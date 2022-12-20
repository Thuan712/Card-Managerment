package com.se.bigproject.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "LoaiThiep")
public class LoaiThiep {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaLoai")
	private int maLoai;
	@Column(name = "TenLoai")
	private String tenLoai;
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "MaLoai")
	private Set<Thiep> listThiep;
	
	public LoaiThiep() {
		// TODO Auto-generated constructor stub
	}

	public int getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(int maLoai) {
		this.maLoai = maLoai;
	}

	public String getTenLoai() {
		return tenLoai;
	}

	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}



	public Set<Thiep> getListThiep() {
		return listThiep;
	}

	public void setListThiep(Set<Thiep> listThiep) {
		this.listThiep = listThiep;
	}

	@Override
	public String toString() {
		return "LoaiThiep [maLoai=" + maLoai + ", tenLoai=" + tenLoai + ", listThiep=" + listThiep + "]";
	}
}
