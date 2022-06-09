package kr.ac.kopo.member.vo;

public class MemberVO {
	private String id;
	private String name;
	private String password;
	private String email;
	private String tel;
	private String post;
	private String addr;
	private String type;
	private String regDate;
	
	public MemberVO() {
	}

	public MemberVO(String id, String name, String type, String regDate) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.regDate = regDate;
	}

	public MemberVO(String id, String name, String password, String email, String tel, String post, String addr,
			String type, String regDate) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.tel = tel;
		this.post = post;
		this.addr = addr;
		this.type = type;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getType() {
		String typeData = null;
		if(type.equals("U")) {
			typeData = "일반계정";
		} else {
			typeData = "슈퍼계정";
		}
		return typeData;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
}
