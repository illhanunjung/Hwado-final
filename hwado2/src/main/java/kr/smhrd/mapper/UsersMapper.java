package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Users;

@Mapper
public interface UsersMapper {
	void usersInsert(Users users);

	Users emailCheck(String inputE);

}
