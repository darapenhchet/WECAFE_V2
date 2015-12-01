package com.kosign.wecafe.services;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class SupplierImpl implements SupplierService{


	@Override
	public Boolean saveSupplier(Supplier supplier) {
		Session session = null;
		try {
			session =  HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			
			session.save(supplier);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
			//HibernateUtil.getSessionFactory().close();
		}
		
		return false;
	}

	@Override
	public List<Supplier> getAllSupplier() {
		
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			Query query = session.createQuery("FROM Supplier");
			List<Supplier> supplier = (List<Supplier>)query.list();
			
			System.out.println(supplier);
			return supplier;
			
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			
		}finally {
			session.close();
		}
		return null;
		
		
	}

	@Override
	public Boolean updateSupplier(Supplier supplier) { 
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
//			Supplier suppliers = session.get(Supplier.class, supplier.getSupId());
			session.update(supplier);

			session.beginTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		
		return false;
	}

	@Override
	public Supplier findSupplierById(long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Supplier supplier = session.get(Supplier.class, id);
			System.out.println(supplier.getSupplierName());
			session.getTransaction().commit();
			return supplier;
			
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public Boolean deleteSupplier(Supplier supplier) {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			Supplier suppliers = session.get(Supplier.class, supplier.getSupId());
			//add field status
			session.delete(suppliers);
			session.beginTransaction().commit();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return true;
	}
}
