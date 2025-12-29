<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>我的观影记录 - M-System</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/minimal.css">
            <style>
                .stats-summary {
                    background: #f5f5f7;
                    padding: 30px;
                    border-radius: 12px;
                    text-align: center;
                    margin-bottom: 40px;
                }

                .stats-count {
                    font-size: 48px;
                    font-weight: 700;
                    margin-bottom: 10px;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                th,
                td {
                    padding: 15px;
                    text-align: left;
                    border-bottom: 1px solid #e5e5e5;
                }

                th {
                    font-weight: 600;
                    color: #86868b;
                    font-size: 14px;
                }
            </style>
        </head>

        <body>

            <nav class="navbar">
                <div class="nav-container">
                    <a href="${pageContext.request.contextPath}/" class="nav-logo" style="font-weight:700;">M-System</a>
                    <ul class="nav-links">
                        <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/movie_list">全部电影</a></li>
                    </ul>
                </div>
            </nav>

            <div class="section-container">
                <h2 class="section-title">我的观影记录</h2>

                <div class="stats-summary">
                    <div class="stats-count">
                        <s:property value="viewingRecords.size()" />
                    </div>
                    <div>观看影片总数</div>
                    <div style="margin-top: 10px; font-size: 14px; color: #86868b;">由于技术限制，暂未统计具体时长</div>
                </div>

                <!-- Export Button -->
                <div style="text-align: right; margin-bottom: 20px;">
                    <a href="${pageContext.request.contextPath}/user/user_exportStats" class="btn btn-primary"
                        target="_blank">导出 CSV 数据</a>
                </div>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>影片名称</th>
                        <th>观看时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <s:iterator value="viewingRecords">
                        <tr>
                            <td>
                                <a href="${pageContext.request.contextPath}/user/movie_view?id=<s:property value="
                                    movie.id" />">
                                <s:property value="movie.name" />
                                </a>
                            </td>
                            <td>
                                <s:date name="startTime" format="yyyy-MM-dd HH:mm:ss" />
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/user/movie_view?id=<s:property value="
                                    movie.id" />" class="btn" style="padding: 4px 10px; font-size: 12px;">重温</a>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
            </div>

            <footer>
                <p>Copyright © 2024 Movie Management System</p>
            </footer>

        </body>

        </html>