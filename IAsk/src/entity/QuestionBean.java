package entity;

public class QuestionBean {

	private int q_id = -1;
	private String u_id = "";
	private String q_text = "";
	private int follow = 0;    //回答数
	private int star_num = 0;    //点击量
	private int is_top = 0;
	private String sub_time="";
	private String category="";
	
	private String nickname = "";
	private int is_ok = 1;
	private int sex = -1;
	private int age = -1;
	private String school = "未知学校";
	private String text = "写下自己擅长的领域吧~";
	
	public void setQId(int qid){
		this.q_id = qid;
	}
	
	public void setUId(String uid){
		this.u_id = uid;
	}
	
	public void setQText(String q_text){
		this.q_text = q_text;
	}
	
	public void setFollow(int follow){
		this.follow = follow;
	}
	
	public void setStarNum(int starNum){
		this.star_num = starNum;
	}

	public void setIsTop(int isTop){
		this.is_top = isTop;
	}
	
	public void setSubTime(String subTime){
		this.sub_time = subTime;
	}
	
	public void setCategory(String category){
		this.category = category;
	}

	public int getQId(){
		return this.q_id;
	}
	
	public String getUId(){
		return this.u_id;
	}
	
	public String getQText(){
		return this.q_text;
	}
	
	public int getFollow(){
		return this.follow;
	}
	
	public int getStarNum(){
		return this.star_num;
	}
	
	public int getIsTop(){
		return this.is_top;
	}
	
	public String getSubTime(){
		return this.sub_time;
	}
	
	public String getCategory(){
		return this.category;
	}
	
	public void setNickname(String nickname){
		this.nickname = nickname;
	}
	
	public void setIsOk(int isOk){
		this.is_ok = isOk;
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
		return this.is_ok;
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