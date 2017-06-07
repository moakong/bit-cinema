package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.CartVO;

public interface CartMapper {
	public void insertCart(CartVO snack) throws Exception;
	public List<CartVO> selectCart() throws Exception;
	public int deleteCart(int no) throws Exception;
	public int updateCart(CartVO snack) throws Exception;
	public CartVO selectOneCart(int no) throws Exception;
}
