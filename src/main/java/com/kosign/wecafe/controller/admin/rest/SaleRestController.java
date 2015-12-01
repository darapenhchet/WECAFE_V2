package com.kosign.wecafe.controller.admin.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosign.wecafe.entities.Pagination;
import com.kosign.wecafe.services.SellService;

@RestController
@RequestMapping("/admin/rest")
public class SaleRestController {


	@Autowired
	SellService sellService;
	
	@RequestMapping(value="/sales", method=RequestMethod.GET, produces= MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> getAllSales(@RequestParam(value="page") int currentPage, 
														   @RequestParam(value="limit") int limit){
		Map<String, Object> map = new HashMap<String, Object>();
		Pagination pagination = new Pagination();
		pagination.setCurrentPage(currentPage);
		pagination.setPerPage(limit);
		System.out.println(pagination.getPerPage());
		map.put("SALES", sellService.getSellAllList(pagination));
		System.out.println(sellService.getAllSellCount());
		pagination.setTotalCount(sellService.getAllSellCount());
		pagination.setTotalPages(pagination.totalPages());
		map.put("PAGINATION", pagination);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	/*@RequestMapping(value="/sales/")
	public Map<String, Object> getAllSales(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("PAGINATION","PAGINATION");
		map.put("SALES", sellService.getSellAllList(0,10));
		return map;
	}*/
}
