<%--
  Created by IntelliJ IDEA.
  User: zhuhuixiu
  Date: 2020/2/24
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>添加课程页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../jquery-1.8.3/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="login-form  col-lg-4 col-lg-offset-4  col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2 ">
        <form id="myForm" class="form-horizontal"  enctype="multipart/form-data" action="${pageContext.request.contextPath}/users/addUsers" method="post" >
            <div class="form-group">
                <label for="username">用户名:</label>
                <input type="text" class="form-control" value="" name="username" id="username">
            </div>
            <div class="form-group">
                <label for="password">密码：</label>
                <input type="text" class="form-control" value="" name="password" id="password">
            </div>
            <div class="form-group">
                <label for="nickname">昵称：</label>
                <input type="text" class="form-control" value="" name="nickname" id="nickname">
            </div>
            <div class="form-group">
                <label for="age">年龄：</label>
                <input type="text" class="form-control" value="" name="age" id="age">
            </div>
            <div class="form-group">
                <label for="sex">性别：</label>
                <select id="sex" name="sex">
                    <option>请选择</option>
                    <option selected value="0">男</option>
                    <option value="1">女</option>
                </select>
            </div>

            <div class="form-group">
                <label for="mobile">手机：</label>
                <input type="text" class="form-control" value="" name="mobile" id="mobile">
            </div>
            <div class="form-group">
                <label for="address">地址：</label>
                <input type="text" class="form-control" value="" name="address" id="address">
            </div>
            <div class="form-group">
                <label for="picpath">头像：</label>
                <input type="file" class="form-control" name="picpath_a" id="picpath">
            </div>
            <button type="submit"  class="btn btn-default">提交</button>
            <button type="reset" onclick="javascript:window.history.go(-1);" class="btn btn-default">返回</button>

        </form>
    </div>
</div>

<script type="text/javascript">
   $(function () {
    $("#myForm").submit(function () {
        //默认可以提交
        var flag=true;
        if(!checkUsername()){
            flag=false;
        }else if(!checkPassword()){
            flag=false;
        }else if(!checkNickname()){
            flag=false;
        }
        return flag;
    })
    function checkUsername() {
        var username=$("#username").val();
        if(username=='' || username==null ||username==undefined){
            alert("用户名不能为空！");
            return false;
        }else {
            return true;
        }
    }

    function checkPassword() {
        var password=$("#password").val();
        if(password=='' || password==null ||password==undefined){
            alert("密码不能为空！");
            return false;
        }else {
            return true;
        }
    }
    function checkNickname() {
        var nickname=$("#nickname").val();
        if(nickname=='' || nickname==null ||nickname==undefined){
            alert("昵称不能为空！");
            return false;
        }else {
            return true;
        }
    }

})
</script>
</body>
</html>
