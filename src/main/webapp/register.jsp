<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>
                <s:text name="title.app" />
            </title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css?v=2.0">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        </head>

        <body>

            <div class="login-container">
                <h2>用户注册</h2>

                <div class="error-msg">
                    <s:if test="message != null">
                        <s:property value="message" />
                    </s:if>
                </div>

                <s:form action="register" namespace="/" method="post" theme="simple">
                    <div class="form-group">
                        <s:textfield name="username" key="label.username" placeholder="%{getText('label.username')}"
                            autocomplete="off" />
                    </div>

                    <div class="form-group">
                        <s:password name="password" key="label.password" placeholder="%{getText('label.password')}" />
                    </div>

                    <div class="form-group">
                        <s:password name="confirmPassword" placeholder="确认密码" />
                    </div>

                    <button type="submit" class="btn-login">注册</button>
                </s:form>

                <div class="footer-links">
                    <a href="login_page">返回登录</a>
                </div>
            </div>

            <script src="${pageContext.request.contextPath}/static/js/particles.js?v=2.0"></script>
        </body>

        </html>