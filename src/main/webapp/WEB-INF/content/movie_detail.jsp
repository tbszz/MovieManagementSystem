<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="zh-CN">

            <head>
                <meta charset="UTF-8">
                <title>
                    <s:property value="movie.name" /> - 详情
                </title>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/libvio_style.css?v=3">
                <style>
                    .detail-container {
                        max-width: 1200px;
                        margin: 40px auto;
                        padding: 0 20px;
                        display: flex;
                        gap: 40px;
                        color: #ccc;
                    }

                    .detail-poster-wrapper {
                        width: 300px;
                        flex-shrink: 0;
                    }

                    .detail-poster-img {
                        width: 100%;
                        border-radius: 8px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
                    }

                    .detail-content {
                        flex: 1;
                    }

                    .detail-title {
                        font-size: 32px;
                        font-weight: 700;
                        color: #fff;
                        margin-bottom: 20px;
                    }

                    .info-row {
                        margin-bottom: 12px;
                        font-size: 14px;
                        line-height: 1.6;
                        color: #aaa;
                    }

                    .info-label {
                        color: #777;
                    }

                    .play-btn {
                        display: inline-block;
                        background-color: #f5c518;
                        /* Yellow/Gold */
                        color: #000;
                        font-weight: 700;
                        padding: 12px 40px;
                        border-radius: 4px;
                        margin-top: 30px;
                        margin-bottom: 30px;
                        font-size: 16px;
                        transition: background 0.2s;
                    }

                    .play-btn:hover {
                        background-color: #e3b60f;
                    }

                    .rating-score {
                        color: #4CAF50;
                        /* Green like Douban/Bean */
                        font-weight: bold;
                        font-size: 16px;
                    }

                    .desc-text {
                        margin-top: 10px;
                        line-height: 1.8;
                        color: #bbb;
                    }

                    .comment-area {
                        max-width: 1200px;
                        margin: 40px auto;
                        padding: 0 20px;
                        border-top: 1px solid #333;
                        padding-top: 40px;
                    }

                    .comment-item {
                        padding: 20px 0;
                        border-bottom: 1px dashed #333;
                    }
                </style>
            </head>

            <body>

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
                            <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                            <li><a href="${pageContext.request.contextPath}/movie_list">全部电影</a></li>
                        </ul>
                        <div class="nav-actions">
                            <!-- Simple user placeholder -->
                            <s:if test="#session.user != null">
                                <span style="color:#aaa; font-size:14px;">
                                    <s:property value="#session.user.username" />
                                </span>
                            </s:if>
                            <s:else>
                                <a href="${pageContext.request.contextPath}/login"
                                    style="color:#aaa; font-size:14px;">登录</a>
                            </s:else>
                        </div>
                    </div>
                </nav>

                <div class="detail-container">
                    <div class="detail-poster-wrapper">
                        <img src="${pageContext.request.contextPath}/<s:property value='movie.coverImage' />"
                            class="detail-poster-img">
                    </div>
                    <div class="detail-content">
                        <div class="detail-title">
                            <s:property value="movie.name" />
                        </div>

                        <div class="info-row">
                            类型:
                            <s:property value="movie.category.name" /> /
                            地区:
                            <s:property value="movie.region" default="未知" /> /
                            年份:
                            <s:date name="movie.releaseDate" format="yyyy" /> /
                            上映:
                            <s:date name="movie.releaseDate" format="yyyy-MM-dd" />(
                            <s:property value="movie.region" default="未知" />)
                        </div>

                        <div class="info-row">
                            主演:
                            <s:property value="movie.actors" /> /
                            导演:
                            <s:property value="movie.director" />
                        </div>

                        <div class="info-row">
                            <s:set var="mr" value="movie.rating" />
                            评分: <span class="rating-score">豆
                                <fmt:formatNumber value="${mr}" pattern="0.0" />分
                            </span>
                        </div>

                        <div class="info-row">
                            最后更新:
                            <s:date name="movie.updateTime" format="yyyy-MM-dd HH:mm:ss" />
                        </div>

                        <div class="info-row">
                            简介:
                            <div class="desc-text">
                                <s:property value="movie.description" />
                                <span style="color:#777; font-size:12px; cursor:pointer;">详情</span>
                            </div>
                        </div>

                        <a href="${pageContext.request.contextPath}/user/movie_play?id=<s:property value='movie.id' />"
                            class="play-btn">立即播放</a>


                    </div>
                </div>

                <!-- Comments Section (simplified from previous) -->
                <div class="comment-area">
                    <h3 style="color:#eee; margin-bottom:20px;">用户评论 (
                        <s:property value="commentList.size()" />)
                    </h3>

                    <s:if test="#session.user != null">
                        <form action="${pageContext.request.contextPath}/user/comment_add" method="post"
                            style="margin-bottom:30px;">
                            <input type="hidden" name="movieId" value="<s:property value='movie.id' />">
                            <textarea name="content"
                                style="width:100%; height:80px; background:#222; border:1px solid #444; color:#fff; padding:10px; border-radius:4px;"
                                placeholder="写下你的评论..."></textarea>
                            <button type="submit"
                                style="margin-top:10px; padding:6px 15px; background:#444; color:#fff; border:none; border-radius:4px; cursor:pointer;">发布</button>
                        </form>
                    </s:if>

                    <div class="comment-list">
                        <s:iterator value="commentList">
                            <div class="comment-item">
                                <div style="color:#f5c518; font-weight:bold; margin-bottom:5px;">
                                    <s:property value="user.username" />
                                    <span style="color:#666; font-size:12px; font-weight:normal; margin-left:10px;">
                                        <s:date name="createDate" format="yyyy-MM-dd HH:mm" />
                                    </span>
                                </div>
                                <div style="color:#ddd; line-height:1.5;">
                                    <s:property value="content" />
                                </div>
                            </div>
                        </s:iterator>
                    </div>
                </div>

                <footer>
                    <p>Copyright © 2024 Movie Management System</p>
                </footer>

            </body>

            </html>