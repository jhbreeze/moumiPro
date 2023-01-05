package com.moumi.app.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moumi.app.common.FileManager;
import com.moumi.app.common.dao.CommonDAO;

@Service("board.boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertBoard(Board dto, String pathname) throws Exception {
		try {
			
			long seq = dao.selectOne("board.seq");
			dto.setCommunityNum(seq);
			dao.insertData("board.insertBoard",dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
				if(saveFilename != null) {
					dto.setFileName(saveFilename);
				}
				dao.insertData("board.insertFile",dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list = null;
		
		try {
			list = dao.selectList("board.listBoard",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("board.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Board readBoard(long num) {
		Board dto = null;
		try {
			dto = dao.selectOne("board.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("board.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.selectOne("board.preReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.selectOne("board.nextReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateBoard(Board dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				if (dto.getFileName() != null && dto.getFileName().length() != 0) {
					fileManager.doFileDelete(dto.getFileName(), pathname);
				}

				dto.setFileName(saveFilename);
			
			}

			dao.updateData("board.updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteBoard(long num, String pathname, long userCode,int userType) throws Exception {
		try {
			Board dto = readBoard(num);
			
			if( dto == null || (dto.getUserCode() != userCode && userType != 0)) {
				return;
			}
			fileManager.doFileDelete(dto.getFileName(), pathname);

			dao.deleteData("board.deleteBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("board.insertBoardLike",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("board.deleteBoardLike",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int boardLikeCount(long num) {
		int result = 0;
		try {
			result = dao.selectOne("board.boardLikeCount",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			Board dto = dao.selectOne("board.userBoardLiked", map);
			if(dto != null) {
				result = true; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReply(Reply dto,String pathname) throws Exception {
		try {
			long seq = dao.selectOne("board.rseq");
			dto.setReplyNum(seq);
			dao.insertData("board.insertReply",dto);
			
			if( ! dto.getSelectFile().isEmpty() ) {
				String filename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
				if(filename != null) {
					dto.setFileName(filename);
					
					dao.insertData("board.replyFile", dto);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		
		try {
			list = dao.selectList("board.listReply",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("board.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("board.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReplyAnswer(Map<String, Object> map) {
			List<Reply> list = null;
		try {
			list = dao.selectList("board.listReplyAnswer", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyAnswerCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("board.replyAnswerCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("board.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		
		try {
			countMap = dao.selectOne("board.replyLikeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countMap;
	}

	@Override
	public void insertNotify(Board dto) throws Exception {
		try {
			dao.insertData("board.insertNotify",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	@Override
	public long readReplyNum(long num) {
			long result = 0;
		try {
			result = dao.selectOne("board.readReplyNum",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}