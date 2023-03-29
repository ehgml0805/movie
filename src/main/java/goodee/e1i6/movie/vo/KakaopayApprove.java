package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class KakaopayApprove {
	private String aid;
	private String tid;
	private String partner_order_id;
	private String partenr_user_id;
	private String payment_method_type;
}
