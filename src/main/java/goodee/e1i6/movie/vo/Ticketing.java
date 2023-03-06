package goodee.e1i6.movie.vo;

import lombok.Data;

@Data
public class Ticketing {
	private int ticketingKey;
	private String seatNumber;
	private int scheduleKey;
	private String customerId;
	private String ticketingStatus;
	private String createdate;
}
