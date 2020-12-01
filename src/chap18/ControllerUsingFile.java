
package chap18;

import java.io.FileReader;  
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
* Servlet implementation class ControllerUsingFile
*/
@WebServlet(value = "/controllerUsingFile",
   initParams = {
      @WebInitParam (
            name="configFile",
            value="/WEB-INF/commandHandler.properties"
      )
})
public class ControllerUsingFile extends HttpServlet {
   private static final long serialVersionUID = 1L;
  
  
  
//   commandHandler.properties 파일로부터 읽어와 클래스명, 객체를 담을 map 선언
   private Map<String, CommandHandler> commandHandlerMap
      = new HashMap<>();
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerUsingFile() {
        super();
        // TODO Auto-generated constructor stub
    }
   
   

    @Override
    public void init() throws ServletException {
      
//       commandHandler.properties페이지의 경로를 얻어은 후 읽어서 prop 키, 값 형태로 넣기
       String configFile = getInitParameter("configFile");
       Properties prop = new Properties();
       String configFilePath = getServletContext().getRealPath(configFile);
       try (FileReader fis = new FileReader(configFilePath)) {
          prop.load(fis);
       } catch (IOException e) {
          e.printStackTrace();
          throw new ServletException(e);
       }
      
//       commandHandler.properties페이지의 경로를 받아 읽어온 prop를 이용해서
//       map 채우기
       Iterator keyIter = prop.keySet().iterator();
       while (keyIter.hasNext()) {
//          command : 파라미터명 (여기선 hello)
          String command = (String) keyIter.next();
//          handlerClassName : 클래스경로 (여기선 chap18.HelloHandler)
          String handlerClassName = prop.getProperty(command);
         
//          해당 클래스의 객체생성해서 map에 commandHandler.properties페이지에서 사용했던
//          (파라미터, 클래스인스턴스) 꼴로 삽입
          try {
//             handlerClass : 다루고자 하는 클래스(정보를 내포)
             Class<?> handlerClass = Class.forName(handlerClassName);
//             인스턴스 객체에 다루고자 하는 class객체 생성해서 삽입
             CommandHandler handlerInstance =
                   (CommandHandler) handlerClass.newInstance();
//            
             commandHandlerMap.put(command, handlerInstance);
          } catch (Exception e) {
             e.printStackTrace();
             throw new ServletException(e);
          }
       }
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      process(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      process(request, response);
   }

   private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
//      cmd : 클라이언트가 요청한 명령어를 임의의 파라미터 cmd로 설정하여 얻는과정
      String command = request.getParameter("cmd");
//      cmd를 통해 위에서 선언한 map중 일치하는 클래스가 있나 확인 후 해당 클래스 객체를 인터페이스 객체에 삽입
      CommandHandler handler = commandHandlerMap.get(command);
     
      /*
      if (handler == null) {
         handler = new NullHandler();
      }
      */
     
      String viewPage = null;
     
      try {
//      해당하는 클래스객체의 클래스 내부에서 process 메소드를 실행하여 얻은 jsp 경로를 viewPage에 삽입
//      여기서 process메소드는 HelloHandler내부에 선언된 메소드
         viewPage = handler.process(request, response);
      } catch (Exception e) {
         e.printStackTrace();
         throw new ServletException(e);
      }
     
//      받은 viewPage가 null이 아니고 jsp 경로이면 (여기에선 hello.jsp) 해당 페이지로 request, response객체 넘김
      if (viewPage != null) {
         RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
         dispatcher.forward(request, response);
      }
   }
}
