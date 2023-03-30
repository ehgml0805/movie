package goodee.e1i6.movie.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.OrderMapper;
import goodee.e1i6.movie.vo.Cart;
import goodee.e1i6.movie.vo.Order;
import goodee.e1i6.movie.vo.SnackconfirmCode;
import goodee.e1i6.movie.vo.TotalOrder;
import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;


@Service
@Transactional
public class OrderService {
	@Autowired
	private OrderMapper orderMapper;
	
	public int insertCart(Cart c) {
		int row=0;
		try {
			row=orderMapper.insertCart(c);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	public List<Cart> selectCartListbyid(String customerId){
		
		return orderMapper.selectCartListById(customerId);
	}
	public List<Cart> selectCartListBySelect(String customerId){
		return orderMapper.selectCartListBySelect(customerId);
	}
	public int inserOrderByCart(List<Cart> cList, String customerId, String path) {
		int row = 0;
		for(Cart c : cList) {
			row +=orderMapper.insertOrdersByCart(c);
			String dataKey = UUID.randomUUID().toString();
			try {
				Barcode barCode = BarcodeFactory.createCode128(dataKey);
				barCode.setLabel(dataKey);
				barCode.setDrawingText(true);
				File file= new File(path+dataKey+".png");
				BarcodeImageHandler.savePNG(barCode, file);
				SnackconfirmCode confirm = new SnackconfirmCode();
				confirm.setDataKey(dataKey);
				confirm.setOrderKey(c.getOrderKey());
				orderMapper.insertSnackConfirm(confirm);
			}catch(Exception e){
				e.printStackTrace();
				// 파일업로드에 실패하면
				// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
				// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
				throw new RuntimeException();
				}
				
			}
		int sum = orderMapper.selectSumGoodsPrice(customerId);
		TotalOrder t= orderMapper.selectOrderCreatedate(customerId);
		t.setTotalPrice(sum);
		t.setCustomerId(customerId);
		orderMapper.insertTotalOrder(t);
		return row;
		
	}
	public int deleteCartById(String customerId) {
		
		int row  = orderMapper.deleteCartById(customerId);
		return row;
	}
	public int insertTotalOrder(TotalOrder paramt) {
		TotalOrder t= orderMapper.selectOrderCreatedate(paramt.getCustomerId());
		paramt.setTotalPrice(t.getTotalPrice());
		paramt.setCreatedate(t.getCreatedate());
		
		return orderMapper.insertTotalOrder(paramt);
	}
	public Integer selectSumgoodsPrice(String customerId) {
		return orderMapper.selectSumGoodsPrice(customerId);
	}
	//아이디 별 주문 내역 리스트 
	public List<Map<String, Object>> selectOrderListByid(String customerId){
		return orderMapper.selectOrderListById(customerId);
	}
	public int insertOrderDir(Order o, String path) {
		orderMapper.insertOrderByDir(o);
		String dataKey = UUID.randomUUID().toString();
		try {
			Barcode barCode = BarcodeFactory.createCode128(dataKey);
			File file= new File(path+dataKey+".png");
			BarcodeImageHandler.savePNG(barCode, file);
			SnackconfirmCode confirm = new SnackconfirmCode();
			confirm.setDataKey(dataKey);
			confirm.setOrderKey(o.getOrderKey());
			orderMapper.insertSnackConfirm(confirm);
		}catch(Exception e){
			e.printStackTrace();
			// 파일업로드에 실패하면
			// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
			// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
			throw new RuntimeException();
		}
		return o.getOrderKey();
	}
	public int selectAll(String customerId) {
		return orderMapper.updateSelectAll(customerId);
	}
	public int selectOne(Cart c) {
		return orderMapper.updateSelectOne(c);
	}
	public int updateCartQuantity(Cart c) {
		return orderMapper.updateCartQuantity(c);
	}
	public int deleteCartOne(Cart c) {
		return orderMapper.deleteCartOne(c);
	}
	public Order selectOrderOne(int orderKey) {
		return orderMapper.selectOrderOne(orderKey);
	}
	public int selectCartCount(String customerId) {
		return orderMapper.selectCartCount(customerId);
	}
	public List<TotalOrder> selectTotalOrderById(String customerId){
		return orderMapper.selectTotalOrderById(customerId);
	}
	
}
