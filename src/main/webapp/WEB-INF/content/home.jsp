<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="zh-CN">

            <head>
                <meta charset="UTF-8">
                <title>LIBVIO - 电影管理</title>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/libvio_style.css?v=2">
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <!-- Icons from Heroicons (SVG) -->
            </head>

            <body>

                <!-- Header -->
                <nav class="navbar">
                    <div class="nav-content">
                        <a href="${pageContext.request.contextPath}/" class="logo">
                            <svg viewBox="0 0 24 24">
                                <path
                                    d="M4 6H2v14c0 1.1.9 2 2 2h14v-2H4V6zm16-4H8c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-8 12.5v-9l6 4.5-6 4.5z" />
                            </svg>
                            ATLASON
                        </a>

                        <ul class="nav-links">
                            <li><a href="${pageContext.request.contextPath}/" class="active">首页</a></li>
                            <li><a href="${pageContext.request.contextPath}/movie_list">全部电影</a></li>
                            <li><a href="${pageContext.request.contextPath}/news_list">新闻资讯</a></li>
                            <!-- Category Dropdown -->
                            <li class="user-menu" style="margin-right: 0;">
                                <a href="#" style="pointer-events: none;">分类 <span style="font-size: 10px;">▼</span></a>
                                <div class="dropdown-menu" style="left: 0; min-width: 120px;">
                                    <s:iterator value="categories">
                                        <!-- Assuming filtering logic will differ, for now link to movie_list?category_id=X -->
                                        <a href="${pageContext.request.contextPath}/movie_list?movie.category.id=<s:property value='id'/>"
                                            class="dropdown-item">
                                            <s:property value="name" />
                                        </a>
                                    </s:iterator>
                                </div>
                            </li>
                        </ul>

                        <div class="nav-actions">
                            <!-- Search -->
                            <div class="search-wrapper" id="searchWrapper">
                                <form action="${pageContext.request.contextPath}/movie_list" method="get"
                                    id="searchForm">
                                    <input type="text" name="keyword" class="search-input" placeholder="搜索电影...">
                                </form>
                                <button class="icon-btn" onclick="toggleSearch()">
                                    <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                    </svg>
                                </button>
                            </div>

                            <!-- History -->
                            <s:if test="#session.user != null">
                                <a href="${pageContext.request.contextPath}/user/user_myStats" class="icon-btn"
                                    title="观影记录">
                                    <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                </a>
                            </s:if>

                            <!-- User Menu -->
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
                                            style="border-bottom: 1px solid #333; margin-bottom: 5px; opacity: 0.7;">
                                            <s:property value="#session.user.username" />
                                        </div>

                                        <!-- Only show Admin Dashboard if role is 'admin' -->
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
                    </div>
                </nav>

                <!-- Main Content -->
                <div class="main-container">

                    <!-- Carousel -->
                    <div class="hero-carousel">
                        <s:iterator value="carouselList" status="st">
                            <div class="carousel-slide ${st.first ? 'active' : ''}"
                                style="background-image: url('${pageContext.request.contextPath}/<s:property value='imageUrl' />');">
                                <div class="slide-overlay">
                                    <div class="slide-title">
                                        <s:property value="title" />
                                    </div>
                                    <s:if test="targetUrl != null && targetUrl != ''">
                                        <a href="${pageContext.request.contextPath}/<s:property value='targetUrl' />"
                                            class="slide-btn">立即观看</a>
                                    </s:if>
                                </div>
                            </div>
                        </s:iterator>
                    </div>

                    <!-- Hot Recommendations -->
                    <h2 class="section-title">热门推荐</h2>
                    <div class="movie-grid">
                        <s:iterator value="movieList">
                            <a href="${pageContext.request.contextPath}/user/movie_view?id=<s:property value='id' />"
                                class="movie-card">
                                <div class="poster-wrapper">
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
                                    <div class="movie-meta" style="color: #f5c518; font-weight: 600;">
                                        <s:set var="r" value="rating" />
                                        豆
                                        <fmt:formatNumber value="${r}" pattern="0.0" />分
                                    </div>
                                </div>
                            </a>
                        </s:iterator>
                    </div>

                </div>

                <footer>
                    <p>Copyright © 2024 ATLASON. All rights reserved.</p>
                </footer>

                <script>
                    function toggleSearch() {
                        var wrapper = document.getElementById('searchWrapper');
                        var input = wrapper.querySelector('.search-input');
                        wrapper.classList.toggle('active');
                        if (wrapper.classList.contains('active')) {
                            input.focus();
                        }
                    }

                    // Carousel Auto-play
                    document.addEventListener('DOMContentLoaded', function () {
                        const slides = document.querySelectorAll('.carousel-slide');
                        let currentSlide = 0;
                        if (slides.length > 1) {
                            setInterval(() => {
                                slides[currentSlide].classList.remove('active');
                                currentSlide = (currentSlide + 1) % slides.length;
                                slides[currentSlide].classList.add('active');
                            }, 5000);
                        }
                    });
                </script>
            </body>

            </html>