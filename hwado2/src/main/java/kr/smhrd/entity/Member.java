package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// @Data // 만능(getter, setter, 기본생성자, toString...)
// @Setter
@AllArgsConstructor // 모든 필드를 받는 생성자메소드
@NoArgsConstructor // 기본 생성자메소드
@RequiredArgsConstructor
@Getter
@Setter
@ToString
public class Member {

		@NonNull
		private String email;
		@NonNull
		private String pw;
		private String pwCheck;
		private String nick;
		
		
}
