package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import entity.User;
import javax.ejb.EJB;
import session.UserFacade;

@WebFilter(servletNames = {"Controller", "User", "Admin"})
public class UserSessionFilter implements Filter {

    @EJB
    private UserFacade userFacade;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        String username = req.getRemoteUser();

        // if session doesn't exist, forward user to welcome page
        if (username != null && req.getSession().getAttribute("user") == null) {
            // First-time login. You can do your thing here.
            User user =  userFacade.find(username);
            req.getSession().setAttribute("user", user);
        } else if (username == null && req.getSession().getAttribute("user") != null) {
            req.getSession().setAttribute("user", null);
        }

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}

}