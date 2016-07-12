### 并发

  [volatile](http://www.infoq.com/cn/articles/ftf-java-volatile)
  [Disruptor](http://ifeve.com/disruptor/)

  http://tutorials.jenkov.com/java-util-concurrent/lock.html
  http://howtodoinjava.com/core-java/multi-threading/how-to-use-locks-in-java-java-util-concurrent-locks-lock-tutorial-and-example/

### mysql

  [canal](http://agapple.iteye.com/blog/1796633)

### java rest

  [Retrofit](http://blog.chengyunfeng.com/?p=491)

### java world blog

  http://hellotojavaworld.blogspot.com/

### security

  http://shiro.apache.org/

<<<<<<< HEAD
### BIO NIO AIO

- AIO

  > jdk7之前没有AIO

  > AIO 是利用的操作系统 进行的IO操作

- NIO

  > IO，.readline()为一次block。readline即为想要的行数据结果

  > NIO .allocate(int number) 为一次执行。其读取结果可能不是想要的，之后需要进行判断

NIO可以理解为单线程中执行多通道数据readline。其付出的代价为解析数据比一个阻塞流中读取数据的逻辑要复杂。


### muti theads

  java.util.concurrent.ExecutorService
  java.util.concurrent.Executors


  ExecutorService pool= Executors.newFixedThreadPool(1);
  pool.execute(new Runnable{...});

- volatile

  其保证线程副内存变量是最新的，但不保证和外边是同步的

- synchronized

  加上synchronized 和 块语句，在多线程访问的时候，同一时刻只能有一个线程能够用

- 缓存一致性协议

缓存一致性协议,最出名的就是Intel 的MESI协议，MESI协议保证了每个缓存中使用的共享变量的副本是一致的。它核心的思想是：当CPU写数据时，如果发现操作的变量是共享变量，即在其他CPU中也存在该变量的副本，会发出信号通知其他CPU将该变量的缓存行置为无效状态，因此当其他CPU需要读取这个变量时，发现自己缓存中缓存该变量的缓存行是无效的，那么它就会从内存重新读取

- 多线程编程 变量三要素

  > 原子性

  > 可见性

  > 有序性
=======
### like dubbo framework

- coral  by amazon
- hsf taobao
- ... netflix

### dropwizard to deb or rpm

https://groups.google.com/forum/#!topic/dropwizard-user/uFCgyipl7GQ

after rpm or deb installation , app can be registered as linux daemon

### workflow

- Activiti
- jbpm

### like zookeeper

  CONSUL
>>>>>>> 66d4da859c71d517987a60a8aee318c033c03f7d
