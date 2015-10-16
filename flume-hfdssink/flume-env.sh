export JAVA_HOME=/usr/java/jdk

# Give Flume more memory and pre-allocate, enable remote monitoring via JMX
# export JAVA_OPTS="-Xms100m -Xmx2000m -Dcom.sun.management.jmxremote"
export JAVA_OPTS="-Xms1024m -Xmx2048m -Dcom.sun.management.jmxremote"

# Note that the Flume conf directory is always included in the classpath.
#FLUME_CLASSPATH=""

FLUME_CLASSPATH=/opt/cloud/flume/conf
