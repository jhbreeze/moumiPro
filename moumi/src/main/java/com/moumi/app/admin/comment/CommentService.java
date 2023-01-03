package com.moumi.app.admin.comment;

import java.util.List;
import java.util.Map;

public interface CommentService {
	public List<Comment> listComment(Map<String, Object> map);
	public void updateComment(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map);

}
