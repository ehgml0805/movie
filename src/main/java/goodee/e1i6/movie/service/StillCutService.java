package goodee.e1i6.movie.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.mapper.StillCutMapper;
import goodee.e1i6.movie.teamColor.TeamColor;
import goodee.e1i6.movie.vo.StillCut;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class StillCutService {
	@Autowired StillCutMapper stillCutMapper; 
	
	// 빠른 예매 시 영화 포스터 불러오기
	public StillCut getStillCutOneByTicketing(int movieKey) {
		return stillCutMapper.selectStillCutOne(movieKey);
	}
	
	// 영화 이미지 삭제
	public int removeStillCut(int stillCutKey) {
		return stillCutMapper.deleteStillCut(stillCutKey);
	}
	
	// 영화 이미지 수정
	public int modifyStillCut(MultipartFile image, String path, StillCut stillCut) {
		// 1+2+3+4 -> 트랜잭션 처리
		int row = 0;
		
		// 1. 파일 업로드
		if(image.getSize() > 0) {
			log.debug(TeamColor.JYW + "StillCutController.modifyStillCut : " + "수정할 파일이 있습니다.");
			
			// 2. 파일 저장
			String originName = image.getOriginalFilename();
			String fileName = stillCut.getFileName();
			File f = new File(path + fileName);
			
			stillCut.setOriginName(originName);
			stillCut.setFileType(image.getContentType());
			stillCut.setFileSize(image.getSize());
			
			// 3. 파일 정보를 stillCut 테이블의 행 수정
			row = stillCutMapper.updateStillCut(stillCut); 
			
			try {
				image.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
				// 파일업로드에 실패하면
				// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
				// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
				throw new RuntimeException();
			}   	
		}
		return row;
	}
	
	// 영화 이미지 등록
	public int insertStillCut(List<MultipartFile> files, String path, int movieKey) {
		// 1+2+3+4 -> 트랜잭션 처리
		int row = 0;
		
		// movie 테이블(1) : (N) still_cut 테이블
		
		// 1. 파일 업로드
		if(files.get(0).getSize() > 0) {
			log.debug(TeamColor.JYW + "StillCutController.addStillCut : " + "첨부된 파일이 있습니다.");
			
			for(MultipartFile mf : files) {
				// 2. 파일 저장				
				StillCut stillCut = new StillCut();
				
				String originName = mf.getOriginalFilename();
				String fileName = UUID.randomUUID().toString().replace("-", ""); // 확장자 미포함
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				
				fileName = fileName + "." + ext;
				log.debug(TeamColor.JYW + "fileName : " + fileName);
				
				File f = new File(path + fileName); // 풀네임으로 빈파일을 생성
				// 빈파일에 mf안의 업로드된 파일을 복사
				
				stillCut.setMovieKey(movieKey);
				stillCut.setPoster("N");
				stillCut.setOriginName(originName);
				stillCut.setFileName(fileName);
				stillCut.setFileType(mf.getContentType());
				stillCut.setFileSize(mf.getSize());
				// 4. 파일정보를 stilCut 테이블에 저장
				row = stillCutMapper.insertStillCut(stillCut);
				
				try {
					mf.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
					// 파일업로드에 실패하면
					// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
					// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
					throw new RuntimeException();
				}   		
			}
		}
		return row;
	}
	
	// 영화 이미지 상세정보 출력
	public StillCut getStillCutOne(int stillCutKey) {
		return stillCutMapper.selectStillCutOne(stillCutKey);
	}
	
	// 영화 이미지 출력
	public List<StillCut> getStillCutList(int movieKey) {
		log.debug(TeamColor.JYW + "getStillCutList");
		return stillCutMapper.selectStillCutList(movieKey);
	}
}
