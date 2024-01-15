package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@ToString
@Setter
public class WISHLIST {
	private int wl_seq;
	@NonNull
	private String user_email;
	@NonNull
	private int aw_seq;
	private String create_at;

}
