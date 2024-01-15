package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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
	
}
