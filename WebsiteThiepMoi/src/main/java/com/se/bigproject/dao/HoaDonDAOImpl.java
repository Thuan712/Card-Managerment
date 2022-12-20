package com.se.bigproject.dao;

import java.util.List;

import javax.servlet.ServletRegistration.Dynamic;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.se.bigproject.entity.HoaDon;

@Repository
public class HoaDonDAOImpl implements HoaDonDAO{
	@Autowired
	private SessionFactory factory;
	
	@Override
	public HoaDon getHoaDon(int id) {
		Session session = factory.getCurrentSession();
		HoaDon hoaDon = session.get(HoaDon.class, id);
		return hoaDon;
	}
	@Transactional
	@Override
	public List<HoaDon> getListHoaDon() {
		Session session = factory.getCurrentSession();
		Query<HoaDon> query = session.createQuery("from HoaDon order by trangThai,NgayLapHD desc", HoaDon.class);
		List<HoaDon> list = query.getResultList();
		return list;
	}
	@Transactional
	@Override
	public List<HoaDon> getHoaDonTheoUser(String user) {
		Session session = factory.getCurrentSession();
		Query<HoaDon> query = session.createQuery("from HoaDon where username=:user order by trangThai, NgayLapHD desc", HoaDon.class);
		query.setString("user", user);
		List<HoaDon> list = query.getResultList();
		return list;
	}
	@Transactional
	public void xacNhanDonHang(int id) {
		Session session = factory.getCurrentSession();
		HoaDon hoaDon = session.get(HoaDon.class, id);
		if(hoaDon.getTrangThai() == 0) {
			hoaDon.setTrangThai(1);
		}
	}
	@Transactional
	public void huyDonHang(int id) {
		Session session = factory.getCurrentSession();
		HoaDon hoaDon = session.get(HoaDon.class, id);
		if(hoaDon.getTrangThai() == 0) {
			hoaDon.setTrangThai(3);
		}
	}
	@Override
	public void saveHoaDon(HoaDon theHoaDon) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(theHoaDon);
	}
	@Transactional
	public void trangThaiHuyDon(int id) {
		Session session = factory.getCurrentSession();
		HoaDon hoaDon = session.get(HoaDon.class, id);
		if(hoaDon.getTrangThai() != 2) {
			hoaDon.setTrangThai(2);
		}
	}

}
