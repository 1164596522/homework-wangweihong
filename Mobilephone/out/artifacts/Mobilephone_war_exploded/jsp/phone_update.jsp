<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新商品</title>
    <style>
        #updatePage{
            position:absolute;
            width: 300px;
            height: 500px;
            top: 20px;
            left: 350px;
            background-color: #CEECF0;
            border:1px solid black;
            padding:30px;
            display: none;
        }
        #updatePage *{
            margin:10px 0px;
        }
    </style>
</head>
<body>
<table class="table table-hover" id="phoneTable">
    <tr class="info">
        <td><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></td>
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
            $.get("/phone/index",function (data) {
                $("tr:gt(0)").remove();
                $.each(data,function (i,v) {
                    var $tr = $("<tr>").appendTo("#phoneTable");
                    $tr.append("<td><input name='phone' type='checkbox'></td>");
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
            loadData();

            $("#updatePageBtn").click(function () {
                $(":checkbox").each(function(index,obj){
                    if(obj.checked){
                        var $tr = $(obj).parent().parent();
                        updateForm.id.value = $tr.children("td:eq(1)").text();
                        updateForm.name.value = $tr.children("td:eq(2)").text();
                        updateForm.colour.value = $tr.children("td:eq(3)").text();
                        updateForm.price.value = $tr.children("td:eq(4)").text();
                        updateForm.company.value = $tr.children("td:eq(5)").text();
                        updateForm.timetomarket.value = $tr.children("td:eq(6)").text();
                        updateForm.inventory.value = $tr.children("td:eq(7)").text();
                        return false;
                    }
                });
                $("#updatePage").fadeIn(1000);
            });

            $("#cancelBtn").click(function(){
                $("#updatePage").fadeOut(1000);
            });

            $("#updateBtn").click(function(){
                var param = $("#updateForm").serialize();
                $.post("/phone/updeate",param,function(data){
                    alert(data);
                    $("#updatePage").hide();
                    loadData();
                    addForm.reset();
                });

            });

        });
    </script>
</table>
<button type="button" id="updatePageBtn" class="btn btn-info">更新</button>
<div id="updatePage">

    <h2 align="center">更新商品</h2>

    <form id="updateForm" name="updateForm">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;id：<input type="text" value="" readonly="readonly" name="id"></br>
        产品名称：<input type="text" name="name"></br>
        机身颜色：<input type="text" name="colour"></br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格：<input type="text" name="price"></br>
        生产厂商：<input type="text" name="company"></br>
        上市时间：<input type="text" name="timetomarket"></br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;库存：<input type="text" name="inventory"></br>
        <div align="center">
            <input id="updateBtn" type="button" value="更新"/>
            <input id="cancelBtn" type="button" value="取消"/>
        </div>
    </form>

</div>
</body>
</html>
