package com.kosign.wecafe.services;

import java.util.List;

import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.forms.ProductForm;

public interface ProductService {
	public List<Product> getAllProducts();
	public List<Product> getAllProductsPagination(int pageNumber, int perPage);
	public Product findProductById(Long id);
	public boolean addNewProduct(Product product);
	public boolean updateProduct(ProductForm product);
	public boolean deleteProduct(Long id);
	public boolean updateProductStatus(Long id);
	
}
