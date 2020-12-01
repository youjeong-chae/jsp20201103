    package chap18;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SimpleController
 */
@WebServlet("/simple")
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SimpleController() {
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
	//1단계 요청을 받음.
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2단계, 요청파악
		String type = request.getParameter("type");  // String 타입 type이라는 파라미터값을 요청 .

		// 3단계, 요청한 기능을 수행한다.
		Object resultObject = null;  //초기화
		
		if (type == null || type.equals("greeting")) // request에 담긴 type 파라미터 값이 null이거나 greeting일때
		{
			resultObject = "안녕하세요"; // 안녕하세요가 나온다.
		} else if (type.equals("date"))   // type 파라미터 값이 date일때
		
		{
			resultObject = new java.util.Date(); // 오늘 날짜가 나온다.
		} else {
			resultObject = "Invalid Type";  // 그 밖의 값은 유효하지않은 타입이라고 뜨게한다.
		}

		// 4단계, request나 session에 처리 결과를 저장
		request.setAttribute("result", resultObject);  //내장객체인 request의 속성메소드를 사용해서 result라는 이름으로 저장
		
		// 5단계, RequestDispatcher를 사용하여 알맞은 뷰로 포워딩
		RequestDispatcher dispatcher 
			= request.getRequestDispatcher("/chap18/simpleView.jsp");
		dispatcher.forward(request, response);
		// 요청을 보내는 방법으로서 forward, include를 사용
		//forward()메소드는 대상 자원으로 제어를 넘기는 역활 
	}

}