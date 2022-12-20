package com.moumi.app.admin.comment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.comment.commenttController")

@RequestMapping("/admin/comment/*")
public class CommentController {
	
	@RequestMapping("list")
	public String commentManage() {
		return ".admin.comment.list";
	}

}
