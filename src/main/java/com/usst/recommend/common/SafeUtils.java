package com.usst.recommend.common;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;

public class SafeUtils {
	public static String Base64EncodeStr(String str){
		byte[] bytes = str.getBytes();
		str = new String(Base64.encodeBase64(bytes));
		return str;
	}
	public static String Base64DecodeStr(String str){
		byte[] bytes = str.getBytes();
		str = new String(Base64.decodeBase64(bytes));
		return str;
	}
	public static String MD5Str(String str){
		return DigestUtils.md5Hex(str);
	}
}
