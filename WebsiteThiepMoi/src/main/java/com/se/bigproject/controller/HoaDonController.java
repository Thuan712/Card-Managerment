package com.se.bigproject.controller;

import java.security.Principal;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.se.bigproject.dao.ThiepDAO;
import com.se.bigproject.entity.CTHD;
import com.se.bigproject.entity.CTHD_new;
import com.se.bigproject.entity.Detail_HoaDon;
import com.se.bigproject.entity.HoaDon;
import com.se.bigproject.entity.Thiep;
import com.se.bigproject.service.CTHDService;
import com.se.bigproject.service.HoaDonService;
import com.se.bigproject.service.ThiepService;
@Controller
@RequestMapping("/invoice")
public class HoaDonController {
	@Autowired
	private HoaDonService hoaDonService;
	@Autowired
	private ThiepDAO thiepDAO;
	@Autowired
	private CTHDService cthdService;
	@Autowired
	private ThiepService thiepService;
	@GetMapping("/showPageInvoiceManage")
	public String showPageInvoiceManage(Model model) {
		List<HoaDon> listHoaDons = hoaDonService.getListHoaDon();
		model.addAttribute("listHoaDon", listHoaDons);
		return "invoice-manage";
	}
	@GetMapping("/showPageInvoiceCustomer")
	public String showPageInvoiceCustomer(Model model,@RequestParam("user") String user) {
		List<HoaDon> list = hoaDonService.getHoaDonTheoUser(user);
		model.addAttribute("ListHD", list);
		return "invoice-customer";
	}
	@GetMapping("/trangThaiXuLi")
	public String xacNhanDonHang(@RequestParam int id) {
		hoaDonService.xacNhanDonHang(id);
		return "redirect:/invoice/showPageInvoiceManage";
	}
	@GetMapping("/trangThaiHuy")
	public String huyDonHang(@RequestParam int id) {
		hoaDonService.huyDonHang(id);
		HoaDon hd = hoaDonService.getHoaDon(id);
		int maThiep;
		int slm;
		for(CTHD ct : hd.getCthds()) {
			slm = ct.getSoLuongMua();
			maThiep = ct.getThiep().getMaThiep();
			Thiep thiep = thiepService.getThiep(maThiep);
			String slnew = (Integer.parseInt(thiep.getSoLuongTon())+ slm)+"";
			thiep.setSoLuongTon(slnew);
			thiepService.updateSoLuong(thiep);
		}
		return "redirect:/invoice/showPageInvoiceManage";
	}
	@PostMapping("/saveInvoice") 
	public String saveInvoice(@ModelAttribute("hoaDon") HoaDon hoaDon,
			 @ModelAttribute("cTHD") CTHD_new cthd,
			 @Valid @ModelAttribute("Detail_HoaDon")  Detail_HoaDon detail_HoaDon,
			 BindingResult result,
			 Model theModel) {
		System.out.println(detail_HoaDon);
		Thiep thiep = thiepService.getThiep(detail_HoaDon.getMaThiep());
		if(result.hasErrors()) {
			theModel.addAttribute("Thiep", thiep);
			return "payment-form";
		}
		else {
			hoaDon.setMaHD(detail_HoaDon.getMaHD());
			hoaDon.setNgayLapHD(new Date(System.currentTimeMillis()));
			hoaDon.setUsername(detail_HoaDon.getUsername());
			hoaDon.setHoTenNguoiNhan(detail_HoaDon.getHoTenNguoiNhan());
			hoaDon.setsDT(detail_HoaDon.getsDT());
			hoaDon.setDiaChi(detail_HoaDon.getDiaChi());
			hoaDon.setTrangThai(0);
			hoaDonService.saveHoaDon(hoaDon);
			cthd.setMaHD(hoaDon.getMaHD());
			cthd.setMaThiep(detail_HoaDon.getMaThiep());
			cthd.setSoLuongMua(detail_HoaDon.getSoLuongMua());
			cthd.setDonGia(detail_HoaDon.getDonGia());
			cthdService.saveCTHD(cthd);
			String slt_new = (Integer.parseInt(thiep.getSoLuongTon())-cthd.getSoLuongMua())+"";
			thiep.setSoLuongTon(slt_new);
			thiepService.saveThiep(thiep);
			return "redirect:/showComplete"; 
		}
	}
	@GetMapping("/huyDon")
	public String doiHuyDon(@RequestParam int Id, @RequestParam String user,@RequestParam int MaThiep,@RequestParam int SoLuongMua) {
		hoaDonService.trangThaiHuyDon(Id);
		Thiep thiep = thiepService.getThiep(MaThiep);
		String slnew = (Integer.parseInt(thiep.getSoLuongTon())+ SoLuongMua)+"";
		thiep.setSoLuongTon(slnew);
		thiepService.updateSoLuong(thiep);
		return "redirect:/invoice/showPageInvoiceCustomer?user="+user;
	}
	
	@GetMapping("/search")
	public String search(Model model ,HttpServletRequest request) {
		String key = request.getParameter("keyword");
		List<Thiep> list = thiepDAO.search(key);
		model.addAttribute("listThiep", list);
		return "home";
	}
}
