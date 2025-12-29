<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>帮助与支持 | 电影系统</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/minimal.css">
            <style>
                body {
                    font-family: 'Inter', sans-serif;
                    line-height: 1.6;
                    color: #333;
                    max-width: 800px;
                    margin: 0 auto;
                    padding: 40px 20px;
                }

                h1 {
                    color: #1a1a1a;
                    margin-bottom: 30px;
                }

                h2 {
                    color: #2d3748;
                    margin-top: 30px;
                    margin-bottom: 15px;
                    font-size: 1.5em;
                }

                p {
                    margin-bottom: 15px;
                    color: #4a5568;
                }

                .faq-item {
                    margin-bottom: 25px;
                    border-bottom: 1px solid #eee;
                    padding-bottom: 20px;
                }

                .faq-question {
                    font-weight: 600;
                    font-size: 1.1em;
                    color: #2d3748;
                    margin-bottom: 8px;
                }

                .back-link {
                    display: inline-block;
                    margin-top: 40px;
                    color: #6366f1;
                    text-decoration: none;
                    font-weight: 500;
                }

                .back-link:hover {
                    text-decoration: underline;
                }
            </style>
        </head>

        <body>

            <h1>帮助与支持</h1>

            <div class="faq-section">
                <h2>常见问题 (FAQ)</h2>

                <div class="faq-item">
                    <div class="faq-question">如何注册新账号？</div>
                    <div class="faq-answer">在登录页面点击“立即注册”链接，填写用户名和密码即可完成注册。</div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">忘记密码怎么办？</div>
                    <div class="faq-answer">目前暂不支持自助找回密码，请联系系统管理员重置密码。</div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">如何修改个人信息？</div>
                    <div class="faq-answer">登录后在个人中心页面可以修改部分个人信息。</div>
                </div>
            </div>

            <div class="contact-section">
                <h2>联系我们</h2>
                <p>如果以上无法解决您的问题，请通过以下方式联系客服：</p>
                <p>邮箱：support@moviesystem.com</p>
                <p>电话：400-123-4567</p>
            </div>

            <a href="login_page" class="back-link">返回登录</a>

        </body>

        </html>