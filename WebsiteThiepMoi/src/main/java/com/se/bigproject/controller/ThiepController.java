package com.se.bigproject.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.se.bigproject.dao.ThiepDAO;
import com.se.bigproject.entity.Detail_HoaDon;
import com.se.bigproject.entity.Thiep;
import com.se.bigproject.service.ThiepService;

@Controller
@RequestMapping("/product")
public class ThiepController {
	@Autowired
	private ThiepDAO thiepDAO;
	@Autowired
	private ThiepService thiepService;
	@GetMapping("/showPageProductManage")
	public String listProduct (Model model) {
		List<Thiep> listThieps = thiepDAO.getListThieps();
		model.addAttribute("listThiep", listThieps);
		return "product-manage";
	}
	@GetMapping("/showDetailProduct")
	public String showDetailProduct(@RequestParam("productId") int theId,
            Model theModel) {
		Thiep theThiep = thiepService.getThiep(theId);
		theModel.addAttribute("Thiep", theThiep);
		return "detail-product";
	}
	@GetMapping("/delete")
	public String deleteThiep(@RequestParam int id) {  
		thiepDAO.deleteThiep(id);
		return "redirect:/product/showPageProductManage";
	}
	@GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {
        Thiep thiep = new Thiep();
        theModel.addAttribute("thiep", thiep);
        return "product-form";
    }
	
    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("thiepId") int theId,
            Model theModel) {
        Thiep theThiep = thiepService.getThiep(theId);
        theModel.addAttribute("thiep", theThiep);
        return "product-form-update";
    }
    @PostMapping("/saveProduct")
    public String saveProduct(@Valid @ModelAttribute("thiep") Thiep thiep,
    		BindingResult theBindingResult) {
		if(theBindingResult.hasErrors()) {
			return "product-form";
		}else {
        thiepService.saveThiep(thiep);
        return "redirect:/product/showPageProductManage";
		}
    }
    @PostMapping("/updateProduct")
    public String updateProduct(@Valid @ModelAttribute("thiep") Thiep thiep,
    		BindingResult theBindingResult) {
		if(theBindingResult.hasErrors()) {
			return "product-form-update";
		}else {
        thiepService.updateThiep(thiep);
        return "redirect:/product/showPageProductManage";
		}
    }

	@GetMapping("/showPayment")
	public String showPayment(@RequestParam("productId") int theId,
            Model theModel) {
		Thiep theThiep = thiepService.getThiep(theId);
		theModel.addAttribute("Thiep", theThiep);
		theModel.addAttribute("Detail_HoaDon", new Detail_HoaDon());
		return "payment-form";
	}
	@GetMapping("/search")
	public String search(Model model ,HttpServletRequest request) {
		String key = request.getParameter("keyword");
		List<Thiep> list = thiepDAO.search(key);
		model.addAttribute("listThiep", list);
		return "home";
	}
}
