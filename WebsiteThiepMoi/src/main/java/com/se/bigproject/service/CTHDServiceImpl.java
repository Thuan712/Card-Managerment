package com.se.bigproject.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.bigproject.dao.CTHDDAO;
import com.se.bigproject.entity.CTHD;
import com.se.bigproject.entity.CTHD_new;
@Repository
public class CTHDServiceImpl implements CTHDService{
	@Autowired
	 private CTHDDAO cthddao;
	@Override
	@Transactional
	public void saveCTHD(CTHD_new theCthd) {
		cthddao.saveCTHD(theCthd);
	}

}
