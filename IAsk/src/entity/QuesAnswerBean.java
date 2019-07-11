package entity;

public class QuesAnswerBean {
	
	
	private int q_id = -1;
	private String u_id = "";
	private String a_text = "";
	private String ans_time = "";
	
    public void setQId(int q_id){
    	this.q_id = q_id;
    }
    
    public void setAText(String text){
    	this.a_text = text;
    }
    
    public void setUId(String uid){
    	this.u_id = uid;
    }
    
    public void setAnsTime(String ans_time){
    	this.ans_time = ans_time;
    }

	public int getQId(){
		return this.q_id;
	}
	
	public String getUId(){
		return this.u_id;
	}
	
	public String getAText(){
		return this.a_text;
	}
	
	public String getAnsTime(){
		return this.ans_time;
	}
}