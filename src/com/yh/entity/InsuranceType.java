package com.yh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_insurance_type")
public class InsuranceType {
	private int id;
	private String name;
	private double baofei;
	private double peifu;
	private String note;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(unique=true)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getBaofei() {
		return baofei;
	}

	public void setBaofei(double baofei) {
		this.baofei = baofei;
	}

	public double getPeifu() {
		return peifu;
	}

	public void setPeifu(double peifu) {
		this.peifu = peifu;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
