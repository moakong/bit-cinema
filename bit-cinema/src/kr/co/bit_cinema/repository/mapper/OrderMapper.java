package kr.co.bit_cinema.repository.mapper;

import java.util.List;

import kr.co.bit_cinema.repository.vo.CartToOrderVO;
import kr.co.bit_cinema.repository.vo.CartVO;
import kr.co.bit_cinema.repository.vo.OrderDetailVO;
import kr.co.bit_cinema.repository.vo.OrderVO;

public interface OrderMapper {
	public List<OrderVO> listOrder(String memberId) throws Exception;
	public List<OrderDetailVO> detailOrder(String orderId) throws Exception;
	public CartToOrderVO selectCart(CartVO cart) throws Exception;

	public void insertOrder(OrderVO order) throws Exception;
	public void insertOrderDetail(OrderDetailVO oDetail) throws Exception;
}
