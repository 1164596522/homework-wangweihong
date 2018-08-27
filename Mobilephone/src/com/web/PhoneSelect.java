package com.web;

import com.dao.PhoneDAO;
import com.dao.PhoneSQLserver;
import com.entity.Phone;
import com.google.gson.Gson;
import com.sun.xml.internal.ws.api.ha.StickyFeature;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.chrono.JapaneseDate;
import java.util.List;

@WebServlet( "/phone/select")
public class PhoneSelect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String str = request.getParameter("name");
        PhoneDAO phoneDAO = new PhoneSQLserver();
        List<Phone> list = phoneDAO.getphone(str);
        request.setAttribute("list",list);
        request.getRequestDispatcher("/jsp/phone_select.jsp").forward(request,response);
    }

}
