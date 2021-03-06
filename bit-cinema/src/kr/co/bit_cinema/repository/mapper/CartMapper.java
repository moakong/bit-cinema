package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.CartVO;
import kr.co.bit_cinema.repository.vo.SnackVO;

public interface CartMapper {
	public void insertCart(CartVO snack) throws Exception;
	public List<CartVO> selectCart(String memberId) throws Exception;
	public CartVO selectOneCart(CartVO snack) throws Exception;
	public int updateCart(CartVO snack) throws Exception;
	public int deleteCart(CartVO snack) throws Exception;
}
