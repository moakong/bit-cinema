package kr.co.bit_cinema.repository.mapper;

import java.util.List;
import kr.co.bit_cinema.repository.vo.RatingVO;



public interface RatingMapper {
	
	public List<RatingVO> selectNewRating(int id) throws Exception;
	public List<RatingVO> selectLowRating(int id) throws Exception;
	public List<RatingVO> selectHighRating(int id) throws Exception;
	public List<RatingVO> myRating(String memberId) throws Exception;
	
	public List<RatingVO> selectRatingByNo(int no) throws Exception;
	
	public void insertRating(RatingVO ratingVO) throws Exception;
	public void updateRating(RatingVO ratingVO) throws Exception;
	public void deleteRating(int no) throws Exception;
	
	
	public String selectNickname(String memberId) throws Exception;

	
	public List<RatingVO> selectRatingList(RatingVO ratingVO) throws Exception;
	
	public int selectAllRating(int id) throws Exception;
}