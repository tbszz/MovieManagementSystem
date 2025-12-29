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
                        <div class="action-bar">
                            <h2>
                                <s:text name="menu.news" />
                            </h2>
                            <a href="news_input" class="btn btn-primary">
                                <s:text name="btn.add" />
                            </a>
                        </div>

                        <div class="data-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th> <!-- Placeholder or reused I18N -->
                                        <th>Publish Date</th>
                                        <th>
                                            <s:text name="label.actions" />
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <s:iterator value="newsList">
                                        <tr>
                                            <td>
                                                <s:property value="id" />
                                            </td>
                                            <td>
                                                <s:property value="title" />
                                            </td>
                                            <td>
                                                <s:date name="publishDate" format="yyyy-MM-dd" />
                                            </td>
                                            <td>
                                                <a href="news_input?id=<s:property value='id'/>"
                                                    class="btn-sm btn-edit">
                                                    <s:text name="btn.edit" />
                                                </a>
                                                <a href="news_delete?id=<s:property value='id'/>"
                                                    class="btn-sm btn-delete"
                                                    onclick='return confirm("<s:text name="confirm.delete"/>")'>
                                                    <s:text name="btn.delete" />
                                                </a>
                                            </td>
                                        </tr>
                                    </s:iterator>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>