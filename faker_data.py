# -*- coding: utf-8 -*-

from faker import Faker
import pymysql
import random

f = Faker(locale='zh_CN')

def generator_faker_data():
    custName = f.name()
    custSource = random.choice([6,7])
    custIndustry = random.choice([1,2,3,4,5])
    custLevel = random.choice([22,23])
    custLinkName = f.name()
    custPhone = f.phone_number()
    custMobile = f.phone_number()
    custZipCode = f.sha1()[:9]
    custAddress = f.address()
    custCreateTime = f.future_datetime()

    print(custName,custSource,custLinkName,custPhone,custMobile
          ,custZipCode,custAddress,custCreateTime)

    custDitct = {
        'custName'   : custName,
        'custSource' : custSource,
        'custIndustry' : custIndustry,
        'custLevel'  : custLevel,
        'custLinkName'   : custLinkName,
        'custPhone'  : custPhone,
        'custMobile' : custMobile,
        'custZipCode': custZipCode,
        'custAddress': custAddress,
        'custCreateTime': custCreateTime
    }

    return custDitct

def mysql_dml(custDict):
    # 打开数据库连接
    db = pymysql.connect(host='127.0.0.1', port=3306, user='root',passwd='', db='crm')

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()

    custName = custDict['custName']
    custLinkName = custDict['custLinkName']
    custSource = custDict['custSource']
    custIndustry = custDict['custIndustry']
    custLevel = custDict['custLevel']
    custPhone = custDict['custPhone']
    custMobile = custDict['custMobile']
    custZipCode = custDict['custZipCode']
    custAddress = custDict['custAddress']
    custCreateTime = custDict['custCreateTime']

    sql = """INSERT INTO CUSTOMER(cust_name,cust_source,cust_industry,cust_level,
                cust_mobile,cust_linkman,cust_phone,
                cust_zipcode,cust_address,cust_createtime) 
                VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}')"""
    sql = sql.format(custName,custSource,custIndustry,custLevel,
                     custMobile,custLinkName,custPhone,
                     custZipCode,custAddress,custCreateTime)

    print(sql)
    try:
        # 执行sql语句
        cursor.execute(sql)
        # 提交到数据库执行
        db.commit()
        print("提交成功")
    except:
        # 如果发生错误则回滚
        db.rollback()
        print("数据回滚")

    # 关闭数据库连接
    db.close()


if __name__ == '__main__':
    for i in range(100):
        custDict = generator_faker_data()
        mysql_dml(custDict)

