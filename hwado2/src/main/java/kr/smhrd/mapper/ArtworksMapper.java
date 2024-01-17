package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.AUCTIONS;
import kr.smhrd.entity.ArtworkImage;
import kr.smhrd.entity.Artworks;
import kr.smhrd.entity.Bidding;
import kr.smhrd.entity.Cart;
import kr.smhrd.entity.IMAGES;
import kr.smhrd.entity.ORDERS;
import kr.smhrd.entity.Portfolios;
import kr.smhrd.entity.Profile;
import kr.smhrd.entity.Users;
import kr.smhrd.entity.WISHLIST;
import lombok.NonNull;

@Mapper
public interface ArtworksMapper {

	// 일반 상품 등록
	public int artRegi(Artworks art);
	
	// 상품 seq 추출
	public int getAwSeq(Artworks art);

	// 상품 이미지 등록
	public int imgRegi(IMAGES img1);

	// 경매 등록
	public int auctionRegi(AUCTIONS auction);

	// 경매 상태 업데이트
	public void auctionUpdate(int seq);

	// 작품 상세보기 이미지 불러오기
	public List<IMAGES> getimges(Artworks art);

	// 일반 작품 불러오기
	public List<Artworks> artList();

	// 일반 작품 이미지 불러오기
	public List<IMAGES> imgList();
	
	// 전체 작품 불러오기
	public List<Artworks> artAllList();
	
	// 전체 작품 이미지 불러오기
	public List<IMAGES> imgAllList();

	// 상세 작품 불러오기
	public Artworks getArt(int aw_seq);

	public List<String> showImg(int aw_seq);

	// 경매 상품 불러오기
	public List<Artworks> auctionList();

	// 경매 상품 이미지 불러오기
	public List<IMAGES> auctionImgList();

	// 경매 리스트
	public List<AUCTIONS> auctioninfo();

	// 경매 정보 가져오기
	public AUCTIONS getAuction(int aw_seq);

	// 관심 상품 추가
	public int wishList(WISHLIST wish);

	// 관심 등록 체크
	public int wishCheck(WISHLIST wish);

	// 관심 작품 제거
	public int deleteWish(WISHLIST wish);

	// 예술가 정보 가져오기
	public Users getArtist(String user_email);

	public IMAGES getWishImg(@NonNull int aw_seq);

	
	// 심사대기 작품 불러오기
	public List<Artworks> artworkList();

	// 심사대기 작품 이미지 불러오기
	public List<IMAGES> imgsList();

	// 작품 승인 
		public void approvalAw(String aw_seq);

		// 작품 거절
		public void refuseAw(String aw_seq);

		

		//카테고리 상품
		public List<Artworks> artCategory(int category_seq);

		// 카테고리 이미지
		public List<IMAGES> imgCategory(int category_seq);

		// 예술가 승인을 위한 유저정보
		public List<Users> artistApproval();
		// 예술가 승인 포트폴리오
		public List<Portfolios> artistPf();
		
	// 메인 페이지 슬라이더
	public List<IMAGES> getRecentArtworkImages();

	// 메인 페이지 이달의 작가
	public List<ArtworkImage> getArtworks_Month();
	

			// 작품 검색
			public List<Artworks> searchArtw(String searchAw);
			// 이미지 검색
			public List<IMAGES> searchImage(String searchAw);
			
			// 장바구니 상품 확인
			public int cartCheck(Artworks art);

			// 장바구니 추가
			public int insertCart(Artworks art);
			
			// 장바구니 리스트 출력
			public List<Cart> getCart(@NonNull String user_email);

			// 장바구니 작품 리스트
			public Artworks cartArt(@NonNull int aw_seq);

			//장바구니 작품 이미지 리스트
			public IMAGES cartImg(@NonNull int aw_seq);

			// 장바구니 작품 아티스트 정보
			public Users catArtist(int aw_seq);

			// 장바구니 제거
			public void deleteCart(Cart cart);

			// basket_seq 가져오기
			public int getBasket_seq(Cart cart);

			// 주문하기
			public int Orders(ORDERS order);

			// 장바구니 업데이트
			public void updateCart(int aw_seq);
			
			// 작품 업데이트
			public void updateArt(int aw_seq);
			
			
			// 경매관리페이지
			public List<Bidding> bidList(@NonNull String user_email);

			public Bidding bidDetail(String user_email);

			
			public int aucStatus(int auc_seq);

			

			public void bidder(AUCTIONS auction);

			// 프로필 등록
			public void insertProfile_0(Profile profile);

			// 작가 개인페이지 작품 등록
			public void insertProfile_1(Profile profile);

			// 작가 개인페이지 작품 확인
			public int getProfile(@NonNull String user_email);

			// 프로필 업데이트
			public void updateProfile_0(Profile profile);

			// 작가 개인페이지 작품 업데이트
			public void updateProfile_1(Profile profile);
			
			// 작가 개인페이지 작품 가져오기
			public List<Profile> getProfileList(String user_email);
			
}
