package model;

public class user {
	
	private String name;
	private String password;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean verifier() {
		
		
		return (this.name.equals("admin")&& this.password.equals("admin"));
			
		
		
		
		
	}

}
