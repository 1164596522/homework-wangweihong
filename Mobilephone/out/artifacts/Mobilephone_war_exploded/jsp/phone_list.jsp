<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>图书列表</title>
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
    <script type="text/javascript">
        $(function () {
            $.get("/phone/index",function (data) {
                $("tr:gt(0)").remove();
                $.each(data,function (i,v) {
                    var $tr = $("<tr>").appendTo("#phoneTable");
                    $tr.append("<td>"+v.id+"</td>");
                    $tr.append("<td>"+v.name+"</td>");
                    $tr.append("<td>"+v.colour+"</td>");
                    $tr.append("<td>"+v.price+"</td>");
                    $tr.append("<td>"+v.company+"</td>");
                    $tr.append("<td>"+v.timetomarket+"</td>");
                    $tr.append("<td>"+v.inventory+"</td>");
                });
            },"json");
        });
    </script>
</table>
</body>
</html>
