package chap14;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {
	public static List<String> listEmployeeName() {
		List<String> list = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "c##mydbms";
		String password = "admin";

		String sql = "SELECT ename FROM employee";

		try {
			// 1. 클래스 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2. 커넥션 생성
			conn = DriverManager.getConnection(url, user, password);

			// 3. Statment 생성
			stmt = conn.createStatement();

			// 4. 쿼리 실행
			rs = stmt.executeQuery(sql);

			// 5. 결과 처리
			while (rs.next()) {
				list.add(rs.getString("ename"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 6. statment 닫고
			try {
				stmt.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			// 7. connection 닫고
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
}
