<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>Add/Edit Slide</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
        </head>

        <body>
            <div class="app-container">
                <jsp:include page="../common/sidebar.jsp" />
                <div class="main-content">
                    <jsp:include page="../common/header.jsp" />

                    <div class="content-wrapper">
                        <div class="form-container">
                            <h2>
                                <s:if test="id > 0">Edit</s:if>
                                <s:else>Add</s:else> Slide
                            </h2>

                            <form action="carousel_save" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="<s:property value=" carousel.id" />">

                                <div class="form-group">
                                    <label>标题</label>
                                    <input type="text" name="carousel.title" value="<s:property value="
                                        carousel.title" />" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label>图片上传 (封面)</label>
                                    <input type="file" name="upload" class="form-control">
                                    <s:if test="carousel.imageUrl != null">
                                        <div style="margin-top:5px;">
                                            <p>当前封面:</p>
                                            <img src="${pageContext.request.contextPath}/<s:property value="
                                                carousel.imageUrl" />" height="80" style="border:1px solid #ddd;
                                            padding:2px;">
                                        </div>
                                    </s:if>
                                </div>

                                <div class="form-group">
                                    <label>跳转链接 (例如: user/movie_view?id=1)</label>
                                    <input type="text" name="carousel.targetUrl" value="<s:property value="
                                        carousel.targetUrl" />" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label>排序 (从小到大)</label>
                                    <input type="number" name="carousel.sortOrder" value="<s:property value="
                                        carousel.sortOrder" />" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label>是否可见</label>
                                    <select name="carousel.isVisible" class="form-control">
                                        <option value="true" <s:if test="carousel.isVisible == true">selected</s:if>>可见
                                        </option>
                                        <option value="false" <s:if test="carousel.isVisible == false">selected</s:if>
                                            >隐藏</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary">保存</button>
                                <a href="carousel_list" class="btn btn-default">取消</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>