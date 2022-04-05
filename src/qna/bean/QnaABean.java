package qna.bean;

import java.sql.Date;

public class QnaABean {
	private int AREP;
	private String AID;
	private String ACON;
	private Date ADATE;
	
	public int getAREP() {
		return AREP;
	}
	public void setAREP(int aREP) {
		AREP = aREP;
	}
	public String getAID() {
		return AID;
	}
	public void setAID(String aID) {
		AID = aID;
	}
	public String getACON() {
		return ACON;
	}
	public void setACON(String aCON) {
		ACON = aCON;
	}
	public Date getADATE() {
		return ADATE;
	}
	public void setADATE(Date aDATE) {
		ADATE = aDATE;
	}

}
