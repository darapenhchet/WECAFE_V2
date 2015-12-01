package com.kosign.wecafe.services;

import java.util.List;
import java.util.Map;

import com.kosign.wecafe.forms.DateForm;

public interface AdminReportService {
	
	public List<Map> getReportListAllSellProduct();
	
	public List<Map> getReportListAllOrderProduct();
	
	public List<Map> getSearchSellbyDate(DateForm dateForm);

	public List<Map> getSearchOrderbyDate(DateForm dateForm);
	
}
