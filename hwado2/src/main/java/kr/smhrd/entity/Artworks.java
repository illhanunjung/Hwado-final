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
	private int aw_seq;
	
	@NonNull
	private String user_email;
	
	@NonNull
	private String file1;
	
	@NonNull
	private String desc1;
	
	@NonNull
	private String aw_name;
	
	@NonNull
	private int aw_price;
	
	private String auc_ended_at;
	
	@NonNull
	private int category_seq;
	
	@NonNull
	private String file2;
	
	@NonNull
	private String desc2;
	
	@NonNull
	private String file3;
	
	@NonNull
	private String desc3;
	
	@NonNull
	private String file4;
	
	@NonNull
	private String desc4;
	
	private String aw_status;
	private String created_at;
	
	private String aw_type;

	public Artworks(@NonNull String user_email, @NonNull String aw_name, @NonNull int aw_price,
			@NonNull int category_seq, String aw_type) {
		this.user_email = user_email;
		this.aw_name = aw_name;
		this.aw_price = aw_price;
		this.category_seq = category_seq;
		this.aw_type = aw_type;
	}

	public Artworks(int aw_seq, @NonNull String user_email,
			@NonNull int category_seq, @NonNull String aw_name, @NonNull int aw_price, String aw_status, String created_at, String aw_type) {
		this.aw_seq = aw_seq;
		this.user_email = user_email;
		this.aw_name = aw_name;
		this.aw_price = aw_price;
		this.category_seq = category_seq;
		this.aw_status = aw_status;
		this.created_at = created_at;
		this.aw_type = aw_type;
	}

	
	public Artworks(@NonNull String user_email, @NonNull String file1, @NonNull String desc1, @NonNull String aw_name,
			@NonNull int aw_price, String auc_ended_at, @NonNull String file2, @NonNull String desc2,
			@NonNull String file3, @NonNull String desc3, @NonNull String file4, @NonNull String desc4) {
		super();
		this.user_email = user_email;
		this.file1 = file1;
		this.desc1 = desc1;
		this.aw_name = aw_name;
		this.aw_price = aw_price;
		this.auc_ended_at = auc_ended_at;
		this.file2 = file2;
		this.desc2 = desc2;
		this.file3 = file3;
		this.desc3 = desc3;
		this.file4 = file4;
		this.desc4 = desc4;
	}
	
	
	public Artworks(int aw_seq, @NonNull String user_email) {
		this.aw_seq = aw_seq;
		this.user_email = user_email;
	}
	
	
	

}
