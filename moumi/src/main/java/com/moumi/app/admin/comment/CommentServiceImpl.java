package com.moumi.app.admin.comment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.dao.CommonDAO;

@Service("comment.commentService")
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Comment> listComment(Map<String, Object> map) {
		List<Comment> list = null;
		
		try {
			list = dao.selectList("comment.listComment", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateComment(Comment dto) throws Exception {
		try {
			dao.updateData("comment.updateComment", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
