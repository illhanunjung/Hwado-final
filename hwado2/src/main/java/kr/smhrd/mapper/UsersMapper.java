package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Users;

@Mapper
public interface UsersMapper {
	public void usersInsert(Users users);

	public Users emailCheck(String inputE);

	public Users userSelect(Users users);

}
