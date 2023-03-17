package goodee.e1i6.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.e1i6.movie.vo.CustomerImg;

@Mapper
public interface CustomerImgMapper {
	int insertCustomerImg(CustomerImg customerImg);
}
