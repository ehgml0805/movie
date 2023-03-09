package goodee.e1i6.movie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Notice;
import goodee.e1i6.movie.vo.NoticeImg;
@Mapper
public interface NoticeMapper {
	
	// 공지사항 이미지 삭제
	int deleteNoticeImg(int noticeKey);
	// 공지사항 삭제
	int deleteNotice(int noticeKey);
	// 공지사항 수정
	int updateNoticeOne(Map<String, Object> paramMap);
	// 공지사항 내용
	Map<String, Object> selectNoticeOne(int noticeKey);
	// 공지사항 리스트 마지막페이지
	int selectNoticeListCount();
	// 공지사항 리스트
	List<Notice> selectNoticeList(Map<String, Object> paramMap);
	// 공지사항 이미지 등록
	int insertNoticeImg(NoticeImg noticeImg);
	// 공지사항 등록
	int insertNotice(Notice notice);
}
