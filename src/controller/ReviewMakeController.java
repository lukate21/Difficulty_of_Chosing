package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bistro.dao.BistroDAO;
import review.dao.ReviewDAO;
import review.vo.ReviewVO;

public class ReviewMakeController implements Controller 
{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		System.out.println("reviewMake: " + (String)session.getAttribute("email"));
		String bName=request.getParameter("bName");
		String email=(String)session.getAttribute("email");
		//request.getParameter("id"), 
		String content =request.getParameter("content");
		Double score=Double.parseDouble(request.getParameter("score"));
		ReviewVO reviewVo = new ReviewVO();
		reviewVo.setbName(bName);
		reviewVo.setmId(email);
		reviewVo.setScore(score);
		reviewVo.setContent(content);
		
		
		ReviewDAO reviewDao = new ReviewDAO();
		
		int reviewMakeResult = reviewDao.reviewMake(reviewVo);
				
		//request.setAttribute("reviewMakeResult", reviewMakeResult);
		
		int averageScoreResult = 0;
		
		if(reviewMakeResult == 1)
		{
			BistroDAO bistroDao = new BistroDAO();
			
			averageScoreResult = bistroDao.setAverageScore(reviewVo.getbName(), reviewVo.getScore());  
		}
		
		request.setAttribute("averageScoreResult", averageScoreResult);
		System.out.println(averageScoreResult);
		
		return "/jsp/review/reviewMake.jsp";
	}

}
