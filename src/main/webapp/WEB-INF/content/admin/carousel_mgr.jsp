<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>Carousel Management</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
        </head>

        <body>
            <div class="app-container">
                <jsp:include page="../common/sidebar.jsp" />
                <div class="main-content">
                    <jsp:include page="../common/header.jsp" />

                    <div class="content-wrapper">
                        <div class="action-bar">
                            <h2>轮播图管理</h2>
                            <a href="carousel_input" class="btn btn-primary">
                                <i class="icon-plus"></i> 添加轮播图
                            </a>
                        </div>

                        <div class="data-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>封面图</th>
                                        <th>标题</th>
                                        <th>跳转链接</th>
                                        <th>排序</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <s:iterator value="carouselList">
                                        <tr>
                                            <td>
                                                <s:property value="id" />
                                            </td>
                                            <td>
                                                <img src="${pageContext.request.contextPath}/<s:property value="
                                                    imageUrl" />" style="height: 50px; border-radius: 4px;">
                                            </td>
                                            <td>
                                                <s:property value="title" />
                                            </td>
                                            <td>
                                                <s:property value="targetUrl" />
                                            </td>
                                            <td>
                                                <s:property value="sortOrder" />
                                            </td>
                                            <td>
                                                <s:if test="isVisible">显示</s:if>
                                                <s:else><span style="color:Gray;">隐藏</span></s:else>
                                            </td>
                                            <td>
                                                <a href="carousel_input?id=<s:property value='id'/>"
                                                    class="btn-sm btn-edit">编辑</a>
                                                <a href="carousel_delete?id=<s:property value='id'/>"
                                                    class="btn-sm btn-delete"
                                                    onclick="return confirm('确认删除该轮播图?')">删除</a>
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