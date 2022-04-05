package main;

public class ActionForward {
	private boolean isRedirect=false;
	private String path=null;
	
	public boolean isRedirect(){
		return isRedirect;
	}
	
	public String getPath(){
		return path;
	}
	
	public void setRedirect(boolean redirect){
		isRedirect=redirect;
	}
	
	public void setPath(String string){
		path=string;
	}
}