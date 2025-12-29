package com.movie.action;

import com.movie.entity.Comment;
import com.movie.entity.Movie;
import com.movie.entity.User;
import com.movie.service.CommentService;
import com.movie.service.MovieService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Date;

@Controller
@Scope("prototype")
public class CommentAction extends ActionSupport {

    @Autowired
    private CommentService commentService;

    @Autowired
    private MovieService movieService;

    private int movieId;
    private String content;
    private int id; // for delete
    private java.util.List<com.movie.entity.Comment> commentList; // For admin list

    public String add() {
        if (movieId > 0 && content != null && !content.trim().isEmpty()) {
            com.movie.entity.User user = (com.movie.entity.User) ServletActionContext.getRequest().getSession()
                    .getAttribute("user");
            if (user != null) {
                com.movie.entity.Comment comment = new com.movie.entity.Comment();
                comment.setContent(content);
                comment.setCreateDate(new java.util.Date());
                comment.setUser(user);

                com.movie.entity.Movie movie = new com.movie.entity.Movie();
                movie.setId(movieId);
                comment.setMovie(movie);

                commentService.add(comment);
            }
        }
        return "redirect_detail";
    }

    // Admin List
    public String list() {
        commentList = commentService.findAll();
        return "list";
    }

    public String delete() {
        if (id > 0) {
            com.movie.entity.Comment c = new com.movie.entity.Comment();
            c.setId(id);
            commentService.delete(c);
        }
        // Check if referer is admin or user detail
        // For simplicity, if movieId is set, go back to movie. If not, go to list.
        if (movieId > 0) {
            return "redirect_detail";
        }
        return "redirect_list";
    }

    // Getters and Setters
    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public java.util.List<com.movie.entity.Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(java.util.List<com.movie.entity.Comment> commentList) {
        this.commentList = commentList;
    }
}
