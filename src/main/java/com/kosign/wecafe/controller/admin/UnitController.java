package com.kosign.wecafe.controller.admin;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosign.wecafe.services.UnitService;

@Controller
public class UnitController {

	@Inject UnitService unitService;
	
	@RequestMapping(value="/admin/unitlist")
	public String getListAllUnit(Map<String, Object>model){
		model.put("units", unitService.getAllUnits());
		return "admin/unilist";
	}
}
