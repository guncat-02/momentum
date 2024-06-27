package vo;

public class BlockVO {
	private String id;
	private String blockId; //차단 아이디
	private String reason; //차단 사유
	
	//getter
	public String getBlockId() {
		return blockId;
	}
	public String getReason() {
		return reason;
	}
	public String getId() {
		return id;
	}
	
	//setter
	public void setReason(String reason) {
		this.reason = reason;
	}
	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}
	public void setId(String id) {
		this.id = id;
	}
}
