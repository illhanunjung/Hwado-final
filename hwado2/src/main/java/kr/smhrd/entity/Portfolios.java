package kr.smhrd.entity;

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
public class Portfolios {

	@NonNull
	private int pf_seq;
	@NonNull
	private String user_email;
	@NonNull
	private String pf_title;
	private String pf_file1;	
	private String pf_file2;
	private String pf_file3;
	@NonNull
	private String pf_desc;
	
	
	
	
	
	
}
