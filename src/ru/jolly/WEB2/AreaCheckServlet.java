package ru.jolly.WEB2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;

@WebServlet(value = "/check")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest servletRequest, HttpServletResponse servletResponse) throws ServletException, IOException {
        long start = System.currentTimeMillis();
        HttpServletRequest request = servletRequest;
        HttpServletResponse response = servletResponse;
        HttpSession session = request.getSession();
        double x, y, r;
        double testx = 10;
        double testy = 10;
        double testr = 10;
        LinkedList<ListMember> ListMembers = (LinkedList<ListMember>) session.getAttribute("results");
        if (ListMembers == null)
            session.setAttribute("results", (ListMembers = new LinkedList<>()));
        else
        {
            ListMember member = ListMembers.getLast();
            testx = member.getX();
            testy = member.getY();
            testr = member.getR();
        }
        session.setAttribute("last_result", " ");
        try {
            x = Double.parseDouble((String)request.getAttribute("parameterX"));
            y = Double.parseDouble((String)request.getAttribute("parameterY"));
            r = Double.parseDouble((String)request.getAttribute("parameterR"));
            if (!(testx == x && testy == y && testr == r)) {
                ListMembers.add(new ListMember(x, y, r, start));
                session.setAttribute("results", ListMembers);
                if (ListMembers.getLast().isSuccess())
                    session.setAttribute("last_result", "Hit");
                else
                    session.setAttribute("last_result", "Miss");
            }
        } catch (NumberFormatException e) {
            session.setAttribute("last_result", "Error");
        }
        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }
}
