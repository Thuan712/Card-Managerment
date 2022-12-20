package com.se.bigproject.service;

import java.util.List;

import com.se.bigproject.entity.Thiep;

public interface ThiepService {
	public List<Thiep> getListThieps();
	public Thiep getThiep(int id);
	public void saveThiep(Thiep thiep);
	public void deleteThiep(int id);
	public void updateThiep(Thiep thiep);
	public void updateSoLuong(Thiep thiep);
}
