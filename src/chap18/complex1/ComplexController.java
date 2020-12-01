package chap18.complex1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComplexController
 */
@WebServlet("/complex")
public class ComplexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplexController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
  	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
  	 *      response)
  	 */
  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		processRequest(request, response);
  	}

  	/**
  	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
  	 *      response)
  	 */
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		processRequest(request, response);
  	}

  	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		// 2단계, 요청파악
  		String type = request.getParameter("type");

  		// 3단계, 요청한 기능을 수행한다.
  		Object resultObject = null;
  		
  		if (type == null || type.equals("greeting")) {
  			Model1 m1 = new Model1();
  			resultObject = m1.method1();
  		} else if (type.equals("date")) {
  			Model2 m2 = new Model2();
  			resultObject = m2.doModel2();
  		} else {
  			resultObject = "Invalid Type";
  		}

  		// 4단계, request나 session에 처리 결과를 저장
  		request.setAttribute("result", resultObject);
  		
  		// 5단계, RequestDispatcher를 사용하여 알맞은 뷰로 포워딩
  		RequestDispatcher dispatcher 
  			= request.getRequestDispatcher("/chap18/simpleView.jsp");
  		dispatcher.forward(request, response);
  	}

  }
