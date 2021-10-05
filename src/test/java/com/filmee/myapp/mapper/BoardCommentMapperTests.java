package com.filmee.myapp.mapper;

import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.BoardCommentVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardCommentMapperTests {
	
//	public abstract Integer create(BoardCommentVO comment);	//댓글 작성
//	public abstract List<BoardCommentVO> list(Integer bno);	//댓글 조회
//	public abstract Integer delete(Integer bcno);			//댓글 삭제
//	public abstract Integer update(BoardCommentVO comment);	//댓글 수정
//	public abstract Integer cocnt(Integer bno);
	
	@Autowired private BoardCommentMapper mapper;
	
	@Before 
	public void setup() {
		log.debug("setup() invoked.");
		Objects.requireNonNull(this.mapper);
	}//setup
	
	
	@Test
	public void testList() {
		log.debug("testList() invoked.");
		
		this.mapper.list(396);
	}
	
	@Test
	public void testInsert() {
		log.debug("testInsert() invoked.");
		
		BoardCommentVO comment = new BoardCommentVO(
				null, 
				396, 
				401, 
				" 댓글 테스트클래스에서 왔습니디ㅏㅇ", 
				null,
				null, 
				null, 
				null);
		
		int vo = this.mapper.insert(comment);
		log.info("Insert Success ! ::", vo);
	}//testInsert

	@Test
	public void testDelete() {
		log.debug("testDelete() invoked.");
		
		int l = this.mapper.delete(5);
		log.info("OK " + l);
	}//testDelete

	@Test
	public void testUpdate() {
		log.debug("testUpdate() invoked.");
		BoardCommentVO comment = new BoardCommentVO(
				59, 
				null, 
				1, 
				" 댓글 수정해따", 
				null,
				null, 
				null, 
				null);
		int l = this.mapper.update(comment);
	}//testUpdate

	@Test
	public void testRead() {
		log.debug("testRead() invoked.");
		
		this.mapper.read(11);
	}//testRead

//	@Test
//	public void testGetListWithPaging() {
//		log.debug("testGetListWithPaging() invoked.");
//		Criteria cri = new Criteria();
//		List<BoardCommentVO> list = this.mapper.getListWithPaging(cri, 171);
//		
//		list.forEach(log::info);
//		
//	}//testGetListWithPaging
}//end class