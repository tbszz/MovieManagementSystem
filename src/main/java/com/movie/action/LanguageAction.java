package com.movie.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Locale;

@Controller
@Scope("prototype")
public class LanguageAction extends ActionSupport {

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(LanguageAction.class);

    private String request_locale;
    private String returnUrl;

    public String switchLanguage() {
        String contextPath = ServletActionContext.getRequest().getContextPath();

        if (request_locale != null && !request_locale.isEmpty()) {
            Locale newLocale;
            if ("zh_CN".equals(request_locale)) {
                newLocale = Locale.SIMPLIFIED_CHINESE;
            } else if ("en_US".equals(request_locale)) {
                newLocale = Locale.US;
            } else {
                newLocale = Locale.getDefault();
            }

            // Set locale for the current request
            ActionContext.getContext().setLocale(newLocale);

            // Store in session for subsequent requests
            ServletActionContext.getRequest().getSession().setAttribute("WW_TRANS_I18N_LOCALE", newLocale);

            logger.info("Language switched to: " + request_locale);
        }

        // Clean up returnUrl to avoid duplicate context path
        if (returnUrl != null && !returnUrl.isEmpty()) {
            if (returnUrl.startsWith(contextPath)) {
                returnUrl = returnUrl.substring(contextPath.length());
            }
            // Ensure it's not pointing to switchLanguage itself to avoid loops
            if (returnUrl.contains("switchLanguage")) {
                returnUrl = "/admin/index";
            }
        } else {
            returnUrl = "/admin/index";
        }

        return SUCCESS;
    }

    // Getters and Setters
    public String getRequest_locale() {
        return request_locale;
    }

    public void setRequest_locale(String request_locale) {
        this.request_locale = request_locale;
    }

    public String getReturnUrl() {
        return returnUrl;
    }

    public void setReturnUrl(String returnUrl) {
        this.returnUrl = returnUrl;
    }
}
