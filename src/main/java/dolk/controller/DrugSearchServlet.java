package dolk.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dolk.dto.DrugDTO;
import dolk.service.DrugApiService;

@WebServlet("/drugSearch")
public class DrugSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DrugSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String searchType = request.getParameter("searchType"); // 'name' 또는 'efficacy'
		String keyword = request.getParameter("keyword");

		DrugApiService apiService = new DrugApiService();
		List<DrugDTO> drugList = Collections.emptyList();

		try {
			if (keyword != null && !keyword.trim().isEmpty()) {
				if ("name".equals(searchType)) {
					drugList = apiService.searchDrugsByName(keyword);
				} else {
					drugList = apiService.searchDrugsByEfficacy(keyword);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("drugList", drugList);
		request.setAttribute("keyword", keyword); 

		RequestDispatcher dispatcher = request.getRequestDispatcher("new_design/DrugSearchPage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
