package com.web;

import com.dao.PhoneDAO;
import com.dao.PhoneSQLserver;
import com.entity.Phone;
import sun.awt.SunGraphicsCallback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(value = "/phone/add")
public class PhoneAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PhoneDAO phoneDAO = new PhoneSQLserver();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String colour = request.getParameter("colour");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String company = request.getParameter("company");
        String timetomarket = request.getParameter("timetomarket");
        int inventory = Integer.parseInt(request.getParameter("inventory"));
        Phone phone = new Phone(id,name,colour,price,company,timetomarket,inventory);
        int data = phoneDAO.add(phone);
        String str = "成功上架"+data+"件商品";
        response.getWriter().write(str);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
