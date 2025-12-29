#!/bin/bash
set -e

# 生成数据库配置文件到 Tomcat lib 目录 (在 classpath 中)
cat <<EOF > /usr/local/tomcat/lib/db.properties
jdbc.driver=com.mysql.cj.jdbc.Driver
jdbc.url=${JDBC_URL}
jdbc.username=${JDBC_USERNAME}
jdbc.password=${JDBC_PASSWORD}
EOF

# 启动 Tomcat
exec catalina.sh run
