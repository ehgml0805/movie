package goodee.e1i6.movie.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import goodee.e1i6.movie.teamColor.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/*")
public class EncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		log.debug(TeamColor.JYW+"EncodingFilter");
		
		request.setCharacterEncoding("UTF-8");
		
		chain.doFilter(request, response);	
	}
}