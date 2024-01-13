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
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class AUCTIONS {
	private int auc_seq;
	
	@NonNull
	private int aw_seq;
	
	private String auc_started_at;
	
	@NonNull
	private String auc_ended_at;
	private String auc_status;
	private String bidder_email;

}
