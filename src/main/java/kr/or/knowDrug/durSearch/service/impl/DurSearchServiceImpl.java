package kr.or.knowDrug.durSearch.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.knowDrug.durSearch.mapper.DurSearchMapper;
import kr.or.knowDrug.durSearch.service.DurSearchService;

@Service("durSearchService")
public class DurSearchServiceImpl implements DurSearchService{

	@Resource(name="durSearchMapper")
	private DurSearchMapper mapper;
	
	@Override
	public int insertData(Map<String, Object> map) throws Exception {
		return mapper.insertData(map);
	}

}
