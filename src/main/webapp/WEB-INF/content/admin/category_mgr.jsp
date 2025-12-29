<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>Category Management</title>
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
                                <s:text name="menu.categories" />
                            </h2>
                            <a href="category_input" class="btn btn-primary">
                                <s:text name="btn.add" />
                            </a>
                        </div>

                        <div class="data-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>
                                            <s:text name="label.name" />
                                        </th>
                                        <th>
                                            <s:text name="label.actions" />
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <s:iterator value="categoryList">
                                        <tr>
                                            <td>
                                                <s:property value="id" />
                                            </td>
                                            <td>
                                                <s:property value="name" />
                                            </td>
                                            <td>
                                                <a href="category_input?id=<s:property value='id'/>"
                                                    class="btn-sm btn-edit">
                                                    <s:text name="btn.edit" />
                                                </a>
                                                <a href="category_delete?id=<s:property value='id'/>"
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