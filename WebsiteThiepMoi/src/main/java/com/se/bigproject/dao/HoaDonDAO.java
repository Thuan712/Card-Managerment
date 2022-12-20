package com.se.bigproject.dao;

import java.util.List;

import com.se.bigproject.entity.HoaDon;

public interface HoaDonDAO {
	public HoaDon getHoaDon(int id);
	public List<HoaDon> getListHoaDon();
	public List<HoaDon> getHoaDonTheoUser(String user);
	public void xacNhanDonHang(int id);
	public void huyDonHang(int id);
	public void saveHoaDon(HoaDon theHoaDon);
	public void trangThaiHuyDon(int id);
}
