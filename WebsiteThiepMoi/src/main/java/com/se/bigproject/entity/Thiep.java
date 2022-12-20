package com.se.bigproject.entity;


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
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="ThiepMoi")
public class Thiep {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaThiep")
	private int maThiep;
	
	@Pattern(regexp = "^[A-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪỬỮỰỲỴÝỶỸ]"
			+ "[A-Za-z0-9àáâãèéêìíòóôõùúăđĩũơưăạảấầẩẫậắằẳẵặẹẻẽềềểễếệỉịọỏốồổỗộớờởỡợụủứừửữựỳỵỷỹÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪỬỮỰỲỴÝỶỸ\\–\\-\\_\\+\\!\\?\\@\\#\\$\\%\\^\\&\\*\\(\\)\\=\\s]+"
			,message = " Tên không được rỗng và ký tự đầu phải in hoa")
	@NotNull
	@Column(name = "TenThiep")
	private String tenThiep;

	@NotNull(message = "Mô tả không được rỗng")
	@Size(min=1,message = "Mô tả không được rỗng")
	@Column(name = "MoTa")
	private String moTa;
	
	@NotNull(message = "Hình ảnh không được rỗng")
	@Size(min=1, message = "Hình ảnh không được rỗng")
	@Column(name = "HinhAnh")
	private String hinhAnh;
	
	@Min(value = 999,message = "Giá tiền phải lớn hơn hoặc bằng 1000")
	@Column(name = "GiaTien")
	private double giaTien;
	
	@Min(value = 0,message = "Số lượng tồn phải lớn hơn hoặc bằng 0")
	@Column(name = "SoLuongTon")
	private String soLuongTon;
	
	@Column(name = "MaLoai")
	private int MaLoai;
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "MaThiep")
	private Set<CTHD> cthds;

	public int getMaThiep() {
		return maThiep;
	}
	public void setMaThiep(int maThiep) {
		this.maThiep = maThiep;
	}
	public String getTenThiep() {
		return tenThiep;
	}
	public void setTenThiep(String tenThiep) {
		this.tenThiep = tenThiep;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public double getGiaTien() {
		return giaTien;
	}
	public void setGiaTien(double giaTien) {
		this.giaTien = giaTien;
	}
	public String getSoLuongTon() {
		return soLuongTon;
	}
	public void setSoLuongTon(String soLuongTon) {
		this.soLuongTon = soLuongTon;
	}
	public int getMaLoai() {
		return MaLoai;
	}
	public void setMaLoai(int maLoai) {
		MaLoai = maLoai;
	}
	public Thiep(int maThiep, String tenThiep, String moTa, String hinhAnh, double giaTien, String soLuongTon,
			int maLoai) {
		this.maThiep = maThiep;
		this.tenThiep = tenThiep;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.giaTien = giaTien;
		this.soLuongTon = soLuongTon;
		this.MaLoai = maLoai;
	}
	public Thiep(String tenThiep, String moTa, String hinhAnh, double giaTien, String soLuongTon,
			int maLoai) {
		this.tenThiep = tenThiep;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.giaTien = giaTien;
		this.soLuongTon = soLuongTon;
		this.MaLoai = maLoai;
	}
	public Thiep() {
	}
	public Set<CTHD> getCthds() {
		return cthds;
	}
	public void setCthds(Set<CTHD> cthds) {
		this.cthds = cthds;
	}
	
	
}
