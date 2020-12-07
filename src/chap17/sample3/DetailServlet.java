package chap17.sample3;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap05.Post;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet(name = "DetailServlet2",
    urlPatterns = { "/sample3/post/detail" })
public class DetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Post post = getPost(id);
        
        String path = "/WEB-INF/view/chap17/detail.jsp";
        request.setAttribute("post", post);
        request.getRequestDispatcher(path).forward(request, response);
    }

    private Post getPost(String id) {
        Post post = null;
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String user = "c##mydbms";
        String password = "admin";
        String sql = "SELECT id, title, body FROM post WHERE id=?";

        try {
            // 2. connection
            con = DriverManager.getConnection(url, user, password);
            // 3. statement
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(id));
            
            // 4. query
            rs = stmt.executeQuery();
            // 5. resultset
            if (rs.next()) {
                post = new Post();
                post.setId(rs.getInt(1));
                post.setTitle(rs.getString(2));
                post.setBody(rs.getString(3));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 6. close
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        
        return post;
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}