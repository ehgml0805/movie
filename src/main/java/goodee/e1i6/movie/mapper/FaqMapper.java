package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Faq;

@Mapper
public interface FaqMapper {
	// FAQ COUNT
	int faqCount(String searchWord);
	// FAQ삭제
	int deleteFaq(Faq faq);
	// FAQ수정
	int updateFaq(Faq faq);
	// FAQ추가
	int insertFaq(Faq faq);
	// FAQ리스트
	List<Faq> selectFaqList(Map<String, Object>paraMap);
}
