package com.kosign.wecafe.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.forms.ProductForm;
import com.kosign.wecafe.services.CategoryService;
import com.kosign.wecafe.services.ProductService;
import com.kosign.wecafe.services.UnitService;
import com.kosign.wecafe.services.UserService;

@Controller
public class ProductController {

	@Inject
	private ProductService productService;

	@Inject
	private CategoryService categoryService;
	
	@Inject
	private UnitService unitService;

	@Autowired
	private UserService userService;
		
	@RequestMapping(value = "/admin/productadd", method = RequestMethod.GET)
	public String productadd(Map<String, Object> model) {
		model.put("categories", categoryService.getAllCategories());
		model.put("units", unitService.getAllUnits());
		return "admin/productadd";
	}

	@RequestMapping(value = "/admin/product/{id}", method = RequestMethod.GET)
	public String updateProduct(@PathVariable("id") Long id, Map<String, Object> model) {
		Product product = productService.findProductById(id);
		model.put("product", product);
		model.put("categories", categoryService.getAllCategories());
		return "admin/productupdate";
	}

	@RequestMapping(value = "/admin/product/update", method = RequestMethod.POST)
	public @ResponseBody boolean updateProduct(ProductForm product, HttpServletRequest request) {
		return productService.updateProduct(product);
	}

	@RequestMapping(value = "/admin/product/delete/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody boolean deleteProduct(@RequestBody @PathVariable("id") Long id) {
		System.out.println("DELETE ID=" + id);
		return productService.deleteProduct(id);
	}
	
	@RequestMapping(value = "/admin/product/status/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody boolean changeProductStatus(@PathVariable("id") Long id) {
		System.out.println("ID=" + id);
		return productService.updateProductStatus(id);
	}
	
	@RequestMapping(value = "/admin/product/invoice")
	public String productInvoice(){
		return "admin/invoice";
	}
	
}

