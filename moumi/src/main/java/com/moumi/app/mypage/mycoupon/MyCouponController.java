package com.moumi.app.mypage.mycoupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moumi.app.member.SessionInfo;

@Controller("mypage.mycouponController")
@RequestMapping("/mypage/mycoupon/*")
public class MyCouponController {
	@Autowired
	private MyCouponService service;

	@RequestMapping(value = "mycoupon")
	public String myCoupon(HttpSession session, HttpServletRequest req, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		System.out.println(info.getUserCode() + "getUserCode");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", info.getUserCode());

		int dataCount = service.dataCount(map);

		List<MyCoupon> couponList = service.listMyCoupon(map);

		model.addAttribute("couponList", couponList);
		model.addAttribute("dataCount", dataCount);

		return ".mypage.mycoupon.mycoupon";
	}

}
