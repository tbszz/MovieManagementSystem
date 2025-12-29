<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>后台管理 | 电影系统</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
        </head>

        <body>
            <div class="app-container">

                <!-- Sidebar -->
                <jsp:include page="../common/sidebar.jsp" />

                <!-- Main Content -->
                <div class="main-content">
                    <jsp:include page="../common/header.jsp" />

                    <div class="dashboard-widgets">
                        <div class="widget">
                            <h3>
                                <s:text name="title.login" />,
                                <s:property value="#session.user.username" />
                            </h3>
                            <p>
                                <s:text name="msg.welcome" />
                            </p>
                        </div>

                        <div class="stats-grid">
                            <div class="stat-card">
                                <div class="stat-value">
                                    <s:property value="movieCount" />
                                </div>
                                <div class="stat-label">
                                    <s:text name="menu.movies" />
                                </div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-value">
                                    <s:property value="categoryCount" />
                                </div>
                                <div class="stat-label">
                                    <s:text name="menu.categories" />
                                </div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-value">
                                    <s:property value="commentCount" />
                                </div>
                                <div class="stat-label">
                                    评论总数
                                </div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-value">
                                    <s:property value="userCount" />
                                </div>
                                <div class="stat-label">
                                    <s:text name="menu.users" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>