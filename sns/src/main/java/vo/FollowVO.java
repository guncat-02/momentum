package vo;

import java.util.List;

public class FollowVO {
	private List<String> followId; //팔로우 한 id
	private List<String> id; //사용자를 팔로우한 id
	
	//getter
	public List<String> getFollowId() {
		return followId;
	}
	public List<String> getId() {
		return id;
	}
	
	//setter
	public void setId(List<String> id) {
		this.id = id;
	}
	public void setFollowId(List<String> followId) {
		this.followId = followId;
	}
}
