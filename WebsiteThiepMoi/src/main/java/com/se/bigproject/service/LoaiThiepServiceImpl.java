package com.se.bigproject.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.se.bigproject.dao.LoaiThiepDAO;
import com.se.bigproject.entity.LoaiThiep;



@Repository
public class LoaiThiepServiceImpl implements LoaiThiepService{

	@Autowired
	private LoaiThiepDAO loaiThiepDAO;
	
	
	@Transactional
	@Override
	public LoaiThiep getLoaiThiep(int id) {
		return loaiThiepDAO.getLoaiThiep(id);
	}

}

