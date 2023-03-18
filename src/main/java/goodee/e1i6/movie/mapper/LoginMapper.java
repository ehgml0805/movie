package goodee.e1i6.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.Employee;

@Mapper
public interface LoginMapper {
	
	// 고객 로그인
	Customer login(Customer customer);
	
	// 관리자 로그인
	Employee loginEmployee(Employee employee);
	
	// 카카오 로그인
	Customer KakaoLogin(Customer customer);
	// 회원가입
	int insertCustomer(Customer customer);
	
	// 회원가입 아이디 중복
	public String selectCustomerId(String customerId);
	
	// 회원찾기
	public Customer findByCustomerId(String customerId);
}
