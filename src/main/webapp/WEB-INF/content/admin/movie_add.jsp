<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>Movie Form</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
        </head>

        <body>
            <div class="app-container">
                <jsp:include page="../common/sidebar.jsp" />
                <div class="main-content">
                    <jsp:include page="../common/header.jsp" />

                    <div class="content-wrapper">
                        <h2>
                            <s:if test="movie == null || movie.id == null">
                                <s:text name="title.addMovie" />
                            </s:if>
                            <s:else>
                                <s:text name="title.editMovie" />
                            </s:else>
                        </h2>

                        <div class="form-card">
                            <s:form action="movie_save" method="post" enctype="multipart/form-data" theme="simple">
                                <s:hidden name="movie.id" />
                                <s:hidden name="movie.filePath" />
                                <s:hidden name="movie.coverImage" />

                                <div class="form-group">
                                    <label>
                                        <s:text name="label.name" />
                                    </label>
                                    <s:textfield name="movie.name" cssClass="form-control" required="true" />
                                </div>

                                <div class="form-group">
                                    <label>
                                        <s:text name="label.director" />
                                    </label>
                                    <s:textfield name="movie.director" cssClass="form-control" />
                                </div>

                                <div class="form-group">
                                    <label>
                                        <s:text name="label.actors" />
                                    </label>
                                    <s:textfield name="movie.actors" cssClass="form-control" />
                                </div>

                                <div class="form-group">
                                    <label>
                                        <s:text name="label.category" />
                                    </label>
                                    <s:select list="categories" listKey="id" listValue="name" name="movie.category.id"
                                        headerKey="" headerValue="%{getText('label.selectCategory')}"
                                        cssClass="form-control" />
                                </div>

                                <div class="form-group">
                                    <label>Region</label>
                                    <s:textfield name="movie.region" cssClass="form-control"
                                        placeholder="e.g. USA, UK, China" />
                                </div>

                                <div class="form-group">
                                    <label>Language</label>
                                    <s:textfield name="movie.language" cssClass="form-control"
                                        placeholder="e.g. English, Chinese" />
                                </div>

                                <div class="form-group" style="display:flex; align-items:center; gap:10px;">
                                    <label style="margin-bottom:0;">Hot Recommendation?</label>
                                    <s:checkbox name="movie.isHot" />
                                </div>

                                <div class="form-group">
                                    <label>
                                        <s:text name="label.releaseDate" />
                                    </label>
                                    <input type="date" name="movie.releaseDate"
                                        value="<s:date name='movie.releaseDate' format='yyyy-MM-dd'/>"
                                        class="form-control">
                                </div>

                                <div class="form-group">
                                    <label>
                                        <s:text name="label.description" />
                                    </label>
                                    <s:textarea name="movie.description" cssClass="form-control" rows="4" />
                                </div>

                                <div class="form-group">
                                    <label>
                                        <s:text name="label.uploadFile" />
                                    </label>
                                    <s:file name="upload" cssClass="form-control" />
                                    <p class="help-text" style="font-size: 0.85rem; color: #666; margin-top: 5px;">
                                        <s:text name="tip.uploadFile" />
                                    </p>
                                </div>

                                <div class="form-group">
                                    <label>
                                        <s:text name="label.uploadCover" />
                                    </label>
                                    <s:file name="cover" cssClass="form-control" />
                                    <p class="help-text" style="font-size: 0.85rem; color: #666; margin-top: 5px;">
                                        <s:text name="tip.uploadCover" />
                                    </p>
                                </div>

                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary">
                                        <s:text name="btn.save" />
                                    </button>
                                    <a href="movie_list" class="btn btn-secondary">
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