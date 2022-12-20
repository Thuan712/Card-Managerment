package com.se.bigproject.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.se.bigproject.dao.HoaDonDAO;
import com.se.bigproject.entity.HoaDon;

@Repository
public class HoaDonServiceImpl implements HoaDonService{

	 @Autowired
	 private HoaDonDAO hoaDonDao;
	 
	@Override
	@Transactional
	public HoaDon getHoaDon(int id) {
		return hoaDonDao.getHoaDon(id);
	}

	@Override
	@Transactional
	public List<HoaDon> getListHoaDon() {
		// TODO Auto-generated method stub
		return hoaDonDao.getListHoaDon();
	}

	@Override
	@Transactional
	public List<HoaDon> getHoaDonTheoUser(String user) {
		return hoaDonDao.getHoaDonTheoUser(user);
	}
	@Transactional
	@Override
	public void saveHoaDon(HoaDon theHoaDon) {
		hoaDonDao.saveHoaDon(theHoaDon);
		
	}
	@Transactional
	@Override
	public void xacNhanDonHang(int id) {
		// TODO Auto-generated method stub
		hoaDonDao.xacNhanDonHang(id);
	}
	@Transactional
	@Override
	public void huyDonHang(int id) {
		// TODO Auto-generated method stub
		hoaDonDao.huyDonHang(id);
	}

	@Transactional
	@Override
	public void trangThaiHuyDon(int id) {
		// TODO Auto-generated method stub
		hoaDonDao.trangThaiHuyDon(id);
	}
}
