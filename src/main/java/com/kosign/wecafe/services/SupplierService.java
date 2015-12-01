package com.kosign.wecafe.services;

import java.util.List;

import com.kosign.wecafe.entities.Supplier;

public interface SupplierService {
	
	public Supplier findSupplierById(long id);
	public Boolean saveSupplier(Supplier supplier);
	public Boolean updateSupplier(Supplier supplier);
	public List<Supplier> getAllSupplier();
	public Boolean deleteSupplier(Supplier id);
	
	
}
