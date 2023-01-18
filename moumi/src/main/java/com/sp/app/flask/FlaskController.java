package com.sp.app.flask;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moumi.app.common.APISerializer;

@Controller("flask.flaskController")
@RequestMapping("/flask/*")
public class FlaskController {
	@Autowired
	private APISerializer apiSerializer;
	
	@RequestMapping("main")
	public String main() {
		return "flask/main";
	}
	
	// 플라스크 웹서버 호출
	@RequestMapping("wordcloud")
	@ResponseBody
	public Map<String, Object> flask(Model model, HttpSession session,@RequestParam String instagram,
				@RequestParam String blog, @RequestParam String twitter,@RequestParam String word) {

		
			String state = "true";
		try {
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "wordcloud";
			System.out.println(path);
			String spec = "http://localhost:5000/wordcloud?word="+URLEncoder.encode(word,"utf-8")+"&instagram="+instagram+"&blog="+blog+
						"&twitter="+twitter;
			String stringJson = apiSerializer.receiveToString(spec);
			JSONObject job = new JSONObject(stringJson);
		} catch (Exception e) {
			state = "false";
		}
			Map<String, Object> map = new HashMap<>();
			map.put("state", state);
			
		return map;
	
	}
}
