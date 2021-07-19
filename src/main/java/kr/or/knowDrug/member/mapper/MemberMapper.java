package kr.or.knowDrug.member.mapper;

import java.util.List;
import java.util.Map;

import org.antlr.grammar.v3.ANTLRParser.exceptionGroup_return;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.knowDrug.member.vo.MemberVO;


@Mapper("memberMapper")
public interface MemberMapper  {
	List<MemberVO> selectMemberList(Map<String, Object> map) throws Exception;

	MemberVO selectMember(Map<String,Object> map) throws Exception;

	MemberVO mypage(Map<String,Object> map) throws Exception;

	int join(Map<String, Object> map) throws Exception;

	int modiMypage(Map<String, Object> map) throws Exception;

	int idDuplCheck(Map<String, Object> map) throws Exception;

	int changeActive(Map<String, Object> map) throws Exception;

	int changeActiveY(Map<String, Object> map) throws Exception;

	int selectCount() throws Exception;

	MemberVO duplId(Map<String, Object> map) throws Exception;

	int setPwd(Map<String, Object> pwdMap) throws Exception;

	int changePwd(Map<String, Object> map) throws Exception;

	int changeActiveD(Map<String, Object> map) throws Exception;
}

