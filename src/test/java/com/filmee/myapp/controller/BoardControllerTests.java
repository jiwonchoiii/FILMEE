package com.filmee.myapp.controller;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@WebAppConfiguration

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class BoardControllerTests {
	@Setter(onMethod_=@Autowired)
	private WebApplicationContext ctx;
	private MockMvc mockMvc;

	@Before
	public void setup() {
		log.debug("setup() invoked");
		assertNotNull(ctx);

	}//setup
	
	@Test
	public void testList() throws Exception{
		log.debug("testList() invoked.");
		
		MockMvcBuilder mockMvcBuilder=MockMvcBuilders.webAppContextSetup(this.ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		RequestBuilder reqBuilder = MockMvcRequestBuilders.get("/board/list");
		
		ModelMap modelMap = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getModelMap();
		
		modelMap.forEach((k,v)->{
			log.info("\t+ key: {} , value: {}",k,v);
		});
		modelMap.clear();
		modelMap=null;
	}//testList
	
	@Test
	public void testGet() throws Exception{
		log.debug("testGet() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(this.ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/board/get");
		reqBuilder.param("bno", "20");
		
		ModelMap modelMap=mockMvc.perform(reqBuilder).andReturn().getModelAndView().getModelMap();
		modelMap.forEach((k,v)->{
			log.info("\t+ key:{} / value:{}",k,v);
		});
	}//testGet
	
	@Test
	public void testRegister() throws Exception{
		log.debug("testRegister() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(this.ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		MockHttpServletRequestBuilder reqbuilder = MockMvcRequestBuilders.post("/board/register");
		reqbuilder.param("title","세상에!");
		reqbuilder.param("content", "이런일이!");
		reqbuilder.param("writer", "1");
		
		String viewName = mockMvc.perform(reqbuilder).andReturn().getModelAndView().getViewName();
		log.info("viewName:{}",viewName);
	}//testRegister
	
	@Test
	public void testModify() throws Exception{
		log.debug("testModify() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(this.ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/board/modify");
		reqBuilder.param("bno", "24");
		reqBuilder.param("title", "와랄랄라라");
		reqBuilder.param("content", "취업하고 싶습니다!!");
		reqBuilder.param("writer", "1");
		
		String viewName = mockMvc.perform(reqBuilder).andReturn().getModelAndView().getViewName();
		log.info("viewName:{}",viewName);
	}//testModify
	
	@Test
	public void remove() throws Exception {
		log.debug("remove()invoked.");
		
		MockMvcBuilder mockMvcBuilder=MockMvcBuilders.webAppContextSetup(this.ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		MockHttpServletRequestBuilder reqbuilder = MockMvcRequestBuilders.post("/board/remove");
		reqbuilder.param("bno", "101");
		
		ModelMap modelMap=mockMvc.perform(reqbuilder).andReturn().getModelAndView().getModelMap();
		
		log.info("\t+ modelMap: "+modelMap);
		
	}//remove
	
	
}//end class
