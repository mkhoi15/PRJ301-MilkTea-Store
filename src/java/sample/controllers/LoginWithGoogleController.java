package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.GooglePojo;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.utils.GoogleUtils;

@WebServlet(name = "LoginWithGoogleController", urlPatterns = {"/LoginWithGoogleController"})
public class LoginWithGoogleController extends HttpServlet {

    private static final String AD = "AD";
    private static final String ADMIN_PAGE = "admin.jsp";

    private static final String US = "US";
    private static final String US_PAGE = "usPage.jsp";
    private static final String LOGIN_PAGE = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                request.setAttribute("ERROR", "Something go wrong with email");
                url = LOGIN_PAGE;
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                String userID = googlePojo.getId();
                String password = googlePojo.getEmail();
                String fullName = googlePojo.getName();
                UserDAO dao = new UserDAO();
                UserDTO loginUser = dao.checkLogin(userID, password);
                if (loginUser == null) {
                    UserDTO user = new UserDTO(userID, fullName, "US", password);
                    boolean checkInsert = dao.insert(user);
                    if (checkInsert) {
                        url = LOGIN_PAGE;
                    } else {
                        request.setAttribute("ERROR", "Unknow Error! ");
                    }
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", loginUser);
                    String roleID = loginUser.getRoleID();
                    if (AD.equals(roleID)) {
                        url = ADMIN_PAGE;
                    } else if (US.equals(roleID)) {
                        url = US_PAGE;
                    } else {
                        request.setAttribute("ERROR", "Your role is not supported yet");
                    }
                }
            }

        } catch (Exception e) {
            log("Error at LoginWithGoogleController " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
