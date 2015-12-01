package com.kosign.wecafe.services;

import java.util.List;

import com.kosign.wecafe.entities.Category;

public interface CategoryService {

	public List<Category> getAllCategories();
	public Boolean addNewCategory(Category category);
	public Boolean updateCategory(Category category);
	public Boolean deleteCategory(Category id);
	public Category findCategoryById(Long id);
}
