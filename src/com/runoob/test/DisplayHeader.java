package com.runoob.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DisplayHeader
 */
@WebServlet(description = "显示头", urlPatterns = { "/DisplayHeader" })
public class DisplayHeader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayHeader() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("DisplayHeader");
		
		response.setContentType("text/html;charset=UTF-8");
		
		response.setCharacterEncoding("UTF-8");

		PrintWriter responseWriter = response.getWriter();

		String title = "Http Header 请求实例";
		
		String docTypeString = "<!DOCTYPE html> \n";
				
		responseWriter.println(docTypeString
				+ "<html>\n"
				+ "<head>"
				+ "<meta charset=\"UTF-8\"/>"
				+ "<title>" + title + "</title>"
				+ "</head>"
				+ "<body bgcolor=\"#f0f0f0\">\n" 
				+ "<h1 align=\"center\">" + title + "</h1>\n"
				+ "<table width=\"100%\" border=\"1\" align=\"center\">\n"
				+ "<tr bgcolor=\"#949494\">\n"
				+ "<th>Header 名称</th><th>Header 值</th>\n"
				+ "</tr>\n"
				);
		
		Enumeration<String> headerNamesEnumeration = request.getHeaderNames();
		
		while (headerNamesEnumeration.hasMoreElements()) {
			String nameString = headerNamesEnumeration.nextElement();
		
			responseWriter.println("<tr><td>" + nameString + "</td>");
			
			String valueString = request.getHeader(nameString);
			
			responseWriter.println("<td>" + valueString + "</td></tr>");
		}
	
		
		responseWriter.println("</table>\n</body>\n</html>\n");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
