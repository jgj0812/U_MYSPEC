package mySpec;

public class OrgBean {
	private String id;		// 단체회원 id
	private String pwd;		// 단체회원 비밀번호
	private String name;	// 단체회원 기관명
	private int type;		// 단체회원 기관형태
	private String manager;	// 단체회원 담당자이름
	private String email;	// 단체회원 담당자 이메일
	private String phone;	// 단체회원 담당자 연락처
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
