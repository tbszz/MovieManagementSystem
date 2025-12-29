<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <div class="sidebar">
            <div class="brand">
                Admin<span>Panel</span>
            </div>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/admin/index">
                        <i class="fas fa-chart-line"></i> 控制台
                    </a></li>
                <li><a href="${pageContext.request.contextPath}/admin/user_list">
                        <i class="fas fa-users"></i> 用户管理
                    </a></li>
                <li><a href="${pageContext.request.contextPath}/admin/movie_list"><i class="fas fa-video"></i> 电影管理</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/admin/carousel_list"><i class="fas fa-images"></i>
                        轮播图/大屏管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/category_list"><i class="fas fa-tags"></i>
                        分类管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/news_list">
                        <i class="fas fa-newspaper"></i> 新闻管理
                    </a></li>
                <li><a href="${pageContext.request.contextPath}/admin/comment_list">
                        <i class="fas fa-comments"></i> 评论管理
                    </a></li>
            </ul>

            <div class="logout-section">
                <a href="${pageContext.request.contextPath}/logout">
                    退出登录
                </a>
            </div>
        </div>