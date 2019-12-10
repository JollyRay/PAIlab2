package ru.jolly.WEB2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/welcome"})
public class ControllerServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            if (request.getParameter("myCheckboxR[]") != null && request.getParameter("myCheckboxX[]") != null && request.getParameter("parameterY") != null) {
                request.setAttribute("parameterR", request.getParameter("myCheckboxR[]"));
                request.setAttribute("parameterX", request.getParameter("myCheckboxX[]"));
                request.setAttribute("parameterY", request.getParameter("parameterY"));
                request.getRequestDispatcher("check").forward(request, response);
            }

    }
}
