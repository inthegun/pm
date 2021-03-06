package com.pickmepetme.mapper;

import java.util.ArrayList;

import com.pickmepetme.domain.ComunityVO;
import com.pickmepetme.domain.Criteria;
import com.pickmepetme.domain.UserVO;

/*UserMapper interface로 아래의 메서드를 UserMapper.xml로 이동하여 처리합니다*/
/*UserMapper.xml의 위치는 src/main/resource/com/pickmepetme/mapper/UserMapper.xml 입니다*/
public interface UserMapper {
	 
	public void register_user(UserVO uservo);

	public UserVO login(UserVO uservo);
 
	// 회원 정보 조회
	public UserVO readMember(String id);
	
	// 내가 쓴글 보기
		public ArrayList<ComunityVO> mywrite(Criteria cri);
		
		//회원정보 수정
		public void memberUpdate(UserVO vo);
		
		//내가 쓴글 전체 갯수
		public int mywriteCount(Criteria cri);
}
