package vo;

public class ChatRoomVO {
	private String chatNum;
	private String chatName;
	private String chatImg;
	private String id;
	private String nickName;
	private String owner;
	
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
