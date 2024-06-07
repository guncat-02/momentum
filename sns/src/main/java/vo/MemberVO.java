package vo;

import java.util.ArrayList;
import java.util.List;

public class MemberVO {
	private String id; //아이디
	private String pass; //비밀번호
	private String name; //이름
	private String b_date; //생년월일
	private List<ProfileVO> profileList; //프로필
	
	//getter
	public String getId() {
		return id;
	}
	public String getPass() {
		return pass;
	}
	public String getName() {
		return name;
	}
	public String getB_date() {
		b_date = b_date.replaceAll("/", ".");
		return b_date;
	}
	public List<ProfileVO> getProfileList() {
		return profileList;
	}
	
	//setter
	public void setProfileList(List<ProfileVO> profileList) {
		this.profileList = profileList;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
}
