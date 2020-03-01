package spring.mvc.bridge.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.bridge.persistence.DAO_Main;
import spring.mvc.bridge.vo.VO_Member;

@Service
public class Service_HostImpl implements Service_Host{
	
	@Autowired
	DAO_Main daoM;
	
	
	
	
	
}
