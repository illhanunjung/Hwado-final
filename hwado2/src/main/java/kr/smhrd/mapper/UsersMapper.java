package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Users;
import kr.smhrd.entity.WISHLIST;

@Mapper
public interface UsersMapper {
	public void usersInsert(Users users);

	public Users emailCheck(String inputE);

	public Users userSelect(Users users);

	public List<WISHLIST> getWish(Users userLogin);

	List<Users> user_management();

	void stopUser(String email);

	void unfreezeUser(String email);
	
}
