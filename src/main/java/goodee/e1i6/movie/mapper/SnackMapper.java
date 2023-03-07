package goodee.e1i6.movie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.Snack;
import goodee.e1i6.movie.vo.SnackCategory;
import goodee.e1i6.movie.vo.SnackImg;

@Mapper
public interface SnackMapper {
	List<Snack> selectSnackListByCategory(int categortNo);
	Snack selectSnackOne(int snackKey);
	Integer insertSnackImg(SnackImg s);
	Integer deleteSnackImg(int snackKey);
	Integer updateSnack(Snack s);
	Integer deleteSnack(int snackKey);
	Integer insertSnack(Snack s);
	List<Snack> selectSnackByHit();
	List<Snack> selectSnackBySearch(String word);
	List<SnackCategory> selectCategory();
}
