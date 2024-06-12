package vo;

public class BlockVO {
	private String blockId; //차단 아이디
	private String reason; //차단 사유
	
	//getter
	public String getBlockId() {
		return blockId;
	}
	public String getReason() {
		return reason;
	}
	
	//setter
	public void setReason(String reason) {
		this.reason = reason;
	}
	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}
}
