package osf.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import osf.spring.dto.ProductDTO;
import osf.spring.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService pservice;
	
	@RequestMapping("/")
	public String home(Model model) {
		List<ProductDTO> products = pservice.productSelectAll();
		model.addAttribute("products", products);
		
		return "home";
	}
	
}
