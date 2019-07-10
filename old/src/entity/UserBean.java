package entity;

public class UserBean {
	private String usrId = "";
	private String nickname = "";
	private String usr_pwd = "";
	private int isOk = 1;
	private int sex = -1;
	private int age = -1;
	private String school = "未知学校";
	private String text = "写下自己擅长的领域吧~";

	public void setUsrId(String usr_id){
		this.usrId = usr_id;
	}
	
	public void setNickname(String nickname){
		this.nickname = nickname;
	}
	
	public void setUsrPwd(String pwd){
		this.usr_pwd = pwd;
	}
	
	public void setIsOk(int isOk){
		this.isOk = isOk;
	}
	
	public void setSex(int sex){
		this.sex = sex;
	}
	
	public void setAge(int age){
		this.age=age;
	}
	
	public void setSchool(String school){
		this.school = school;
	}
	
	public void setText(String text){
		this.text = text;
	}
	
	public String getUsrId(){
		return this.usrId;
	}
	
	public String getNickname(){
		return this.nickname;
	}
	
	public String getUsrPwd(){
		return this.usr_pwd;
	}
	
	public int getIsOk(){
		return this.isOk;
	}
	
	public int getSex(){
		return this.sex;
	}
	
	public int getAge(){
		return this.age;
	}
	
	public String getSchool(){
		return this.school;
	}
	
	public String getText(){
		return this.text;
	}
}
