package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dolk.controller.DBConnectionMgr;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DBConnectionMgr pool;  
	
    public void init() throws ServletException {
        pool = DBConnectionMgr.getInstance(); // 커넥션 풀 초기화
    }
	
    public LoginServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String mid = request.getParameter("mid");   // 로그인 폼에서 넘어온 아이디
        String mpwd = request.getParameter("mpwd"); // 로그인 폼에서 넘어온 비번

        boolean flag = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String sql = "SELECT m_id FROM dolk WHERE m_id = ? AND m_pwd = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, mid);
            pstmt.setString(2, mpwd);
            rs = pstmt.executeQuery();
            flag = rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        PrintWriter out = response.getWriter();
        if (flag) {
            // 세션에 사용자 정보 저장
            HttpSession session = request.getSession();
            session.setAttribute("userId", mid);

            out.println("<script>alert('로그인 성공!'); location.href='welcome.jsp';</script>");
        } else {
            out.println("<script>alert('로그인 실패. 다시 시도하세요.'); history.back();</script>");
        }
        out.close();
	}
}