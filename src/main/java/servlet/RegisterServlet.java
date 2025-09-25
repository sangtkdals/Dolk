package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dolk.bean.MemberBean;
import dolk.controller.DBConnectionMgr;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DBConnectionMgr pool;
	
    @Override
    public void init() throws ServletException {
        pool = DBConnectionMgr.getInstance(); // 커넥션 풀 초기화
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 📌 회원가입 폼에서 넘어온 값 받기
        MemberBean member = new MemberBean();
        member.setMid(request.getParameter("mid"));
        member.setMpwd(request.getParameter("mpwd"));
        member.setMname(request.getParameter("mname"));
        member.setMemail(request.getParameter("memail"));

        // 숫자값은 Null 체크 후 파싱
        String numParam = request.getParameter("mnum");
        if (numParam != null && !numParam.isEmpty()) {
            member.setMnum(Integer.parseInt(numParam));
        }

        member.setMbirth(request.getParameter("mbirth"));

        String ageParam = request.getParameter("mage");
        if (ageParam != null && !ageParam.isEmpty()) {
            member.setMage(Integer.parseInt(ageParam));
        }

        Connection con = null;
        PreparedStatement pstmt = null;
        boolean success = false;

        try {
            con = pool.getConnection();
            String sql = "INSERT INTO member (m_id, m_pwd, m_name, m_email, m_num, m_birth, m_age) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member.getMid());
            pstmt.setString(2, member.getMpwd());   // ⚠️ 실제 운영에서는 반드시 암호화 필요!
            pstmt.setString(3, member.getMname());
            pstmt.setString(4, member.getMemail());
            pstmt.setLong(5, member.getMnum());     // BIGINT 컬럼이므로 setLong 권장
            pstmt.setString(6, member.getMbirth()); // DATE 변환 필요 시 java.sql.Date로 처리 가능
            pstmt.setInt(7, member.getMage());

            int result = pstmt.executeUpdate();
            success = (result > 0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt);
        }

        PrintWriter out = response.getWriter();
        if (success) {
            out.println("<script>alert('회원가입 성공! 로그인 해주세요.'); location.href='login.jsp';</script>");
        } else {
            out.println("<script>alert('회원가입 실패. 다시 시도하세요.'); history.back();</script>");
        }
        out.close();
	}
}