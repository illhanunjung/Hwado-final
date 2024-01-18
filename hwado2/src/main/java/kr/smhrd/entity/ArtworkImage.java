package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ArtworkImage {
	
	// ARTWORKS 테이블의 필드
	private String aw_seq;
	private String ap_desc;
    private String aw_name;
    private String user_email;
    private String user_nick;
    private int pay_amount;
    private String delivery_status;
    private String delivery_at;
    private String aw_desc;
    private String ap_title;
    
    // IMAGES 테이블의 필드
    private String img_filename;

	public String getAw_name() {
		return aw_name;
	}

	public void setAw_name(String aw_name) {
		this.aw_name = aw_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getImg_filename() {
		return img_filename;
	}

	public void setImg_filename(String img_filename) {
		this.img_filename = img_filename;
	}


}
