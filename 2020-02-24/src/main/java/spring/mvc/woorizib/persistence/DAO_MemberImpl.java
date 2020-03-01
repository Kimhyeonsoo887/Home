package spring.mvc.woorizib.persistence;

import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.mvc.woorizib.vo.VO_Member;

@Repository
public class DAO_MemberImpl implements DAO_Member {

	@Autowired
	SqlSession sqlSession;

	
	

}
