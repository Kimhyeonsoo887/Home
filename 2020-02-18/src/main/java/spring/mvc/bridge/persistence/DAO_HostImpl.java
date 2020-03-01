package spring.mvc.bridge.persistence;

import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.mvc.bridge.vo.VO_Member;

@Repository
public class DAO_HostImpl implements DAO_Host {

	@Autowired
	SqlSession sqlSession;

	
	

}
