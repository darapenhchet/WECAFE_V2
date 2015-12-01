package com.kosign.wecafe.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Unit")
public class Unit {
	
	@Id
	@SequenceGenerator(allocationSize=1, initialValue=2, sequenceName="unit_unit_id_seq", name="unit_id")
	@GeneratedValue(generator="unit_id", strategy=GenerationType.SEQUENCE)
	@Column(name="unit_id")
	private Long unitId;
	
	@Column(name="qty")
	private Long qty;

	@Column(name="unit_name")
	private String unitName;

	public Long getUnitId() {
		return unitId;
	}

	public void setUnitId(Long unitId) {
		this.unitId = unitId;
	}

	public Long getQty() {
		return qty;
	}

	public void setQty(Long qty) {
		this.qty = qty;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	
}
