/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Attendance;
import entity.Group;
import entity.Lecturer;
import entity.Room;
import entity.Session;
import entity.Student;
import entity.Subject;
import entity.TimeSlot;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author dell
 */
public class SessionDBContext extends DBContext<Session>{
    
    
    public ArrayList<Student> getStudentsBySession(int seid) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "SELECT  s.[sid],s.[sname]\n" +
                         "FROM [Student] s INNER JOIN Enrollment e ON s.[sid] = e.[sid]\n" +
                         "			 INNER JOIN [Group] g ON g.[gid] = e.[gid]\n" +
                         "			 INNER JOIN [Session] ses ON ses.[gid] = g.[gid]\n" +
                         "WHERE ses.[seid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, seid);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Student s = new Student();
                s.setId(rs.getString("sid"));
                s.setName(rs.getString("sname"));
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }
    
    public ArrayList<Attendance> getAttendencesBySession(int seid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = "SELECT s.[sid],s.[sname],\n" +
                         "	   a.[aid],a.[description],a.[isPresent],a.[DateTime]\n" +
                         "FROM [Student] s INNER JOIN [Enrollment] e ON s.[sid] = e.[sid]\n" +
                         "			 INNER JOIN [Group] g ON g.[gid] = e.[gid]\n" +
                         "			 INNER JOIN [Session] ses ON ses.[gid] = g.[gid]\n" +
                         "		        LEFT JOIN  [Attendance] a ON a.[seid] = ses.[seid] AND a.[sid] = s.[sid]\n" +
                         "WHERE ses.[seid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, seid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                Student s = new Student();
                Session ses = new Session();
                s.setId(rs.getString("sid"));
                s.setName(rs.getString("sname"));
                a.setStudent(s);

                ses.setId(seid);
                a.setSession(ses);

                a.setId(rs.getInt("aid"));
                if (a.getId() != 0) {
                    a.setDescription(rs.getString("description"));
                    a.setPresent(rs.getBoolean("isPresent"));
                    a.setTime(rs.getTimestamp("DateTime"));
                }
                atts.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }
    
    public ArrayList<Session> getBy (int lid, Date from, Date to){
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT   ses.seid, ses.isTaken, ses.Date,\n" +
                         "	       g.gid, g.gname, su.subid, su.subname,\n" +
                         "	       t.tid, t.tname,\n" +
                         "		r.rid, r.rname,\n" +
                         "		l.lid, l.lname\n" +
                         "FROM [Session] ses INNER JOIN [Group] g ON ses.gid = g.gid\n" +
                         "				   INNER JOIN [Subject] su ON su.subid = g.subid\n" +
                         "				   INNER JOIN [TimeSlot] t ON t.tid = ses.tid\n" +
                         "				   INNER JOIN [Room] r ON r.rid = ses.rid\n" +
                         "				   INNER JOIN [Lecturer] l ON l.lid = ses.lid\n" +
                         "WHERE ses.lid = ? AND ses.[Date] >= ? and ses.[Date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Session ses = new Session();
                Group g = new Group();
                Subject s = new Subject();
                TimeSlot slot = new TimeSlot();
                Room r = new Room();
                Lecturer l = new Lecturer();
                
                ses.setId(rs.getInt("seid"));
                ses.setAttended(rs.getBoolean("isTaken"));
                ses.setDate(rs.getDate("date"));
                
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                s.setId(rs.getInt("subid"));
                s.setName(rs.getString("subname"));
                g.setSubject(s);
                ses.setGroup(g);
                
                slot.setId(rs.getInt("tid"));
                slot.setName(rs.getString("tname"));
                ses.setSlot(slot);
                
                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("rname"));
                ses.setRoom(r); 
                
                l.setId(rs.getInt("lid"));
                l.setName(rs.getString("lname"));
                ses.setLecturer(l); 
                
                sessions.add(ses);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return sessions;
        
    }
}
