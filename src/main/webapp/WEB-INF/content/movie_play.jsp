<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>播放:
                <s:property value="movie.name" /> - M-System
            </title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/minimal.css">
            <style>
                .player-container {
                    width: 100%;
                    max-width: 1200px;
                    margin: 0 auto;
                    padding: 20px;
                    background: #000;
                }

                video {
                    width: 100%;
                    outline: none;
                }

                .player-header {
                    padding: 20px;
                    color: #fff;
                    background: #1d1d1f;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .back-link {
                    color: #fff;
                    font-size: 14px;
                }
            </style>
        </head>

        <body style="background:#000;">

            <div class="player-header">
                <a href="${pageContext.request.contextPath}/user/movie_view?id=<s:property value=" movie.id" />"
                class="back-link">← 返回影片详情</a>
                <span style="font-weight:600;">
                    <s:property value="movie.name" />
                </span>
            </div>

            <div class="player-container">
                <video controls autoplay>
                    <source src="${pageContext.request.contextPath}/<s:property value=" movie.filePath" />"
                    type="video/mp4">
                    您的浏览器不支持 HTML5 视频。
                </video>
            </div>

        </body>

        </html>