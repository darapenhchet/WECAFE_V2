package com.kosign.wecafe.controller.admin;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.ExpenseDetail;
import com.kosign.wecafe.services.ExpenseService; 

@Controller
public class ExpesneController {
	
	@Inject ExpenseService expenseService;
		
	@RequestMapping(value="/admin/expenselist", method=RequestMethod.GET)
	public String listAllExpense(Map<String, Object>model){ 
		
		model.put("expenses", expenseService.listAllExpense());
		return "admin/expenselist";
	}
	
	@RequestMapping(value="/admin/expenseadd", method=RequestMethod.GET)
	public String expProductAdd(){
		return "admin/expenseadd";
	}
	
	@RequestMapping(value="/admin/getexpensedetail/{expid}", method=RequestMethod.GET) 
		public @ResponseBody List<ExpenseDetail> expensedetail(@PathVariable("expid") Long expid, Map<String, Object>model){ 
		 
		return expenseService.listExpenseDetail(expid);
	}
	 
}
