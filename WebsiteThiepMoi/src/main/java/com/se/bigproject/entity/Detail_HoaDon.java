package com.se.bigproject.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;


public class Detail_HoaDon {
	private int maHD;
	private Date ngayLapHD;
	private String username;
	@Pattern(regexp = "([A-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪỬỮỰỲỴÝỶỸ]{1}[a-zàáâãèéêìíòóôõùúăđĩũơưăạảấầẩẫậắằẳẵặẹẻẽềềểễếệỉịọỏốồổỗộớờởỡợụủứừửữựỳỵỷỹ]*[\\s]?)+",message = "Họ tên viết hoa đầu từ!")
	@NotBlank(message = "Vui lòng nhập họ tên!")
	private String hoTenNguoiNhan;
	@Pattern(regexp = "([\\+84|84|0]+(3|5|7|8|9|1[2|6]))+([0-9]{8})\\b",message = "SDT không đúng định dạng!")
	private String sDT;
	@NotBlank(message = "Vui lòng nhập địa chỉ!")
	private String diaChi;
	private int trangThai;
	private int maCTHD;
	private int maThiep;
	private int soLuongMua;
	private double donGia;
	
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
	public int getMaCTHD() {
		return maCTHD;
	}
	public void setMaCTHD(int maCTHD) {
		this.maCTHD = maCTHD;
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
	public Detail_HoaDon(int maHD, Date ngayLapHD, String username, String hoTenNguoiNhan, String sDT, String diaChi,
			int trangThai, int maCTHD, int maThiep, int soLuongMua, double donGia) {
		this.maHD = maHD;
		this.ngayLapHD = ngayLapHD;
		this.username = username;
		this.hoTenNguoiNhan = hoTenNguoiNhan;
		this.sDT = sDT;
		this.diaChi = diaChi;
		this.trangThai = trangThai;
		this.maCTHD = maCTHD;
		this.maThiep = maThiep;
		this.soLuongMua = soLuongMua;
		this.donGia = donGia;
	}
	public Detail_HoaDon() {
	}
	
}
