package goodee.e1i6.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Notice;
import goodee.e1i6.movie.vo.NoticeImg;
@Mapper
public interface NoticeMapper {

	// 공지사항 이미지 등록
	int insertNoticeImg(NoticeImg noticeImg);
	// 공지사항 등록
	int insertNotice(Notice notice);
}
