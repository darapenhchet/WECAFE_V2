package com.kosign.wecafe.services;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.forms.ProductForm;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private UserService userService;
	
	@Override
	public List<Product> getAllProducts() {
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			
			Criteria criteria = session.createCriteria(Product.class);
			criteria.addOrder(Order.desc("createdDate"));
			//criteria.setFirstResult(0);
			//criteria.setMaxResults(10);
			List<Product> products = (List<Product>)criteria.list();
			
/*			Query query = session.createQuery("FROM Product ORDER BY createdDate DESC");
			
			List<Product> products = (List<Product>)query.list();*/
			
			session.getTransaction().commit();
			return products;
		}catch(Exception ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
			//HibernateUtil.getSessionFactory().close();
		}
		return null;
	}
	
	@Transactional
	@Override
	public boolean addNewProduct(Product product) {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			Category category = session.get(Category.class, product.getCategory().getCatId());
			product.setCategory(category);
			product.setCreatedBy(userService.findUserByUsername(getPrincipal()));
			//product.setCreatedDate(new Date());
			session.save(product);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println(ex.getMessage());
		}
		return false;
	}
	
	@Override
	public boolean deleteProduct(Long id) {
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			Product product = session.get(Product.class, id);
			product.setStatus(false);
			session.update(product);
			session.getTransaction().commit();
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
		}
		return false;
	}
	
	@Override
	public boolean updateProduct(ProductForm newProduct) {
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			Category category = session.get(Category.class, newProduct.getCategoryId());
			Product product = session.get(Product.class, newProduct.getProductId());
			System.out.println("PRODUCT QUANTITY="+ newProduct.getQuantity());
			product.setProductName(newProduct.getProductName());
			//product.setQuantity(newProduct.getQuantity());
			product.setCostPrice(newProduct.getCostPrice());
			product.setUnitPrice(newProduct.getUnitPrice());
			product.setSalePrice(newProduct.getSalePrice());
			product.setCategory(category);
			product.setLastUpdatedDate(new Date());
			product.setImage(newProduct.getImage());
			//product.setLastUpdatedBy(newProduct.getLastUpdatedBy());
			session.saveOrUpdate(product);	
			session.getTransaction().commit();
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
		}
		return false;
	}
	
	@Override
	public Product findProductById(Long id) {
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			
			Product product = session.get(Product.class, id);
			
			session.getTransaction().commit();
			return product;
		}catch(Exception ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
		}
		return null;
	}
	
	@Override
	@Transactional
	public boolean updateProductStatus(Long id) {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			Product product = session.load(Product.class, id);
			product.setStatus(!product.getStatus());
			product.setLastUpdatedDate(new Date());
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	@Transactional
	public List<Product> getAllProductsPagination(int pageNumber, int perPage) {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(Product.class);
			criteria.setFirstResult(pageNumber-1);
			criteria.setMaxResults(perPage);
			List<Product> products = (List<Product>)criteria.list();
			return products;
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println(ex.getMessage());
		}
		return null;
	}
	
	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}
