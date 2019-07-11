package entity;

public class AnswerquesBean {

	private int q_id;
	private String u_id;
	private String ans_Time="";
	private String ans_text="";
	
	public void setQid(int qid){
		this.q_id = qid;
	}
	
	public void setUid(String uid){
		this.u_id = uid;
	}
	
	public void setAnsTime(String ans_time ){
		this.ans_Time=ans_time;
	}
	
	public void setAnsText(String ans_text){
		this.ans_text = ans_text;
	}
	
	public int getQ_id(){
		return this.q_id;
	}
	
	public String getU_id(){
		return this.u_id;
	}
	
	public String getAns_Time(){
		return this.ans_Time;
	}

	public String getAns_text() {
		return this.ans_text;
	}
	
}
