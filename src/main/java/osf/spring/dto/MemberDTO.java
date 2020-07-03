package osf.spring.dto;

public class MemberDTO {
	private int mseq;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private String email;
	private int point;
	private String blacklist_yn;
	
	public MemberDTO() {};
	
	public MemberDTO(int mseq, String id, String pw, String name, String phone, String zipcode, String address1,
			String address2, String email, int point, String blacklist_yn) {
		super();
		this.mseq = mseq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.email = email;
		this.point = point;
		this.blacklist_yn = blacklist_yn;
	}

	public int getMseq() {
		return mseq;
	}

	public void setMseq(int mseq) {
		this.mseq = mseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getBlacklist_yn() {
		return blacklist_yn;
	}

	public void setBlacklist_yn(String blacklist_yn) {
		this.blacklist_yn = blacklist_yn;
	}
	
	
	
	
}
