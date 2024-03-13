<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT University Academic Portal</title>
    </head>
    <body>
        <div>
            <h2>FPT University Academic Portal </h2>
        </div> <br>
        <div>
            <p>
                <b>Note:</b> These activities do not include extra-curriculum activities, such as club activities ...
            </p> 
            <p>
                <b>Chú thích:</b> Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa, ví dụ như hoạt động câu lạc bộ ...
            </p>
            <p>
                Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br>
                Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br>
                Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br><!-- comment -->
                Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br><!-- comment -->
                Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br><!-- comment -->
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