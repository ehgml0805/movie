package goodee.e1i6.movie.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import goodee.e1i6.movie.teamColor.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j // static log log = new log();
@WebFilter("/customer/*")
public class CustomerLoginFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		log.debug(TeamColor.JYW+"Customer Filter");
		
		if(request instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = ((HttpServletRequest) request).getSession();
			
			if(session.getAttribute("loginCustomer") == null) {
				// 로그인 안되어 있으면 alert창 출력 후 home으로 이동
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 후 이용 가능합니다.'); location.href='/movie/home'</script>");
				out.flush();
				out.close();
				
				//((HttpServletResponse)response).sendRedirect(req.getContextPath()+"/home");
				return;
			}
		} else {
			log.debug("웹브라우저 요청만 허용합니다.");
			return;
		}
		
		// controller 전
		chain.doFilter(request, response);
		// controller 후
	}
}
