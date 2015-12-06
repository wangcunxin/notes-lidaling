### convertion
#### Convert Spark DataFrame to Pandas
pandas_df = young.toPandas()
#### Create a Spark DataFrame from Pandas
spark_df = context.createDataFrame(pandas_df)

### list to DataFrame 

```
 list=[
     {'pv':10,'uv':5,'logtype':'1-prelogin','hosid':'1','suppid':'1','day':'20151120'},
     {'pv':5,'uv':3,'logtype':'2-mobile-login','hosid':'3','suppid':'1','day':'20151120'},
     {'pv':3,'uv':4,'logtype':'2-mobile-login','hosid':'1','suppid':'1','day':'20151120'},
     {'pv':6,'uv':2,'logtype':'2-wechat-login','hosid':'1','suppid':'1','day':'20151120'},
     {'pv':8,'uv':7,'logtype':'2-olduser-login','hosid':'1','suppid':'1','day':'20151120'}
       ]

 df=sqlContext.createDataFrame(list)
```
