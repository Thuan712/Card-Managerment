package com.se.bigproject.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.bigproject.dao.ThiepDAO;
import com.se.bigproject.entity.LoaiThiep;
import com.se.bigproject.entity.Thiep;
import com.se.bigproject.service.LoaiThiepService;
@Controller
public class LoginController {
	@Autowired
	private ThiepDAO thiepDAO;
	
	@Autowired
	private LoaiThiepService loaiThiepService;
	
	
	@GetMapping("/showMyLoginPage")
	public String showLoginPage() {
		return "login";
	}
    @GetMapping("/")
    public String showHomePage(Model model) {
		 List<Thiep> listThieps = thiepDAO.getListThieps();
		 model.addAttribute("listThiep", listThieps);
        return "home";
    }
    
    
    @GetMapping("/access-denied")
    public String showAccessDenied() {

        return "access-denied";

    }
    
    
    @GetMapping("/showcontact")
    public String showContactPage() {
       return "contact";
   }
	@GetMapping("/search")
	public String search(Model model ,HttpServletRequest request) {
		String key = request.getParameter("keyword");
		List<Thiep> list = thiepDAO.search(key);
		model.addAttribute("listThiep", list);
		return "home";
	}
	
	@GetMapping("/filter")
	public String filter(@RequestParam("maLoai") int maLoai,Model model) {
		LoaiThiep loaiThiep = loaiThiepService.getLoaiThiep(maLoai);
		model.addAttribute("LoaiThiep", loaiThiep);
		return "filter-product";
	}
	@GetMapping("/showComplete")
	public String showComplete() {
		return "completed";
	}
	
	@GetMapping("/showQ&A")
	public String showQA() {
		return "Q&A";
	}
	@GetMapping("/showTrendPage")
	public String showTrendPage() {
		return "trend-page";
	}
}
