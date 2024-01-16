package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Cart {

	private int basket_seq;
	private String user_email;
	private int aw_seq;
	private String created_at;
	private String basket_status;
	
}
