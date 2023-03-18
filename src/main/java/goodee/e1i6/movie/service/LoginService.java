package goodee.e1i6.movie.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.mapper.CustomerImgMapper;
import goodee.e1i6.movie.mapper.LoginMapper;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Customer;
import goodee.e1i6.movie.vo.CustomerForm;
import goodee.e1i6.movie.vo.CustomerImg;
import goodee.e1i6.movie.vo.Employee;
import lombok.extern.slf4j.Slf4j;

@Slf4j // static Log log = new Log() 로그 객체를 선언하여 사용할 수 있게 함
@Service
@Transactional
public class LoginService {
	@Autowired private LoginMapper loginMapper;
	@Autowired private CustomerImgMapper customerImgMapper;
	
	// 카카오 호그인
	public Customer kakaoLogin(Customer customer) {
		return loginMapper.KakaoLogin(customer);
		}
	
	
	// employee 호그인
	public Employee loginEmployee(Employee employee) {
		return loginMapper.loginEmployee(employee);
	}
		
	 
	// customer 로그인
	public Customer login(Customer customer) {
		return loginMapper.login(customer);
	}
	

	// customer 회원가입
	public void addCustomer(CustomerForm customerForm, String path) {
		Customer customer = new Customer();
		customer.setCustomerId(customerForm.getCustomerId());
		customer.setCustomerPw(customerForm.getCustomerPw());
		customer.setCustomerName(customerForm.getCustomerName());
		customer.setCustomerAddress(customerForm.getCustomerAddress());
		customer.setCustomerBirthday(customerForm.getCustomerBirthday());
		customer.setCustomerGender(customerForm.getCustomerGender());
		customer.setCustomerPhone(customerForm.getCustomerPhone());
		customer.setCustomerPoint(customerForm.getCustomerPoint());
		customer.setCustomerEmail(customerForm.getCustomerEmail());
		customer.setBlacklist(customerForm.getBlacklist());
		customer.setCustomerGrade(customerForm.getCustomerGrade());
		customer.setLastLogin(customerForm.getLastLogin());
		customer.setCreatedate(customerForm.getCreatedate());
		
		int row = loginMapper.insertCustomer(customer);
		log.debug(TeamColor.JSM + row + " <- loginMapper.insertCustomer 실행결과 :");
		
		if(customerForm.getCustomerImgList().get(0).getSize() > 0 && row == 1) {
			for(MultipartFile mf : customerForm.getCustomerImgList()) {
				CustomerImg customerImg = new CustomerImg();
				
				String originName = mf.getOriginalFilename();
				// originName에서 마지막 .문자열 위치
				String ext = originName.substring(originName.lastIndexOf("."));
				
				// 파일을 저장할때 사용할 중복되지않는 새로운 이름 필요(UUID API사용)
				String fileName = UUID.randomUUID().toString();
			
				fileName = fileName + ext;
				
				customerImg.setCustomerId(customer.getCustomerId());
				customerImg.setFileName(fileName);
				customerImg.setFileType(mf.getContentType());
				customerImg.setFileSize(mf.getSize());
				customerImg.setOriginName(originName);
				customerImgMapper.insertCustomerImg(customerImg);
				try {
					mf.transferTo(new File(path+fileName));
				} catch (Exception e) {
					e.printStackTrace();
					// 파일업로드에 실패하면
					// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
					// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
					throw new RuntimeException();
				}				
			}
		}
	}
	
	// customer 회원찾기
	@Transactional (readOnly = true)
	public Customer findCustomer(String customerId) {
		
		Customer customer = loginMapper.findByCustomerId(customerId);
		

		return customer;
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
	// customer 회원가입
	public int addCustomer(Customer customer) {
		return loginMapper.insertCustomer(customer);
	}
	
	// 한명의 회원정보 불러오기
	public Customer selectCustomerOne(Customer customer) {
		Customer resultCustomer = loginMapper.SelectCustomerOne(customer);
		
		
		return resultCustomer;
	}
	
}
