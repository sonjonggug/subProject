package notice.bean;

import java.sql.Date;

public class NoticeBean {
	
	private int NNUM;
	private int NREAD;
	private String NTITLE;
	private String NCON;
	private String NFILE;
	private Date NDATE;
	
	public int getNNUM() {
		return NNUM;
	}
	public void setNNUM(int nNUM) {
		NNUM = nNUM;
	}
	public int getNREAD() {
		return NREAD;
	}
	public void setNREAD(int nREAD) {
		NREAD = nREAD;
	}
	public String getNTITLE() {
		return NTITLE;
	}
	public void setNTITLE(String nTITLE) {
		NTITLE = nTITLE;
	}
	public String getNCON() {
		return NCON;
	}
	public void setNCON(String nCON) {
		NCON = nCON;
	}
	public String getNFILE() {
		return NFILE;
	}
	public void setNFILE(String nFILE) {
		NFILE = nFILE;
	}
	public Date getNDATE() {
		return NDATE;
	}
	public void setNDATE(Date nDATE) {
		NDATE = nDATE;
	}
	
	

}