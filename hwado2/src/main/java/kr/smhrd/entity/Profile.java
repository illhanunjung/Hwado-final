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
public class Profile {
	@NonNull
	private int ap_seq;
	@NonNull
	private String user_email;
	@NonNull
	private String ap_title;
	@NonNull
	private String ap_desc;
	@NonNull
	private String ap_type;
	
	@NonNull
	private String aw_title;
	
	private String name1;
	private String file1;
	private String desc1;
	
	private String name2;
	private String file2;
	private String desc2;
	
	private String name3;
	private String file3;
	private String desc3;
	
	private String name4;
	private String file4;
	private String desc4;
	
	private String name5;
	private String file5;
	private String desc5;
	
	private String name6;
	private String file6;
	private String desc6;
	
	private String name7;
	private String file7;
	private String desc7;
	
	private String name8;
	private String file8;
	private String desc8;
	
	
	
	public Profile(@NonNull String ap_title, @NonNull String ap_desc,
			String name1, String file1, String desc1) {
		super();
		this.ap_title = ap_title;
		this.ap_desc = ap_desc;
		this.name1 = name1;
		this.file1 = file1;
		this.desc1 = desc1;
	}



	public Profile(@NonNull String ap_title, @NonNull String ap_desc) {
		super();
		this.ap_title = ap_title;
		this.ap_desc = ap_desc;
	}



	public Profile( @NonNull String ap_title,@NonNull String ap_desc,
			String name1, String file1, String desc1, String name2, String file2,
			String desc2) {
		super();
		this.ap_title = ap_title;
		this.ap_desc = ap_desc;
		this.name1 = name1;
		this.file1 = file1;
		this.desc1 = desc1;
		this.name2 = name2;
		this.file2 = file2;
		this.desc2 = desc2;
	}



	public Profile(@NonNull String ap_title,  @NonNull String ap_desc,
			String name1, String file1, String desc1, String name2, String file2,
			String desc2, String name3, String file3, String desc3) {
		super();
		this.ap_title = ap_title;
		this.ap_desc = ap_desc;
		this.name1 = name1;
		this.file1 = file1;
		this.desc1 = desc1;
		this.name2 = name2;
		this.file2 = file2;
		this.desc2 = desc2;
		this.name3 = name3;
		this.file3 = file3;
		this.desc3 = desc3;
	}



	public Profile(@NonNull String ap_title, @NonNull String ap_desc,
			String name1, String file1, String desc1, String name2, String file2,
			String desc2, String name3, String file3, String desc3, String name4, String file4, String desc4) {
		super();
		this.ap_title = ap_title;
		this.ap_desc = ap_desc;
		this.name1 = name1;
		this.file1 = file1;
		this.desc1 = desc1;
		this.name2 = name2;
		this.file2 = file2;
		this.desc2 = desc2;
		this.name3 = name3;
		this.file3 = file3;
		this.desc3 = desc3;
		this.name4 = name4;
		this.file4 = file4;
		this.desc4 = desc4;
	}



	public Profile(@NonNull String ap_title,  @NonNull String ap_desc,
			String name1, String file1, String desc1, String name2, String file2,
			String desc2, String name3, String file3, String desc3, String name4, String file4, String desc4,
			String name5, String file5, String desc5) {
		super();
		this.ap_title = ap_title;
		this.ap_desc = ap_desc;
		this.name1 = name1;
		this.file1 = file1;
		this.desc1 = desc1;
		this.name2 = name2;
		this.file2 = file2;
		this.desc2 = desc2;
		this.name3 = name3;
		this.file3 = file3;
		this.desc3 = desc3;
		this.name4 = name4;
		this.file4 = file4;
		this.desc4 = desc4;
		this.name5 = name5;
		this.file5 = file5;
		this.desc5 = desc5;
	}



	public Profile(@NonNull String ap_title, @NonNull String ap_desc,
			String name1, String file1, String desc1, String name2, String file2,
			String desc2, String name3, String file3, String desc3, String name4, String file4, String desc4,
			String name5, String file5, String desc5, String name6, String file6, String desc6) {
		super();
		this.ap_title = ap_title;
		this.ap_desc = ap_desc;
		this.name1 = name1;
		this.file1 = file1;
		this.desc1 = desc1;
		this.name2 = name2;
		this.file2 = file2;
		this.desc2 = desc2;
		this.name3 = name3;
		this.file3 = file3;
		this.desc3 = desc3;
		this.name4 = name4;
		this.file4 = file4;
		this.desc4 = desc4;
		this.name5 = name5;
		this.file5 = file5;
		this.desc5 = desc5;
		this.name6 = name6;
		this.file6 = file6;
		this.desc6 = desc6;
	}



	public Profile( @NonNull String ap_title, @NonNull String ap_desc,
			String name1, String file1, String desc1, String name2, String file2,
			String desc2, String name3, String file3, String desc3, String name4, String file4, String desc4,
			String name5, String file5, String desc5, String name6, String file6, String desc6, String name7,
			String file7, String desc7) {
		super();
		this.ap_title = ap_title;
		this.ap_desc = ap_desc;
		this.name1 = name1;
		this.file1 = file1;
		this.desc1 = desc1;
		this.name2 = name2;
		this.file2 = file2;
		this.desc2 = desc2;
		this.name3 = name3;
		this.file3 = file3;
		this.desc3 = desc3;
		this.name4 = name4;
		this.file4 = file4;
		this.desc4 = desc4;
		this.name5 = name5;
		this.file5 = file5;
		this.desc5 = desc5;
		this.name6 = name6;
		this.file6 = file6;
		this.desc6 = desc6;
		this.name7 = name7;
		this.file7 = file7;
		this.desc7 = desc7;
	}



	public Profile(@NonNull String ap_title, @NonNull String ap_desc,
			String name1, String file1, String desc1, String name2, String file2,
			String desc2, String name3, String file3, String desc3, String name4, String file4, String desc4,
			String name5, String file5, String desc5, String name6, String file6, String desc6, String name7,
			String file7, String desc7, String name8, String file8, String desc8) {
		super();
		this.ap_title = ap_title;
		this.ap_desc = ap_desc;
		this.name1 = name1;
		this.file1 = file1;
		this.desc1 = desc1;
		this.name2 = name2;
		this.file2 = file2;
		this.desc2 = desc2;
		this.name3 = name3;
		this.file3 = file3;
		this.desc3 = desc3;
		this.name4 = name4;
		this.file4 = file4;
		this.desc4 = desc4;
		this.name5 = name5;
		this.file5 = file5;
		this.desc5 = desc5;
		this.name6 = name6;
		this.file6 = file6;
		this.desc6 = desc6;
		this.name7 = name7;
		this.file7 = file7;
		this.desc7 = desc7;
		this.name8 = name8;
		this.file8 = file8;
		this.desc8 = desc8;
	}



	public Profile(@NonNull String user_email, @NonNull String ap_title, @NonNull String ap_desc,
			@NonNull String ap_type) {
		super();
		this.user_email = user_email;
		this.ap_title = ap_title;
		this.ap_desc = ap_desc;
		this.ap_type = ap_type;
	}




	
	
	
	
	
	


}
