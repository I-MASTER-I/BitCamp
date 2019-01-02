package com.sb.mall.member.service;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MemberMailService {

   @Autowired
   private JavaMailSender mailSender;


   // 파일 첨부 보내기, 이미지 본문 첨부
   public void sendMail(String userId, String userName, String filePath, HttpSession session) throws IOException {

	  MimeMessage message = mailSender.createMimeMessage();

      String file = session.getServletContext().getRealPath("WEB-INF/views") + filePath;
      InputStream is = new FileInputStream(file);
      String htmlContent = "";
      
      //스트링 버퍼를 이용하여 inputStream을 스트링으로 변환하고 utf-8로 변환하는 방법
      String UTF8 = "utf8";
      StringBuffer buffer = new StringBuffer();
      int BUFFER_SIZE = 8192;
      BufferedReader br = new BufferedReader(new InputStreamReader(is, UTF8), BUFFER_SIZE);
      String str;
      
      while ((str = br.readLine()) != null) {
         htmlContent += str;
      }

      try {

         MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

         messageHelper.setSubject("[공지] 회원 가입 안내");
         messageHelper.setText(htmlContent, true);
         messageHelper.setFrom("bitcamp1114@gmail.com", "SB_Company");
         messageHelper.setTo(new InternetAddress(userId, userName, "utf-8"));       
         
/*         // 파일 첨부
         messageHelper.addAttachment(MimeUtility.encodeText("사용자관리.xlsx", "UTF-8", "B"), new FileDataSource("C:/OpenProject/사용자관리.xlsx"));
         
         // 파일 첨부2 - 이미지파일만 가능, 본문에 미리보기 기능 추가
         messageHelper.addInline("qwer", new FileDataSource("C:/OpenProject/qwer.jpg"));*/
         
         //메일 보내기
         mailSender.send(message);

      } catch (MailException e) {

         e.printStackTrace();
         return;

      } catch (Throwable e) {

         e.printStackTrace();
         return;

      }
   }
}