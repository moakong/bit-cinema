package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> listReview(int id) throws Exception;
	public ReviewVO detailReview(int id) throws Exception;
	public void insertReview(ReviewVO vo) throws Exception;

	
}
