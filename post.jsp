<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.DBObject"%>
<%@ page import="java.io.File"%>
<%@ page import="com.mongodb.gridfs.*"%>

<%
String luname=request.getParameter("uname");
String ltitle=request.getParameter("title");
String lcomment=request.getParameter("comment");

MongoClient mongoclient=new MongoClient("localhost",27017);
DB db=mongoclient.getDB("test");
DBCollection col=db.createCollection("blog",null);

BasicDBObject y=new BasicDBObject("uname",luname).append("title",ltitle).append("comment",lcomment);
col.insert(y);
%>
<form action="blog.jsp">
<input type="Submit" value="refresh"/>
</form>



