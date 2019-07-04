package entity;

public class UserBean {
	private int id = -1;
	//private String account="";
	private String pwd = "";
	private int isOk = 1;
	private int sex = -1;
	private int age = -1;
	private String school = "西工大";
	private String nickname = "404";
	private String text = "这个人很懒，什么都没留下";
	public void setId(int id){
		this.id = id;
	}
	
//	public void setAccount(String account){
//		this.account = account;
//	}
	
	public void setPwd(String pwd){
		this.pwd = pwd;
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
	
	public void setNick(String nick) {
		// TODO Auto-generated method stub
		this.nickname=nick;
	}
	public void setText(String text) {
		// TODO Auto-generated method stub
		this.text  = text;
	}
	
	
	public String getText() {
		// TODO Auto-generated method stub
		return this.text;
	}
	
	public String getNick() {
		// TODO Auto-generated method stub
		return this.nickname;
	}
	
	public int getId(){
		return this.id;
	}
	
//	public String getAccount(){
//		return this.account;
//	}
//	
	public String getPwd(){
		return this.pwd;
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



	
}
