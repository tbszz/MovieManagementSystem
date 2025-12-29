<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>Edit User</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
        </head>

        <body>
            <div class="app-container">
                <jsp:include page="../common/sidebar.jsp" />
                <div class="main-content">
                    <jsp:include page="../common/header.jsp" />

                    <div class="content-wrapper">
                        <div class="form-container">
                            <h2>编辑用户角色</h2>

                            <form action="user_save" method="post">
                                <s:hidden name="user.id" />

                                <div class="form-group">
                                    <label>用户名</label>
                                    <input type="text" value="<s:property value='user.username'/>" readonly
                                        class="form-control" style="background-color: #f5f5f5;">
                                </div>

                                <div class="form-group">
                                    <label>角色</label>
                                    <select name="user.role" class="form-control">
                                        <option value="user" <s:if test="user.role == 'user'">selected</s:if>>普通用户
                                        </option>
                                        <option value="admin" <s:if test="user.role == 'admin'">selected</s:if>>管理员
                                        </option>
                                    </select>
                                </div>

                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary">保存</button>
                                    <a href="user_list" class="btn btn-secondary">取消</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>