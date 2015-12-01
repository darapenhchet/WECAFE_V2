package com.kosign.wecafe.services;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.kosign.wecafe.entities.Unit;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class UnitsServiceImp implements UnitService {

	@Override
	public List<Unit> getAllUnits() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("FROM Unit");
			List<Unit> units = query.list();
			return units;
			
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		
		
		
		return null;
	}

}
