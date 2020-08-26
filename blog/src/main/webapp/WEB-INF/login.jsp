<%--
  Created by IntelliJ IDEA.
  User: 杨凯
  Date: 2020/5/27
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
   <form action="/login" method="post">
       用户：<input id="username" name="username"/><br/><br/>
       密码：<input type="password" id="password" name="password"/><br/><br/>
   <input type="submit" name="summit" value="登录"><span></span>
   </form>
</body>
</html>
