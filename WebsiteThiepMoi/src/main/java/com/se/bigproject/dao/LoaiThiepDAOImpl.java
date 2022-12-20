package com.se.bigproject.dao;



import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.se.bigproject.entity.LoaiThiep;


@Repository
public class LoaiThiepDAOImpl implements LoaiThiepDAO{
	@Autowired
	private SessionFactory factory;

	@Override
	public LoaiThiep getLoaiThiep(int id) {
		Session session = factory.getCurrentSession();
		LoaiThiep lt = session.get(LoaiThiep.class, id);
		return lt;
	}
	
}

