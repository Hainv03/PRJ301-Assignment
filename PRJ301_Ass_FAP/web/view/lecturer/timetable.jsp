<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            text-decoration: none;
        }
        .box_header{
            padding: 20px 15px;
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
            <a href="http://localhost:9999/PRJ301_Ass_FAP/login"  class="label" onclick="return confirm('Are you sure you want to logout?');">
               logout 
            </a>
             | 
            <span class="label">CAMPUS: FPTU-Hòa Lạc</span>
        </div>
        <div class="box_header">
                <li>
                    <a href="http://localhost:9999/PRJ301_Ass_FAP/view/authentication/home.jsp">Home</a>
                     &nbsp;|&nbsp; 
                    <b>View Schedule</b>
                </li>
        </div>
        
        <div>
            <p>
                <b>Note:</b> These activities do not include extra-curriculum activities, such as club activities ...
            </p> 
            <p>
                <b>Chú thích:</b> Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa, ví dụ như hoạt động câu lạc bộ ...
            </p>
            <p>
                Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...
                <br>
                Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..
                <br>
                Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...
                <br>
                Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.
                <br>
                Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..
                <br>
                Little UK (LUK) thuộc tầng 5 tòa nhà Delta
            </p>
        </div>
        <form action="timetable" method="GET">
            <input type="hidden" value="${param.id}" name="id"/>
            From: <input type="date" name="from" value="${requestScope.from}"/> -
            <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/>
        </form>
        <table border="1px">
            <tr>
                <td></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        (<fmt:formatDate pattern="E" value="${d}" />)
                        ${d}</td>
                </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${ses.date eq d and ses.slot.id eq slot.id}">
                                    ${ses.group.name} - ${ses.group.subject.name}
                                    
                                    <a href="att?id=${ses.id}">
                                        <c:if test="${ses.attended}">Edit</c:if>
                                        <c:if test="${!ses.attended}">Take</c:if>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
                <br>
            <div>
                <b>More note / Chú thích thêm:</b>
                <li>(attended): Student had attended this activity / Student đã tham gia hoạt động này</li>
                <li>(absent): Student had NOT attended this activity / Student đã vắng mặt buổi này</li>
                <li>(-): no data was given / chưa có dữ liệu</li>
            </div>
                <br><!-- comment -->
            <p>
                <b>Mọi góp ý, thắc mắc xin liên hệ:</b>  Phòng dịch vụ sinh viên: Email: <a href="dichvusinhvien@fe.edu.vn" >dichvusinhvien@fe.edu.vn</a>. Điện thoại:<b>(024)7308.13.13</b>
            </p>
                <hr><!-- comment -->
             
    </body>
</html>