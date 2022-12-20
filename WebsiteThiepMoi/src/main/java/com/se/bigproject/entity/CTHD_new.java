package com.se.bigproject.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="CTHD")
public class CTHD_new {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaCTHD")
	private int maCTHD;
	
	@Column(name="MaHD")
	private int maHD;
	
	@Column(name="MaThiep")
	private int maThiep;
	
	@Column(name = "SoLuongMua")
	private int soLuongMua;
	
	@Column(name = "DonGia")
	private double donGia;

	public CTHD_new(int maCTHD, int maHD, int maThiep, int soLuongMua, double donGia) {
		this.maCTHD = maCTHD;
		this.maHD = maHD;
		this.maThiep = maThiep;
		this.soLuongMua = soLuongMua;
		this.donGia = donGia;
	}
	
	public CTHD_new() {
	}

	public int getMaCTHD() {
		return maCTHD;
	}

	public void setMaCTHD(int maCTHD) {
		this.maCTHD = maCTHD;
	}

	public int getMaHD() {
		return maHD;
	}

	public void setMaHD(int maHD) {
		this.maHD = maHD;
	}

	public int getMaThiep() {
		return maThiep;
	}

	public void setMaThiep(int maThiep) {
		this.maThiep = maThiep;
	}

	public int getSoLuongMua() {
		return soLuongMua;
	}

	public void setSoLuongMua(int soLuongMua) {
		this.soLuongMua = soLuongMua;
	}

	public double getDonGia() {
		return donGia;
	}

	public void setDonGia(double donGia) {
		this.donGia = donGia;
	}
	
	
	
}
