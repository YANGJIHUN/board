package kr.or.jh.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.jh.service.Board;
import kr.or.jh.service.BoardDao;

@Controller
public class BoardController {
	@Autowired
	private BoardDao boardDao;
	
	// 글 수정 폼 요청
	@RequestMapping(value="/boardModify", method = RequestMethod.GET)
	public String boardModify(Model model 
							,@RequestParam(value="boardNo", required=true)int boardNo){
		Board board = boardDao.getBoard(boardNo);
		model.addAttribute("board", board);
		return "/boardModify";
	}
	
	// 글 수정 요청
	@RequestMapping(value ="/boardModify", method = RequestMethod.POST)
	public String boardModify(Board board){
		boardDao.updateBoard(board);
		return "redirect:boardView?boardNo="+board.getBoardNo();
	}
	
	// 글 삭제 폼 요청(비밀번호 입력 폼)
	@RequestMapping(value="/boardRemove", method = RequestMethod.GET)
	public String boardRemove(@RequestParam(value="boardNo", required=true)int boardNo){
		/*Board board = boardDao.getBoard(boardNo);
		model.addAttribute("board", board);*/
		return "/boardRemove";
	}
	// 글 삭제 요청
	@RequestMapping(value ="/boardRemove", method = RequestMethod.POST)
	public String boardRemove(@RequestParam(value="boardNo")int boardNo
							,@RequestParam(value="boardPw")String boardPw){
		boardDao.deleteBoard(boardNo, boardPw);
		return "redirect:/boardList";
	}
	
	// 글 상세 내용 요청
	@RequestMapping(value="/boardView", method = RequestMethod.GET)
	public String boardView(Model model 
							,@RequestParam(value="boardNo")int boardNo){
		Board board = boardDao.getBoard(boardNo);
		model.addAttribute("board", board);
		return "/boardView";
	}
	
	// 리스트요청
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList(Model model 
							, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage){
		int boardCount = boardDao.getBoardCount();
		int pagePerRow = 10;
		int lastPage = (int)(Math.ceil(boardCount / pagePerRow));
		/*반올림 : Math.round()
		올림 : Math.ceil()
		내림 : Math.floor()*/
		List<Board> list = boardDao.getBoardList(currentPage, pagePerRow);
		  
	    //페이지를 10씩 끊어서 
	    int countPage = 10;
	    //시작 페이지 구하기 
	    int startPage = ((currentPage-1)/10)*10+1;
	    //끝 페이지 구하기 
	    int endPage = startPage + countPage-1;
	    //다음 페이지 구하기 
	    int nextPage = ((currentPage-1)/10)*10+11;
	    //이전페이지 구하기 
	    int previousPage =((currentPage-1)/10)*10-10+1;
	    
	    //이전 페이지가 0보다 같거나 작을경우
	    if(previousPage <=0){
	    	previousPage = 1; 	
	    }
	    //끝 페이자가 총 페이지보다 클 경우
	    if(endPage > lastPage){
	    	endPage = lastPage;
	    }
	    //다음 페이지가 총 페이지보다 큰 경우 
	    if(nextPage > lastPage){
	    	nextPage = lastPage;
	    }
		model.addAttribute("startPage", startPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		model.addAttribute("endPage", endPage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("previousPage", previousPage);
		return "/boardList";
	}
	
	
	// 입력페이지 요청
	@RequestMapping(value = "/boardAdd", method = RequestMethod.GET)
	public String boardAdd(){
		System.out.println("boardAdd 폼 요청");
		return "boardAdd";
	}
	
	// 입력(액션)요청
	@RequestMapping(value = "/boardAdd", method = RequestMethod.POST)
	public String boardAdd(Board board){
		
		boardDao.insertBoard(board);
		System.out.println(board);
		return "redirect:/boardList";// 글입력후 "/boardList"로 리다이렉트(재요청)
	}
	
}
