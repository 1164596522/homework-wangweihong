<%@ page import="java.lang.reflect.Array" %>
<%@ page import="com.entity.Phone" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 灵遥
  Date: 2018/8/27
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询手机</title>
</head>
<body>
<table class="table table-hover" id="phoneTable">
    <tr class="info">
        <td>id</td>
        <td>产品名称</td>
        <td>机身颜色</td>
        <td>价格</td>
        <td>生产厂商</td>
        <td>上市时间</td>
        <td>库存</td>
    </tr>
    <%
        List<Phone> list = (List<Phone>) request.getAttribute("list");
        for (int i = 0; i <list.size() ; i++) {
            Phone phone=list.get(i);
    %>
    <tr class="info">
        <td><%=phone.getId()%></td>
        <td><%=phone.getName()%></td>
        <td><%=phone.getColour()%></td>
        <td><%=phone.getPrice()%></td>
        <td><%=phone.getCompany()%></td>
        <td><%=phone.getTimetomarket()%></td>
        <td><%=phone.getInventory()%></td>
    </tr>

            <%
        }
    %>
</table>
</body>
</html>
