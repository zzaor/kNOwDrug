package kr.or.knowDrug.durSearch.mapper;

import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("durSearchMapper")
public interface DurSearchMapper {

	int insertData(Map<String,Object> map) throws Exception;
}
