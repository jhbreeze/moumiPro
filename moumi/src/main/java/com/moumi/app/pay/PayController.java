package com.moumi.app.pay;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moumi.app.member.SessionInfo;

@Controller("pay.payController")
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	private PayService service;
	
	
	@RequestMapping(value = "list")
	public String list(HttpSession sesion) {
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
		int productNum = Integer.parseInt(productnum);
		Pay dto2 = service.readPay(productNum);
		
		model.addAttribute("dto",dto);
		model.addAttribute("dto2",dto2);
		
		return ".pay.payment";
	}
}
