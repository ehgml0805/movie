package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Cart;
import goodee.e1i6.movie.vo.Order;
import goodee.e1i6.movie.vo.SnackconfirmCode;
import goodee.e1i6.movie.vo.TotalOrder;

@Mapper
public interface OrderMapper {
	//카트 담기 
	Integer insertCart(Cart c);
	//아이디별 카트 리스트 
	List<Cart> selectCartListById(String customerId);
	//??? 
	List<Cart> selectCartListBySelect(String customerId);
	//주문에 담기 
	Integer insertOrdersByCart(Cart c);
	
	Integer insertTotalOrder(TotalOrder t);
	Integer deleteCartById(String customerId);
	Integer selectSumGoodsPrice(String customerId);
	//아이디 별 주문 내역 리스트 
    List<Map<String, Object>> selectOrderListById(String customerId);
    Integer insertOrderByDir(Order o);
    Integer updateSelectAll(String customerId);
    Integer updateSelectOne(Cart c);
    Integer updateCartQuantity(Cart c);
    Integer deleteCartOne(Cart c);
    Order selectOrderOne(int orderKey);
    Integer selectCartCount(String customerId);
	Integer insertSnackConfirm(SnackconfirmCode s);
	Integer updateSnackConfirm(SnackconfirmCode s);
	
	List<TotalOrder> selectTotalOrderById(String customerId);
	TotalOrder selectOrderCreatedate(String customerId);
}
