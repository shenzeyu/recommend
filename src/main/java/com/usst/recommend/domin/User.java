package com.usst.recommend.domin;

import org.apache.commons.codec.digest.DigestUtils;

import com.usst.recommend.common.SafeUtils;

public class User {
	private Long id;
	private String username;
	private String password;
	private int age;
	private String address;
	private String email;
	private String telephone;
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = DigestUtils.md5Hex(password);
	}
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return SafeUtils.Base64DecodeStr(address);
	}

	public void setAddress(String address) {
		this.address = SafeUtils.Base64EncodeStr(address);
	}

	public String getEmail() {
		return SafeUtils.Base64DecodeStr(email);
	}

	public void setEmail(String email) {
		this.email = SafeUtils.Base64EncodeStr(email);
	}

	public String getTelephone() {
		return SafeUtils.Base64DecodeStr(telephone);
	}

	public void setTelephone(String telephone) {
		this.telephone = SafeUtils.Base64EncodeStr(telephone);
	}

	public static void main(String[] args) {
		System.out.println(DigestUtils.md5Hex("hello\n"));
		String str = SafeUtils.Base64EncodeStr("64");
		System.out.println(str);
		System.out.println(SafeUtils.Base64DecodeStr(str));
	}
}
