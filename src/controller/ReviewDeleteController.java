package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bistro.dao.BistroDAO;
import review.dao.ReviewDAO;
import review.vo.ReviewVO;

public class ReviewDeleteController implements Controller 
{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String bName=request.getParameter("bName");
		int no=Integer.parseInt(request.getParameter("no"));
		String email=(String)session.getAttribute("email");		
		Double score=Double.parseDouble(request.getParameter("score"));
		
		ReviewDAO reviewDao = new ReviewDAO();
		
		reviewDao.reviewDelete(no, email);
		
		BistroDAO bistroDao = new BistroDAO();
		int result =bistroDao.setMinusScore(bName, score);
		
		
		return "/jsp/review/reviewDelete.jsp";
	}

}
