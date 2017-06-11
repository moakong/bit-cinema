package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.OrderVO;

public interface OrderMapper {
	public List<OrderVO> OrderSelect() throws Exception;
}
