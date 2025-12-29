<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <div class="header">
            <div class="page-title">
                <s:text name="title.system" />
            </div>
            <div class="user-profile">
                <span>
                    <s:property value="#session.user.username" />
                </span>
                <span class="lang-switch">
                    <a href="${pageContext.request.contextPath}/switchLanguage?request_locale=zh_CN&returnUrl=${requestScope['javax.servlet.forward.request_uri']}"
                        style="color: #6366f1; text-decoration: none;">中文</a>
                    <span style="margin: 0 5px;">/</span>
                    <a href="${pageContext.request.contextPath}/switchLanguage?request_locale=en_US&returnUrl=${requestScope['javax.servlet.forward.request_uri']}"
                        style="color: #6366f1; text-decoration: none;">EN</a>
                </span>
            </div>
        </div>