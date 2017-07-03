package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bistro.dao.BistroDAO;
import bistro.vo.BistroVO;

public class BistroDetailController implements Controller 
{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		String bName = request.getParameter("bName");
		
		BistroDAO dao = new BistroDAO();
		
		BistroVO bistroDetail = dao.getBistroDetail(bName);
		
		request.setAttribute("bistroDetail", bistroDetail);
		
		return "/jsp/bistro/bistroDetail.jsp";
	}

}
