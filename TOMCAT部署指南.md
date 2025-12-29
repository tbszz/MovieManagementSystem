# Tomcat 本地部署指南

## 📦 WAR 包位置

已成功生成 WAR 包：
- **路径**: `d:\web实训\movie-management-system\target\movie-management-system.war`
- **大小**: 约 31 MB

## 🚀 部署步骤

### 1. 下载并安装 Tomcat

如果还没有安装 Tomcat，请按以下步骤操作：

1. **下载 Tomcat 9**
   - 访问：https://tomcat.apache.org/download-90.cgi
   - 下载 Windows 版本（推荐 zip 压缩包）
   - 解压到任意目录（例如：`C:\apache-tomcat-9.0.xx`）

2. **配置环境变量**（可选）
   - 设置 `CATALINA_HOME` 指向 Tomcat 目录
   - 添加 `%CATALINA_HOME%\bin` 到 PATH

### 2. 部署 WAR 包

有两种部署方式：

#### 方式一：自动部署（推荐）

1. 复制 WAR 包到 Tomcat 的 `webapps` 目录：
   ```powershell
   copy "d:\web实训\movie-management-system\target\movie-management-system.war" "C:\apache-tomcat-9.0.xx\webapps\"
   ```

2. Tomcat 启动后会自动解压并部署

#### 方式二：手动解压部署

1. 在 Tomcat 的 `webapps` 目录下创建文件夹：
   ```powershell
   mkdir "C:\apache-tomcat-9.0.xx\webapps\movie-management-system"
   ```

2. 解压 WAR 包到该目录：
   ```powershell
   cd "C:\apache-tomcat-9.0.xx\webapps\movie-management-system"
   jar -xvf "d:\web实训\movie-management-system\target\movie-management-system.war"
   ```

### 3. 启动 Tomcat

1. **Windows 启动**：
   ```powershell
   cd C:\apache-tomcat-9.0.xx\bin
   .\startup.bat
   ```

2. **查看启动日志**：
   - 打开 `C:\apache-tomcat-9.0.xx\logs\catalina.out` 或 `catalina.{日期}.log`
   - 确认没有错误信息

3. **等待部署完成**：
   - 看到类似 `Deployment of web application archive ... has finished in [xxx] ms` 的日志表示部署成功

### 4. 访问应用

- **访问地址**: http://localhost:8080/movie-management-system/
- **默认账号**: admin
- **默认密码**: admin123

## ⚙️ 配置说明

### 数据库配置

确保 MySQL 数据库已启动，并且配置正确：

1. **数据库连接信息**（在 `applicationContext.xml` 中）:
   - 主机: localhost
   - 端口: 3306
   - 数据库名: movie_db
   - 用户名: root
   - 密码: zou162534.

2. **初始化数据库**（如果还未执行）:
   ```sql
   mysql -u root -p < d:\web实训\movie-management-system\db.sql
   ```

### 端口配置

如果 8080 端口被占用，修改 Tomcat 配置：

1. 编辑 `C:\apache-tomcat-9.0.xx\conf\server.xml`
2. 找到以下行并修改端口号：
   ```xml
   <Connector port="8080" protocol="HTTP/1.1"
              connectionTimeout="20000"
              redirectPort="8443" />
   ```
3. 修改为其他端口，例如 8081

## 🛠️ 故障排查

### 1. 应用无法访问

**检查**:
- Tomcat 是否正常启动：访问 http://localhost:8080 应该看到 Tomcat 欢迎页
- WAR 包是否正确部署：检查 `webapps` 目录下是否有 `movie-management-system` 文件夹
- 查看日志：`logs/catalina.{日期}.log` 和 `logs/localhost.{日期}.log`

### 2. 数据库连接失败

**检查**:
- MySQL 服务是否启动
- 数据库 `movie_db` 是否已创建
- 用户名密码是否正确
- 防火墙是否阻止连接

**查看错误**:
```powershell
type "C:\apache-tomcat-9.0.xx\logs\catalina.{日期}.log"
```

### 3. 500 错误或白页

**检查**:
- 查看 Tomcat 日志中的异常堆栈
- 确认所有依赖的 JAR 包都在 WAR 包中（`WEB-INF/lib` 目录）
- 检查 JDK 版本（需要 JDK 8 或更高）

## 🔄 重新部署

如果修改了代码需要重新部署：

1. **重新打包**：
   ```powershell
   cd "d:\web实训\movie-management-system"
   mvn clean package -DskipTests
   ```

2. **停止 Tomcat**：
   ```powershell
   C:\apache-tomcat-9.0.xx\bin\shutdown.bat
   ```

3. **删除旧部署**：
   ```powershell
   rmdir /s /q "C:\apache-tomcat-9.0.xx\webapps\movie-management-system"
   del "C:\apache-tomcat-9.0.xx\webapps\movie-management-system.war"
   ```

4. **复制新 WAR 包**：
   ```powershell
   copy "d:\web实训\movie-management-system\target\movie-management-system.war" "C:\apache-tomcat-9.0.xx\webapps\"
   ```

5. **启动 Tomcat**：
   ```powershell
   C:\apache-tomcat-9.0.xx\bin\startup.bat
   ```

## 📝 注意事项

1. **JDK 版本**: 确保安装了 JDK 8 或更高版本，并设置了 `JAVA_HOME` 环境变量
2. **编码问题**: 如果出现中文乱码，在 Tomcat 的 `conf/server.xml` 中的 Connector 标签添加：
   ```xml
   URIEncoding="UTF-8"
   ```
3. **内存配置**: 如果应用较大，可能需要调整 Tomcat 内存，编辑 `bin/catalina.bat`，添加：
   ```bat
   set JAVA_OPTS=-Xms512m -Xmx1024m
   ```

## 🎉 快速启动脚本

创建一个批处理文件 `deploy.bat` 快速部署：

```bat
@echo off
echo ========================================
echo 电影管理系统 - 快速部署到 Tomcat
echo ========================================

REM 设置 Tomcat 路径（请修改为您的实际路径）
set TOMCAT_HOME=C:\apache-tomcat-9.0.xx

echo [1/5] 停止 Tomcat...
call "%TOMCAT_HOME%\bin\shutdown.bat"
timeout /t 3

echo [2/5] 清理旧部署...
rmdir /s /q "%TOMCAT_HOME%\webapps\movie-management-system" 2>nul
del "%TOMCAT_HOME%\webapps\movie-management-system.war" 2>nul

echo [3/5] 重新打包项目...
call mvn clean package -DskipTests

echo [4/5] 部署新 WAR 包...
copy "target\movie-management-system.war" "%TOMCAT_HOME%\webapps\"

echo [5/5] 启动 Tomcat...
call "%TOMCAT_HOME%\bin\startup.bat"

echo.
echo ========================================
echo 部署完成！
echo 访问地址: http://localhost:8080/movie-management-system/
echo ========================================
pause
```

将此文件保存在项目根目录，双击即可一键部署！
