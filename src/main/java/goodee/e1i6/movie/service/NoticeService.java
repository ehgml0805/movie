package goodee.e1i6.movie.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.mapper.NoticeMapper;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.Notice;
import goodee.e1i6.movie.vo.NoticeImg;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class NoticeService {
	@Autowired NoticeMapper noticeMapper;
	
	// 공지사항 삭제
	public int removeNotice(int noticeKey) {
		return noticeMapper.deleteNotice(noticeKey);
	}
	
	// 공지사항 수정
	public int modifyNoticeOne(int noticeKey, String newTitle, String newContent) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("noticeKey", noticeKey);
		paramMap.put("newTitle", newTitle);
		paramMap.put("newContent", newContent);
		return noticeMapper.updateNoticeOne(paramMap);
	}
	
	// 공지사항 내용
	public Map<String, Object> getNoticeOne(int noticeKey) {
		return noticeMapper.selectNoticeOne(noticeKey);
	}
	
	// 공지사항 리스트 마지막페이지
	public int getNoticeListCount() {
		return noticeMapper.selectNoticeListCount();
	}
	
	// 공지사항 리스트
	public List<Notice> getNoticeList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage -1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return noticeMapper.selectNoticeList(paramMap);
	}
	
	// 공지사항 등록(파일업로드)
	public int addNotice(String noticeTitle, String noticeContent, String path, MultipartFile img) {
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);
		// noticeKey는 insert쿼리 실행 후 생성된 auto_increment값으로 채워지도록 쿼리를 실행
		int insertNotice = noticeMapper.insertNotice(notice);
		int noticeKey = notice.getNoticeKey();
		log.debug(TeamColor.YIB + noticeKey + " : noticeKey");
		log.debug(TeamColor.YIB + insertNotice + " : insertNotice");
		log.debug(TeamColor.YIB + path + " : path");
		// 이미지 파일이 있으면
		if(img.getSize() != 0) {
			log.debug(TeamColor.YIB + "파일업로드 start");
			String originName = img.getOriginalFilename(); // 원본 파일 이름
			String fileType = originName.substring(originName.lastIndexOf(".")+1); // .뒤에글자(파일 확장자)
			String fileSize = Long.toString(img.getSize());
			String newName = UUID.randomUUID().toString().replace("-", ""); // 확장자 미포함, -빼고저장
			String fileName = newName + "." + fileType;
			String savePath = path + fileName;
			log.debug(TeamColor.YIB + fileName + " : fileName");
			File f = new File(savePath);
			try {
				img.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
				// 파일업로드 실패시 RuntimeException을 발생시켜 애노테이션Transactional이 감지하여 rollback할 수 있도록
				throw new RuntimeException();
			}
			NoticeImg noticeImg = new NoticeImg();
			noticeImg.setNoticeKey(noticeKey);
			noticeImg.setOriginName(originName);
			noticeImg.setFileType(fileType);
			noticeImg.setFileSize(fileSize);
			noticeImg.setFileName(fileName);
			return noticeMapper.insertNoticeImg(noticeImg);
		}
		return insertNotice;
	}
	
}
