<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>Category Form</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
        </head>

        <body>
            <div class="app-container">
                <jsp:include page="../common/sidebar.jsp" />
                <div class="main-content">
                    <jsp:include page="../common/header.jsp" />

                    <div class="content-wrapper">
                        <h2>
                            <s:text name="menu.categories" />
                        </h2>
                        <div class="form-card">
                            <s:form action="category_save" method="post" theme="simple">
                                <s:hidden name="category.id" />
                                <div class="form-group">
                                    <label>
                                        <s:text name="label.name" />
                                    </label>
                                    <s:textfield name="category.name" cssClass="form-control" required="true" />
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary">
                                        <s:text name="btn.save" />
                                    </button>
                                    <a href="category_list" class="btn btn-secondary">
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