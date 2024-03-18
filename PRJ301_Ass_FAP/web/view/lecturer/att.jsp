<%-- 
    Document   : att
    Created on : Mar 11, 2024, 4:49:48 AM
    Author     : dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
    </head>
    <style>
        body{
            margin: auto;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            line-height: 1.42857143;
            color: #333;
        }
        .h1{
            font-family: inherit;
            font-weight: 500;
            line-height: 1.1;
            color: inherit;
        }
        .header{
            display: flex;
            justify-content: space-around;
        }
        .image a{
            margin: 0 20px;
        }
        .div{
            display: block;
        }
        .div.info {
            float: right;
            margin-right: 16px; 
            padding: 5px; 
        }

        .label {
            color: #ffffff;
            border: 1px solid #7cb342;
            background-color: #4caf50;
            text-decoration: none;
        }
        .box_header{
            padding: 15px 15px;
            margin-bottom: 40px;
            list-style: none;
            background-color: #f5f5f5;
            border-radius: 4px;
        }
        a{
            color: #337ab7;
            text-decoration: none;
            background-color: transparent;
        }
        .footer{
            text-align: center;
        }
        .main_function{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 800px; 
            margin: auto; 
        }

        thead {
            background-color: #6b90da; 
            color: black; 
        }

        th, td {
            padding: 20px; 
            border: 1px solid #dddddd; 
            text-align: left; 
        }

        tr:nth-child(even) {
            background-color: #f2f2f2; 
        }

        .save_data {
        text-align: center;
        margin-top: 20px; 
        }

        .save_data input[type="submit"] {
            padding: 10px 20px; 
            background-color: #6b90da; 
            color: white; 
            border: none; 
            border-radius: 5px; 
            cursor: pointer; 
            transition: background-color 0.3s; 
        }

        .save_data input[type="submit"]:hover {
            background-color: #5a7eb8; 
        }
    </style>
    <body>
            <div class="header">
                <h1>
                    <span>FPT University Academic Portal</span>
                </h1>
            <div class="image">
                    <a href="https://apps.apple.com/us/app/myfap/id1527723314">
                    <img src="https://fap.fpt.edu.vn/images/app-store.png" >
                </a>
                <a href="https://play.google.com/store/apps/details?id=com.fuct">
                    <img src="https://fap.fpt.edu.vn/images/play-store.png" >
                </a>
            </div>
            </div>
        
            <div class="info" style="float:right; margin-right: 16px;">
                <a>
                   <span class="label">hainvhe170492</span> 
                </a>
                 | 
                <a href="http://localhost:9999/PRJ301_Ass_FAP/logout"  class="label" onclick="return confirm('Are you sure you want to logout?');">
                   logout 
                </a>
                 | 
                <span class="label">CAMPUS: FPTU-Hòa Lạc</span>
            </div>
            <div class="box_header">
                    <li>
                        <a href="http://localhost:9999/PRJ301_Ass_FAP/timetable?id=1">View Schedule</a>
                         &nbsp;|&nbsp; 
                        <b>Attendance</b>
                    </li>
            </div>
            <div class="main_function">
                <form action="att" method="POST">
                                <input type="hidden" name="id" value="${param.id}" />
                    <table border="1px">
                        <thead>
                            <tr>
                                <td>Student ID</td>
                                <td>Student Name</td>
                                <td>Presented</td>
                                <td>Description</td>
                                <td>Time</td>
                            </tr>
                        <thead/>
                        <tbody>
                            <c:forEach items="${requestScope.atts}" var="a">
                                <tr>
                                    <td>${a.student.id}</td>
                                    <td>${a.student.name}</td>
                                <td>
                                    <input type="radio" 
                                                ${!a.present?"checked=\"checked\"":""}
                                                name="present${a.student.id}" value="no" id="absent${a.student.id}" /> 
                                        <label for="absent${a.student.id}" style="color: red;">Absent</label>

                                    <input type="radio" 
                                                ${a.present?"checked=\"checked\"":""}
                                                name="present${a.student.id}" value="yes" id="attended${a.student.id}" /> 
                                        <label for="attended${a.student.id}" style="color: #7cb342;">Attended</label>
                                </td>
                                    <td>
                                        <input type="text" name="description${a.student.id}" value="${a.description}" />
                                    </td>
                                    <td>
                                        ${a.time}
                                    </td>
                                </tr>    
                            </c:forEach>
                        <tbody/>
                    </table>
            <div class="save_data" >
                <input type="submit" value="Save"/>
            </div>  
                </form>
            </div>
                
                <p>
                    <b>Mọi góp ý, thắc mắc xin liên hệ:</b>  Phòng dịch vụ sinh viên: Email: <a href="dichvusinhvien@fe.edu.vn" >dichvusinhvien@fe.edu.vn</a>. Điện thoại:<b>(024)7308.13.13</b>
                </p>
            <hr/>
            <div class="footer">
                <p>© Powered by <a href="https://fpt.edu.vn/">FPT University</a> |  <a href="https://cmshn.fpt.edu.vn/">CMS</a> |  <a href="https://library.fpt.edu.vn/">library</a> |  <a href="https://library.books24x7.com/login.asp?ic=0">books24x7</a></p>
            </div>
    </body>
</html>
