package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bistro.dao.BistroDAO;
import bistro.vo.BistroVO;

public class BistroListController implements Controller 
{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		String fName = request.getParameter("fName");
		
		BistroDAO dao = new BistroDAO();
		
		List<BistroVO> bistroList = dao.getBistroList(fName);
		System.out.println(bistroList);
		
		request.setAttribute("bistroList", bistroList);
		
		return "/jsp/bistro/bistroList.jsp";
	}	

}
