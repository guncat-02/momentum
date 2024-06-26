package vo;

public class ProfileVO {
	private String id; //아이디
	private String nickName; //닉네임
	private String photo; //프로필 사진
	private String tel; //전화번호
	private String bio; //한 줄 소개
	private int privacy; //공개 여부
	private int p_main; //메인 프로필 여부
	private String email; //이메일

	//getter
	public String getId() {
		return id;
	}
	public String getNickName() {
		return nickName;
	}
	public String getPhoto() {
		return photo;
	}
	public String getTel() {
		return tel;
	}
	public String getBio() {
		return bio;
	}
	public int getPrivacy() {
		return privacy;
	}
	public int getP_main() {
		return p_main;
	}
	public String getEmail() {
		return email;
	}
	
	//setter
	public void setId(String id) {
		this.id = id;
	}
	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public void setP_main(int p_main) {
		this.p_main = p_main;
	}
	public void setEmail(String email) {
		this.email = email;
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
		this.tel = telNum;
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
