package osf.spring.dto;

public class ImageDTO {
	private int img_seq;
	private String oriname;
	private String sysname;
	
	public ImageDTO() {}
	
	public ImageDTO(int img_seq, String oriname, String sysname) {
		super();
		this.img_seq = img_seq;
		this.oriname = oriname;
		this.sysname = sysname;
	}

	public int getImg_seq() {
		return img_seq;
	}

	public void setImg_seq(int img_seq) {
		this.img_seq = img_seq;
	}

	public String getOriname() {
		return oriname;
	}

	public void setOriname(String oriname) {
		this.oriname = oriname;
	}

	public String getSysname() {
		return sysname;
	}

	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	
	
}
