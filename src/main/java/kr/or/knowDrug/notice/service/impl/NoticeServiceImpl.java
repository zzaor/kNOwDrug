package kr.or.knowDrug.notice.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.knowDrug.notice.mapper.NoticeMapper;
import kr.or.knowDrug.notice.service.NoticeService;
import kr.or.knowDrug.notice.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Resource(name="noticeMapper")
	private NoticeMapper mapper;

	@Override
	public List<NoticeVO> selectNoticeList(Map<String,Object> map) throws Exception {
		return mapper.selectNoticeList(map);
	}

	@Override
	public int selectCount() throws Exception {
		return mapper.selectCount();
	}

	@Override
	public int writeNotice(Map<String, Object> map) throws Exception {
		return mapper.writeNotice(map);
	}

	@Override
	public NoticeVO noticeDetail(Map<String, Object> map) throws Exception {
		return mapper.noticeDetail(map);
	}

	@Override
	public int hit(Map<String, Object> map) throws Exception {
		return mapper.hit(map);
	}

	@Override
	public int fileDel(Map<String, Object> map) throws Exception {
		return mapper.fileDel(map);
	}

	@Override
	public int noticeModify(Map<String, Object> map) throws Exception {
		return mapper.noticeModify(map);
	}

	@Override
	public int noticeDelete(Map<String, Object> map) throws Exception {
		return mapper.noticeDelete(map);
	}






}
