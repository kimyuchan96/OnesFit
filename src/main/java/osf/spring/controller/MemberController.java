package osf.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import osf.spring.dto.LocketListDTO;
import osf.spring.dto.MemberDTO;
import osf.spring.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("login")
	public String login(String id,String pw)throws Exception{
		boolean login =mservice.login(id, pw);

		if(login) {
			MemberDTO dto =mservice.mypage(id);
			session.setAttribute("loginInfo", dto);
		}
		return "redirect:/";
	}	
	
	@RequestMapping("addressList")
	public String addressList(Model model) throws Exception{
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		List<LocketListDTO> list=mservice.selectAddressList(dto.getId());
		
		model.addAttribute("list",list);
		
		return "product/addressList";
	}
}
