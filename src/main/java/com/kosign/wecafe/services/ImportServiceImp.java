package com.kosign.wecafe.services;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.ImportDetail;
import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.forms.ImportForm;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class ImportServiceImp implements ImportService {

	@Inject UserService userService;
	
	@Autowired SessionFactory sessionFactory;
	
//	@Override
//	public List<Map> listAllImportProduct() {
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		try {
//			session.getTransaction().begin();
//			/*Query query = session.createQuery("SELECT new Map(io.proQty as proQty ,product.productName as productName, ip.userId as userId"
//					+ "							 )"
//					+ "FROM ImportDetail io "
//					+ "INNER JOIN io.pk1.product product "
//					+ "INNER JOIN io.pk1.importProduct ip ");
//			Query query = session.createQuery("SELECT new Map("
//					+ "io.proQty as proQty"
//					+ ",ip.impId as impId"
//					+ ", io.unitPrice as unitPrice"
//					+ ", io.proStatus as status"
//					+ ",product.productName as productName"
//					+ ",ip.userId as userId"
//					+ ",sp.supplierName as supplierName)"
//					+ "FROM ImportDetail io "
//					+ "INNER JOIN io.pk1.product product "
//					+ "INNER JOIN io.pk1.importProduct ip "
//					+ "INNER JOIN io.supplier sp"
//					);*/
//			
///*			Query query = session.createQuery("SELECT new Map("
//					+ "io.proQty as proQty"
//					+ ",ip.impId as impId"
//					+ ", io.unitPrice as unitPrice"
//					+ ", io.proStatus as status"
//					+ ",product.productName as productName"
//					+ ", product.productId as productId"
//					+ ",ip.userId as userId"
//					+ ",ip.impDate as impDate"
//					+ ",ip.totalAmount as totalAmount)"
//					+ "FROM ImportDetail io "
//					+ "INNER JOIN io.pk1.product product "
//					+ "INNER JOIN io.pk1.importProduct ip "
//					
////					+ "INNER JOIN io.supplier sp "
////					+ "WHERE ip.impId = ? "
//					);*/
//			Query query = session.createQuery("FROM ImportProduct");
//			
//			List<Map> importProducts = (ArrayList<Map>)query.list();
//			System.out.println("products.size()" + importProducts.size());
////			for(Map Product : importProducts){
////				
////				
////			}
//			return importProducts;
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println(e.getMessage());
//			session.getTransaction().rollback();
//		}finally {
//			session.close();
//		}
//		
//		return null;
//	}
	@Override
	@Transactional
	public List<ImportProduct> listAllImportProduct() {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			session.getTransaction().begin();
			Query query = session.createQuery("FROM ImportProduct");
			List<ImportProduct>	importProducts = (List<ImportProduct>)query.list();	
			return importProducts;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
		}
		
		return null;
	}
	@Override
	@Transactional
	public Boolean saveImportPro(List<ImportForm> importform) { 
		
		Session session = sessionFactory.getCurrentSession();
		try {
			session.getTransaction().begin();
			//1. save import product 
			ImportProduct importProduct = new ImportProduct();
			importProduct.setImpDate(new Date());
			User user = userService.findUserByUsername(getPrincipal());
			importProduct.setUserId(user.getId());
			System.out.println("userid idididi" + user.getId());
			//session.save(importProduct);

			//2.save import detail
			
			for(int i=0; i < importform.size();i++){
				ImportDetail importdetail = new ImportDetail();
				Product product = new Product();
				product.setProductId(importform.get(i).getProId());
				System.out.println("importform.size(pid)" + importform.get(i).getProId());
				importdetail.setProduct(product);
				importdetail.setImportProduct(importProduct);
				importdetail.setProQty(importform.get(i).getQuantity());
				System.out.println("importform.size(pid)" + importform.get(i).getQuantity());
				importdetail.setProStatus(true);
				Supplier suppliers = new Supplier();
				suppliers.setSupId(importform.get(i).getSupplierId());
				importdetail.setSupplier(suppliers);
				System.out.println("importform.get(i).getSupplierId()" + importform.get(i).getSupplierId());
				importdetail.setSupplierid(importform.get(i).getSupplierId());
				importdetail.setUnitPrice(importform.get(i).getUnitPrice());
				System.out.println("importform.size(price)" + importform.get(i).getUnitPrice());
				importProduct.getImportDetail().add(importdetail);
				//session.save(importdetail);
				
				
				//3. update product (stock)
				Product products  = session.get(Product.class, importdetail.getProduct().getProductId());
				System.out.println("importdetail.getProduct().getProductId()" + products.getQuantity());
				products.setQuantity(products.getQuantity() + importform.get(i).getQuantity() );
				System.out.println("product.getQuantity()" +  importform.get(i).getQuantity());
				session.update(products);
			}
			//importProduct.setImpId(impId);
			session.save(importProduct);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
		}
		return null;
	}

	@Override
	public List<Product> listAllProduct() {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("FROM Product");
			List<Product> products = query.list(); 
			 return products; 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Supplier> listAllSupplier() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("FROM Supplier");
			 List<Supplier> suppliers= query.list();
			 return suppliers; 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}finally {
			session.close();
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

	@Override
	@Transactional
	public Boolean updateImportPro(List<ImportForm> importForms, Long id) {
	    try {
			ImportProduct importProduct = sessionFactory.getCurrentSession().get(ImportProduct.class, id);
			Set<ImportDetail> importDetails = importProduct.getImportDetail();
			
			System.out.println("IMPORT DETAILS SIZE=" + importDetails.size());
			
			for(ImportDetail importDetail : importDetails){
				Product product = sessionFactory.getCurrentSession().get(Product.class, importDetail.getProduct().getProductId());
				product.setQuantity(product.getQuantity() - importDetail.getProQty());
				product.setLastUpdatedDate(new Date());
				product.setLastUpdatedBy(userService.findUserByUsername(getPrincipal()));
				/*sessionFactory.getCurrentSession().flush();
				sessionFactory.getCurrentSession().clear();*/
				sessionFactory.getCurrentSession().update(product);
				//importProduct.getImportDetail().remove(importDetail);
				//sessionFactory.getCurrentSession().evict(product);
				
				System.out.println("PRODUCT ID = " + product.getProductId());
				//session.delete(importDetail);
			}
			
			importProduct.getImportDetail().clear();
					
			//importProduct.setImportDetail(new HashSet<ImportDetail>());
			sessionFactory.getCurrentSession().update(importProduct);
		/*	sessionFactory.getCurrentSession().flush();
			sessionFactory.getCurrentSession().clear();*/
			
			//sessionFactory.getCurrentSession().evict(importProduct);
												
			for(ImportForm importForm : importForms){
				ImportDetail importDetail = new ImportDetail();
				Product product = sessionFactory.getCurrentSession().get(Product.class, importForm.getProId());
				importDetail.setImportProduct(importProduct);
				importDetail.setProduct(product);
				importDetail.setSupplier(sessionFactory.getCurrentSession().get(Supplier.class, importForm.getSupplierId()));
				importDetail.setUnitPrice(importForm.getUnitPrice());
				importDetail.setProQty(importForm.getQuantity());
				importDetail.setProStatus(true);
				
				product.setUnitPrice(new BigDecimal(importForm.getUnitPrice()));
				product.setQuantity(product.getQuantity()+importForm.getQuantity());
				//sessionFactory.getCurrentSession().flush();
				//sessionFactory.getCurrentSession().clear();
				sessionFactory.getCurrentSession().update(product);
				
				importProduct.getImportDetail().add(importDetail);
				System.out.println("PRODUCT QTY = " + importForm.getQuantity());
				System.out.println("PRODUCT = " + importForm.getProId());
			}
			System.out.println("IMPORT DETAIL SIZE=" + importProduct.getImportDetail().size());
			
			//sessionFactory.getCurrentSession().flush();
			//sessionFactory.getCurrentSession().clear();
			sessionFactory.getCurrentSession().update(importProduct);
			//session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.getStackTrace();
			//session.getTransaction().rollback();
		}finally {
			//session.close();
		}
		return false;
	}

	@Override
	public List<Map> findById(Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			
//			Query query = session.createQuery("SELECT new Map("
//					+ "io.proQty as proQty"
//					+ ",ip.impId as impId"
//					+ ", io.unitPrice as unitPrice"
//					+ ", io.proStatus as status"
//					+ ",product.productName as productName"
//					+ ", product.productId as productId"
//					+ ",ip.userId as userId"
//					+ ",sp.supplierName as supplierName)"
//					+ "FROM ImportDetail io "
//					+ "INNER JOIN io.pk1.product product "
//					+ "INNER JOIN io.pk1.importProduct ip "
//					+ "INNER JOIN io.supplier sp "
//					+ "WHERE ip.impId = ? "
//					);
			Query query = session.createQuery("Select new Map("
					+ "p.productName as proname,"
					+ "impdetail.proQty as proqty,"
					+ "impdetail.unitPrice as prounitprice,"
					+ "impdetail.supplier.supplierName as supname)"
					+ " FROM ImportDetail impdetail" 
					+ " INNER JOIN impdetail.pk1.product  p"
					+ " WHERE impdetail.pk1.importProduct.impId= ? ");
			
			query.setParameter(0, id);
			
			List<Map> importProducts = (List<Map>)query.list();
			
			return importProducts;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Map> listAllImportDetail(Long id){
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("Select new Map("
											+ "p.productName as proname,"
											+ "p.productId as proid,"
											+ "impdetail.proQty as proqty,"
											+ "impdetail.unitPrice as prounitprice,"
											+ "impdetail.supplier.supId as supId,"
											+ "impdetail.supplier.supplierName as supname)"
											+ " FROM ImportDetail impdetail" 
											+ " INNER JOIN impdetail.pk1.product  p"
											+ " WHERE impdetail.pk1.importProduct.impId= ? ");
			query.setParameter(0, id);
			List<Map> importDetails = query.list();
			session.getTransaction().commit();
			return importDetails;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.getStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public Boolean deleteImportPro(List<ImportForm> importform, Long id ) {

		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			Query query = session.createQuery("FROM ImportDetail ID"
											+ " Where ID.pk1.importProduct.impId = ? "
											+ " and ID.pk1.product.productId = ? ");
				query.setParameter(0,  id);
				query.setParameter(1, 1);
			ImportDetail importdetail =   (ImportDetail)query.uniqueResult();
			session.delete(importdetail);
			 
			//System.out.println("importdetail : " + importdetail);
			
			session.delete(importdetail);
			session.beginTransaction().commit();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return true;
	}
 
	 
}
