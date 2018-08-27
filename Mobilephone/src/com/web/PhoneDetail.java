package com.web;

import com.dao.PhoneDAO;
import com.dao.PhoneSQLserver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/phone/detail")
public class PhoneDetail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] ids = request.getParameterValues("id");
        PhoneDAO phoneDAO = new PhoneSQLserver();
        int num = phoneDAO.delPhoneById(ids);
        String str = "成功下架"+num+"件商品";
        response.getWriter().write(str);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
