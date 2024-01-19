package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.ArtworkImage;
import kr.smhrd.entity.Interests;
import kr.smhrd.entity.Portfolios;
import kr.smhrd.entity.Users;
import kr.smhrd.entity.WISHLIST;
import lombok.NonNull;

@Mapper
public interface UsersMapper {
	public void usersInsert(Users users);

	public Users emailCheck(String inputE);

	public Users userSelect(Users users);

	public List<WISHLIST> getWish(String user_email);

	List<Users> user_management();

	void stopUser(String email);

	void unfreezeUser(String email);
	
	// 예술가 승인
		public void approvalPf(String email);
		// 예술가 거절
		public void refusePf(String email);
	// 예술가 등급으로 업데이트
		public void updateArtist(String email);
	// 회원관리 검색
		public List<Users> searchByQuery(String query);

		// 작가검색
		public List<Users> searchArtist(String searchAw);

		public int regiPortfolio(Portfolios portfolio);
		
		// 구매내역 페이지
		public List<ArtworkImage> purchase_history(@NonNull String user_email);
		
		// 작가페이지 이동
		public List<ArtworkImage> Author_page();

		// 관심작가
		public List<Interests> getWishArtist(String userEmail);

		//비번 수정
		public void updateUser(Users users);
		
		//전시페이지 수정
		public List<ArtworkImage> exhibition(String artist_email);
	
}
