<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>隐私政策 | 电影系统</title>
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

                ul {
                    margin-bottom: 20px;
                    padding-left: 20px;
                }

                li {
                    margin-bottom: 10px;
                    color: #4a5568;
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

            <h1>隐私政策</h1>
            <p>生效日期：2023年1月1日</p>

            <p>欢迎使用电影管理系统。我们非常重视您的隐私保护。本隐私政策旨在向您说明我们如何收集、使用、存储和保护您的个人信息。</p>

            <h2>1. 我们收集的信息</h2>
            <p>为了向您提供服务，我们可能会收集以下类型的信息：</p>
            <ul>
                <li><strong>账户信息：</strong> 在您注册账户时，我们会收集您的用户名和密码。</li>
                <li><strong>使用日志：</strong> 我们可能会记录您的观影历史、评论内容以及对系统的访问日志。</li>
            </ul>

            <h2>2. 信息的用途</h2>
            <p>我们收集的信息主要用于：</p>
            <ul>
                <li>提供、维护和改进我们的服务。</li>
                <li>个性化您的用户体验，例如推荐您可能感兴趣的电影。</li>
                <li>保障系统的安全，防止欺诈和滥用。</li>
            </ul>

            <h2>3. 信息保护</h2>
            <p>我们采取合理的技术和管理措施来保护您的个人信息，防止未经授权的访问、披露、使用或修改。请您妥善保管您的账户密码。</p>

            <h2>4. Cookie 的使用</h2>
            <p>我们可能会使用 Cookie 和类似技术来提升您的使用体验，例如保持您的登录状态。</p>

            <h2>5. 联系我们</h2>
            <p>如果您对本隐私政策有任何疑问，请通过系统内的帮助渠道联系我们。</p>

            <a href="login_page" class="back-link">返回登录</a>

        </body>

        </html>