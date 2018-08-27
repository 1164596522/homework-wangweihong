<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
                <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">猪头干活啦！</a>
                </div>
                <form action="/phone/select" class="navbar-form navbar-right" method="post">
                        <input type="text" class="form-control" placeholder="查询条件(手机名称)" id="phonetext" value="" name="name"/>
                        <button id="selecttbn" type="submit" class="btn btn-primary">查询</button>
                </form>
        </div>
</nav>