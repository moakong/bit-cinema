package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.SnackVO;

public interface SnackMapper {
	public List<SnackVO> listSnack(int categoryId) throws Exception;
	public List<SnackVO> bestSnack() throws Exception;
	public SnackVO detailSnack(int snackId)throws Exception;
}
