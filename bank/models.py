from django.db import models

# Create your models here.
class customer(models.Model):
    name=models.CharField(max_length=32)
    credit=models.IntegerField(max_length=4)

class account(models.Model):
    key=models.CharField(max_length=60)
    balance=models.FloatField()
    account_customer=models.ForeignKey(to=customer,to_field="id",on_delete=models.CASCADE)

class credit_card(models.Model):
    limit=models.FloatField()
    creditcard_customer = models.ForeignKey(to=customer, to_field="id", on_delete=models.CASCADE)

class bank(models.Model):
    name=models.CharField(max_length=32)

class transactionType_list(models.Model):
    Type=models.CharField(max_length=20)

class transaction_history(models.Model):
    amount=models.FloatField()
    time=models.DateField()
    transactionHistory_customer=models.ForeignKey(to=customer, to_field="id", on_delete=models.CASCADE)
    transactionHistory_account = models.ForeignKey(to=account, to_field="id", on_delete=models.CASCADE)
    transactionType=models.ForeignKey(to=transactionType_list,to_field="id",on_delete=models.SET_NULL)

class creditCardhistoryType_list(models.Model):
    Type=models.CharField(max_length=20)

class creditCard_history():
    time=models.DateField()
    amount=models.FloatField()
    creditCardHistory_account = models.ForeignKey(to=account, to_field="id", on_delete=models.CASCADE)
    creditCardhistoryType=models.ForeignKey(to=creditCardhistoryType_list,to_field="id",on_delete=models.SET_NULL)

class loan():
    amount=models.FloatField()
    year_interest_rate=models.FloatField()
    time_limit=models.IntegerField(max_length=25)
    time=models.DateField()

class repayment():
    amount = models.FloatField()
    time = models.DateField()
    repayment_loan=models.ForeignKey(to=loan,to_field="id",on_delete=models.CASCADE)

