package osf.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import osf.spring.dao.ProductDAO;
import osf.spring.dto.BuyListDTO;
import osf.spring.dto.CartDTO;
import osf.spring.dto.ImageDTO;
import osf.spring.dto.ImagesDTO;
import osf.spring.dto.MemberDTO;
import osf.spring.dto.OptionDTO;
import osf.spring.dto.OrderDTO;
import osf.spring.dto.ProductDTO;
import osf.spring.dto.QuestionDTO;
import osf.spring.dto.ReviewDTO;
import osf.spring.service.ProductService;

@Controller
@RequestMapping("/product/")
public class ProductController {

	@Autowired
	private ProductService pservice;

	@Autowired
	private ProductDAO pdao;

	@Autowired
	private HttpSession session;

	@RequestMapping("productRegist")
	public String productRegist() {
		//		UUID uuid = UUID.randomUUID();
		//		List<ImageDTO> imageList = new ArrayList<>();
		//		
		//		String filePath=session.getServletContext().getRealPath("upload/mainpic");
		return "product/productRegist";
	}

	@RequestMapping("productRegistComplete")
	public String productRegistComplete(ProductDTO pdto,MultipartFile file,ImagesDTO images)throws Exception {		
		int pseq = pdao.getNextVal();
		UUID uuid = UUID.randomUUID();
		List<ImageDTO> imageList = new ArrayList<>();
		System.out.println(pdto.getPname()+" : "+pdto.getPrice()+" : "+pdto.getContent());
		String filePath=session.getServletContext().getRealPath("upload/product/title");
		String filePath2=session.getServletContext().getRealPath("upload/product/"+pseq);
		pdto.setPname(pdto.getPname().replaceAll("<", "&lt"));
		pdto.setContent(pdto.getContent().replaceAll("<", "&lt"));
		File folder1=new File(filePath);
		File folder2=new File(filePath2);
		if(!folder1.exists()) {
			folder1.mkdirs();
		}
		if(!folder2.exists()) {
			folder2.mkdirs();
		}

		String sysFileName=uuid+"_"+file.getOriginalFilename();
		pdto.setTitle_img(sysFileName);
		File targetLoc = new File(filePath+"/"+sysFileName);
		file.transferTo(targetLoc);

		if(images.getImages().length !=0) {			
			for(MultipartFile f : images.getImages()) {
				if(!f.isEmpty()) {
					ImageDTO dto = new ImageDTO();
					dto.setOriname(f.getOriginalFilename());
					String sysFileName2=uuid+"_"+f.getOriginalFilename();
					File targetLoc2 = new File(filePath2 + "/" +sysFileName2);
					f.transferTo(targetLoc2);
					dto.setSysname(sysFileName2);
					imageList.add(dto);
				}
			}
		}
		pdto.setPseq(pseq);
		pservice.productRegist(pdto, imageList);

		return "redirect:/";
	}

	@RequestMapping(value="productDetail", method=RequestMethod.GET)
	public String productDetail(HttpServletRequest request,Model model)throws Exception{
		int pseq=0;
		try{pseq =Integer.parseInt(request.getParameter("pseq"));}catch(Exception e){}

		ProductDTO pdto = pservice.productSelectByPseq(pseq);
		MemberDTO mdto = (MemberDTO)session.getAttribute("loginInfo");
		List<ImageDTO> idto = pservice.ImageSelectByPseq(pseq);
		List<OptionDTO> options = pservice.optionSelect(pseq);
		HashSet<String> color = new HashSet<String>();		

		List<ReviewDTO> rdto = pservice.ReviewtByPseq(pseq);
		model.addAttribute("rdto", rdto);


		model.addAttribute("pdto", pdto);
		model.addAttribute("idto", idto);
		List<QuestionDTO> qdto = pservice.QuestionByPseq(pseq);
		model.addAttribute("qdto", qdto);
		for(OptionDTO dto:options) {
			color.add(dto.getColor());			
		}
		model.addAttribute("color", color);	
		//		model.addAttribute("options", null);
		model.addAttribute("loginId",mdto.getId());
		return "product/productDetail";		
	}

	@RequestMapping("colorSelect")
	@ResponseBody
	public List<OptionDTO> colorSelect(HttpServletRequest req,Model model)throws Exception{
		int pseq =Integer.parseInt(req.getParameter("pseq"));
		String color = req.getParameter("color");		
		List<OptionDTO> options = pservice.colorSelect(pseq, color);		
		return options;
	}

	@RequestMapping("cartAdd")
	@ResponseBody
	public String cartAdd(HttpServletRequest req)throws Exception{
		List<CartDTO> carts = new ArrayList<>();
		MemberDTO mdto = (MemberDTO)session.getAttribute("loginInfo");
		int result=0;
		int pseq=Integer.parseInt(req.getParameter("pseq"));
		String size=req.getParameter("option1");			
		String color=req.getParameter("option2");
		String amount = req.getParameter("amounts");
		int length = Integer.parseInt(req.getParameter("length"));
		ProductDTO pdto = pservice.productSelectByPseq(pseq);
		JsonArray sizes=JsonParser.parseString(size).getAsJsonArray();
		JsonArray colors=JsonParser.parseString(color).getAsJsonArray();
		JsonArray amounts=JsonParser.parseString(amount).getAsJsonArray();

		for(int j =0;j<length;j++) {
			CartDTO cdto=new CartDTO();
			cdto.setParent_id(mdto.getId());
			cdto.setPseq(pseq);
			cdto.setOption1(sizes.get(j).getAsString());
			cdto.setPname(pdto.getPname());
			cdto.setPrice(pdto.getPrice()*amounts.get(j).getAsInt());
			cdto.setTitle_img(pdto.getTitle_img());
			cdto.setOption2(colors.get(j).getAsString());
			cdto.setCount_item(Integer.parseInt(amounts.get(j).getAsString()));			
			carts.add(cdto);
		}
		result = pservice.cartAdd(carts);
		JsonObject respobj=new JsonObject();
		respobj.addProperty("result", result);

		return respobj.toString();

	}

	@RequestMapping(value="payMent", method=RequestMethod.POST)
	public String payMent(HttpServletRequest req, Model model) throws Exception {
		MemberDTO mdto = (MemberDTO)session.getAttribute("loginInfo");
		int pseq=0;
		try{pseq = Integer.parseInt(req.getParameter("pseq"));}catch(Exception e){}

		ProductDTO pdto = pservice.productSelectByPseq(pseq);
		model.addAttribute("mdto",mdto);
		model.addAttribute("pdto", pdto);

		String[] color = req.getParameterValues("color");		
		req.setAttribute("list1", color);

		String[] size = req.getParameterValues("size");		
		req.setAttribute("list2", size);

		String[] amount = req.getParameterValues("amount");		
		req.setAttribute("list3", amount);

		String sum = req.getParameter("sum");
		req.setAttribute("sum", sum);

		return "product/payMent";	
	}

	@RequestMapping(value="Makepayment", method=RequestMethod.POST)
	@Transactional("txManager")
	public String Makepayment(HttpServletRequest req,BuyListDTO bdto) throws Exception {
		MemberDTO dto =(MemberDTO) session.getAttribute("loginInfo");
		String parent_id = dto.getId();
		int oseq =pdao.getOrderNextVal();
		String[] pname = req.getParameterValues("pname");
		String[] pcolor=req.getParameterValues("pcolor");
		String[] psize=req.getParameterValues("psize");
		String[] amount=req.getParameterValues("amount");
		String[] point = req.getParameterValues("point");
		int totalPrice = Integer.parseInt(req.getParameter("totalPrice"));
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		int usePoint = 0;
		try{usePoint=Integer.parseInt(req.getParameter("usepoint"));}catch(Exception e) {usePoint=0;}


		for(int i=0; i<pcolor.length;i++) {
			bdto.setProduct_num(product_num);
			bdto.setPname(pname[i]);
			bdto.setParent_id(parent_id);
			bdto.setPcolor(pcolor[i]);
			bdto.setPsize(psize[i]);
			bdto.setAmount(Integer.parseInt(amount[i]));
			bdto.setAddpoint(Integer.parseInt(point[i]));
			bdto.setOseq(oseq);
			pservice.BuyList(bdto);			
		}
		OrderDTO odto = new OrderDTO();
		odto.setAmount(totalPrice);
		odto.setId(parent_id);
		odto.setOseq(oseq);
		odto.setUsepoint(usePoint);
		pservice.orderInsert(odto);	
		dto.setPoint(pservice.selectPoint(parent_id));
		return "redirect:/";
	}
	@RequestMapping("review")
	public String Makepayment(HttpServletRequest req, ReviewDTO rdto, MultipartFile file, Model model)
			throws Exception {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		String writer = dto.getId();

		String pseq = req.getParameter("pseq");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		String filePath = session.getServletContext().getRealPath("upload");

		String img = "";
		File tempFilePath = new File(filePath);
		if (!tempFilePath.exists()) {
			tempFilePath.mkdir();
		}
		filePath += "/product";
		File temp2 = new File(filePath);
		if (!temp2.exists()) {
			temp2.mkdir();
		}
		filePath += "/" + pseq;
		File temp3 = new File(filePath);
		if (!temp3.exists()) {
			temp3.mkdir();
		}
		filePath += "/review";
		File temp4 = new File(filePath);
		if (!temp4.exists()) {
			System.out.println(temp4);
			temp4.mkdir();
		}
		if (!file.isEmpty()) {
			String systemFileName = file.getOriginalFilename();
			File targetLoc = new File(filePath + "/" + systemFileName);
			file.transferTo(targetLoc);
			img = systemFileName;
		}
		rdto.setPseq(Integer.parseInt(pseq));
		rdto.setImg(img);
		rdto.setTitle(title);
		rdto.setContent(content);
		rdto.setWriter(writer);
		pservice.Review(rdto);

		return "redirect:/product/productDetail?pseq=" + pseq;
	}

	@RequestMapping("question")
	public String QuestionWrite(HttpServletRequest req, QuestionDTO qdto) throws Exception {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		String writer = dto.getId();

		String pseq = req.getParameter("pseq");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		qdto.setPseq(Integer.parseInt(pseq));
		qdto.setTitle(title);
		qdto.setContent(content);
		qdto.setWriter(writer);
		pservice.Question(qdto);

		return "redirect:/product/productDetail?pseq=" + pseq;
	}

	@RequestMapping(value="memberInfo",produces="application/text;charset=UTF-8")
	@ResponseBody
	public String memberInfo() {
		MemberDTO mdto = (MemberDTO)session.getAttribute("loginInfo");
		String[] email = mdto.getEmail().split("@");
		Gson member= new Gson();
		JsonObject obj = new JsonObject();
		obj.addProperty("email1", email[0]);
		obj.addProperty("email2", email[1]);
		obj.addProperty("member", member.toJson(mdto));
		return obj.toString();
	}


	@RequestMapping("reviewdelete") 
	public String ReviewDelete(HttpServletRequest req) throws Exception { 
		int bno = Integer.parseInt(req.getParameter("bno"));
		int pseq = Integer.parseInt(req.getParameter("pseq"));
		pservice.ReviewDelete(bno);
		return "redirect:/product/productDetail?pseq="+pseq; 
	}

	@RequestMapping("questiondelete")
	public String questiondelete(HttpServletRequest req) throws Exception { 
		int bno = Integer.parseInt(req.getParameter("bno"));
		int pseq = Integer.parseInt(req.getParameter("pseq"));
		pservice.QuestionDelete(bno);
		return "redirect:/product/productDetail?pseq="+pseq; 
	}

	@RequestMapping("reviewupdate")
	public String reviewupdate(HttpServletRequest req, MultipartFile file, ReviewDTO rdto) throws Exception { 
		int bno = Integer.parseInt(req.getParameter("bno"));
		int pseq = Integer.parseInt(req.getParameter("pseq"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");   
		String reviewimg = req.getParameter("reviewimg");   

		String img = "";
		if(file!=null) {
			String filePath = session.getServletContext().getRealPath("upload/product/"+pseq+"/review");
			File folder = new File(filePath);
			File[] folder_list = folder.listFiles(); 
			for (int j = 0; j < folder_list.length; j++) {
				if(folder_list[j].equals(reviewimg)) {
					folder_list[j].delete(); 
				}
			}
			if(!file.getOriginalFilename().contentEquals(reviewimg)) {
				if (!file.isEmpty()) {
					String systemFileName = file.getOriginalFilename();
					File targetLoc = new File(filePath + "/" + systemFileName);
					file.transferTo(targetLoc);
					img = systemFileName;
				}
			}
			if(img.contentEquals("")) {
				img = reviewimg;
			}
		}
		rdto.setImg(img);
		rdto.setBno(bno);
		rdto.setPseq(pseq);   
		rdto.setPseq(pseq);
		rdto.setTitle(title);
		rdto.setContent(content);
		rdto.setWriter(writer);

		pservice.ReviewUpdate(rdto);

		return "redirect:/product/productDetail?pseq="+pseq; 
	}
	
	
}
