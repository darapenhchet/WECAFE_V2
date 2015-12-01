package com.kosign.wecafe.services;

import java.util.List;
import java.util.Map;

import com.kosign.wecafe.entities.Order;
import com.kosign.wecafe.entities.Pagination;

public interface SellService {

	public List<Map> getSellAllList(Pagination pagination);
	public List<Map<String, Object>> getDetailSellProduct(long id);
	public List<Order> getAllOrders();
	public Long getAllSellCount();
}
