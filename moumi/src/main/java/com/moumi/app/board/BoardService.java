package com.moumi.app.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public void insertBoard(Board dto, String pathname) throws Exception;
	public List<Board> listBoard(Map<String,Object> map);
	public int dataCount(Map<String,Object> map);
	public Board readBoard(long num);
	public void updateHitCount(long num) throws Exception;
	public Board preReadBoard(Map<String,Object> map);
	public Board nextReadBoard(Map<String,Object> map);
	public void updateBoard(Board dto, String pathname) throws Exception;
	public void deleteBoard(long num, String pathname, int userCode);
	
	public void insertBoardLike(Map<String,Object> map) throws Exception;
	public void deleteBoardLike(Map<String,Object> map) throws Exception;
	public int boardLikeCount(long num);
	public boolean userBoardLiked(Map<String,Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String,Object> map);
	public int replyCount(Map<String,Object> map);
	public void deleteReply(Map<String,Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(Map<String,Object> map);
	public int replyAnswerCount(Map<String,Object> map);
	
	public void insertReplyLike(Map<String,Object> map) throws Exception;
	public Map<String,Object> replyLikeCount(Map<String,Object> map);
	
	public void updateReplyShowHide(Map<String,Object> map) throws Exception;
}
