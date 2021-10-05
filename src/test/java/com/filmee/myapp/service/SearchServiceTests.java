package com.filmee.myapp.service;

import java.util.List;
import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.SearchPeopleVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class SearchServiceTests {

	@Setter(onMethod_=@Autowired)
	private SearchService service;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		Objects.requireNonNull(service);
	}//setup
	
	@Test
	public void testSearchFilmsByPeopleId() {
		log.debug("testSearchFilmsByPeopleName() invoked.");
		
		List<SearchPeopleVO> films = this.service.serachFilmsByPeopleId("3223");
		
		films.forEach((t) -> {
			log.info(t);
		});
		
	}//testSearchFilmsByPeopleName
}
