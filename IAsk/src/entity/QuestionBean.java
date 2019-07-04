package entity;
//questionbean
public class QuestionBean {

	private int quesId = -1;
	private String usrId = "";
	private String quesText = "";
	private int follow = 0;    //回答数
	private int starNum = 0;    //点击量
	private int isTop = 0;
	private String subTime="";
	private String category="";
	
	private String nickname = "";
	private int isOk = 1;
	private int sex = -1;
	private int age = -1;
	private String school = "未知学校";
	private String text = "写下自己擅长的领域吧~";
	
	public void setQuesId(int qid){
		this.quesId = qid;
	}
	
	public void setUsrId(String uid){
		this.usrId = uid;
	}
	
	public void setQuesText(String q_text){
		this.quesText = q_text;
	}
	
	public void setFollow(int follow){
		this.follow = follow;
	}
	
	public void setStarNum(int starNum){
		this.starNum = starNum;
	}

	public void setIsTop(int isTop){
		this.isTop = isTop;
	}
	
	public void setSubTime(String subTime){
		this.subTime = subTime;
	}
	
	public void setCategory(String category){
		this.category = category;
	}

	public int getQuesId(){
		return this.quesId;
	}
	
	public String getUsrId(){
		return this.usrId;
	}
	
	public String getQuesText(){
		return this.quesText;
	}
	
	public int getFollow(){
		return this.follow;
	}
	
	public int getStarNum(){
		return this.starNum;
	}
	
	public int getIsTop(){
		return this.isTop;
	}
	
	public String getSubTime(){
		return this.subTime;
	}
	
	public String getCategory(){
		return this.category;
	}
	
	public void setNickname(String nickname){
		this.nickname = nickname;
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
	
	public String getNickname(){
		return this.nickname;
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