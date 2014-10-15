
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.DBObject"%>
<%@ page import="com.mongodb.gridfs.*"%>
<%@ page import="java.io.File"%>

<%

MongoClient mongoclient=new MongoClient("localhost",27017);

DB db=mongoclient.getDB("test");
DBCollection col=db.createCollection("login",null);


String luname=request.getParameter("uname");
String lpasswd=request.getParameter("passwd");
String lsrc=request.getParameter("src");

BasicDBObject x=new BasicDBObject("uname",luname).append("passwd",lpasswd);
DBCursor cursor=col.find(x);
if(cursor.hasNext()==false)
{
out.println("user not available");
}
else
{
%>
<body><h1>Blog</h1></body>
<%
	DBCollection col1=db.createCollection("blog",null);
	if(lsrc!="")
	{
		 File imageFile = new File(lsrc);
		 String newFileName = "newi";
         // create a "photo" namespace
         GridFS gfsPhoto = new GridFS(db, "photo");
         // get image file from local drive
         GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);
         // set a new filename for identify purpose
         gfsFile.setFilename(newFileName);
         // save the image file into mongoDB
         gfsFile.save();                     
			// get image file by it's filename
         GridFSDBFile imageForOutput = gfsPhoto.findOne(newFileName);
         // save it into a new image file
         imageForOutput.writeTo("/home/archbloom/apache-tomcat-8.0.9/webapps/ROOT/blog_jsp/abc1.jpg");
%>
<img src="abc1.jpg" alt="Image file" style="width:304px;height:228px">
<%
	}
	DBCursor cursor1=col1.find();
	if(cursor1.hasNext()==false)
	{
%>
<h3>No Blog Available</h3>
<%
	}
	else
	{
		while(cursor1.hasNext())
		{
			DBObject record=cursor1.next();%><br><br><br><%
			out.println("uname: "+record.get("uname"));%><br><%
			out.println("Titel: "+record.get("title"));%><br><%
			out.println("Comment: "+record.get("comment"));%><br><%
		}
			
	}
%>
<h6>Add new Post<h6>
<form action="post.jsp">
username:<input type="text" name="uname"><br>
Title:<input type="text" name="title"><br>
comment:<input type="text" name="comment"><br>
<input type="Submit" value="Post"/>
</form>
<%
}
%>

