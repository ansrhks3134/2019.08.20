package ser;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBPKG.DAO;
import DBPKG.DTO;

/**
 * Servlet implementation class insert
 */
@WebServlet("/insert")
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("insert.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao = DAO.getInstance();
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		DTO vo = new DTO();
		vo.setCustno(custno);
		vo.setCustname(custname);
		vo.setPhone(phone);
		vo.setAddress(address);
		vo.setJoindate(joindate);
		vo.setGrade(grade);
		vo.setCity(city);
		int row = dao.insert(vo);
		request.setAttribute("row", row);
		RequestDispatcher rd = request.getRequestDispatcher("insert_pro.jsp");
		rd.forward(request, response);
	}

}
