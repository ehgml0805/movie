package goodee.e1i6.movie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.FaqMapper;
import goodee.e1i6.movie.vo.Faq;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FaqService {
	@Autowired private FaqMapper faqMapper;
	// faqCount
	public int faqCount(String searchWord, int currentPage, int rowPerPage) {
		int count = faqMapper.faqCount(searchWord);
		int lastPage = (count + rowPerPage - 1) / rowPerPage;
		
		return lastPage;
	}
	// removeFaq
	public int removeFaq(Faq faq) {
		return faqMapper.deleteFaq(faq);
	}
	
	// modifyFaq
	public int modifyFaq(Faq faq) {
		return faqMapper.updateFaq(faq);
	}
	
	// addFaq
	public int addFaq(Faq faq) {
		return faqMapper.insertFaq(faq);
	}
	
	// faqList
	public List<Faq> getFaqList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String,Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return faqMapper.selectFaqList(paramMap);
	}
}
