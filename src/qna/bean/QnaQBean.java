package qna.bean;

import java.sql.Date;

public class QnaQBean {
	private int QNUM;
	private String QID;
	private String QTITLE;
	private String QCON;
	private int QREAD;
	private Date QDATE;
	
	public int getQNUM() {
		return QNUM;
	}
	public void setQNUM(int qNUM) {
		QNUM = qNUM;
	}
	public String getQID() {
		return QID;
	}
	public void setQID(String qID) {
		QID = qID;
	}
	public String getQTITLE() {
		return QTITLE;
	}
	public void setQTITLE(String qTITLE) {
		QTITLE = qTITLE;
	}
	public String getQCON() {
		return QCON;
	}
	public void setQCON(String qCON) {
		QCON = qCON;
	}
	public int getQREAD() {
		return QREAD;
	}
	public void setQREAD(int qREAD) {
		QREAD = qREAD;
	}
	public Date getQDATE() {
		return QDATE;
	}
	public void setQDATE(Date qDATE) {
		QDATE = qDATE;
	}
	
}
