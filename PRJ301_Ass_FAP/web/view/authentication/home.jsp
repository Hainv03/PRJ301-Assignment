<%-- 
    Document   : home
    Created on : Mar 15, 2024, 3:55:54 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT University Academic Portal</title>
    </head>
    <style>
        .body{
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
        }
        .box_header{
            padding: 20px 15px;
            margin-bottom: 40px;
            list-style: none;
            background-color: #f5f5f5;
            border-radius: 4px;
        }
        .box_body h3{
            height: 34px;
            line-height: 34px;
            display: inline-block;
            position: absolute;
            left: 30px;
            top: 130px;
            padding: 0 15px;
            color: #ffffff;
            border-radius: 5px 5px 0 0;
        }
        .OrangeTilte{
            background-position: 0 -400px;
            background-color: #ef8d01;
        }
        h3{
            font-size: 24px;
            margin-top: 20px;
            margin-bottom: 10px;
            font-family: inherit;
            font-weight: 500;
        }
        .footer{
            text-align: center;
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
            <a class="label">
               logout 
            </a>
             | 
            <span class="label">CAMPUS: FPTU-Hòa Lạc</span>
        </div>
        <div class="box_header"></div>
        <br/>
        <div class="box_body" style="width: 60%;" >
            <h3 class="OrangeTilte">Academic Information</h3>
        </div>
        
        <div class="" >
            <ul type="disc" >
                <li>  
                    <a href="http://localhost:9999/PRJ301_Ass_FAP/timetable?id=1">Weekly timetable</a> (Thời khóa biểu từng tuần) 
                </li>
            </ul>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <div>
            <p>
                <b>Mọi góp ý, thắc mắc xin liên hệ:</b>  Phòng dịch vụ sinh viên: Email: <a href="dichvusinhvien@fe.edu.vn" >dichvusinhvien@fe.edu.vn</a>. Điện thoại:<b>(024)7308.13.13</b>
            </p>
        </div>
        <hr>
        <div class="footer">
            <p>© Powered by <a href="https://fpt.edu.vn/">FPT University</a> |  <a href="https://cmshn.fpt.edu.vn/">CMS</a> |  <a href="https://library.fpt.edu.vn/">library</a> |  <a href="https://library.books24x7.com/login.asp?ic=0">books24x7</a></p>
        </div>
    </body>
</html>
