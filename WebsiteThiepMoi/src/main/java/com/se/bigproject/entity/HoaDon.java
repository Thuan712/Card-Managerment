package com.se.bigproject.entity;

import java.sql.Date;
import java.util.HashSet;
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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="HoaDon")
public class HoaDon {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaHD")
	private int maHD;

	
	@Column(name = "NgayLapHD")
	private Date ngayLapHD;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "HoTenNguoiNhan")
	private String hoTenNguoiNhan;
	
	@Column(name = "SDT")
	private String sDT;
	
	@Column(name = "DiaChi")
	private String diaChi;
	
	@Column(name = "TrangThai")
	private int trangThai;
	
	 
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "MaHD")
    private Set<CTHD> cthds;

	public Set<CTHD> getCthds() {
		return cthds;
	}

	public void setCthds(Set<CTHD> cthds) {
		this.cthds = cthds;
	}

	public int getMaHD() {
		return maHD;
	}

	public void setMaHD(int maHD) {
		this.maHD = maHD;
	}

	public Date getNgayLapHD() {
		return ngayLapHD;
	}

	public void setNgayLapHD(Date ngayLapHD) {
		this.ngayLapHD = ngayLapHD;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getHoTenNguoiNhan() {
		return hoTenNguoiNhan;
	}

	public void setHoTenNguoiNhan(String hoTenNguoiNhan) {
		this.hoTenNguoiNhan = hoTenNguoiNhan;
	}

	public String getsDT() {
		return sDT;
	}

	public void setsDT(String sDT) {
		this.sDT = sDT;
	}
	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	
	public HoaDon(Date ngayLapHD, String username, String hoTenNguoiNhan, String sDT, String diaChi, int trangThai) {
		super();
		this.ngayLapHD = ngayLapHD;
		this.username = username;
		this.hoTenNguoiNhan = hoTenNguoiNhan;
		this.sDT = sDT;
		this.diaChi = diaChi;
		this.trangThai = trangThai;
	}

	public HoaDon(int maHD, Date ngayLapHD, String username, String hoTenNguoiNhan, String sDT, String diaChi,
			int trangThai) {
		super();
		this.maHD = maHD;
		this.ngayLapHD = ngayLapHD;
		this.username = username;
		this.hoTenNguoiNhan = hoTenNguoiNhan;
		this.sDT = sDT;
		this.diaChi = diaChi;
		this.trangThai = trangThai;
	}

	public HoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
