package com.se.bigproject.service;

import java.util.List;

import com.se.bigproject.entity.HoaDon;

public interface HoaDonService {
	public HoaDon getHoaDon(int id);
	public List<HoaDon> getListHoaDon();
	public List<HoaDon> getHoaDonTheoUser(String user);
	public void saveHoaDon(HoaDon theHoaDon);
	public void trangThaiHuyDon(int id);
	public void xacNhanDonHang(int id);
	public void huyDonHang(int id);
}
