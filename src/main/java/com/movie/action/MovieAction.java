package com.movie.action;

import com.opensymphony.xwork2.ActionSupport;
import com.movie.entity.Category;
import com.movie.entity.Movie;
import com.movie.service.CategoryService;
import com.movie.service.MovieService;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@Scope("prototype")
public class MovieAction extends ActionSupport {

    @Autowired
    private MovieService movieService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private com.movie.service.CommentService commentService;
    @Autowired
    private com.movie.service.ViewingRecordService viewingRecordService;
    @Autowired
    private com.movie.service.CarouselService carouselService;

    private List<Movie> movieList;
    private List<Category> categories;
    private java.util.List<com.movie.entity.Comment> commentList;
    private java.util.List<com.movie.entity.Carousel> carouselList;
    private Movie movie;
    private int id;
    private String keyword;
    private Double rating; // For submitting rating

    // File Upload (Movie)
    private File upload;
    private String uploadFileName;
    private String uploadContentType;

    // File Upload (Cover)
    private File cover;
    private String coverFileName;
    private String coverContentType;

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(MovieAction.class);

    public String list() {
        categories = categoryService.findAll(); // Populate categories for navbar
        if (keyword != null && !keyword.isEmpty()) {
            movieList = movieService.search(keyword);
        } else if (movie != null && movie.getCategory() != null && movie.getCategory().getId() != null) {
            movieList = movieService.findByCategory(movie.getCategory().getId());
        } else {
            movieList = movieService.findAll();
        }
        return "list";
    }

    public String home() {
        categories = categoryService.findAll(); // Populate categories for navbar
        carouselList = carouselService.findVisible();
        movieList = movieService.findHotMovies(8); // Fetch top 8 hot movies
        // If not enough hot movies, maybe fill with recent? For now just hot.
        if (movieList == null || movieList.isEmpty()) {
            movieList = movieService.findAll(); // Fallback
        }
        return "home";
    }

    public String input() {
        categories = categoryService.findAll();
        if (id > 0) {
            movie = movieService.get(id);
        }
        return "input";
    }

    public String view() {
        if (id > 0) {
            movie = movieService.get(id);
            if (movie != null) {
                commentList = commentService.findByMovie(id);
            }
        }
        return "view";
    }

    public String play() {
        if (id > 0) {
            movie = movieService.get(id);
            if (movie != null) {
                com.movie.entity.User user = (com.movie.entity.User) ServletActionContext.getRequest().getSession()
                        .getAttribute("user");
                if (user != null) {
                    com.movie.entity.ViewingRecord record = new com.movie.entity.ViewingRecord();
                    record.setMovie(movie);
                    record.setUser(user);
                    record.setStartTime(new java.util.Date());
                    // Duration is difficult to track without JS callbacks, setting 0 or mock
                    // default
                    record.setDuration(0L);
                    viewingRecordService.add(record);
                }
                // Fetch comments for play view too
                commentList = commentService.findByMovie(id);
            }
        }
        return "play";
    }

    public String addRating() {
        if (id > 0 && rating != null) {
            movie = movieService.get(id);
            if (movie != null) {
                double currentTotal = movie.getRating() * movie.getRatingCount();
                int newCount = movie.getRatingCount() + 1;
                double newRating = (currentTotal + rating) / newCount;
                movie.setRating(newRating);
                movie.setRatingCount(newCount);
                movieService.update(movie);
            }
        }
        return "redirect_view";
    }

    public String save() {
        try {
            if (movie == null) {
                movie = new Movie();
            }

            // Load category from database to avoid transient instance error
            if (movie.getCategory() != null && movie.getCategory().getId() != null) {
                Category category = categoryService.get(movie.getCategory().getId());
                movie.setCategory(category);
            }

            String path = ServletActionContext.getServletContext().getRealPath("/uploads");
            if (path == null) {
                path = System.getProperty("user.dir") + File.separator + "src" + File.separator + "main"
                        + File.separator + "webapp" + File.separator + "uploads";
            }
            File destPath = new File(path);
            if (!destPath.exists()) {
                destPath.mkdirs();
            }

            // Handle Movie File Upload
            if (upload != null) {
                String newMovieName = UUID.randomUUID().toString() + "_" + uploadFileName;
                File destMovieFile = new File(destPath, newMovieName);
                logger.info("Uploading movie file to: " + destMovieFile.getAbsolutePath());
                FileUtils.copyFile(upload, destMovieFile);
                movie.setFilePath("uploads/" + newMovieName);
            }

            // Handle Cover Image Upload
            if (cover != null) {
                String newCoverName = UUID.randomUUID().toString() + "_" + coverFileName;
                File destCoverFile = new File(destPath, newCoverName);
                logger.info("Uploading cover image to: " + destCoverFile.getAbsolutePath());
                FileUtils.copyFile(cover, destCoverFile);
                movie.setCoverImage("uploads/" + newCoverName);
            }

            if (movie.getId() == null) {
                movieService.add(movie);
            } else {
                movieService.update(movie);
            }
        } catch (Exception e) {
            logger.error("Error saving movie: ", e);
            addActionError("Save failed: " + e.getMessage());
            return ERROR;
        }
        return "redirect_list";
    }

    public String delete() {
        movieService.delete(id);
        return "redirect_list";
    }

    private List<Integer> ids;

    public String batchDelete() {
        if (ids != null && !ids.isEmpty()) {
            for (Integer mid : ids) {
                movieService.delete(mid);
            }
        }
        return "redirect_list";
    }

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }

    // Getters and Setters
    public List<Movie> getMovieList() {
        return movieList;
    }

    public void setMovieList(List<Movie> movieList) {
        this.movieList = movieList;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public File getCover() {
        return cover;
    }

    public void setCover(File cover) {
        this.cover = cover;
    }

    public String getCoverFileName() {
        return coverFileName;
    }

    public void setCoverFileName(String coverFileName) {
        this.coverFileName = coverFileName;
    }

    public String getCoverContentType() {
        return coverContentType;
    }

    public void setCoverContentType(String coverContentType) {
        this.coverContentType = coverContentType;
    }

    public java.util.List<com.movie.entity.Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(java.util.List<com.movie.entity.Comment> commentList) {
        this.commentList = commentList;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public java.util.List<com.movie.entity.Carousel> getCarouselList() {
        return carouselList;
    }

    public void setCarouselList(java.util.List<com.movie.entity.Carousel> carouselList) {
        this.carouselList = carouselList;
    }
}
