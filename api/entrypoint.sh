#!/bin/bash

JAVA_OPTS="-Xms64M -Xmx128M -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=128M -Dfile.encoding=UTF-8 -Dsun.stdout.encoding=UTF-8 -Dsun.err.encoding=UTF-8 -Dstdout.encoding=UTF-8 -Dstderr.encoding=UTF-8 -XX:+ExitOnOutOfMemoryError -Djava.security.egd=file:/dev/urandom -XX:+UseParallelGC -XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=20 -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -XX:FlightRecorderOptions=stackdepth=128"
java $JAVA_OPTS -jar /opt/beatbuddy/app.jar
