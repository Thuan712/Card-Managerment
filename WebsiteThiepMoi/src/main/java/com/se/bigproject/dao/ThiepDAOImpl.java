package com.se.bigproject.dao;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.bigproject.entity.HoaDon;
import com.se.bigproject.entity.Thiep;
@Repository
public class ThiepDAOImpl implements ThiepDAO{
	@Autowired
	private ThiepDAO dao;
	@Autowired
	private SessionFactory factory;
	@Transactional
	@Override
	public List<Thiep> getListThieps() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Query<Thiep> query = session.createQuery("from Thiep order by maThiep", Thiep.class);
		List<Thiep> list = query.getResultList();
		return list;
	}
	@Override
	public Thiep getThiep(int id) {
		Session session = factory.getCurrentSession();
		Thiep thiep = session.get(Thiep.class, id);
		return thiep;
	}
	@Override
	public void saveThiep(Thiep thiep) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(thiep);
	}
	@Transactional
	@Override
	public void deleteThiep(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Thiep thiep = session.get(Thiep.class, id);
		session.delete(thiep);
	}
	@Override
	public void updateThiep(Thiep thiep) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(thiep);
	}
	@Transactional
	@Override
	public List<Thiep> search(String keyword) {
		Session session = factory.getCurrentSession();
		Query<Thiep> query = session.createQuery("from Thiep th where th.tenThiep like ?1", Thiep.class);
		query.setParameter(1,"%"+keyword+"%");
		List<Thiep> list = query.getResultList();
		return list;
	}
	@Override
	public void updateSoLuong(Thiep thiep) {
		Session session = factory.getCurrentSession();
		Thiep t = session.get(Thiep.class, thiep.getMaThiep());
		t.setSoLuongTon(thiep.getSoLuongTon());
	}
}
