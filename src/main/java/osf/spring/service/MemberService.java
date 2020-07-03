package osf.spring.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import osf.spring.dao.MemberDAO;
import osf.spring.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO mdao;
	
	public static String getSHA512(String input){

		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return toReturn;
	}
	
	public boolean login(String id,String pw) {
		Map<String,String> param = new HashMap<>();
		param.put("id",id);
		param.put("pw",pw);
		boolean check = mdao.login(param);
		return check;
	}
	
	public MemberDTO mypage(String id){
		MemberDTO mdto = mdao.mypage(id);
		return mdto;
	}
}
