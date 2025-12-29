# Build Stage
FROM maven:3.8.6-jdk-8 AS build
WORKDIR /app
COPY pom.xml .
# 预下载依赖 (利用缓存)
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests

# Runtime Stage
FROM tomcat:9.0.83-jdk8-corretto
WORKDIR /usr/local/tomcat

# 删除默认应用
RUN rm -rf webapps/*

# 复制构建好的 WAR 包为 ROOT.war
COPY --from=build /app/target/*.war webapps/ROOT.war

# 复制启动脚本
COPY entrypoint.sh bin/entrypoint.sh
RUN chmod +x bin/entrypoint.sh

# 暴露端口 (Railway 会自动分配 PORT，但 Tomcat 默认监听 8080)
EXPOSE 8080

CMD ["bin/entrypoint.sh"]
