package kr.smhrd.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@Setter
public class Interests {

	public Interests(String user_email, @NonNull Long ap_seq) {
        this.user_email = user_email;
        this.ap_seq = ap_seq;
    }

	@NonNull
	private Long it_seq;
	
	@NonNull
	private String user_email;
	
	@NonNull
	private  Timestamp created_at;
	
	@NonNull
	private Long ap_seq;
	
	public Interests(Long it_seq, String user_email, @NonNull Timestamp created_at, @NonNull Long ap_seq) {
	    
		this.user_email = user_email;
        this.ap_seq = ap_seq;
        this.created_at = created_at;
        this.it_seq = it_seq;
		
	}


	
}
