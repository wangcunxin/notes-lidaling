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

###  har 合并文件的读取

  inputSrc ="har://hdfs-master:8020/user/impala/impaladir/kafka01/20150909.har/part-*"

### csv read

    import csv
    headers = ['col_a', 'col_b', 'col_c']
    sc.textFile(filepath).map(lambda l: csv.DictReader([l], fieldnames=headers).next())

### spark read with jdbc

  # set evn
  os.environ['SPARK_CLASSPATH']='/home/lidl/cloud/mysql-connector-java-5.1.36.jar'

  df= sqlContext.load(
      source='jdbc',
      driver='com.mysql.jdbc.Driver',
      url='jdbc:mysql://host.net/mugic?user=user&password=password',
      dbtable='table_or_select')

  or

  df = sqlContext.read.format('jdbc').options(
       url='jdbc:mysql://192.168.0.173:3306/bblink_data?user=bblink_hos&password=bblink_hos',
       dbtable='(select hosid,gwid from bblink_data_hos_subject limit 20)as t'
   ).load()


### df from json

  import json
  ds = [{'a': {'b': {'c': 1}}}]
  ds2 = [json.dumps(item) for item in ds]
  df = sqlCtx.jsonRDD(sc.parallelize(ds2))
  df.printSchema()

# Creates a DataFrame from an RDD of tuple/list, list or pandas.DataFrame.

[link](https://spark.apache.org/docs/1.5.2/api/python/pyspark.sql.html)
[doc](https://spark.apache.org/docs/1.5.2/api/python/index.html)
https://spark.apache.org/docs/1.4.1/api/python/pyspark.sql.html?highlight=dataframe#pyspark.sql.DataFrame

  d = [{'name': 'Alice', 'age': 1}]
  sqlContext.createDataFrame(d).collect()
