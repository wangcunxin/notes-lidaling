### config local repository

vim ~/.sbt/repositories

[repositories]
  local
  sharedRepo: file:///path/to/my/shared/repo/.m2/repository

### build.sbt

```
resolvers += "Local Maven Repository" at "file://"+Path.userHome.absolutePath+"/.m2/repository"

resolvers += "OSChina Maven Repository" at "http://maven.oschina.net/content/groups/public/"

resolvers += "osc_thirdparty" at "http://maven.oschina.net/content/repositories/thirdparty/"

externalResolvers := Resolver.withDefaultResolvers(resolvers.value, mavenCentral = true)
```
