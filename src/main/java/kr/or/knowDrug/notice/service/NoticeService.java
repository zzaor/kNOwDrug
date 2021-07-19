package kr.or.knowDrug.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.knowDrug.notice.vo.NoticeVO;

public interface NoticeService {
	//공지사항 리스트
	public List<NoticeVO> selectNoticeList(Map<String,Object> map) throws Exception;

	//글 수 카운트
	int selectCount() throws Exception;

	public int writeNotice(Map<String,Object> map) throws Exception;

	NoticeVO noticeDetail(Map<String,Object> map) throws Exception;

	int hit(Map<String, Object> map) throws Exception;

	int fileDel(Map<String, Object> map) throws Exception;

	int noticeModify(Map<String, Object> map) throws Exception;

	int noticeDelete(Map<String, Object> map) throws Exception;

}
