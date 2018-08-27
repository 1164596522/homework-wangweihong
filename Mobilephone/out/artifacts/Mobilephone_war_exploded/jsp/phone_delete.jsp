<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table table-hover" id="phoneTable">
    <tr class="info">
        <td><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></td>
        <td>id</td>
        <td>产品名称</td>
        <td>机身颜色</td>
        <td>价格</td>
        <td>生产厂商</td>
        <td>上市时间</td>
        <td>库存</td>
    </tr>
    <script type="text/javascript">
        function loadData(){
            $("tr:gt(0)").remove();
            $.get("/phone/index",function (data) {
                $.each(data,function (i,v) {
                    var $tr = $("<tr>").appendTo("#phoneTable");
                    $tr.append("<td><input name='id' type='checkbox' value='"+v.id+"'></td>");
                    $tr.append("<td>"+v.id+"</td>");
                    $tr.append("<td>"+v.name+"</td>");
                    $tr.append("<td>"+v.colour+"</td>");
                    $tr.append("<td>"+v.price+"</td>");
                    $tr.append("<td>"+v.company+"</td>");
                    $tr.append("<td>"+v.timetomarket+"</td>");
                    $tr.append("<td>"+v.inventory+"</td>");
                });
            },"json");
        }
        $(function () {
            loadData()
            $("#delbtn").click(function () {
                var param = $(":checkbox[name='id']").serialize();
                $.post("/phone/detail",param,function(data){
                    alert(data);
                    loadData()
                });
            });

            $("#delallbtn").click(function () {
                $.post("/phone/delall",function(data){
                    alert(data);
                    loadData()
                });
            });

        });
    </script>
</table>
<input type="button" class="btn btn-danger" value="全部下架" id="delallbtn">&nbsp&nbsp<input type="button" class="btn btn-danger" value="下架所选" id="delbtn">
</body>
</html>
