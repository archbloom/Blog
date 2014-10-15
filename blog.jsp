
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.DBObject"%>

<%

MongoClient mongoclient=new MongoClient("localhost",27017);

DB db=mongoclient.getDB("test");
	%>
	<body>
	<h1>Blog</h1>
	</body>
	<%
	DBCollection col1=db.createCollection("blog",null);
	DBCursor cursor1=col1.find();
	if(cursor1.hasNext()==false)
	{
	%>
	<h3>No Blog Available</h3>
	<%
	}
	else
	{
	%>
			<img src="abc1.jpg" alt="Image file" style="width:304px;height:228px">
			<%
		while(cursor1.hasNext())
		{
			DBObject record=cursor1.next();%><br><br><br><%
			out.println("uname: "+record.get("uname"));%><br><%
			out.println("Titel: "+record.get("title"));%><br><%
			out.println("Comment: "+record.get("comment"));
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



