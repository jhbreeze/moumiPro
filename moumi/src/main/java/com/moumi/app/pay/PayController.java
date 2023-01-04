package com.moumi.app.pay;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moumi.app.member.SessionInfo;

@Controller("pay.payController")
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	private PayService service;
	
	
	@RequestMapping(value = "list")
	public String list(HttpSession sesion) throws Exception {
		return ".pay.list";
	}
	
	@GetMapping("payment")
	public String paymentList(@RequestParam String productnum,
				@RequestParam String price, Model model,HttpSession session) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Pay dto = service.readMember(info.getUserCode());
		if(dto == null) {
			return"redirect:/pay/payment?productnum="+productnum+"&price="+ price;
		}
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String now = sdf.format(date);
		Calendar cal = Calendar.getInstance();
		String enddate = null;
		if (productnum.equals("1")) {
			cal.setTime(date);
			cal.add(Calendar.DATE, 30);
			enddate = sdf.format(cal.getTime());
		} else if(productnum.equals("2")) {
			cal.setTime(date);
			cal.add(Calendar.DATE, 50);
			enddate = sdf.format(cal.getTime());
		}
		
		int productNum = Integer.parseInt(productnum);
		Pay dto2 = service.readPay(productNum);
		
		model.addAttribute("dto",dto);
		model.addAttribute("dto2",dto2);
		model.addAttribute("price",price);
		model.addAttribute("now",now);
		model.addAttribute("enddate",enddate);
		
		return ".pay.payment";
	}
	
	@PostMapping("payment")
	public String paymentSubmit(Pay dto,HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserCode(info.getUserCode());
			dto.setDiscount(1000);
			System.out.println(dto.getPaymentPrice());
			System.out.println(dto.getPayDate());
			System.out.println(dto.getEndDate());
			service.insertPay(dto);
		} catch (Exception e) {
			
		}
		return "redirect:/pay/success?userName="+URLEncoder.encode(dto.getUserName(),"UTF-8")+"&subject="+URLEncoder.encode(dto.getSubject(),"UTF-8");
	}


	@GetMapping("success")
	public String paymentSuccess(@RequestParam String userName,
				@RequestParam String subject,Pay dto,Model model,HttpSession session) throws Exception {
		
		userName = URLDecoder.decode(userName,"utf-8");
		subject = URLDecoder.decode(subject,"utf-8");
		model.addAttribute("userName",userName);
		model.addAttribute("subject",subject);
		
		return ".pay.success";
	}
	
}
