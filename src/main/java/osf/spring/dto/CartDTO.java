package osf.spring.dto;

public class CartDTO {
	private int cseq;
	private String parent_id;
	private int pseq;
	private String option1;
	private String option2;
	private int count_item;
	
	public CartDTO() {}

	public CartDTO(int cseq,String parent_id, int pseq, String option1, String option2, int count_item) {
		super();
		this.cseq=cseq;
		this.parent_id = parent_id;
		this.pseq = pseq;
		this.option1 = option1;
		this.option2 = option2;
		this.count_item = count_item;
	}

	public String getParent_id() {
		return parent_id;
	}

	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public int getCount_item() {
		return count_item;
	}

	public void setCount_item(int count_item) {
		this.count_item = count_item;
	}

	public int getCseq() {
		return cseq;
	}

	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	
	
	
}
