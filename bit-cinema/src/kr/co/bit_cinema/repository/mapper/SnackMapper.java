package kr.co.bit_cinema.repository.mapper;

import kr.co.bit_cinema.repository.vo.SnackVO;

public interface SnackMapper {
	public SnackVO selectSnacks(int no) throws Exception;
	public SnackVO bestSnacks(int no) throws Exception;
	public SnackVO detailScnacks(int no)throws Exception;
}
