package chap17.sample3;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RemoveServlet
 */
@WebServlet(name = "RemoveServlet2",
urlPatterns = { "/sample3/post/remove" })
public class RemoveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        
        // delete jdbc code
        remove(id);
        
        response.sendRedirect(request.getContextPath() + "/sample3/post/main");
    }

    private void remove(String id) {
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String user = "c##mydbms";
        String password = "admin";
        String sql = "DELETE FROM post WHERE id=?";
        
        try (
                Connection con = DriverManager.getConnection(url, user, password);
                PreparedStatement pstmt = con.prepareStatement(sql);
        ) {
            pstmt.setInt(1, Integer.parseInt(id));
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}