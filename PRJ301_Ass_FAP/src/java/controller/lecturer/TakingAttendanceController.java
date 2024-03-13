/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecturer;

import controller.authentication.BaseReqAuthentication;
import dal.SessionDBContext;
import entity.Account;
import entity.Attendance;
import entity.Session;
import entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class TakingAttendanceController extends BaseReqAuthentication {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int seid = Integer.parseInt(req.getParameter("id"));
        SessionDBContext db = new SessionDBContext();
        ArrayList<Student> students = db.getStudentsBySession(seid);
        ArrayList<Attendance> atts = new ArrayList<>();
        Session session = new Session();
        session.setId(seid);
        for (Student student : students) {
            Attendance a = new Attendance();
            a.setSession(session);
            a.setStudent(student);
            a.setDescription(req.getParameter("description"+student.getId()));
            a.setPresent(req.getParameter("present"+student.getId()).equals("yes"));
            atts.add(a);
        }
        db.takeAttendances(seid, atts);
        resp.sendRedirect("att?id="+seid);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int seid = Integer.parseInt(req.getParameter("id"));
        SessionDBContext db = new SessionDBContext();
        ArrayList<Attendance> atts = db.getAttendencesBySession(seid);
        req.setAttribute("atts", atts);
        req.getRequestDispatcher("/view/lecturer/att.jsp").forward(req, resp);
    
    }
}
