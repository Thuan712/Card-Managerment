package com.se.bigproject.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.bigproject.dao.ThiepDAO;
import com.se.bigproject.entity.Thiep;
import com.se.bigproject.user.CrmUser;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private ThiepDAO thiepDAO;
	
	@Autowired
	private UserDetailsManager userDetailsManager;
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}	
	
	
	@GetMapping("/showMyRegisterPage")
	public String showMyRegisterPage(Model theModel) {
		theModel.addAttribute("crmUser", new CrmUser());
		return "register";
	}
	
	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(
				@Valid @ModelAttribute("crmUser") CrmUser theCrmUser, 
				BindingResult theBindingResult, 
				Model theModel) {
						
		String userName = theCrmUser.getUserName();
		String pw = theCrmUser.getPassword();
		String cfpw = theCrmUser.getConfirmpassword();
		
		
		// validation
		if (theBindingResult.hasErrors()) {
			return "register";	
		}
		
		boolean userExists = checkUser(userName);
		
		if (userExists) {
			theModel.addAttribute("registrationError", "User name đã tồn tại.");
			return "register";			
		}
		if(!pw.equals(cfpw)) {
			theModel.addAttribute("registrationPassword", "Không trùng khớp với password.");
			return "register";		
		}
		
		// encrypt the password
        String encodedPassword = passwordEncoder.encode(theCrmUser.getPassword());

        // prepend the encoding algorithm id
        encodedPassword = "{bcrypt}" + encodedPassword;
                 
		// give user default role of "employee"
        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_KH");

        // create user object (from Spring Security framework)
        User tempUser = new User(userName, encodedPassword, authorities);

        // save user in the database
        userDetailsManager.createUser(tempUser);		
		
     
        theModel.addAttribute("crmUser", new CrmUser());
        theModel.addAttribute("registrationSuccess", "Đăng ký tài khoản thành công.");
        return "register";	
        
	}
	
	private boolean checkUser(String userName) {
		//kiá»ƒm tra data base cÃ³ tá»“n táº¡i user khÃ´ng 
		boolean exists = userDetailsManager.userExists(userName);
		return exists;
	}
	
	
	@GetMapping("/search")
	public String search(Model model ,HttpServletRequest request) {
		String key = request.getParameter("keyword");
		List<Thiep> list = thiepDAO.search(key);
		model.addAttribute("listThiep", list);
		return "home";
	}
	
}
