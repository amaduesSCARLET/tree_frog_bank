"""""""""
操作数据库的脚本函数，具体操作在代码末尾，可以分别执行
"""""""""

import datetime
import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "tree_frog_bank.settings")
import django
from django.db.models import Sum
django.setup()
from bank.models import *


#本次实现的类以及全部功能函数
class treeFrogBank():


    def costomer_baseInformation(id):
        print(customer.objects.filter(id=id)[0].name,"你共开通了如下账户")
        for i in account.objects.filter(account_customer_id=id):
            print("账户id",i.id)

    def customer_accountKEY_revise(accountId,key,newkey):
        for i in account.objects.filter(id=accountId):
            if i.key==key:
                i.key=newkey
                print("密码修改成功，新密码为",i.key)
            else:
                print("原密码错误，请前往线下柜台核对身份后更改密码")

    def costomer_Inquire_idbalance(id):
        print("您所有账户余额如下")
        for i in account.objects.filter(account_customer_id=id):
            print("账户",i.id,i.balance)

    def costomer_Inquire_accountbalance(accountid):
        for i in account.objects.filter(id=accountid):
            print("账户",i.id,"的余额",i.balance)

    def costomer_Inquire_rate(id):
        print(bank.objects.all()[0].name,"利率为",bank.objects.all()[0].rate)

    def costomer_Inquire_credit(id):
        print("客户",customer.objects.filter(id=id)[0].name,
              "的额度为",creditCard_type.objects.filter(
            credit=customer.objects.filter(id=id)[0].customer_credit.credit
            )[0].limit,"元")


    def costomer_inAccount(inaccountid,time,amount):
        transaction_history.objects.create(
            amount=amount,time=time,useCreditCard=False,
            inAccount_id=inaccountid,transactionType=transactionType_list.objects.all()[0],
            consumptionType=consumptionType_list.objects.all()[0])
        a=account.objects.filter(id=inaccountid)[0]
        a.balance=a.balance+amount
        a.save()
        print("存入后账户",inaccountid,"余额为",account.objects.filter(id=inaccountid)[0].balance)

    def costomer_outAccount(outaccountid,time,amount,useCreditCard,consumptionType):
        transaction_history.objects.create(
            amount=amount,time=time,useCreditCard=useCreditCard,
            outAccount_id=outaccountid,transactionType=transactionType_list.objects.all()[1],
            consumptionType=consumptionType_list.objects.all()[consumptionType])
        if useCreditCard:
            creditCard_history.objects.create(time=time,amount=amount,
                                              creditCardHistory_account_id=outaccountid,
                                              creditCardhistoryType=
                                              creditCardhistoryType_list.objects.all()[1])
            b=credit_card.objects.filter(creditcard_account_id=outaccountid)[0]
            b.limit_remain=b.limit_remain-amount
            b.save()
            amount=0
            print("转出后信用卡剩余额度为", b.limit_remain)

        a=account.objects.filter(id=outaccountid)[0]
        a.balance=a.balance-amount
        a.save()
        print("转出后账户",outaccountid,"余额为",a.balance)

    def costomer_transAccount(inaccountid,outaccountid,time,amount,useCreditCard,consumptionType):
        transaction_history.objects.create(
            amount=amount,time=time,useCreditCard=useCreditCard,inAccount_id=inaccountid,
            outAccount_id=outaccountid,transactionType=transactionType_list.objects.all()[2],
            consumptionType=consumptionType_list.objects.all()[consumptionType])
        a=account.objects.filter(id=inaccountid)[0]
        a.balance=a.balance+amount
        a.save()
        print("存入后账户",inaccountid,"余额为",account.objects.filter(id=inaccountid)[0].balance)

        if useCreditCard:
            creditCard_history.objects.create(time=time,amount=amount,
                                              creditCardHistory_account_id=outaccountid,
                                              creditCardhistoryType=
                                              creditCardhistoryType_list.objects.all()[1])
            b=credit_card.objects.filter(creditcard_account_id=outaccountid)[0]
            b.limit_remain=b.limit_remain-amount
            b.save()
            amount=0
            print("转出后信用卡剩余额度为", b.limit_remain)


        a=account.objects.filter(id=outaccountid)[0]
        a.balance=a.balance-amount
        a.save()
        print("转出后账户",outaccountid,"余额为",a.balance)

    def creditCardIN(self):
            if datetime.datetime.now().date().day==self:
                for i in credit_card.objects.all():
                    a=i.limit_remain
                    b=creditCard_type.objects.filter(
                        credit=customer.objects.filter(
                            id=account.objects.filter(
                                id=i.creditcard_account.id
                            )[0].account_customer.id)[0].customer_credit.credit
                    )[0].limit
                    print("以下为账户对应的信用卡进行自动还款")
                    treeFrogBank.costomer_outAccount(outaccountid=i.creditcard_account_id,
                                                     time=datetime.datetime.now().date(),
                                                     amount=b-a,
                                                     useCreditCard=False,
                                                     consumptionType=0)
                    creditCard_history.objects.create(time=datetime.datetime.now().date(),
                                                      amount=b-a,
                                                      creditCardHistory_account_id=
                                                      i.creditcard_account_id,
                                                      creditCardhistoryType_id=1)

                    i.limit_remain=b
                    i.save()
                    print("账户",i.creditcard_account_id,"信用卡余额",i.limit_remain)
            else:
                print("未到还款日")

    def tradeInquire(id,time):
        for i in account.objects.filter(account_customer_id=id):
            print(customer.objects.filter(id=id)[0].name,time,"的交易记录")
            for c in creditCard_history.objects.filter(time=time,creditCardHistory_account_id=i.id):
                print(time,
                      "账户",
                      i.id,
                      creditCardhistoryType_list.objects.filter(
                          CeTypeId=c.creditCardhistoryType_id)[0].Type,
                      c.amount)
            for t in transaction_history.objects.filter(time=time,inAccount_id=i.id):
                print(time,
                      "账户",
                      i.id,
                      consumptionType_list.objects.filter(CoTypeId=t.consumptionType_id)[0].Type,
                      transactionType_list.objects.filter(TypeId=t.transactionType_id)[0].Type,
                      t.amount
                      )
            for t in transaction_history.objects.filter(time=time,outAccount_id=i.id):
                print(time,
                      "账户",
                      i.id,
                      consumptionType_list.objects.filter(CoTypeId=t.consumptionType_id)[0].Type,
                      transactionType_list.objects.filter(TypeId=t.transactionType_id)[0].Type,
                      t.amount
                      )

    def tradeAnalyse(id,year,month):
        totalAmount = [0] * (consumptionType_list.objects.count())
        for ct in consumptionType_list.objects.all():
            total = transaction_history.objects.filter(consumptionType_id=ct.CoTypeId,
                                                       time__year=year,time__month=month,
                                                       outAccount_id=account.objects.filter(
                                                           account_customer_id=id)[0].id).aggregate(
                nums=Sum('amount'))

            if total['nums']!=None:
                totalAmount[ct.CoTypeId]=total['nums']
        sorted_id = sorted(range(len(totalAmount)), key=lambda k: totalAmount[k], reverse=True)
        print("顾客",id,"顾客姓名", customer.objects.filter(id=id)[0].name,year, "年", month, "月消费分布")
        for i in sorted_id:
            print("消费种类编号",consumptionType_list.objects.filter(CoTypeId=i)[0].CoTypeId,
                      "消费种类名称",consumptionType_list.objects.filter(CoTypeId=i)[0].Type,
                  "消费金额",totalAmount[i],
                  "排名",sorted_id.index(i)+1)

    def customer_loan(amount,time_limit,time,id):
        if amount>creditCard_type.objects.filter(
                        credit=customer.objects.filter(
                            id=id)[0].customer_credit.credit
                    )[0].limit:
            print("超出额度，请检查自己信用额度后合理贷款")
        else:
            loan.objects.create(amount=amount,time=time,time_limit=time_limit,loan_customer_id=id)
            print("贷款成功，贷款编号为",loan.objects.latest("id").id)

    def customer_repayment(amount,time,id,loanid):
        repayment.objects.create(amount=amount,time=time,
                                 repayment_loan_id=loanid,repayment_customer_id=id)
        print("还款成功，还款编号为",repayment.objects.latest("id").id,"本笔贷款明年应还",
              (loan.objects.filter(id=loanid)[0].amount-amount)*0.045+40)
    def customerRepaymentInquire(loanid):
        print("还款总量为",repayment.objects.filter(
            repayment_loan_id=loanid).aggregate(nums=Sum('amount'))['nums'],"比例为",
              repayment.objects.filter(
                  repayment_loan_id=loanid).aggregate(nums=Sum('amount'))['nums']/1564.38
              )
        for i in repayment.objects.filter(repayment_loan_id=loanid):
            print("还款时间",i.time,"还款金额",i.amount)












# 查询顾客id为1的基本信息，如开通的账户
# treeFrogBank.costomer_baseInformation(1)


# 修改id为1的顾客的密码
# treeFrogBank.customer_accountKEY_revise(1,123456,66666666)
# treeFrogBank.customer_accountKEY_revise(1,"144030663","66666666")


# 查询id为1的顾客的所有账户的余额
# treeFrogBank.costomer_Inquire_idbalance(id=1)


# 查询账户id为3的余额
# treeFrogBank.costomer_Inquire_accountbalance(accountid=3)


# 实现查询顾客的利率
# treeFrogBank.costomer_Inquire_rate(1)


# 实现查询顾客id为1的额度
# treeFrogBank.costomer_Inquire_credit(1)


# 对id为1的账户，在7月3日存入100元
# treeFrogBank.costomer_inAccount(inaccountid=1,time=datetime.date(2022,7,3),amount=100)


# 对id为1的账户，在7月3日，取出20元，其中不使用信用卡，消费类型编号为1（教育）
# treeFrogBank.costomer_outAccount(outaccountid=1,time=datetime.date(2022,7,2),
#                                  amount=20,useCreditCard=False,consumptionType=1)


# 对id为1的账户，在7月3日，取出10元，使用信用卡，消费类型编号为1（教育）
# treeFrogBank.costomer_outAccount(outaccountid=1,time=datetime.date(2022,7,2),
#                                  amount=10,useCreditCard=True,consumptionType=1)


# 账户1向账户2于7月2号转入10元，账户1未使用信用卡，消费类型为2（交通）
# treeFrogBank.costomer_transAccount(
#     inaccountid=2,outaccountid=1,time=datetime.date(2022,7,2),
#     amount=10,useCreditCard=False,consumptionType=2)


# 账户1向账户2于7月2号转入20元，账户1使用了信用卡，消费类型为2（交通）
# treeFrogBank.costomer_transAccount(
#     inaccountid=2,outaccountid=1,time=datetime.date(2022,7,2),
#     amount=20,useCreditCard=True,consumptionType=2)


# 在每月4号还款
# treeFrogBank.creditCardIN(4)


# 在每月3号还款
# treeFrogBank.creditCardIN(3)


# 查询顾客id为1的客户，使用多个账户在7月3日的消费
# treeFrogBank.tradeInquire(1,time=datetime.date(2022,7,3))


# 查询顾客id为1的客户，使用多个账户在7月2日的消费
# treeFrogBank.tradeInquire(1,time=datetime.date(2022,7,2))


# 查询id为1的顾客2022年7月消费分布
# treeFrogBank.tradeAnalyse(6,2022,7)

# Id为1的顾客在7月3号贷款1000000000元
# treeFrogBank.customer_loan(1000000000,25,datetime.date(2022,7,3),1)


# Id为1的顾客在7月3号贷款1000元
# treeFrogBank.customer_loan(1000,25,datetime.date(2022,7,3),1)
# Id为1的顾客在2023年对借的单号5的贷款还款81.175元
# treeFrogBank.customer_repayment(amount=81.175,time=datetime.date(2025,7,3),id=1,loanid=5)


# 查询单号为5的还款情况
# treeFrogBank.customerRepaymentInquire(5)


# 还款量单独查询（请在sql console中执行）
# select sum(bank_repayment.amount) as "还款总量",bank_loan.amount-sum(bank_repayment.amount) as "待还清"
# from  bank_repayment,bank_loan
# where repayment_loan_id=5
#   and bank_loan.id=bank_repayment.repayment_loan_id;

# 10题中测试索引
# import platform
# # 计时器
# print('系统:',platform.system())
#
# import time
# T1 = time.perf_counter()
#
# #______程序部分______
# treeFrogBank.customerRepaymentInquire(5)
#
# T2 =time.perf_counter()
# print('程序运行时间:%s毫秒' % ((T2 - T1)*1000))
