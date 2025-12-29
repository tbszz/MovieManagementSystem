package com.movie.action;

import com.opensymphony.xwork2.ActionSupport;
import com.movie.entity.User;
import com.movie.service.UserService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

@Controller
@Scope("prototype")
public class UserAction extends ActionSupport {

    @Autowired
    private UserService userService;
    @Autowired
    private com.movie.service.ViewingRecordService viewingRecordService;

    private String username;
    private String password;
    private String confirmPassword;
    private String message;

    private java.util.List<com.movie.entity.ViewingRecord> viewingRecords;
    private long totalDuration;

    private java.util.List<User> users;
    private User user;
    private Integer id;

    public String list() {
        users = userService.findAll();
        return "list";
    }

    public String input() {
        if (id != null) {
            user = userService.get(id);
        }
        return INPUT;
    }

    public String save() {
        if (user != null && user.getId() != null) {
            User existingUser = userService.get(user.getId());
            if (existingUser != null) {
                // Only update allowed fields for now (Role)
                existingUser.setRole(user.getRole());
                userService.update(existingUser);
            }
        }
        return "redirect_list";
    }

    public String delete() {
        if (id != null) {
            userService.delete(id);
        }
        return "redirect_list";
    }

    public String login() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        // Clear previous messages
        message = null;

        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            if ("admin".equalsIgnoreCase(user.getRole())) {
                return "admin_success";
            } else {
                return "user_success";
            }
        } else {
            // Only set message on failure
            message = "用户名或密码错误";
            return INPUT; // Back to login.jsp
        }
    }

    public String registerInput() {
        return "register_input";
    }

    public String register() {
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            message = "用户名和密码不能为空";
            return "register_input";
        }

        if (!password.equals(confirmPassword)) {
            message = "两次输入的密码不一致";
            return "register_input";
        }

        // Check if user exists (Optional: assuming UserService handles it or catching
        // exception,
        // but explicit check is better. For now relying on DB unique constraint or
        // simple flow)
        // Ideally UserService should have findByUsername.
        // Let's rely on try-catch or just proceed for now as per plan granularity.
        // Actually, let's just proceed.

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setRole("user"); // Default role

        try {
            userService.register(newUser);
            message = "注册成功，请登录";
            return "register_success";
        } catch (Exception e) {
            e.printStackTrace();
            message = "注册失败，用户名可能已存在";
            return "register_input";
        }
    }

    public String privacy() {
        return "privacy";
    }

    public String help() {
        return "help";
    }

    public String logout() {
        ServletActionContext.getRequest().getSession().invalidate();
        return INPUT;
    }

    public String myStats() {
        User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
        if (user == null) {
            return LOGIN;
        }
        viewingRecords = viewingRecordService.findByUser(user.getId());
        return "stats";
    }

    // Export Stream
    private java.io.InputStream exportStream;

    public java.io.InputStream getExportStream() {
        return exportStream;
    }

    public String exportStats() {
        User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
        if (user == null) {
            return LOGIN;
        }

        viewingRecords = viewingRecordService.findByUser(user.getId());

        StringBuilder csv = new StringBuilder();
        csv.append("Movie Name,Start Time,Duration (s)\n");
        for (com.movie.entity.ViewingRecord record : viewingRecords) {
            csv.append(record.getMovie().getName()).append(",");
            csv.append(record.getStartTime()).append(",");
            csv.append(record.getDuration()).append("\n");
        }

        try {
            exportStream = new java.io.ByteArrayInputStream(csv.toString().getBytes("UTF-8"));
        } catch (java.io.UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return "export";
    }

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public java.util.List<com.movie.entity.ViewingRecord> getViewingRecords() {
        return viewingRecords;
    }

    public void setViewingRecords(java.util.List<com.movie.entity.ViewingRecord> viewingRecords) {
        this.viewingRecords = viewingRecords;
    }

    public long getTotalDuration() {
        return totalDuration;
    }

    public void setTotalDuration(long totalDuration) {
        this.totalDuration = totalDuration;
    }

    public java.util.List<User> getUsers() {
        return users;
    }

    public void setUsers(java.util.List<User> users) {
        this.users = users;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
