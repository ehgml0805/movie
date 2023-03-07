package goodee.e1i6.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.IdMapper;



@Service
@Transactional
public class IdService {
	@Autowired private IdMapper idMapper;
	
	// null이면 사용가능, null이 아니면 사용불가
	public String getIdCheck(String id) {
		return idMapper.selectIdCheck(id);
	}
}
