package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.ReviewFileVO;
import kr.co.bit_cinema.repository.vo.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> listReview(int id) throws Exception;
	public ReviewVO detailReview(int reviewNo) throws Exception;
	public void insertReview(ReviewVO vo) throws Exception;
	public void deleteReview(int no) throws Exception;
	public void updateReview(ReviewVO vo) throws Exception;

	//파일 
	public void insertFile(ReviewFileVO vo) throws Exception;
	public ReviewFileVO detailFile(int reviewNo) throws Exception;
	public List<ReviewFileVO> listFile(int id) throws Exception;
	public void deleteFile(int no) throws Exception;
	
	
	
}
