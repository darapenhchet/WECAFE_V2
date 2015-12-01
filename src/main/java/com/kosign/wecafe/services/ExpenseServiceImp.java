package com.kosign.wecafe.services;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Expense;
import com.kosign.wecafe.entities.ExpenseDetail;
import com.kosign.wecafe.entities.ImportProduct; 
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

@Service
public class ExpenseServiceImp implements ExpenseService {
	@Autowired SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Expense> listAllExpense() {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("FROM Expense");
			List<Expense>	expense = (List<Expense>)query.list();	
			return expense;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
		}
		return null;
	}

	@Override
	@Transactional
	public List<ExpenseDetail> listExpenseDetail(Long id) {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from ExpenseDetail where expense_id=" + id);
			List<ExpenseDetail>	expensedetail = (List<ExpenseDetail>)query.list();	
			return expensedetail;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
		}
		return null;
	}

}
