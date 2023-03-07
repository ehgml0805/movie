package goodee.e1i6.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.e1i6.movie.mapper.NoticeMapper;
import goodee.e1i6.movie.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired NoticeMapper noticeMapper;
	
	// 공지사항 등록
	public int addNotice(String noticeTitle, String noticeContent) {
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);
		return noticeMapper.insertNotice(notice);
	}
	
}
