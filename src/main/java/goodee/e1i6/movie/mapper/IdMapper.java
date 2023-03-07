package goodee.e1i6.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IdMapper {
	String selectIdCheck(String id);

}
