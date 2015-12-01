package com.kosign.wecafe.services;

import java.util.List;
import java.util.Map;

import com.kosign.wecafe.entities.ImportDetail;
import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.forms.ImportForm;

public interface ImportService {

	public List<ImportProduct> listAllImportProduct();
//	public List<Map> listAllImportProduct();
	public Boolean saveImportPro(List<ImportForm> importForm);
	public List<Product> listAllProduct();
	public List<Supplier> listAllSupplier();
	public Boolean updateImportPro(List<ImportForm> importform, Long id);
	 
	public List<Map> findById(Long id);
	public List<Map> listAllImportDetail(Long id);
	Boolean deleteImportPro(List<ImportForm> importform, Long id);
	
}