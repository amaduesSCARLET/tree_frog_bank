from django.db import models

# Create your models here.
class creditCard_type(models.Model):
    credit=models.IntegerField(max_length=4,primary_key=True)
    limit=models.FloatField()

class customer(models.Model):
    name=models.CharField(max_length=32)
    customer_credit=models.ForeignKey(to=creditCard_type,to_field="credit",on_delete=models.SET_NULL)

class account(models.Model):
    key=models.CharField(max_length=60)
    balance=models.FloatField()
    account_customer=models.ForeignKey(to=customer,to_field="id",on_delete=models.CASCADE)

class credit_card(models.Model):
    creditcard_account = models.ForeignKey(to=account, to_field="id", on_delete=models.CASCADE)
    limit_remain=models.FloatField(
        default=creditCard_type.objects.filter(
            credit=customer.objects.filter(
                id=account.objects.filter(
                    id=creditcard_account)[0].account_customer_id)[0].customer_credit)[0].limit)

class bank(models.Model):
    name=models.CharField(max_length=32)

class transactionType_list(models.Model):
    TypeId=models.IntegerField(max_length=4,primary_key=True)
    Type=models.CharField(max_length=20)

class consumptionType_list(models.Model):
    CoTypeId = models.IntegerField(max_length=4, primary_key=True)
    Type=models.CharField(max_length=20)

class transaction_history(models.Model):
    amount=models.FloatField()
    time=models.DateField()
    useCreditCard=models.BooleanField(default=False)
    transactionHistory_in_account = models.ForeignKey(to=account, to_field="id",null=True,on_delete=models.CASCADE)
    transactionHistory_out_account = models.ForeignKey(to=account, to_field="id",null=True,on_delete=models.CASCADE)
    transactionType=models.ForeignKey(to=transactionType_list,to_field="TypeId",on_delete=models.SET_NULL)
    consumptionType=models.ForeignKey(to=consumptionType_list,to_field="CoTypeId",on_delete=models.SET_NULL)

class creditCardhistoryType_list(models.Model):
    CeTypeId = models.IntegerField(max_length=4, primary_key=True)
    Type=models.CharField(max_length=20)

class creditCard_history(models.Model):
    time=models.DateField()
    amount=models.FloatField()
    creditCardHistory_account = models.ForeignKey(to=account, to_field="id", on_delete=models.CASCADE)
    creditCardhistoryType=models.ForeignKey(to=creditCardhistoryType_list,to_field="CeTypeId",on_delete=models.SET_NULL)

class loan(models.Model):
    amount=models.FloatField()
    year_interest_rate=models.FloatField(default=0.045)
    time_limit=models.IntegerField(max_length=25)
    time=models.DateField()
    loan_customer=models.ForeignKey(to=customer,to_field="id",on_delete=models.CASCADE)

class repayment(models.Model):
    amount = models.FloatField()
    time = models.DateField()
    repayment_loan=models.ForeignKey(to=loan,to_field="id",on_delete=models.CASCADE)
    repayment_customer = models.ForeignKey(to=customer, to_field="id", on_delete=models.CASCADE)

