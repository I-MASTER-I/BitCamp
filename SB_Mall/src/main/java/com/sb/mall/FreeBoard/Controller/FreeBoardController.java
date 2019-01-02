package com.sb.mall.FreeBoard.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.FreeBoard.model.FreeBoard;
import com.sb.mall.FreeBoard.service.FreeBoardService_Create;
import com.sb.mall.FreeBoard.service.FreeBoardService_Delete;
import com.sb.mall.FreeBoard.service.FreeBoardService_Select;
import com.sb.mall.FreeBoard.service.FreeBoardService_Update;
import com.sb.mall.FreeBoard.service.FreeBoard_ListView_Service;
import com.sb.mall.member.model.MemberInfo;

@Controller
@RequestMapping("freeBoard")
@SessionAttributes("memberInfo")
public class FreeBoardController {
	
	MemberInfo memberInfo;
	
	@Autowired
	FreeBoard_ListView_Service freeBoardListViewService;
	//게시판 이동
	@RequestMapping(method = RequestMethod.GET) 
	public ModelAndView freeBoardMainPage_List() {
		
		//경로 지정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("freeBoard/FreeBoardMain");
		System.out.println("[자유게시판]");
		
		
		//Get the boardlist from DB
		List<FreeBoard> list = freeBoardListViewService.freeBoardListView();
		
		//System.out.println(list);
		modelAndView.addObject("FreeBoardList",list);
		
		return modelAndView;
	}
	
	//게시판에서 글쓰기버튼 클릭
	@RequestMapping("/writePage") 
	public String freeBoardWrite() {
		System.out.println("[freeBoardWrite()]");
		
		return "freeBoard/FreeBoardWrite";
	}
	
	//Create
	@Autowired
	FreeBoardService_Create freeBoardServiceCreate;
	
	@RequestMapping(method = RequestMethod.POST, value="/insert") 
	public String freeBoardInsert(
			FreeBoard freeBoard,
			MemberInfo memberInfo) throws Exception {
		System.out.println("[freeBoardInsert()]");
		
		int userSeq = memberInfo.getUserSeq();
		System.out.println("접속 회원명:"+memberInfo.getUserName());
		System.out.println("접속 회원번호:"+userSeq);
		
		ModelAndView modelAndView = new ModelAndView("freeBoard/FreeBoardMain");
		
		if (memberInfo.getUserId() != null) {
			
			System.out.println("FK: memberInfo 테이블의 기본키 freeBoard 테이블에 저장");
			
			freeBoard.setUserSeq(memberInfo.getUserSeq());
			freeBoard.setWriterName(memberInfo.getUserName());
			
			
			
			int resultCnt = 0;
			System.out.println(freeBoard.toString());
			resultCnt = freeBoardServiceCreate.freeBoardService_Create(freeBoard);
			
		}else {
			return "redirect:/freeBoard";
		}
		
		return "redirect:/freeBoard";
	}//End of method Create
	
	
	//Read
	@Autowired
	FreeBoardService_Select freeBoardService_Select;
	@Autowired
	FreeBoardService_Update freeBoardService_Update;
	
	@RequestMapping("/select") 
	public ModelAndView freeBoardSelect(FreeBoard freeBoard, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("freeBoard/FreeBoardRead");
		System.out.println("[freeBoardSelect()]");
		/*게시글 클릭시 해당 게시판번호 출력확인*/
		int boardSeq = freeBoard.getBoardSeq();
		System.out.println(boardSeq);
		//클릭하면 해당 게시물 조회수 1 증가
		try {
			freeBoardService_Update.freeBoardService_viewCount();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		try {
			freeBoard = freeBoardService_Select.freeBoardService_Select(boardSeq);
			modelAndView.addObject("freeBoard",freeBoard);
			/*조회된 객채 확인*/
			System.out.println(freeBoard.toString());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	//Update 
	//1. 수정 가능한 형태로 데이터 불러오기
	@RequestMapping("/update") 
	public ModelAndView freeBoardUpdate(FreeBoard freeBoard, MemberInfo memberInfo) {
		ModelAndView modelAndView = new ModelAndView("/freeBoard/FreeBoardUpdate");
		System.out.println("[freeBoardUpdate() - select by boardSeq]");
		/*게시글 클릭시 해당 게시판번호 출력확인*/
		//MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
		int boardSeq = freeBoard.getBoardSeq();
		int b_userSeq = freeBoard.getUserSeq();
		int m_userSeq = memberInfo.getUserSeq();
		
		System.out.println("b_userSeq :" + b_userSeq);
		System.out.println("m_userSeq :" + m_userSeq);
		
		if (b_userSeq == m_userSeq) {
			System.out.println("본인");
		}else {
			System.out.println("타인");
		}
		
		
		try {
			freeBoard = freeBoardService_Select.freeBoardService_Select(boardSeq);
			modelAndView.addObject("freeBoard",freeBoard);
			/*조회된 객채 확인*/
			System.out.println(freeBoard.toString());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	//2. 수정된 게시글 업데이트
	
	@RequestMapping( method=RequestMethod.POST,value="/update_over") 
	public ModelAndView freeBoardUpdate_End(FreeBoard freeBoard) {
		ModelAndView modelAndView = new ModelAndView("redirect:/freeBoard");
		System.out.println("[freeBoardUpdate() - update by boardSeq]");
		/*게시글 클릭시 해당 게시판번호 출력확인*/
		int boardSeq = freeBoard.getBoardSeq();
		
		System.out.println(freeBoard.toString());
		int resultCnt;
		try {
			resultCnt = freeBoardService_Update.freeBoardService_Update(freeBoard);
			if (resultCnt == 1) {
				System.out.println("수정완료");
			}else {
				System.out.println("수정실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return modelAndView;
	}
	
	
	//Delete
	@Autowired
	FreeBoardService_Delete freeBoardService_Delete;
	
	@RequestMapping("/delete") 
	public ModelAndView freeBoardDelete(FreeBoard freeBoard, HttpSession session) {
		
		MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
		
		ModelAndView modelAndView = new ModelAndView("redirect:/freeBoard");
		System.out.println("[freeBoardDelete()]");
		/*게시글 클릭시 해당 게시판번호 출력확인*/
		System.out.println(freeBoard.toString());
		System.out.println(memberInfo.toString());
		
		int boardSeq = freeBoard.getBoardSeq();
		int b_userSeq = freeBoard.getUserSeq();
		int m_userSeq = memberInfo.getUserSeq();
		System.out.println("삭제할 게시글 번호 : "+boardSeq);
		System.out.println("삭제할 게시글유저 번호 : "+b_userSeq);
		System.out.println("로그인한 유저 번호: "+m_userSeq);
		
		if (b_userSeq == m_userSeq) {
			
			try {
				freeBoardService_Delete.freeBoardService_Delete(freeBoard.getBoardSeq());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			modelAndView.setViewName("redirect:/freeBoard");
			System.out.println("삭제 실패");
		}
		
		
		return modelAndView;
	}
}
