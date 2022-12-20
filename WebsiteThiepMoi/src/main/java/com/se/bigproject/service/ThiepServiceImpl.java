package com.se.bigproject.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.se.bigproject.dao.ThiepDAO;
import com.se.bigproject.entity.Thiep;
@Repository
public class ThiepServiceImpl implements ThiepService{
	private SessionFactory factory;
	@Autowired
	 private ThiepDAO thiepDAO;
	@Transactional
	@Override
	public List<Thiep> getListThieps() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Query<Thiep> query = session.createQuery("from Thiep order by maThiep", Thiep.class);
		List<Thiep> list = query.getResultList();
		return list;
	}
	@Transactional
	@Override
	public Thiep getThiep(int id) {
//		Session session = factory.getCurrentSession();
		Thiep thiep = thiepDAO.getThiep(id);
		return thiep;
	}
	@Transactional
	@Override
	public void saveThiep(Thiep thiep) {
		thiepDAO.saveThiep(thiep);
	}
	@Transactional
	@Override
	public void deleteThiep(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Thiep thiep = session.get(Thiep.class, id);
		session.delete(thiep);
	}
	@Transactional
	@Override
	public void updateThiep(Thiep thiep) {
		// TODO Auto-generated method stub
//		Session session = factory.getCurrentSession();
//		session.save(thiep);
		thiepDAO.updateThiep(thiep);
	}
	@Transactional
	@Override
	public void updateSoLuong(Thiep thiep) {
		thiepDAO.updateSoLuong(thiep);
		
	}
}
