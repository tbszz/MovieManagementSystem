<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>Comment Management</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
        </head>

        <body>
            <div class="app-container">
                <jsp:include page="../common/sidebar.jsp" />
                <div class="main-content">
                    <jsp:include page="../common/header.jsp" />

                    <div class="content-wrapper">
                        <div class="action-bar">
                            <h2>Comment Management</h2>
                        </div>

                        <div class="data-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Content</th>
                                        <th>User</th>
                                        <th>Movie</th>
                                        <th>Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <s:iterator value="commentList">
                                        <tr>
                                            <td>
                                                <s:property value="id" />
                                            </td>
                                            <td>
                                                <s:property value="content" />
                                            </td>
                                            <td>
                                                <s:property value="user.username" />
                                            </td>
                                            <td>
                                                <s:property value="movie.name" />
                                            </td>
                                            <td>
                                                <s:date name="createDate" format="yyyy-MM-dd HH:mm" />
                                            </td>
                                            <td>
                                                <a href="comment_delete?id=<s:property value='id'/>"
                                                    class="btn-sm btn-delete"
                                                    onclick="return confirm('Confirm delete?')">Delete</a>
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