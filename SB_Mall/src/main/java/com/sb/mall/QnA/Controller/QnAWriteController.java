package com.sb.mall.QnA.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.QnA.model.QnABoard;
import com.sb.mall.QnA.service.QnAWriteService;
import com.sb.mall.member.model.MemberInfo;

@Controller
@RequestMapping("/qnaWrite")
public class QnAWriteController {
	
	@Autowired
	QnAWriteService qnaWriteService;
    
    @RequestMapping(method=RequestMethod.GET)
    public String createGET() {
    	
		return "qna/qnaWrite";
    	
    }
    
    @RequestMapping(method=RequestMethod.POST )
    public ModelAndView createPOST(QnABoard qnaBoard, HttpSession session) {
    		
    	ModelAndView modelAndView = new ModelAndView();
    	
    	System.out.println("qnaBoard : " + qnaBoard);
    	
    	MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
    	
    	System.out.println("memberInfo : " + memberInfo);
    	
    	modelAndView.setViewName("redirect:/qna");
    	
    	qnaBoard.setUserSeq(memberInfo.getUserSeq());
    	
    	System.out.println("qnaBoard : " + qnaBoard);
    	
    	qnaWriteService.qnaWrite(memberInfo, qnaBoard);
    	
    	
        return modelAndView;
    }

	
	
	
	
	
	
	
	
	/*@Autowired
	private QnAService qnaBoardService;

	@RequestMapping(value="/qna/openQnAList.do")
	public ModelAndView openQnAList(CommandMap commandMap) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/qna/qnaList");
		
		List<Map<String,Object>> list = QnAService.selectQnAList(commandMap.getMap());
		modelAndView.addObject("list", list);
    	
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/openQnAWrite.do")
	public ModelAndView openQnAWrite(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("/qna/qnaWrite");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/insertQnA.do")
	public ModelAndView insertQnA(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("redirect:/qna/openQnAList.do");
		
		QnAService.insertQnA(commandMap.getMap());
		
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/openQnADetail.do")
	public ModelAndView openQnADetail(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("/qna/qnaDetail");
		
		Map<String,Object> map = QnAService.selectQnADetail(commandMap.getMap());
		modelAndView.addObject("map", map);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/openQnAUpdate.do")
	public ModelAndView openQnAUpdate(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("/qna/qnaUpdate");
		
		Map<String,Object> map = QnAService.selectQnADetail(commandMap.getMap());
		modelAndView.addObject("map", map);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/updateQnA.do")
	public ModelAndView updateQnA(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("redirect:/qna/openQnADetail.do");
		
		QnAService.updateQnA(commandMap.getMap());
		
		modelAndView.addObject("IDX", commandMap.get("IDX"));
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/deleteQnA.do")
	public ModelAndView deleteQnA(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("redirect:/qna/openQnAList.do");
		
		QnAService.deleteQnA(commandMap.getMap());
		
		return modelAndView;
	}*/
	
	
	/*@ResponseBody
	@RequestMapping(value = "qna")
	public ModelAndView getQnABoard() {
		ModelAndView modelAndView = new ModelAndView();

		try {
			List<Map<String, Object>> list = qnaBoardListService.qnaList();
			modelAndView.addObject("qnaList", list);
		} catch (SQLException e) {
			modelAndView.addObject("errorMsg", "글 목록 조회에 실패하였습니다.");
			System.out.println("글 목록 조회에 실패하였습니다.");
		}
		modelAndView.setViewName("qna");
		return modelAndView;
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String createPOST(QnABoard board, RedirectAttributes rttr) throws Exception {
		
		System.out.println(board.toString());

		qnaBoardListService.qnaList();

		// return "/board/succes";
		rttr.addFlashAttribute("msg", "성공");
		return "redirect:/qna";
	}*/

}
