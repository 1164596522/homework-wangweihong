<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上架商品</title>
</head>
<body>
<script>
    $(function () {
        $("#addbtn").click(function () {
            var param = $("#addForm").serialize();
            $.post("/phone/add", param, function (data) {
                alert(data);
                $("#addForm")[0].reset();
            });
        });
    })
</script>
<form action="/phone/add" id="addForm">
    <input type="text" name="id" class="form-control" placeholder="id" aria-describedby="sizing-addon1"></br>
    <input type="text" name="name" class="form-control" placeholder="产品名称" aria-describedby="sizing-addon1"></br>
    <input type="text" name="colour" class="form-control" placeholder="机身颜色" aria-describedby="sizing-addon1"></br>
    <input type="text" name="price" class="form-control" placeholder="价格" aria-describedby="sizing-addon1"></br>
    <input type="text" name="company" class="form-control" placeholder="生产厂商" aria-describedby="sizing-addon1"></br>
    <input type="text" name="timetomarket" class="form-control" placeholder="上市时间"
           aria-describedby="sizing-addon1"></br>
    <input type="text" name="inventory" class="form-control" placeholder="库存" aria-describedby="sizing-addon1"></br>
    <button type="button" class="btn btn-success" id="addbtn">上架</button>
</form>
</body>
</html>
