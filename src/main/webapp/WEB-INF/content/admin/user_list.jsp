<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>User Management</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
        </head>

        <body>
            <div class="app-container">
                <jsp:include page="../common/sidebar.jsp" />
                <div class="main-content">
                    <jsp:include page="../common/header.jsp" />

                    <div class="content-wrapper">
                        <div class="action-bar">
                            <h2>用户管理</h2>
                        </div>

                        <div class="data-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>用户名</th>
                                        <th>角色</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <s:iterator value="users">
                                        <tr>
                                            <td>
                                                <s:property value="id" />
                                            </td>
                                            <td>
                                                <s:property value="username" />
                                            </td>
                                            <td>
                                                <s:if test="role == 'admin'">
                                                    <span class="badge badge-primary">管理员</span>
                                                </s:if>
                                                <s:else>
                                                    <span class="badge badge-secondary">普通用户</span>
                                                </s:else>
                                            </td>
                                            <td>
                                                <a href="user_input?id=<s:property value='id'/>"
                                                    class="btn-sm btn-edit">
                                                    编辑
                                                </a>
                                                <a href="user_delete?id=<s:property value='id'/>"
                                                    class="btn-sm btn-delete" onclick="return confirm('确定要删除该用户吗？')">
                                                    删除
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