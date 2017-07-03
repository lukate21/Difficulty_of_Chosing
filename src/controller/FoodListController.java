package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import food.dao.FoodDAO;
import food.vo.FoodVO;

public class FoodListController implements Controller 
{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		String fId = request.getParameter("fId");
		
		System.out.println(fId);
		
		FoodDAO dao = new FoodDAO();
		
		List<FoodVO> foodList = dao.getFoodList(fId);
		
		HttpSession session = request.getSession();
		session.setAttribute("foodList", foodList);
		request.setAttribute("fId",fId);
		
		System.out.println(foodList);
		return "/jsp/food/foodList.jsp";
	}

}
