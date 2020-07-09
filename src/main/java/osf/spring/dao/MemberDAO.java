package osf.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import osf.spring.dto.LocketListDTO;
import osf.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public boolean login(Map<String,String> param) {
		int result= mybatis.selectOne("Member.login",param);
		
		if(result>0) return true;
		else return false;
	}
	
	public MemberDTO mypage(String id){
		MemberDTO dto = mybatis.selectOne("Member.mypage", id);
		return dto;
	}	
	
	public List<LocketListDTO> selectAddressList(String id){
		return mybatis.selectList("Member.selectAddressList",id);
	}
}
