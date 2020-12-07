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

import chap05.Post;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/sample3/post/update")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String body = request.getParameter("body");
        
        
        Post post = new Post();
        post.setId(Integer.parseInt(id));
        post.setTitle(title);
        post.setBody(body);
        
        update(post);
        
        response.sendRedirect(request.getContextPath()+ "/sample3/post/main");
    }

    private void update(Post post) {
        String sql = "UPDATE post "
                + "SET title=?, body=? "
                + "WHERE id=?";
        
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String user = "c##mydbms";
        String password = "admin";
        
        try (
                Connection con = DriverManager.getConnection(url, user, password);
                PreparedStatement pstmt = con.prepareStatement(sql);
        ) {
            pstmt.setString(1, post.getTitle());
            pstmt.setString(2, post.getBody());
            pstmt.setInt(3, post.getId());
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
    }
    
    

}
