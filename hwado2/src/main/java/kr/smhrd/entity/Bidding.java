package kr.smhrd.entity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class Bidding {

	@NonNull
	private int bid_seq;
	
	@NonNull
	private int auc_seq;
	
	@NonNull
	private String user_email;
	
	@NonNull
	private int bid_price;
	
	private String bid_story;
	
	@NonNull
	private String created_at;
	
}
