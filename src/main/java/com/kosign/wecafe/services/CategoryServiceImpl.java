package com.kosign.wecafe.services;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Category;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	UserService userService;
	
	@Override
	@Transactional
	public List<Category> getAllCategories() {
		try{
			return (List<Category>)sessionFactory.getCurrentSession()
												 .createCriteria(Category.class)
												 .add(Restrictions.eq("status", true)).list();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	@Transactional
	public Boolean addNewCategory(Category category) {
		try{
			sessionFactory.getCurrentSession().save(category);
			return true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	@Transactional
	public Boolean updateCategory(Category category) {
		try{
			category.setLastUpdatedDate(new Date());
			sessionFactory.getCurrentSession().update(category);
			return true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	@Transactional
	public Boolean deleteCategory(Category deleteCategory) {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			Category category = session.get(Category.class, deleteCategory.getCatId());
			category.setStatus(false);
			category.setLastUpdatedDate(new Date());
			//category.setLastUpdatedBy(deleteCategory.getLastUpdatedBy());
			session.saveOrUpdate(category);
			return true;			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	@Transactional
	public Category findCategoryById(Long id) {
		try{
			return sessionFactory.getCurrentSession().get(Category.class, id);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return null;
	}
	
	

}
