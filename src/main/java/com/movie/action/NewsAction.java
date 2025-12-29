package com.movie.action;

import com.opensymphony.xwork2.ActionSupport;
import com.movie.entity.News;
import com.movie.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Date;
import java.util.List;

@Controller
@Scope("prototype")
public class NewsAction extends ActionSupport {

    @Autowired
    private NewsService newsService;

    private List<News> newsList;
    private News news;
    private int id;

    public String list() {
        newsList = newsService.findAll();
        return "list";
    }

    public String save() {
        if (news == null) {
            news = new News();
        }

        if (news.getId() == null) {
            news.setPublishDate(new Date());
            newsService.add(news);
        } else {
            // Preserve original date or update? Updating for now.
            if (news.getPublishDate() == null)
                news.setPublishDate(new Date());
            newsService.update(news);
        }
        return "redirect_list";
    }

    public String edit() {
        news = newsService.get(id);
        return "input";
    }

    public String delete() {
        newsService.delete(id);
        return "redirect_list";
    }

    // Getters and Setters
    public List<News> getNewsList() {
        return newsList;
    }

    public void setNewsList(List<News> newsList) {
        this.newsList = newsList;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
