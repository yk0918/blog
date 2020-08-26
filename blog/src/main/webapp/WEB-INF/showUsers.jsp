<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>显示微博</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        form{
            display: inline-block;
        }
    </style>
    <script src="../jquery-1.8.3/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        window.onload=function tablecolor(){
            var tab= document.getElementById("tab");
            var trs = tab.getElementsByTagName("tr");
            for(var i=0;i<=trs.length;i++){
                //偶数行时执行
                if(i%2 == 0){
                    trs[i].style.backgroundColor="white";
                }
                else{
                    trs[i].style.backgroundColor="lightblue";

                }
            }
        }

        function jump_to(frm,inputPage){
            var input1=document.getElementById("input1");
            var input2=document.getElementById("input2");
            var zengze=/^[+]{0,1}(\d+)$/;
            //获取页面的总数
            var totalPageCount=input2.value;
            input1.value=inputPage;
            if(!zengze.test(inputPage)){//如果不是数字
                alert("输入的不是正整数或数字！");
                return false;
            }
            if(parseInt(inputPage)<=parseInt(totalPageCount) && parseInt(inputPage)>=1){
                frm.submit();
            }else{
                alert("输入的数字不在页数范围内！");
                return false;
            }
        }
    </script>
</head>
<body>
<h1>微博系统管理员欢迎您！</h1>
<div class="container-fluid">
    <div style="margin-left: 450px"><h1>微博详细信息列表</h1></div>

    <div class="login-form  col-lg-8 col-lg-offset-2  col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2 ">
        <table id="tab" class="table table-bordered">
            <tr>
                <td>用户名</td>
                <td>昵称</td>
                <td>手机</td>
                <td>地址</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${requestScope.usersList}" var="users" >
                <tr>
                    <td>${users.username}<img src="${pageContext.request.contextPath}/upload/${users.picpath}" height="50px" wid/></td>
                    <td>${users.nickname}</td>
                    <td>${users.mobile}</td>
                    <td>${users.address}</td>
                    <td>
                        <form id="form1" action="/users/getAllPages" method="post">
                            <input id="input1" type="hidden" name="number" value="1"/>
                            <input id="input2" type="hidden" name="totalPageCount" value="${pageInfo.pages}"/>
                        </form>
                        <form action="/users/to_updateUser?id=${users.id}" method="post">
                        <button class="btn btn-primary btn-sm ">
                            <span class="glyphicon glyphicon-pencil">修改</span>
                        </button>&nbsp;
                        </form>

                            <button class="btn btn-primary btn-sm " onclick="javascript:if(confirm('是否删除？'))
                                window.location='${pageContext.request.contextPath}/users/delUsers?id=${users.id}'">
                               <span class="glyphicon glyphicon-pencil">删除</span>
                            </button>&nbsp;&nbsp;
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div align="center">
            <form action="/users/to_addUsers" method="get">
            <button class="btn btn-primary btn-sm ">
                <span class="glyphicon glyphicon-pencil">新增用户</span>
            </button>
            </form>
            共${pageInfo.total}条记录 每页2条 第${pageInfo.pageNum}页/共${pageInfo.pages}页
            <a href="${pageContext.request.contextPath}/users/getAllPages?number=1">第一页</a>
            <a href="${pageContext.request.contextPath}/users/getAllPages?number=${pageInfo.prePage}">上一页</a>
            <c:forEach items="${pageInfo.navigatepageNums}" var="number">
                <a href="${pageContext.request.contextPath}/users/getAllPages?number=${number}">${number}</a>
            </c:forEach>
            <a href="${pageContext.request.contextPath}/users/getAllPages?number=${pageInfo.nextPage}">下一页</a>
            <a href="${pageContext.request.contextPath}/users/getAllPages?number=${pageInfo.pages}">最后一页</a>

            <span class="page-go-form"><label>转到第</label>
	        <input type="text"  id="inputPage" value=""/>页
	        <button type="button" onclick="jump_to(document.forms[0],document.getElementById('inputPage').value)">GO</button>
		    </span>
        </div>
    </div>
</div>
</body>
</html>
