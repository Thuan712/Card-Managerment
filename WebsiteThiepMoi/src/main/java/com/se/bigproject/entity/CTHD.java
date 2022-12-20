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
public class CTHD {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaCTHD")
	private int maCTHD;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="MaHD")
	private HoaDon hoaDon;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="MaThiep")
	private Thiep thiep;
	
	@Column(name = "SoLuongMua")
	private int soLuongMua;
	
	@Column(name = "DonGia")
	private double donGia;
	
	public int getMaCTHD() {
		return maCTHD;
	}

	public void setMaCTHD(int maCTHD) {
		this.maCTHD = maCTHD;
	}

	public HoaDon getHoaDon() {
		return hoaDon;
	}

	public void setHoaDon(HoaDon hoaDon) {
		this.hoaDon = hoaDon;
	}

	public Thiep getThiep() {
		return thiep;
	}

	public void setThiep(Thiep thiep) {
		this.thiep = thiep;
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

	public CTHD(int maCTHD, HoaDon hoaDon, Thiep thiep, int soLuongMua, double donGia) {
		super();
		this.maCTHD = maCTHD;
		this.hoaDon = hoaDon;
		this.thiep = thiep;
		this.soLuongMua = soLuongMua;
		this.donGia = donGia;
	}

	public CTHD() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
