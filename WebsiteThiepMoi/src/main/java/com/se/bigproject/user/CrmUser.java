package com.se.bigproject.user;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class CrmUser {
	@NotNull(message="is required")
	@Pattern(regexp = "[a-zA-Z0-9]{3,20}",message = "Không chứa các kí tự đặt biệt , chỉ từ 3-20 kí tự")
	private String userName;
	
	@NotNull(message="is required")
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$",message = "Tối thiểu 6 ký tự ,ít nhất 1 chữ cái và 1 số")
	private String password;
	
	@NotNull(message="is required")
	private String confirmpassword;
	
	public CrmUser() {
		
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	
}
