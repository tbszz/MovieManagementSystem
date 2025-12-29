<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>
                <s:text name="menu.news" />
            </title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
        </head>

        <body>
            <div class="app-container">
                <jsp:include page="../common/sidebar.jsp" />
                <div class="main-content">
                    <jsp:include page="../common/header.jsp" />

                    <div class="content-wrapper">
                        <h2>
                            <s:if test="news == null || news.id == null">Add News</s:if>
                            <s:else>Edit News</s:else>
                        </h2>

                        <div class="form-card">
                            <s:form action="news_save" method="post" theme="simple">
                                <s:hidden name="news.id" />
                                <s:hidden name="news.publishDate" />

                                <div class="form-group">
                                    <label>Title</label>
                                    <s:textfield name="news.title" cssClass="form-control" required="true" />
                                </div>

                                <div class="form-group">
                                    <label>Content</label>
                                    <s:textarea name="news.content" cssClass="form-control" rows="10" />
                                </div>

                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary">
                                        <s:text name="btn.save" />
                                    </button>
                                    <a href="news_list" class="btn btn-secondary">
                                        <s:text name="btn.cancel" />
                                    </a>
                                </div>
                            </s:form>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>