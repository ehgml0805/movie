package goodee.e1i6.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.EventImg;

@Mapper
public interface EventImgMapper {
	int deleteEventImg(int eventKey);
	int insertEventImg(EventImg eventImg);
}
