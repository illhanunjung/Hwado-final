package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@ToString
public class Artworks {
	private String aw_seq;
	private String user_email;
	private String category_seq;
	
	@NonNull
	private String aw_name;
	
	@NonNull
	private int aw_price;
	
	private String aw_status;
	private String created_at;
	
	@NonNull
	private String aw_type;

}
