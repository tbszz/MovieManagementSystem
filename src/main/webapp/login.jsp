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
                <h2>
                    <s:text name="title.login" />
                </h2>

                <div class="error-msg">
                    <s:if test="message != null && message != ''">
                        <s:property value="message" />
                    </s:if>
                </div>

                <s:form action="login" namespace="/" method="post" theme="simple">
                    <div class="form-group">
                        <s:textfield name="username" key="label.username" placeholder="%{getText('label.username')}"
                            autocomplete="off" />
                    </div>

                    <div class="form-group">
                        <s:password name="password" key="label.password" placeholder="%{getText('label.password')}" />
                    </div>

                    <button type="submit" class="btn-login">
                        <s:text name="btn.login" />
                    </button>

                    <div style="margin-top: 15px; text-align: center;">
                        <a href="register_input" style="color: #6366f1; text-decoration: none; font-size: 0.9em;">
                            没有账号？立即注册
                        </a>
                    </div>
                </s:form>

                <div class="footer-links">
                    <a href="privacy">
                        隐私政策
                    </a>
                    <span>|</span>
                    <a href="help">
                        <s:text name="link.help" />
                    </a>
                </div>

                <div class="lang-switch" style="margin-top: 15px; text-align: center;">
                    <a href="login_page?request_locale=zh_CN"
                        style="color: #a5b4fc; text-decoration: none; margin: 0 5px;">中文</a>
                    <span style="color: rgba(255,255,255,0.3)">|</span>
                    <a href="login_page?request_locale=en_US"
                        style="color: #a5b4fc; text-decoration: none; margin: 0 5px;">English</a>
                </div>
            </div>

            <script src="${pageContext.request.contextPath}/static/js/particles.js?v=2.0"></script>
        </body>

        </html>