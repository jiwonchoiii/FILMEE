package com.filmee.myapp.util;

import java.security.NoSuchAlgorithmException;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.filmee.myapp.domain.UserDTO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
public class HashingTest {

	@Setter(onMethod_=@Autowired)
	private HashUtils hashUtils;
	
	@Test
	public void testHashing() throws NoSuchAlgorithmException {
		UserDTO dto = new UserDTO();
		dto.setPassword("123123");
		
		String salt =hashUtils.getSalt();
		
		log.info("salt.length : {}", salt.length());
		
		String password = hashUtils.hashing(dto.getPassword(), salt);

		log.info("password : {}", password);
		log.info("password.length : {}", password.length());
		
		
	
	}//testHashing
	

}