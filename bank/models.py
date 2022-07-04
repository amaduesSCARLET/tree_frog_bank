from django.db import models

# Create your models here.
# 信用卡额度分级表(credit——>limit)
class creditCard_type(models.Model):
    credit=models.IntegerField(primary_key=True)
    limit=models.FloatField()

# 顾客表(id——>name,id——>customer_credit)
class customer(models.Model):
    name=models.CharField(max_length=32)
    customer_credit=models.ForeignKey(to=creditCard_type,to_field="credit",on_delete=models.CASCADE)

# 顾客账户表(id——>key,id——>balance,id——>account_customer)
class account(models.Model):
    key=models.CharField(max_length=60)
    balance=models.FloatField()
    account_customer=models.ForeignKey(to=customer,to_field="id",on_delete=models.CASCADE)

# 信用卡表(id——>creditcard_account,id——>limit_remain)
class credit_card(models.Model):
    creditcard_account = models.ForeignKey(to=account, to_field="id", on_delete=models.CASCADE)
    limit_remain=models.FloatField()

# 银行表(id——>name,id——>rate)
class bank(models.Model):
    name=models.CharField(max_length=32)
    rate=models.FloatField(default=0.045)

# 交易类型表（转账，取现，存款）(TypeId——>Type)
class transactionType_list(models.Model):
    TypeId=models.IntegerField(primary_key=True)
    Type=models.CharField(max_length=20)

# 消费类型表（教育，交通，购物等）(CoTypeId——>Type)
class consumptionType_list(models.Model):
    CoTypeId = models.IntegerField(primary_key=True)
    Type=models.CharField(max_length=20)

# 交易记录表(id——>amount,id——>time,id——>useCreditCard,
# id——>inAccount,id——>outAccount,id——>transactionType,id——>consumptionType)
class transaction_history(models.Model):
    amount=models.FloatField()
    time=models.DateField()
    useCreditCard=models.BooleanField(default=False)
    inAccount = models.ForeignKey(to=account, to_field="id",null=True,on_delete=models.CASCADE,
                                  related_name='inAccount',default=None)
    outAccount = models.ForeignKey(to=account, to_field="id",null=True,on_delete=models.CASCADE,
                                   related_name='outAccount',default=None)
    transactionType=models.ForeignKey(to=transactionType_list,to_field="TypeId",on_delete=models.CASCADE)
    consumptionType=models.ForeignKey(to=consumptionType_list,to_field="CoTypeId",on_delete=models.CASCADE)

# 信用卡流水类型表（消费，还款）(CeTypeId——>Type)
class creditCardhistoryType_list(models.Model):
    CeTypeId = models.IntegerField(primary_key=True)
    Type=models.CharField(max_length=20)

# 信用卡交易记录表(id——>time,id——>amount,id——>creditCardHistory_account,id——>creditCardhistoryType)
class creditCard_history(models.Model):
    time=models.DateField()
    amount=models.FloatField()
    creditCardHistory_account = models.ForeignKey(to=account, to_field="id", on_delete=models.CASCADE)
    creditCardhistoryType=models.ForeignKey(to=creditCardhistoryType_list,to_field="CeTypeId",on_delete=models.CASCADE)

# 贷款表(id——>amount,id——>year_interest_rate,id——>time_limit,id——>time,id——>loan_customer)
class loan(models.Model):
    amount=models.FloatField()
    year_interest_rate=models.FloatField(default=0.045)
    time_limit=models.IntegerField()
    time=models.DateField()
    loan_customer=models.ForeignKey(to=customer,to_field="id",on_delete=models.CASCADE)

# 还款表(id——>amount,id——>time,id——>repayment_loan,id——>repayment_customer)
class repayment(models.Model):
    amount = models.FloatField()
    time = models.DateField()
    repayment_loan=models.ForeignKey(to=loan,to_field="id",on_delete=models.CASCADE)
    repayment_customer = models.ForeignKey(to=customer, to_field="id", on_delete=models.CASCADE)

