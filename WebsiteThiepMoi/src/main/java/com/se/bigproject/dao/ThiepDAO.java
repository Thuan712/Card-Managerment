package com.se.bigproject.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.se.bigproject.entity.Thiep;

public interface ThiepDAO {
	public List<Thiep> getListThieps();
	public Thiep getThiep(int id);
	public void saveThiep(Thiep thiep);
	public void deleteThiep(int id);
	public void updateThiep(Thiep thiep);
	public void updateSoLuong(Thiep thiep);
	public List<Thiep> search(String keyword);
}
