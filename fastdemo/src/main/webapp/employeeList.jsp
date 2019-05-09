<%--
  Created by IntelliJ IDEA.
  User: Lycn
  Date: 2019/4/13
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script src="js/jquery-1.7.js"></script>
<script>
</script>
<head>
    <title>Title</title>
</head>
<script>
    $(function(){
        var s =${criteria.orderL}+""

        if(s=="1"){
            $(this).val(${criteria.orderL});
            $("#order").attr("checked",true)
            $("#huan").html("当前为降序排列");
        }

        $("#order").click(function(){



            $(this).val("1");
            $("#fr").submit();
        });

       $.post(
           "countryList",
           function(obj){
               for(var i in obj){
                   $("#country").append("<option value='"+obj[i].countryId+"'>"+obj[i].countryName+"</option>");
               }
           }
       );
    });
    function locaS(){
        $("#loca"). empty();
        $("#department"). empty();
        var coutryId = $("#country").val();
        $.post(
            "locaList",
            {coutryId:coutryId},
            function(obj){
                for(var i in obj){
                    $("#loca").append("<option value='"+obj[i].locationId+"'>"+obj[i].streetAddress+"</option>");
                }
            }
        );
    }
    function departS(){
        $("#department"). empty();
        var locaId = $("#loca").val();
        $.post(
            "departmentList",
            {locaId:locaId},
            function(obj){
                for(var i in obj){
                    $("#department").append("<option value='"+obj[i].departmentId+"'>"+obj[i].departmentName+"</option>");
                }
            }
        );
    }

</script>
<body>
    <table width="1000px" border="1" align="center">
        <tr>
            <td colspan="99">
                <form action="list" method="post" id="fr">

                    名字:<input type="text" name="employeeName">&nbsp;

                    所属国家:<select  id="country" onchange="locaS()">

                        </select>
                    地址:<select  id="loca" onchange="departS()">

                        </select>
                    部门:<select name="departmentId" id="department">

                    </select>&nbsp;

                    入职日期:<input type="date" name="startDate">至
                    <input type="date" name="endDate"><br>

                    薪资:<select name="compareS">
                    <option value="2">大于</option>
                    <option value="1">等于</option>
                    <option value="0">小于</option>
                </select>
                    <input type="text" name="salary">&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="搜索">
                </form>

            </td>
        </tr>
        <tr>
            <td>序号</td>
            <td>部门</td>
            <td>员工名称</td>
            <td>邮箱</td>
            <td>电话号码</td>
            <td>入职日期</td>
            <td>薪资</td>
            <td>办公地址</td>
            <td>所属国家</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${employeeList}" var="l">
            <tr>
                <td>${l.employeeId}</td>
                <td>${l.departmentName}</td>
                <td>${l.name}</td>
                <td>${l.email}</td>
                <td>${l.phoneNumber}</td>
                <td>${l.hireDate}</td>
                <td>${l.salary}</td>
                <td>${l.streetAddress}</td>
                <td>${l.countryName}</td>
                <td>
                    <input type="button" value="修改">
                </td>
            </tr>
        </c:forEach>
        <tr><td colspan="99">${page.pageStr}</td></tr>
    </table>
</body>
</html>
