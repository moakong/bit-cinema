package kr.co.bit_cinema.repository.vo;

public class MemberVO {
	private String memberId;
	private String pass;
	private String name;
	private String nickname;
	private String profile;
	private String phone;
	private String emailId;
	private int emailAddr;
	private int agreePhone;
	private int agreeEmail;
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public int getEmailAddr() {
		return emailAddr;
	}
	public void setEmailAddr(int emailAddr) {
		this.emailAddr = emailAddr;
	}
	public int getAgreePhone() {
		return agreePhone;
	}
	public void setAgreePhone(int agreePhone) {
		this.agreePhone = agreePhone;
	}
	public int getAgreeEmail() {
		return agreeEmail;
	}
	public void setAgreeEmail(int agreeEmail) {
		this.agreeEmail = agreeEmail;
	}
}
