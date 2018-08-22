package com.kh.sp.member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.sp.member.model.service.MemberService;

@WebServlet("/pwdMail.me")
public class PasswordMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PasswordMailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String temporaryPwd = randomStr();
		String subject = "iCrowd 임시 비밀번호 발급";
		String text = "iCrowd 임시 비밀번호가 발급되었습니다."
				+ "\n아래의 임시 비밀번호로 iCrowd 홈페이지에 로그인 해주시길 바랍니다."
				+ "\n[임시 비밀번호 : " + temporaryPwd + "]"
				+ "\n회원님의 개인정보보호를 위해 로그인과 동시에 새 비밀번호 설정 창으로 이동합니다.";

		String username = "iCrowd11@gmail.com";
		String password = "xnwkgktlwh1!";

		String userPwd = getSha512(temporaryPwd);
		int sw = 0;
		int result = new MemberService().updatePassword(email, userPwd, sw);

		if(result > 0){
			//성공
			Properties props = new Properties(); 
			props.put("mail.smtp.user",username); 
			props.put("mail.smtp.password", password);
			props.put("mail.smtp.host", "smtp.gmail.com"); 
			props.put("mail.smtp.port", "25"); 
			props.put("mail.debug", "true"); 
			props.put("mail.smtp.auth", "true"); 
			props.put("mail.smtp.starttls.enable","true"); 
			props.put("mail.smtp.EnableSSL.enable","true");
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
			props.setProperty("mail.smtp.socketFactory.fallback", "false");   
			props.setProperty("mail.smtp.port", "465");   
			props.setProperty("mail.smtp.socketFactory.port", "465"); 

			Session session = Session.getInstance(props, new javax.mail.Authenticator() { 
				protected PasswordAuthentication getPasswordAuthentication() { 
					return new PasswordAuthentication(username, password); 
				}});
			System.out.println("??");
			try{
				Message message = new MimeMessage(session); 
				message.setFrom(new InternetAddress(username)); 
				message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email)); 
				message.setSubject(subject);
				message.setText(text);
				Transport.send(message); 
				System.out.println("SEND");
			} catch(Exception e){
				e.printStackTrace();
			}

			response.getWriter().println(1);

		}else{
			//일치하는 정보 없음
			response.getWriter().println(2);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

	private static String getSha512(String pwd){
		String encPwd = null;

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);

			encPwd = Base64.getEncoder().encodeToString(md.digest());

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return encPwd;

	}

	public static String randomStr(){ 
		char strCollection[] = new char[] { 
				'1','2','3','4','5','6','7','8','9','0', 
				'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', 
				'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
				'!','@','#','$','%','^','&','*','(',')'};

		String ranStr = ""; 

		for (int i = 0; i < 10; i++) { 
			int selectRandomStr = (int)(Math.random()*(strCollection.length));
			ranStr += strCollection[selectRandomStr]; 
		} 

		return ranStr; 
	} 

}
