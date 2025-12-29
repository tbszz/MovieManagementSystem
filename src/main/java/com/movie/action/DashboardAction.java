package com.movie.action;

import com.movie.service.MovieService;
import com.movie.service.CategoryService;
import com.movie.service.CommentService;
import com.movie.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Scope("prototype")
public class DashboardAction extends ActionSupport {

    @Autowired
    private MovieService movieService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CommentService commentService;

    // You might need a UserService if you want to count users, but I'll stick to
    // available services first.
    // If UserService isn't injectable or doesn't have count, I might skip user
    // count or add it.
    // Checking UserAction, it uses UserService.
    @Autowired
    private UserService userService;

    private int movieCount;
    private int categoryCount;
    private int commentCount;
    private int userCount;

    public String execute() {
        // Since services might not have count() methods, I'll use list().size()
        // Note: Inefficiencies are acceptable for this scale.
        // If services allow findAll(), I'll use that.

        try {
            movieCount = movieService.findAll().size();
            categoryCount = categoryService.findAll().size();
            commentCount = commentService.findAll().size();
            userCount = userService.findAll().size();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }

    public int getMovieCount() {
        return movieCount;
    }

    public int getCategoryCount() {
        return categoryCount;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public int getUserCount() {
        return userCount;
    }
}
