package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class Cart {

	private int basket_seq;
	@NonNull
	private String user_email;
	@NonNull
	private int aw_seq;
	private String created_at;
	private String basket_status;
	
}
