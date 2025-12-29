<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="zh-CN">

            <head>
                <meta charset="UTF-8">
                <title>新闻资讯 - LIBVIO</title>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/minimal.css">
                <style>
                    .news-container {
                        max-width: 1200px;
                        margin: 0 auto;
                        padding: 40px 20px;
                    }

                    .news-card {
                        background: rgba(30, 41, 59, 0.7);
                        border-radius: 12px;
                        padding: 24px;
                        margin-bottom: 20px;
                        border: 1px solid rgba(255, 255, 255, 0.1);
                        transition: transform 0.2s;
                    }

                    .news-card:hover {
                        transform: translateY(-2px);
                        background: rgba(30, 41, 59, 0.9);
                    }

                    .news-title {
                        font-size: 1.5em;
                        font-weight: 600;
                        color: #fff;
                        margin-bottom: 10px;
                    }

                    .news-meta {
                        color: #94a3b8;
                        font-size: 0.9em;
                        margin-bottom: 15px;
                    }

                    .news-content {
                        color: #cbd5e1;
                        line-height: 1.6;
                    }
                </style>
            </head>

            <body>

                <!-- Navbar -->
                <nav class="navbar">
                    <div class="nav-content">
                        <a href="${pageContext.request.contextPath}/" class="logo">
                            <svg viewBox="0 0 24 24">
                                <path
                                    d="M4 6H2v14c0 1.1.9 2 2 2h14v-2H4V6zm16-4H8c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-8 12.5v-9l6 4.5-6 4.5z" />
                            </svg>
                            LIBVIO
                        </a>

                        <ul class="nav-links">
                            <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                            <li><a href="${pageContext.request.contextPath}/movie_list">全部电影</a></li>
                            <li><a href="${pageContext.request.contextPath}/news_list" class="active">新闻资讯</a></li>
                            <!-- Category Dropdown -->
                            <li class="user-menu" style="margin-right: 0;">
                                <a href="#" style="pointer-events: none;">分类 <span style="font-size: 10px;">▼</span></a>
                                <div class="dropdown-menu" style="top: 30px; left: 0; min-width: 120px;">
                                    <s:iterator value="categories">
                                        <a href="${pageContext.request.contextPath}/movie_list?movie.category.id=<s:property value='id'/>"
                                            class="dropdown-item">
                                            <s:property value="name" />
                                        </a>
                                    </s:iterator>
                                </div>
                            </li>
                        </ul>

                        <div class="nav-actions">
                            <div class="search-wrapper active" id="searchWrapper">
                                <form action="${pageContext.request.contextPath}/movie_list" method="get">
                                    <input type="text" name="keyword" class="search-input" placeholder="搜索电影...">
                                </form>
                                <button class="icon-btn">
                                    <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                    </svg>
                                </button>
                            </div>

                            <s:if test="#session.user != null">
                                <a href="${pageContext.request.contextPath}/user/user_myStats" class="icon-btn"
                                    title="观影记录">
                                    <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                </a>
                            </s:if>

                            <div class="user-menu">
                                <button class="icon-btn">
                                    <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z">
                                        </path>
                                    </svg>
                                </button>
                                <div class="dropdown-menu">
                                    <s:if test="#session.user != null">
                                        <div class="dropdown-item"
                                            style="border-bottom: 1px solid #333; margin-bottom: 5px;">
                                            <s:property value="#session.user.username" />
                                        </div>
                                        <s:if test="#session.user.role == 'admin'">
                                            <a href="${pageContext.request.contextPath}/admin/index"
                                                class="dropdown-item">后台管理</a>
                                        </s:if>
                                        <a href="${pageContext.request.contextPath}/logout"
                                            class="dropdown-item">退出登录</a>
                                    </s:if>
                                    <s:else>
                                        <a href="${pageContext.request.contextPath}/login" class="dropdown-item">登录</a>
                                        <a href="${pageContext.request.contextPath}/register"
                                            class="dropdown-item">注册</a>
                                    </s:else>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>

                <div class="news-container">
                    <h2 class="section-title">最新资讯</h2>

                    <s:if test="newsList == null || newsList.size() == 0">
                        <div style="text-align: center; color: #94a3b8; padding: 40px;">暂无新闻</div>
                    </s:if>

                    <s:iterator value="newsList">
                        <div class="news-card">
                            <div class="news-title">
                                <s:property value="title" />
                            </div>
                            <div class="news-meta">发布时间：
                                <s:date name="publishDate" format="yyyy-MM-dd HH:mm" />
                            </div>
                            <div class="news-content">
                                <s:property value="content" escapeHtml="false" />
                            </div>
                        </div>
                    </s:iterator>
                </div>

                <footer>
                    <p>Copyright © 2024 LIBVIO Clone. All rights reserved.</p>
                </footer>

            </body>

            </html>