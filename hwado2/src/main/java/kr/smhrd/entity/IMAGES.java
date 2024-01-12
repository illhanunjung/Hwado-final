package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class IMAGES {
	private int img_seq;
	private int aw_seq;
	
	@NonNull
	private String img_filename;
	
	@NonNull
	private String img_rgb;
	
	@NonNull
	private String img_type;
	
	@NonNull
	private String aw_desc;

	public IMAGES(int aw_seq, @NonNull String img_filename, @NonNull String img_rgb, @NonNull String img_type,
			@NonNull String aw_desc) {
		this.aw_seq = aw_seq;
		this.img_filename = img_filename;
		this.img_rgb = img_rgb;
		this.img_type = img_type;
		this.aw_desc = aw_desc;
	}

	public IMAGES(int aw_seq, @NonNull String img_filename, @NonNull String img_type, @NonNull String aw_desc) {
		this.aw_seq = aw_seq;
		this.img_filename = img_filename;
		this.img_type = img_type;
		this.aw_desc = aw_desc;
	}
	
	
	

}
