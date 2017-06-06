package kr.co.bit_cinema.repository.mapper;

import kr.co.bit_cinema.repository.vo.MemberVO;

public interface MemberMapper {
	public MemberVO loginMember(MemberVO member) throws Exception;
	public void joinMember(MemberVO member) throws Exception;
	public MemberVO infoMember(String memberId) throws Exception;
	public void modifyMember(MemberVO member) throws Exception;
	public void withdrawMember(String memberId) throws Exception;
	
	public String checkId(String id) throws Exception;
	public String findMemberId(MemberVO member) throws Exception;
	public String findMemberPass(MemberVO member) throws Exception;
}
