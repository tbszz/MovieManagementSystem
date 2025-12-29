package com.movie.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

@Component("authInterceptor")
public class AuthInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Object user = session.getAttribute("user");

        if (user == null) {
            return "login"; // Global result for login redirect
        }

        return invocation.invoke();
    }
}
