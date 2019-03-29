/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.filters;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Danze
 */
public class AuthFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    private final List<String> guest;
    private final List<String> customer;
    private final List<String> guide;
    private final List<String> admin;

    public AuthFilter() {
        //GUEST
        guest = new ArrayList<>();
        guest.add("");
        guest.add("''");
        guest.add("index.jsp");
        guest.add("searchTour.jsp");
        guest.add("register.jsp");
        guest.add("404NotFound.jsp");
        guest.add("searchTour");
        guest.add("searchTour.action");      
        guest.add("signIn");
        guest.add("signIn.action");
        guest.add("signUp_toPage");
        guest.add("signUp_toPage.action");
        guest.add("signUp_register");
        guest.add("signUp_register.action");
        guest.add("loginStaff.jsp");
        guest.add("signInStaff");
        guest.add("signInStaff.action");
        guest.add("viewTourDetails");
        guest.add("viewTourDetails.action");
        guest.add("tourBooking.jsp");
        guest.add("addToCart");
        guest.add("addToCart.action");

        //CUSTOMER
        customer = new ArrayList<>();
        customer.add("");
        customer.add("''");
        customer.add("index.jsp");
        customer.add("searchTour.jsp");
        customer.add("404NotFound.jsp");
        customer.add("searchTour");
        customer.add("searchTour.action");  
        customer.add("dashboard.jsp");
        customer.add("viewProfile");
        customer.add("viewProfile.action");
        customer.add("editProfile.jsp");
        customer.add("editProfile");
        customer.add("editProfile.action");
        customer.add("updateProfile");
        customer.add("updateProfile.action");
        customer.add("changePassword.jsp");
        customer.add("changePassword");
        customer.add("changePassword.action");
        customer.add("signOut");
        customer.add("signOut.action");
        customer.add("viewTourDetails");
        customer.add("viewTourDetails.action");
        customer.add("tourBooking.jsp");
        customer.add("addToCart");
        customer.add("addToCart.action");
        customer.add("viewCart");
        customer.add("viewCart.action");
        customer.add("cart.jsp");
        customer.add("updateCart");
        customer.add("updateCart.action");
        customer.add("removeTourInCart");
        customer.add("removeTourInCart.action");
        customer.add("payment.jsp");
        customer.add("checkOut");
        customer.add("checkOut.action");
        customer.add("paymentResult.jsp");
        customer.add("confirmBooking");
        customer.add("confirmBooking.action");

        //GUIDE
        guide = new ArrayList<>();
        guide.add("accessdenied.jsp");
        guide.add("homeStaff.jsp");
        guide.add("signOutStaff");
        guide.add("signOutStaff.action");
        guide.add("searchTourStaff.jsp");
        guide.add("searchTourStaff");
        guide.add("searchTourStaff.action");
        guide.add("destinationStaff.jsp");
        guide.add("viewAllDestinationsStaff");
        guide.add("viewAllDestinationsStaff.action");
        guide.add("tourStaff.jsp");
        guide.add("viewAllToursStaff");
        guide.add("viewAllToursStaff.action");
        
        //ADMIN
        admin = new ArrayList<>();
        admin.add("accessdenied.jsp");
        admin.add("homeStaff.jsp");
        admin.add("signOutStaff");
        admin.add("signOutStaff.action");
        admin.add("searchTourStaff.jsp");
        admin.add("searchTourStaff");
        admin.add("searchTourStaff.action");
        admin.add("addDestination.jsp");
        admin.add("addDestination");
        admin.add("addDestination.action");
        admin.add("destinationStaff.jsp");
        admin.add("viewAllDestinationsStaff");
        admin.add("viewAllDestinationsStaff.action");
        admin.add("addTour.jsp");
        admin.add("addTour");
        admin.add("addTour.action");
        admin.add("tourStaff.jsp");
        admin.add("viewAllToursStaff");
        admin.add("viewAllToursStaff.action");

    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        boolean isRef = uri.contains("/images/") || uri.contains("/css/") || uri.contains("/js/") || uri.contains("/fonts/");
        if (isRef) //khong can thiet phai filter cac ref
            chain.doFilter(request, response);
        else {
            int index = uri.lastIndexOf("/") + 1;
            String resource = uri.substring(index);
            if (resource.contains(";jsessionid=")) {
                resource = resource.substring(0, resource.indexOf(";jsessionid="));
            }

            HttpSession session = req.getSession();
            if (session == null || session.getAttribute("ROLE") == null) {
                if (guest.contains(resource)) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("404NotFound.jsp");
                }
            } else if (session.getAttribute("ROLE").equals("customer")) {
                if (customer.contains(resource)) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("404NotFound.jsp");
                }
            } else if (session.getAttribute("ROLE").equals("guide")) {
                if (guide.contains(resource)) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("accessdenied.jsp");
                }
            } else if (session.getAttribute("ROLE").equals("admin")) {
                if (admin.contains(resource)) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("accessdenied.jsp");
                }
            }
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
