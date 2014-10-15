<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.DBObject"%>

<%

MongoClient mongoclient=new MongoClient("localhost",27017);

DB db=mongoclient.getDB("test");
DBCollection col=db.createCollection("login",null);

String lu=request.getParameter("nuname");
String lp=request.getParameter("npasswd");
String lc=request.getParameter("cpasswd");
if(lp.equals(lc))
{
BasicDBObject x=new BasicDBObject("uname",lu).append("passwd",lp);
col.insert(x);
%>
<h3>User added successfully<h3>
<%
}
else
{
%>
<h3>User not added please tetry<h3>
<%
}
%>

