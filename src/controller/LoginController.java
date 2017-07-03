package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String email = request.getParameter("email");

		HttpSession session = request.getSession();
		session.setAttribute("email", email);
		
		return "/jsp/login/loginProcess.jsp";
	}

}
