package kr.or.knowDrug.academicInfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.knowDrug.academicInfo.mapper.AcademicInfoMapper;
import kr.or.knowDrug.academicInfo.service.AcademicInfoService;
import kr.or.knowDrug.academicInfo.vo.AcademicInfoVO;

@Service("academicInfoService")
public class AcademicInfoServiceImpl implements AcademicInfoService{

	@Resource(name="academicInfoMapper")
	private AcademicInfoMapper mapper;

	@Override
	public List<AcademicInfoVO> selectInfoList(Map<String,Object> map) throws Exception {
		return mapper.selectInfoList(map);
	}

	@Override
	public int writeInfo(Map<String, Object> map) throws Exception {
		return mapper.writeInfo(map);
	}

	@Override
	public int writeFile(Map<String, Object> map) throws Exception {
		return mapper.writeFile(map);
	}

	@Override
	public String selectSeq() throws Exception {
		return mapper.selectSeq();
	}

	@Override
	public List<?> selectInfo(Map<String, Object> map) throws Exception {
		return mapper.selectInfo(map);
	}

	@Override
	public int addHit(Map<String, Object> map) throws Exception {
		return mapper.addHit(map);
	}

	@Override
	public int deleteInfo(Map<String, Object> map) throws Exception {
		return mapper.deleteInfo(map);
	}

	@Override
	public int selectCount() throws Exception {
		return mapper.selectCount();
	}

	@Override
	public int modiInfo(Map<String, Object> map) throws Exception {
		return mapper.modiInfo(map);
	}

	@Override
	public int deleteFile(Map<String, Object> map) throws Exception {
		return mapper.deleteFile(map);
	}

	@Override
	public int selectFile(Map<String, Object> map) throws Exception {
		return mapper.selectFile(map);
	}




}
