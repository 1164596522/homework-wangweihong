package com.web;

import com.dao.PhoneDAO;
import com.dao.PhoneSQLserver;
import com.entity.Phone;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/phone/select")
public class PhoneSelect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String str = request.getParameter("name");
        request.setAttribute("Name",str);
        request.getRequestDispatcher("/jsp/phone_select.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String str = request.getParameter("name");
        System.out.println(str);
        PhoneDAO phoneDAO = new PhoneSQLserver();
        List<Phone> list = phoneDAO.getphone(str);
        response.getWriter().write(new Gson().toJson(list));
    }
}
