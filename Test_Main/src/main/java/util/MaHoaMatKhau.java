package util;

import java.security.MessageDigest;
import java.util.Base64;



public class MaHoaMatKhau {
	public static String toSHA1(String matKhau) {
        String salt = "asdfghjklzxcvbnm";
        String result = null;
        matKhau = matKhau + salt;
        try {
            byte[] dataBytes = matKhau.getBytes("UTF-8");
            
            // sử dụng thuật toán băm SHA-1
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            
            // Cập nhật MessageDigest với dữ liệu mật khẩu và salt	
            md.update(dataBytes); 
            
            // băm và lưu vào digestBytes
            byte[] digestBytes = md.digest();
            
            // chuyển từ mảng về chuỗi
            result = Base64.getEncoder().encodeToString(digestBytes);
            
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return result;
    }
	
	public static void main(String[] args) {
		String s =  "123";
		System.out.println(toSHA1(s));
	}
}
