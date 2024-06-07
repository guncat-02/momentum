package vo;

import java.util.List;

public class ProfileVO {
	private String nickName; //닉네임
	private String photo; //프로필 사진
	private String tel; //전화번호
	private String email; //이메일
	private String bio; //한 줄 소개
	private int privacy; //공개 여부
	
	//getter
	public String getNickName() {
		return nickName;
	}
	public String getPhoto() {
		return photo;
	}
	public String getTel() {
		return tel;
	}
	public String getEmail() {
		return email;
	}
	public String getBio() {
		return bio;
	}
	public int getPrivacy() {
		return privacy;
	}
	
	//setter
	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	
	//전화번호에 - 추가
	public void setTel(String tel) {
		tel = telChk(tel);
		String telNum = "";
		for(int i = 0; i < tel.length(); i++) {
			if(i == 3 || i == 7) {
				telNum += "-";
			}
			telNum += tel.charAt(i);
		}
		this.tel = tel;
	}
	
	//전화번호에 - 제거
	public String telChk(String tel) {
		String telNum = "";
		for(int i = 0; i < tel.length(); i++) {
			if(tel.charAt(i) != '-') {
				telNum += tel.charAt(i);
			}
		}
		return telNum;
	}
}
