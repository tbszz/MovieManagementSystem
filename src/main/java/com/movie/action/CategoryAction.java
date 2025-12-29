package com.movie.action;

import com.opensymphony.xwork2.ActionSupport;
import com.movie.entity.Category;
import com.movie.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Scope("prototype")
public class CategoryAction extends ActionSupport {

    @Autowired
    private CategoryService categoryService;

    private List<Category> categoryList;
    private Category category;
    private int id;

    // List all categories
    public String list() {
        categoryList = categoryService.findAll();
        return "list";
    }

    // Add or Update category
    public String save() {
        if (category == null) {
            category = new Category();
        }

        System.out.println("Saving category: " + category.getName());

        if (category.getId() == null || category.getId() == 0) {
            categoryService.add(category);
        } else {
            categoryService.update(category);
        }
        return "redirect_list";
    }

    // Input form (for both add and edit)
    public String input() {
        if (id > 0) {
            category = categoryService.get(id);
        }
        return "input";
    }

    // Edit (load for form) - alias for input
    public String edit() {
        return input();
    }

    // Delete category
    public String delete() {
        categoryService.delete(id);
        return "redirect_list";
    }

    // Getters and Setters
    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
