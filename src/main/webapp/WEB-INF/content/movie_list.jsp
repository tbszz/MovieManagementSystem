<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>电影库 - LIBVIO</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/minimal.css">
        </head>

        <body>

            <!-- Reuse Navbar Structure -->
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
                        <li><a href="${pageContext.request.contextPath}/movie_list" class="active">全部电影</a></li>
                        <li><a href="${pageContext.request.contextPath}/news_list">新闻资讯</a></li>
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
                                <input type="text" name="keyword" class="search-input" placeholder="搜索电影..."
                                    value="<s:property value='keyword'/>">
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
                                        d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
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

                                    <a href="${pageContext.request.contextPath}/logout" class="dropdown-item">退出登录</a>
                                </s:if>
                                <s:else>
                                    <a href="${pageContext.request.contextPath}/login" class="dropdown-item">登录</a>
                                    <a href="${pageContext.request.contextPath}/register" class="dropdown-item">注册</a>
                                </s:else>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </nav>

            <div class="main-container">
                <h2 class="section-title">
                    <s:if test="keyword != null && keyword != ''">
                        搜索结果: "
                        <s:property value="keyword" />"
                    </s:if>
                    <s:else>
                        全部电影
                    </s:else>
                </h2>

                <div class="movie-grid">
                    <s:iterator value="movieList">
                        <a href="${pageContext.request.contextPath}/user/movie_view?id=<s:property value='id' />"
                            class="movie-card">
                            <div class="poster-wrapper">
                                <span class="rating-badge">
                                    <s:property value="rating" />
                                </span>
                                <img src="${pageContext.request.contextPath}/<s:property value='coverImage' />"
                                    alt="<s:property value='name' />" class="movie-poster">
                            </div>
                            <div class="movie-info">
                                <div class="movie-title">
                                    <s:property value="name" />
                                </div>
                                <div class="movie-meta">
                                    <s:property value="category.name" /> •
                                    <s:date name="releaseDate" format="yyyy" />
                                </div>
                            </div>
                        </a>
                    </s:iterator>
                </div>

                <s:if test="movieList == null || movieList.size() == 0">
                    <div style="text-align: center; padding: 50px; color: #666;">
                        暂无相关电影
                    </div>
                </s:if>
            </div>

            <footer>
                <p>Copyright © 2024 LIBVIO Clone. All rights reserved.</p>
            </footer>
        </body>

        </html>