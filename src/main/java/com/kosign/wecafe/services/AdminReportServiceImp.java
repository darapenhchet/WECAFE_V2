package com.kosign.wecafe.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.kosign.wecafe.forms.DateForm;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class AdminReportServiceImp implements AdminReportService {

	@Override
	public List<Map> getReportListAllSellProduct() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery(
					"SELECT new Map(O.pk.product.productId As prouductID " 
									+ ", O.pk.product.productName as productName "
									+ ", SUM(O.proQty) As proQty "
									+ ", O.proUnitPrice As UnitPrice "
									+ ", SUM(O.proQty * O.proUnitPrice) as Total)"
						+ " FROM OrderDetail O " 
						+ " INNER JOIN O.pk.order " 
						+ " INNER JOIN O.pk.order.sale "
						+ " Where O.pk.order.sale.saleDatetime BETWEEN :startDate AND :endDate "
						+ " and O.pk.order.status = 2 "
						+ " GROUP BY  O.pk.product.productId, O.pk.product.productName, O.proUnitPrice");

			// query.setParameter("orderId", new Long(94));
			SimpleDateFormat dateformat3 = new SimpleDateFormat("dd/MM/yyyy");
			Date date1 = dateformat3.parse("26/10/2015");
			Date date2 = dateformat3.parse("29/11/2015");
			query.setParameter("startDate", date1);
			query.setParameter("endDate", date2);
			List<Map> products = (ArrayList<Map>) query.list();
			System.out.println("products.size()" + products.size());
 
			return products;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}

		return null;
	}

	@Override
	public List<Map> getReportListAllOrderProduct() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			/*Query query = session.createQuery(
					"SELECT new Map(O.pk.product.productId As prouductID " 
									+ ", O.pk.product.productName as productName "
									+ ", SUM(O.proQty) As proQty "
									+ ", O.proUnitPrice As UnitPrice "
									+ ", SUM(O.proQty * O.proUnitPrice) as Total)"
						+ " FROM OrderDetail O " 
						+ " INNER JOIN O.pk.order " 
						+ " INNER JOIN O.pk.order.sale "
						+ " Where O.pk.order.sale.saleDatetime BETWEEN :startDate AND :endDate "
						+ " and O.pk.order.status = 1 "
						+ " GROUP BY  O.pk.product.productId, O.pk.product.productName, O.proUnitPrice");

			*/
		
			Query query = session.createQuery("Select new Map("
					+ "p.productName as proname,"
					+ "SUM(impdetail.proQty) as proqty,"
					+ "impdetail.unitPrice as prounitprice,"
				//	+ "impdetail.supplier.supplierName as supname, "
					+ " SUM(impdetail.proQty * impdetail.unitPrice) as Total)"
					+ " FROM ImportDetail impdetail" 
					+ " INNER JOIN impdetail.pk1.product p"
					+ " GROUP BY p.productName, impdetail.unitPrice ");
			// query.setParameter("orderId", new Long(94));
//			SimpleDateFormat dateformat3 = new SimpleDateFormat("dd/MM/yyyy");
//			 Date date1 = dateformat3.parse("26/10/2015");
//			 Date date2 = dateformat3.parse("29/11/2015");
//			query.setParameter("startDate", date1);
//			query.setParameter("endDate", date2);
			List<Map> products = (ArrayList<Map>) query.list();
			System.out.println("products.size()" + products.size());
//			for (Map product : products) {
//				System.out.println("productName" + product.get("productName"));
//				System.out.println("prouductID " + product.get("prouductID"));
//				System.out.println("proQty " + product.get("proQty"));
//				System.out.println("UnitPrice " + product.get("UnitPrice"));
//				System.out.println("Total" + product.get("Total"));
//			}
			return products;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Map> getSearchSellbyDate(DateForm dateForm) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery(
					"SELECT new Map(O.pk.product.productId As prouductID " 
									+ ", O.pk.product.productName as productName "
									+ ", SUM(O.proQty) As proQty "
									+ ", O.proUnitPrice As UnitPrice "
									+ ", SUM(O.proQty * O.proUnitPrice) as Total)"
						+ " FROM OrderDetail O " 
						+ " INNER JOIN O.pk.order " 
						+ " INNER JOIN O.pk.order.sale "
						+ " Where O.pk.order.sale.saleDatetime BETWEEN :startDate AND :endDate "
						+ " and O.pk.order.status = 2 "
						+ " GROUP BY  O.pk.product.productId, O.pk.product.productName, O.proUnitPrice");

			// query.setParameter("orderId", new Long(94));
			SimpleDateFormat dateformat3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date startdate = dateformat3.parse(dateForm.getStartdate());
			Date enddate = dateformat3.parse(dateForm.getEnddate());
			query.setParameter("startDate", startdate);
			query.setParameter("endDate", enddate);
			List<Map> products = (ArrayList<Map>) query.list();
			System.out.println("products.size()" + products.size());
//			for (Map product : products) {
//				System.out.println("productName" + product.get("productName"));
//				System.out.println("prouductID " + product.get("prouductID"));
//				System.out.println("proQty " + product.get("proQty"));
//				System.out.println("UnitPrice " + product.get("UnitPrice"));
//				System.out.println("Total" + product.get("Total"));
//			}
			
			System.out.println("=======================================" + query );
			return products;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}

		return null;
	}

	@Override
	public List<Map> getSearchOrderbyDate(DateForm dateForm) { 
		

		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			/*Query query = session.createQuery(
					"SELECT new Map(O.pk.product.productId As prouductID " 
									+ ", O.pk.product.productName as productName "
									+ ", SUM(O.proQty) As proQty "
									+ ", O.proUnitPrice As UnitPrice "
									+ ", SUM(O.proQty * O.proUnitPrice) as Total)"
						+ " FROM OrderDetail O " 
						+ " INNER JOIN O.pk.order " 
						+ " INNER JOIN O.pk.order.sale "
						+ " Where O.pk.order.sale.saleDatetime BETWEEN :startDate AND :endDate "
						+ " and O.pk.order.status = 1 "
						+ " GROUP BY  O.pk.product.productId, O.pk.product.productName, O.proUnitPrice");						


			*/
//			SELECT pd.pro_id, pd.imp_id, pd.pro_qty, pd.pro_status, pd.sup_id, pd.unit_price from import_detail pd INNER JOIN import p on pd.imp_id = p.imp_id where p.imp_date = '2015-11-13'
			
			Query query = session.createQuery("Select new Map("
					+ "p.productName as proname,"
					+ "SUM(impdetail.proQty) as proqty,"
					+ "impdetail.unitPrice as prounitprice,"
				//	+ "impdetail.supplier.supplierName as supname, "
					+ " SUM(impdetail.proQty * impdetail.unitPrice) as Total)"
					+ " FROM ImportDetail impdetail" 
					+ " Inner join impdetail.pk1.importProduct imppro"
					+ " INNER JOIN impdetail.pk1.product p"
					+ " Where imppro.impDate BETWEEN :startDate AND :endDate "
					+ " GROUP BY p.productName, impdetail.unitPrice ");
			 // query.setParameter("orderId", new Long(94));
			
			SimpleDateFormat dateformat3 = new SimpleDateFormat("yyyy-MM-dd");
			Date startdate = dateformat3.parse(dateForm.getStartdate());
			Date enddate = dateformat3.parse(dateForm.getEnddate());
			query.setParameter("startDate", startdate);
			query.setParameter("endDate", enddate); 
			List<Map> products = (ArrayList<Map>) query.list();
			System.out.println("products.size()" + products.size());
//			for (Map product : products) {
//				System.out.println("productName" + product.get("productName"));
//				System.out.println("prouductID " + product.get("prouductID"));
//				System.out.println("proQty " + product.get("proQty"));
//				System.out.println("UnitPrice " + product.get("UnitPrice"));
//				System.out.println("Total" + product.get("Total"));
//			}
			return products;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return null;
	}
}
