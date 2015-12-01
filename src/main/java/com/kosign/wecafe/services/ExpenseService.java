package com.kosign.wecafe.services;



import java.util.List;
import java.util.Map;

import com.kosign.wecafe.entities.Expense;
import com.kosign.wecafe.entities.ExpenseDetail;;

public interface ExpenseService {

	public   List<Expense> listAllExpense() ;
	public   List<ExpenseDetail> listExpenseDetail(Long id) ;
 
}
