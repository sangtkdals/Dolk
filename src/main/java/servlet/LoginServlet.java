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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        String m_id = request.getParameter("m_id").trim();   // 로그인 폼에서 넘어온 아이디
        String m_pwd = request.getParameter("m_pwd").trim(); // 로그인 폼에서 넘어온 비번

        try {
            con = pool.getConnection();
            String sql = "SELECT m_id FROM member WHERE m_id = ? AND m_pwd = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, m_id);
            pstmt.setString(2, m_pwd);
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
            session.setAttribute("userId", m_id);

            // 알림 띄우고 home.jsp로 이동
            response.setContentType("text/html; charset=UTF-8");
            out.println("<script>");
            out.println("alert('로그인 성공! 환영합니다.');");
            out.println("location.href='" + request.getContextPath() + "/dolk/lobby/home.jsp';");
            out.println("</script>");
        }else {
            // 로그인 실패 시 login.jsp로 이동
            response.setContentType("text/html; charset=UTF-8");
            out.println("<script>");
            out.println("alert('아이디 또는 비밀번호가 올바르지 않습니다.');");
            out.println("history.back();"); // 뒤로가기 (login.jsp)
            out.println("</script>");
        }
	}
}