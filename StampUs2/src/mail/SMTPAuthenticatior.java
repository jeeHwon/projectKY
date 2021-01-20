package mail;
 
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class SMTPAuthenticatior extends Authenticator{
 
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("jsyoo010@naver.com","1q2w3e4r!");
    }														//도용하면 고소합니다!! 시연뒤에 비번 바꿀예정
}


