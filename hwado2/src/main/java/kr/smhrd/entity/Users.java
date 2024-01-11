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
public class Users {
	@NonNull
	private String user_email;
	@NonNull
	private String user_pw;
	@NonNull
	private String user_name;
	@NonNull
	private String user_nick;
	@NonNull
	private String user_birthdate;
	private String user_role;
	private String joined_at;


}
