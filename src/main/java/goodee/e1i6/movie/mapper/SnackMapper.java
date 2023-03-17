package goodee.e1i6.movie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Snack;
import goodee.e1i6.movie.vo.SnackCategory;
import goodee.e1i6.movie.vo.SnackImg;

@Mapper
public interface SnackMapper {
	//카테고리 별 스낵 리스트
	List<Snack> selectSnackListByCategory(int categortNo);
	//스낵 상세보기
	Snack selectSnackOne(int snackKey);
	//스낵 수정
	Integer updateSnack(Snack s);
	//스낵 이지미 삭제
	Integer deleteSnackImg(int snackKey);
	//스낵삭제
	Integer deleteSnack(int snackKey);
	//스낵 이미지 추가
	Integer insertSnackImg(SnackImg s);
	//스낵 추가
	Integer insertSnack(Snack s);
	
	List<Snack> selectSnackByHit();
	
	List<Snack> selectSnackBySearch(String word);
	//스낵 카테고리 리스트
	List<SnackCategory> selectCategory();
}
