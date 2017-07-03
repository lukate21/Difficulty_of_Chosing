package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.dao.ReviewDAO;
import review.vo.ReviewVO;

public class ReviewListController implements Controller 
{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		int pageNo = 1;
		if(request.getParameter("pageNo")==null){
		}else{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		
		String bName = request.getParameter("bName");
		
		ReviewDAO dao = new ReviewDAO();
		
		System.out.println("Controller: " + bName);
		List<ReviewVO> reviewList = dao.getReviewList(bName, pageNo);
		
		request.setAttribute("reviewList", reviewList);
		
		return "/jsp/review/reviewList.jsp";
	}

}
