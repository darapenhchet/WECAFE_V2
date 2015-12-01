package com.kosign.wecafe.controller.admin.rest;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.Pagination;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.forms.ProductForm;
import com.kosign.wecafe.services.ProductService;
import com.kosign.wecafe.services.UserService;


//TODO: Product REST Controller
@RestController
@RequestMapping("api/admin")
public class ProductRestController {

	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	// TODO: List All Products
	@RequestMapping(value="/products", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getAllProducts(@ModelAttribute Pagination pagination){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("products", productService.findAllProducts(pagination));
		pagination.setTotalCount(productService.count());
		pagination.setTotalPages(pagination.totalPages());
		map.put("pagination",pagination);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	// TODO: Get a Product
	@RequestMapping(value="/products/{id}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getProductById(@PathVariable(value="id") Long id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", productService.findProductById(id));
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	// TODO: Get a Count of Products
	@RequestMapping(value="/products/count", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getProductCount(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", productService.count());
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	// TODO: Create a New Product
	@RequestMapping(value="/products", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> createNewProduct(@RequestBody Product product, Principal principal){
		Map<String, Object> map = new HashMap<String, Object>();
		//Product product = new Product();
        //Category category = new Category();
        //category.setCatId(form.getCategoryId());
		User user = userService.findUserByUsername(principal.getName());
		//System.out.println(user.getUsername());
		//product.setProductName(form.getProductName());
		//product.setQuantity(form.getQuantity());
		//product.setCostPrice(form.getCostPrice());
		//product.setSalePrice(form.getSalePrice());
		//product.setUnitPrice(form.getUnitPrice());
		//product.setCategory(category);
		product.setImage(product.getImage());
		product.setCreatedDate(new Date());
		product.setLastUpdatedDate(new Date());
		product.setStatus(true);
		if(productService.addNewProduct(product)){
			map.put("STATUS", true);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.CREATED);
		}else{
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// TODO: Update a Product
	@RequestMapping(value="/products/{id}", method=RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> updateProduct(@PathVariable(value="id") Long id, @RequestBody Product product){
		Map<String, Object> map = new HashMap<String, Object>();
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	// TODO: Delete a Product
	@RequestMapping(value="/products/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> deleteProduct(@PathVariable(value="id") Long id){
		Map<String, Object> map = new HashMap<String, Object>();
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	// TODO: Delete All Products
	@RequestMapping(value="/products", method=RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> deleteAllProducts(){
		Map<String, Object> map = new HashMap<String, Object>();
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
}
