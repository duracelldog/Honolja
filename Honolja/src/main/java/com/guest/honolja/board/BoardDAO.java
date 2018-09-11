package com.guest.honolja.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
		
	@Autowired
	SqlSessionTemplate temp;
	//private static final Logger logger = LoggerFactory.getLogger(LoginDAO.class);
	
	public List<BoardDTO> dbSelect() {
		List<BoardDTO> list=temp.selectList("board.select");
		return list;
		    }//end
	
	
	public List<BoardDTO> dbSelect(int start,int end) {
		BoardDTO dto=new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		List<BoardDTO> list=temp.selectList("board.select2",dto);
		return list;
		    }//end
	
	public List<BoardDTO> dbSelect(int start,int end,String skey,String sval) {
		BoardDTO dto=new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setSkey(skey);
		dto.setSval(sval);
		List<BoardDTO> list=temp.selectList("board.selectAll",dto);
		return list;
	
	}
	public int dbCount(String skey,String sval) {
		BoardDTO dto=new BoardDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		int total=temp.selectOne("board.countAll", dto);
		return total;
	}
	
	  public void dbInsert(BoardDTO dto) {
		  dto.setB_uploadfilename(dto.getB_uploadfilename2().toString());
		  temp.insert("board.add", dto);
	  }
	  
	  public BoardDTO dbDetail(String data) {
		  BoardDTO dto=temp.selectOne("board.detail",data);
		  return dto;
		  //dasf
	  }
}