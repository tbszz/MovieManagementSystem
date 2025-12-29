<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>影片详情 - <s:property value="movie.name"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
    <style>
        .detail-card {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            max-width: 800px;
            margin: 0 auto;
        }
        .detail-header {
            display: flex;
            gap: 2rem;
            margin-bottom: 2rem;
        }
        .detail-cover {
            width: 200px;
            height: 280px;
            object-fit: cover;
            border-radius: 8px;
            background: #f0f0f0;
        }
        .detail-info {
            flex: 1;
        }
        .info-item {
            margin-bottom: 0.8rem;
        }
        .info-label {
            font-weight: 600;
            color: #666;
            width: 80px;
            display: inline-block;
        }
        .info-content {
            color: #333;
        }
        .detail-description {
            border-top: 1px solid #eee;
            padding-top: 1.5rem;
            margin-top: 1.5rem;
        }
        .description-text {
            line-height: 1.6;
            color: #555;
            white-space: pre-wrap;
        }
        .detail-actions {
            margin-top: 2rem;
            display: flex;
            gap: 1rem;
        }
    </style>
</head>
<body>
    <div class="app-container">
        <jsp:include page="../common/sidebar.jsp" />
        <div class="main-content">
            <jsp:include page="../common/header.jsp" />

            <div class="content-wrapper">
                <div class="detail-card">
                    <div class="detail-header">
                        <s:if test="movie.coverImage != null">
                            <img src="${pageContext.request.contextPath}/<s:property value='movie.coverImage'/>" class="detail-cover" alt="Cover">
                        </s:if>
                        <s:else>
                            <div class="detail-cover" style="display:flex;align-items:center;justify-content:center;">No Cover</div>
                        </s:else>
                        
                        <div class="detail-info">
                            <h2 style="margin-top:0;"><s:property value="movie.name"/></h2>
                            <div class="info-item">
                                <span class="info-label">导演:</span>
                                <span class="info-content"><s:property value="movie.director"/></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">主演:</span>
                                <span class="info-content"><s:property value="movie.actors"/></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">分类:</span>
                                <span class="info-content"><s:property value="movie.category.name"/></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">上映日期:</span>
                                <span class="info-content"><s:date name="movie.releaseDate" format="yyyy-MM-dd"/></span>
                            </div>
                        </div>
                    </div>

                    <div class="detail-description">
                        <h3>影片描述</h3>
                        <div class="description-text"><s:property value="movie.description"/></div>
                    </div>

                    <div class="detail-actions">
                        <s:if test="movie.filePath != null">
                            <a href="${pageContext.request.contextPath}/<s:property value='movie.filePath'/>" target="_blank" class="btn btn-primary">查看/播放影片</a>
                        </s:if>
                        <a href="movie_list" class="btn btn-secondary">返回列表</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
