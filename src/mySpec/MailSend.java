package mySpec;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

public class MailSend {
	private static class SMTPAuthenticator extends Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			// 지메일 아이디, 비밀번호
			return new PasswordAuthentication("shikimtq", "wh7014A!");
		}
	}
	
	// 메일 발송하는 메소드
	public static void send(String title, String content, String toEmail) {
		Properties p = new Properties();
		p.put("mail.smtp.user", "shikimtq@gmail.com");	// 본인 지메일
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			session.setDebug(true);
			MimeMessage msg = new MimeMessage(session);
			String message = content;
			msg.setSubject(title);
			//InternetAddress(메일주소, 보내는사람 이름, 문자셋)
			Address fromAddr = new InternetAddress("shikimtq@gmail.com");
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(toEmail);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(message, "text/html;charset=KSC5601");
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 개인회원 id찾기
	public boolean sendPersonId(String email, String birth, String phone) {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		String id = mgr.findPersonId(email, birth, phone);
		if(id != null && !id.equals("")) {
			String title = "MYSPEC의 당신의 아이디 입니다.";
			String content = "아이디 : " + id;
			send(title, content, email);
			flag = true;
		}
		return flag;
	}
	
	// 단체회원 id찾기
	public boolean sendOrgId(String email, String name, String manager, String phone) {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		String id = mgr.findOrgId(email, name, manager, phone);
		if(id != null && !id.equals("")) {
			String title = "MYSPEC의 "+ name + "의 아이디 입니다.";
			String content = "아이디 : " + id;
			send(title, content, email);
			flag = true;
		}
		return flag;
	}
	
	// pwd찾기
	public boolean sendPwd(int mem, String id, String email) {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		String pwd = mgr.findPwd(mem, id, email);
		if(pwd != null && !pwd.equals("")) {
			String title = "MYSPEC " + id +"님의 비밀번호 입니다.";
			String content = "비밀번호 : " + pwd;
			send(title, content, email);
			flag = true;
		}
		return flag;
	}
}
