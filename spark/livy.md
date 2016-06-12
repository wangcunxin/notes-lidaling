### config

  vim bin/livy-server

  add
```
  export JAVA_HOME=...
  export SPARK_HOME=...
```

  vim con/livy-default.conf

  edit

  ```
   livy.server.session.factory = yarn
  ```

### start

  ./bin/livy-server

### sessions

session means using same context

ref:
  http://gethue.com/how-to-use-the-livy-spark-rest-job-server-for-interactive-spark-2-2/
  http://gethue.com/how-to-use-the-livy-spark-rest-job-server-api-for-sharing-spark-rdds-and-contexts/

- get session list

  curl master:8998/sessions|python -m json.toolcurl master:8998/sessions|python -m json.tool

- create session

  curl -X POST --data '{"kind": "pyspark"}' -H "Content-Type: application/json" master:8998/sessions
  curl -X POST --data '{"kind": "pyspark","proxyUser": "bob"}' -H "Content-Type: application/json" master:8998/sessions

- get session status with sessionid

  curl master:8998/sessions/0 | python -m json.tool

- calc with sessionid

  curl master:8998/sessions/0/statements -X POST -H 'Content-Type: application/json' -d '{"code":"1 + 1"}'
  curl master:8998/sessions/0/statements -X POST -H 'Content-Type: application/json' -d '{"code":"a = 10"}'
  curl master:8998/sessions/5/statements -X POST -H 'Content-Type: application/json' -d '{"code":"a + 1"}'

- get calc result

  curl master:8998/sessions/0/statements/0

- delete session with sessionid

  curl master:8998/sessions/0 -X DELETE
