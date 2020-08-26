<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>添加图书页面</title>
    <script src="../jquery-1.8.3/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        function checkname() {
            var name = $("#bookname").val();
            if (name == null || name == "") {
                alert("书名不能为空！");
            }
        }
        function checkauthor() {
            var name = $("#author").val();
            if (name == null || name == "") {
                alert("作者不能为空！");
            }
        }
        function checkpublish() {
            var name = $("#publish").val();
            if (name == null || name == "") {
                alert("出版社不能为空！");
            }
        }
        function checkpublishdate() {
            var name = $("#publishdate").val();
            if (name == null || name == "") {
                alert("出版时间不能为空！");
            }
        }
    </script>
</head>

<body>
<div id="wrap" >
    <form action="${pageContext.request.contextPath}/users/addUsers" method="post">

        <div><h1>添加用户</h1></div>
        <td>用户名</td>
        <td>昵称</td>
        <td>手机</td>
        <td>地址</td>
        <td>操作</td>
        <div>
            用户名(*)
            <input onblur="checkname()" name="username" id="username" />
        </div>
        <div>
            昵称(*)
            <input onblur="checkauthor()" name="nickname" id="nickname"/>
        </div>
        <div>
            手机(*)
            <input onblur="checkpublish()" name="mobile" id="mobile"/>
        </div>
        <div>
            地址(*)
            <input onblur="checkpublishdate()" name="publishdate" id="publishdate"/>
        </div>
        <div>
            操作
            <input name="page"/>
        </div>

            <input type="submit" value="提交"/>
            <input type="button" value="返回" onclick="javaScript:location.href='${pageContext.request.contextPath}/users/to_frame'"/>
    </form>
</div>
</body>
</html>
