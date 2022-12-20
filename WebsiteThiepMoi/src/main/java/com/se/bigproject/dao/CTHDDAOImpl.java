package com.se.bigproject.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.se.bigproject.entity.CTHD_new;
@Repository
public class CTHDDAOImpl implements CTHDDAO{
	@Autowired
	private SessionFactory factory;
	@Override
	@Transactional
	public void saveCTHD(CTHD_new theCthd) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(theCthd);	
	}
	
}
