package kr.or.knowDrug.board.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.knowDrug.board.mapper.BoardMapper;
import kr.or.knowDrug.board.service.BoardService;
import kr.or.knowDrug.board.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardMapper")
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getBoardList(Map<String, Object> map) throws Exception{
		return mapper.selectBoardList(map);
	}

	@Override
	public int getBoardWrite(Map<String, Object> map) throws Exception{
//		System.out.println("saveFile"+saveFile);
		return mapper.write(map);
	}
	//공지사항 상세
	@Override
	public BoardVO boardDetail(Map<String, Object> map) throws Exception {
		return mapper.read(map);
	}
	//공지사항 삭제
	@Override
	public int boardDelete(Map<String, Object> map) throws Exception{
		return mapper.delete(map);
	}
	//댓글 등록
	@Override
	public int getReplyAdd(Map<String, Object> map) throws Exception {
		return mapper.replyWrite(map);

	}
	//댓글리스트
	@Override
	public List<?> getReplyList(Map<String, Object> map) throws Exception {
		return mapper.replyList(map);
	}


	//댓글삭제
	@Override
	public int replyDel(Map<String, Object> map) throws Exception {
		return mapper.replyDel(map);
	}
	//자유게시판 수정
	@Override
	public int boardModify(Map<String, Object> map) throws Exception{
		return mapper.boardModify(map);
	}
	//파일삭제
	@Override
	public int fileDel(Map<String, Object> map) throws Exception{
		return mapper.fileDel(map);
	}
	//카운트
	@Override
	public int selectCount() throws Exception {
		return mapper.selectCount();
	}
	//조회수 증가
	@Override
	public int hit(Map<String, Object> map) throws Exception {
		return mapper.hit(map);
	}
}
