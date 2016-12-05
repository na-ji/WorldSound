package controller;

import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import session.UserFacade;
import validate.Validator;

@WebServlet(
    name = "User",
    loadOnStartup = 1,
    urlPatterns = {
        "/register"
    }
)
public class UserServlet extends HttpServlet {

    @EJB
    private UserFacade userFacade;

    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        
        // use RequestDispatcher to forward request internally
        String url = "/login/register.jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");  // ensures that user input is interpreted as
                                                // 8-bit Unicode (e.g., for Czech characters)

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        Validator validator = new Validator();

        // if register action is called
        if (userPath.equals("/register")) {

            // extract user data from request
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");

            // validate user data
            boolean validationErrorFlag = false;
            validationErrorFlag = validator.validateFormUser(username, email, password1, password2, request);

            // if validation error found, return user to registration
            if (validationErrorFlag) {
                request.setAttribute("validationErrorFlag", validationErrorFlag);
                userPath = "/register";

            // otherwise, save user to database
            } else {
                User user = userFacade.addUser(username, email, password1);
                
                request.login(user.getUsername(), password1);
                
                response.sendRedirect("/");
                
                return;
            }
        }
        
        String url = "/login" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
