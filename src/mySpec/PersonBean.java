package mySpec;

public class PersonBean {
	private String id;		// 개인회원 id
	private String pwd;		// 개인회원 비밀번호
	private String nick;	// 개인회원 닉네임
	private String birth;	// 개인회원 생년월일
	private String email;	// 개인회원 이메일
	private String phone;	// 개인회원 연락처
	
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
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
