<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>Movies List</title>
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
                                <s:text name="menu.movies" />
                            </h2>
                            <div>
                                <button type="button" class="btn btn-delete" onclick="submitBatchDelete()"
                                    style="margin-right: 10px;">
                                    <i class="icon-trash"></i> 批量删除
                                </button>
                                <a href="movie_input" class="btn btn-primary" title="点击此处添加电影并上传影片文件">
                                    <i class="icon-plus"></i>
                                    <s:text name="btn.add" />
                                </a>
                            </div>
                        </div>

                        <div class="data-table">
                            <form id="batchForm" action="movie_batchDelete" method="post">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 40px;"><input type="checkbox" id="selectAll"
                                                    onclick="toggleAll(this)"></th>
                                            <th>ID</th>
                                            <th>
                                                <s:text name="label.name" />
                                            </th>
                                            <th>
                                                <s:text name="label.director" />
                                            </th>
                                            <th>
                                                <s:text name="label.category" />
                                            </th>
                                            <th>
                                                <s:text name="label.releaseDate" />
                                            </th>
                                            <th>
                                                <s:text name="label.actions" />
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="movieList">
                                            <tr>
                                                <td><input type="checkbox" name="ids" value="<s:property value='id'/>">
                                                </td>
                                                <td>
                                                    <s:property value="id" />
                                                </td>
                                                <td>
                                                    <s:property value="name" />
                                                </td>
                                                <td>
                                                    <s:property value="director" />
                                                </td>
                                                <td>
                                                    <s:property value="category.name" />
                                                </td>
                                                <td>
                                                    <s:date name="releaseDate" format="yyyy-MM-dd" />
                                                </td>
                                                <td>
                                                    <a href="movie_view?id=<s:property value='id'/>"
                                                        class="btn-sm btn-primary"
                                                        style="margin-right: 5px; text-decoration: none;">
                                                        查看
                                                    </a>
                                                    <a href="movie_input?id=<s:property value='id'/>"
                                                        class="btn-sm btn-edit">
                                                        <s:text name="btn.edit" />
                                                    </a>
                                                    <a href="movie_delete?id=<s:property value='id'/>"
                                                        class="btn-sm btn-delete"
                                                        onclick='return confirm("<s:text name="confirm.delete"/>")'>
                                                        <s:text name="btn.delete" />
                                                    </a>
                                                </td>
                                            </tr>
                                        </s:iterator>
                                    </tbody>
                                </table>
                            </form>
                        </div>

                        <script>
                            function toggleAll(source) {
                                checkboxes = document.getElementsByName('ids');
                                for (var i = 0, n = checkboxes.length; i < n; i++) {
                                    checkboxes[i].checked = source.checked;
                                }
                            }

                            function submitBatchDelete() {
                                var checkboxes = document.getElementsByName('ids');
                                var checkedOne = false;
                                for (var i = 0; i < checkboxes.length; i++) {
                                    if (checkboxes[i].checked) {
                                        checkedOne = true;
                                        break;
                                    }
                                }
                                if (!checkedOne) {
                                    alert("请至少选择一项进行删除");
                                    return;
                                }
                                if (confirm("确定要删除选中的电影吗？此操作不可恢复。")) {
                                    document.getElementById('batchForm').submit();
                                }
                            }
                        </script>
                    </div>
                </div>
            </div>
        </body>

        </html>