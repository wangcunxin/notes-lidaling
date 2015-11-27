### spark-submit

- --driver-class-path

### conf/spark-env.sh

- export SPARK_CLASSPATH=../*.jar

  但不可和spark-submit --driver-class-path 配置同时使用

### coding

｀｀｀
    os.environ['SPARK_HOME'] = spark_home
    os.environ['SPARK_CLASSPATH'] = "/home/lidl/cloud/mysql-connector-java-5.1.20.jar"

｀｀｀
