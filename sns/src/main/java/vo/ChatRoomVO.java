package vo;

public class ChatRoomVO {
	private String chatNum; //채팅방 코드
	private String chatName; //채팅방 이름
	private String chatImg; //채팅방 사진
	private String id; //아이디
	private String nickName; //닉네임
	private String owner; //방장 여부
	
	//getter
	public String getChatNum() {
		return chatNum;
	}
	public String getChatName() {
		return chatName;
	}
	public String getChatImg() {
		return chatImg;
	}
	public String getId() {
		return id;
	}
	public String getNickName() {
		return nickName;
	}
	public String getOwner() {
		return owner;
	}
	
	//setter
	public void setChatNum(String chatNum) {
		this.chatNum = chatNum;
	}
	public void setChatName(String chatName) {
		this.chatName = chatName;
	}
	public void setChatImg(String chatImg) {
		this.chatImg = chatImg;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
}
