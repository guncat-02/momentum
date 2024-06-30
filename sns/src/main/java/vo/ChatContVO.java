package vo;

public class ChatContVO {
	private int no; //chat 번호
	private String chatNum; //채팅방 코드
	private String nickName; //닉네임
	private String cont; //채팅 내용
	private String chatTime; //채팅 시간
	private String[] attachList; //채팅 사진
	private String chatAttach; //채팅 사진
	
	//getter
	public int getNo() {
		return no;
	}
	public String getChatNum() {
		return chatNum;
	}
	public String getNickName() {
		return nickName;
	}
	public String getCont() {
		return cont;
	}
	public String getChatTime() {
		return chatTime;
	}
	public String[] getAttachList() {
		return attachList;
	}
	public String getChatAttach() {
		return chatAttach;
	}
	
	//setter
	public void setNo(int no) {
		this.no = no;
	}
	public void setChatNum(String chatNum) {
		this.chatNum = chatNum;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	public void setAttachList(String[] attachList) {
		this.attachList = attachList;
	}
	public void setChatAttach(String chatAttach) {
		this.chatAttach = chatAttach;
	}
}
