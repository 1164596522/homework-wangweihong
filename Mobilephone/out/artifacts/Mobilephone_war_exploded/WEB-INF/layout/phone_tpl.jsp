<%@taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><sitemesh:title /></title>
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../assets/css/bootstrap-theme.css" rel="stylesheet">
    <link href="../../assets/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="../../assets/css/dashboard.css" rel="stylesheet">
    <sitemesh:head />
    </head>
    <body>
    <script src="../../assets/js/jquery-1.11.3.min.js"></script>
    <script src="../../assets/js/bootstrap.js"></script>
        <%@include file="phone_nav.jsp"%>
        <div class="container-fluid">
        <div class="row">
        <%@include file="phone_menu.jsp"%>
        <%@include file="phone_body.jsp"%>
        </div>
        </div>
    </body>
</html>