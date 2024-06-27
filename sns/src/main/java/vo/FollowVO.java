package vo;

public class FollowVO {
	private String followId; //팔로우 한 id
	private String id; //사용자를 팔로우한 id
	
	//getter
	public String getFollowId() {
		return followId;
	}
	public String getId() {
		return id;
	}
	
	//setter
	public void setId(String id) {
		this.id = id;
	}
	public void setFollowId(String followId) {
		this.followId = followId;
	}
	
}
