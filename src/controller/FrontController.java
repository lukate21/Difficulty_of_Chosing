package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet 
{
	private HandlerMapping mappings = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException 
	{
		String configName = config.getInitParameter("configName");
		
		mappings = new HandlerMapping(configName);
	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		uri = uri.substring(context.length());
				
		try {
			
			Controller controller = mappings.getController(uri);
			String callPage = controller.handleRequest(request, response);
			System.out.println(callPage);
			RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}
