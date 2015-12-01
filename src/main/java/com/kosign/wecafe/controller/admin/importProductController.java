package com.kosign.wecafe.controller.admin;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.ImportDetail;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.forms.ImportForm;
import com.kosign.wecafe.services.ImportService;
import com.kosign.wecafe.services.ProductService;
import com.kosign.wecafe.services.SupplierService;

@Controller
public class importProductController {
	
	@Inject ImportService importService;
	
	@Inject ProductService productService;
	
	@Inject SupplierService supplierService;
	
	@RequestMapping(value="/admin/importlist", method=RequestMethod.GET)
	public String listAllImpProduct(Map<String, Object>model){
		System.out.println("jasdfjklajfasjfjasdlkfjasdkl");
		model.put("importproducts",importService.listAllImportProduct());
		return "admin/importlist";
	}
	
	@RequestMapping(value="/admin/searchproduct", method=RequestMethod.POST)
	public @ResponseBody List<Product> searchProductName(){
		return importService.listAllProduct();
	}
	
	@RequestMapping(value="/admin/searchsupplier", method=RequestMethod.POST)
	public @ResponseBody List<Supplier> searchSupplierName(){
		return importService.listAllSupplier();
	}
	
	@RequestMapping(value="/admin/importadd", method=RequestMethod.GET)
	public String impProductAdd(){
		return "admin/importadd";
	}
	
	@RequestMapping(value="/admin/addImport", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Boolean saveImpProduct(@RequestBody List<ImportForm> importForm)	{
		ImportDetail importDetails = new ImportDetail();
		System.out.println(importForm.size());
		try {
			/*
			 * Product product = productService.findProductById(importForm.getProId());
		    //Supplier supplier = supplierService.findSupplierById(importForm.getSupplierId());
			importDetails.setProduct(product);
			
			importDetails.setProQty(importForm.getQuantity());
			importDetails.setUnitPrice(importForm.getUnitPrice());
			importDetails.setProStatus(true);
			importDetails.setSupId(importForm.getSupplierId());
			;*/
			return importService.saveImportPro(importForm);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	@RequestMapping(value="/admin/importupdate/{id}", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Boolean importupdate(@RequestBody List<ImportForm> importform, @PathVariable("id") Long impId){
		
		System.out.println("simpId +" + impId);
		 try {
			return importService.updateImportPro(importform, impId);
			//return importService.deleteImportPro(importform, impId);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}  
		return false;
	}
	
	@RequestMapping(value="admin/getimportdetail/{id}", method=RequestMethod.POST)
		public @ResponseBody List<Map> importdetail(@PathVariable("id") Long impid, Map<String, Object>model){
			   
		return importService.listAllImportDetail(impid);
			
		}
	 
	@RequestMapping(value="/admin/viewById/{id}", method=RequestMethod.GET)
	public String viewById(@PathVariable("id") Long impid, Map<String, Object>model){
		 
		model.put("importpro", importService.listAllImportDetail(impid));
		model.put("IMPORT_ID", impid);
		  
		 
		return "admin/importupdate";
	}
	

}
