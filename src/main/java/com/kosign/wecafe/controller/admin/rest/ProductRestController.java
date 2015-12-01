package com.kosign.wecafe.controller.admin.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kosign.wecafe.services.ProductService;

@RestController
@RequestMapping("/admin/rest")
public class ProductRestController {


	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/products/{pageNumber}/{perPage}")
	public Map<String, Object> getAllProducts(@PathVariable("pageNumber") int pageNumber, @PathVariable("perPage") int perPage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("PAGINATION","PAGINATION");
		map.put("PRODUCTS", productService.getAllProductsPagination(pageNumber, perPage));
		return map;
	}
	
	@RequestMapping(value="/products/")
	public Map<String, Object> getAllProducts(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("PAGINATION","PAGINATION");
		map.put("PRODUCTS", productService.getAllProducts());
		return map;
	}
}
