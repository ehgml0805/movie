package goodee.e1i6.movie.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import goodee.e1i6.movie.mapper.SnackMapper;
import goodee.e1i6.movie.vo.Snack;
import goodee.e1i6.movie.vo.SnackCategory;
import goodee.e1i6.movie.vo.SnackImg;

@Transactional
@Service
public class SnackService {
	@Autowired
	SnackMapper snackMapper;
	
	public List<Snack> snackListByCategoryNo(int categoryNo){
	
		return snackMapper.selectSnackListByCategory(categoryNo);
		
	}
	
	public Snack snackOne(int snackKey) {
		return snackMapper.selectSnackOne(snackKey);
	}
	
	public int insertSnack(Snack s, MultipartFile mf, String path) {
		int row= snackMapper.insertSnack(s);
		if(row==1) {
			String originName = mf.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."));
			String fileName = s.getSnackKey()+s.getSnackName();
			fileName = fileName+ext;
			SnackImg i = new SnackImg();
			i.setFileName(fileName);
			i.setSnackKey(s.getSnackKey());
			i.setFileSize(mf.getSize());
			i.setFileType(mf.getContentType());
			i.setOriginName(originName);
			snackMapper.insertSnackImg(i);
			try {
				mf.transferTo(new File(path+fileName));
			}catch (Exception e) {
				e.printStackTrace();
				// 파일업로드에 실패하면
				// try...catch절이 필요로 하지 않는 RuntimeException을 발생시켜서
				// 애노테이션Transactional이 감지하여 rollback할 수 있도록 
				throw new RuntimeException();
			}
			
		}
		return row;
	}
	public int deleteSnack(int snackKey) {
		int row = snackMapper.deleteSnack(snackKey);
		if(row==1) {
			snackMapper.deleteSnackImg(snackKey);
		}
		return row;
	}
	public int updateSnack(Snack s) {
		return snackMapper.updateSnack(s);
	}
	public List<Snack> selectSnackByHit(){
		
		return snackMapper.selectSnackByHit();
	}
	public List<Snack> selectsnackBySearch(String word){
		
		return snackMapper.selectSnackBySearch(word);
	}
	public List<SnackCategory> selectCateogry(){
		return snackMapper.selectCategory();
	}
}
