package com.movie.action;

import com.movie.entity.Carousel;
import com.movie.service.CarouselService;
import com.opensymphony.xwork2.ActionSupport;
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
public class CarouselAction extends ActionSupport {

    @Autowired
    private CarouselService carouselService;

    private List<Carousel> carouselList;
    private Carousel carousel;
    private int id;

    // File Upload
    private File upload;
    private String uploadFileName;
    private String uploadContentType;

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(CarouselAction.class);

    public String list() {
        carouselList = carouselService.findAll();
        return "list";
    }

    public String input() {
        if (id > 0) {
            carousel = carouselService.get(id);
        }
        return "input";
    }

    public String save() {
        try {
            if (carousel == null) {
                carousel = new Carousel();
            }

            // Handle Image Upload
            if (upload != null) {
                String path = ServletActionContext.getServletContext().getRealPath("/uploads");
                if (path == null) {
                    path = System.getProperty("user.dir") + File.separator + "src" + File.separator + "main"
                            + File.separator + "webapp" + File.separator + "uploads";
                }
                File destPath = new File(path);
                if (!destPath.exists()) {
                    destPath.mkdirs();
                }

                String newFileName = UUID.randomUUID().toString() + "_" + uploadFileName;
                File destFile = new File(destPath, newFileName);
                FileUtils.copyFile(upload, destFile);
                carousel.setImageUrl("uploads/" + newFileName);
            }

            if (carousel.getId() == null) {
                if (carousel.getIsVisible() == null)
                    carousel.setIsVisible(true);
                carouselService.add(carousel);
            } else {
                // If update and no new file, keep old url (handled by hidden field or fetching
                // old)
                // If carousel object is bound partially, care needed.
                // Creating a simplified update here assuming hidden fields or separate logic?
                // Usually struts params interceptor updates the object.
                // If imageUrl is null, we might lose it if not careful.
                // Better to fetch DB state if id exists and copy props if image is null.
                Carousel dbCarousel = carouselService.get(carousel.getId());
                if (upload == null && dbCarousel != null) {
                    carousel.setImageUrl(dbCarousel.getImageUrl());
                }
                carouselService.update(carousel);
            }
        } catch (Exception e) {
            logger.error("Error saving carousel: ", e);
            addActionError("Save failed: " + e.getMessage());
            return ERROR;
        }
        return "redirect_list";
    }

    public String delete() {
        carouselService.delete(id);
        return "redirect_list";
    }

    // Getters and Setters
    public List<Carousel> getCarouselList() {
        return carouselList;
    }

    public void setCarouselList(List<Carousel> carouselList) {
        this.carouselList = carouselList;
    }

    public Carousel getCarousel() {
        return carousel;
    }

    public void setCarousel(Carousel carousel) {
        this.carousel = carousel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
}
