package goodee.e1i6.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Customer;

@Mapper
public interface LoginMapper {
	
	// 로그인
	Customer login(Customer customer);

	// 회원가입
	int insertCustomer(Customer customer);
	
	// 회원가입 아이디 중복
	public String selectCustomerId(String customerId);
}
