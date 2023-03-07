package goodee.e1i6.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.LoginMapper;
import goodee.e1i6.movie.vo.Customer;
import lombok.extern.slf4j.Slf4j;

@Slf4j // static Log log = new Log() 로그 객체를 선언하여 사용할 수 있게 함
@Service
@Transactional
public class LoginService {
	@Autowired private LoginMapper loginMapper;
	
	// customer 호그인
	public Customer login(Customer customer) {
		return loginMapper.login(customer);
	}
	

	// customer 회원가입
	public int addCustomer(Customer customer) {
		return loginMapper.insertCustomer(customer);
	}
	
	// 회원가입중복검사
	public String getCustomerId(String customerId) {
		// 사용가능한 id면 yes 아니면 no
		String resultStr = "NO";
		

		if(loginMapper.selectCustomerId(customerId) == null) {
			resultStr = "YES";
		}

		return resultStr;
}
	
}
