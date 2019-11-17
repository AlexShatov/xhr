package xhr.servlet;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import xhr.object.Something;

@WebServlet("/")
public class Servlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		StringBuffer jb = new StringBuffer();
		String line = null;
		try {
		    BufferedReader reader = req.getReader();
		    while ((line = reader.readLine()) != null) {
		    	jb.append(line);
		    }
		} catch (IOException e) {
			throw new IOException("Failed to read request", e); 
		}
		Gson gson = new Gson();
		Something something = gson.fromJson(jb.toString(), Something.class);
		something.setProperty("changed");
		String toResp = gson.toJson(something);
		resp.setContentType("text/JSON");
		resp.getWriter().write(toResp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		resp.sendRedirect(req.getContextPath() + "/page.jsp");
	}
	
}
