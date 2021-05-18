package email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class GoogleAuthentication extends Authenticator{
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("ID", "PW");
	
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}

}

