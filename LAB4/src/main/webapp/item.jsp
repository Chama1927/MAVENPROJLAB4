<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.LAB4.itemController" %>
 

  <%


	itemController itemObj = new itemController();
	itemObj.connect();//For testing the connect method

 %>
 
 <%
  //insert items-------
   if (request.getParameter("itemCode") != null)
   {	 
    	itemController i = new itemController();
    	String stsMsg = i.insertItem(request.getParameter("itemCode"), request.getParameter("itemName"),
    	request.getParameter("itemPrice"), request.getParameter("itemDesc"));
    	session.setAttribute("statusMsg", stsMsg);
   }
   

  %>
  
  <%
  //Delete item----------------------------------
  if (request.getParameter("itemID") != null) {
	itemController i2 = new itemController();
  	String stsMsg = i2.deleteItem(request.getParameter("itemID"));
  	session.setAttribute("statusMsg", stsMsg);
  }
  
  
  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item Management</title>
</head>
<body>
	<h1>Items Management</h1>
	<form method="post" action="item.jsp">
		Item code: <input name="itemCode" type="text"><br> 
		Item name: <input name="itemName" type="text"><br> 
		Item price: <input name="itemPrice" type="text"><br> 
		Item description: <input name="itemDesc" type="text"><br> 
		<input name="btnSubmit" type="submit" value="Save">
	</form>
	
	<% out.print(session.getAttribute("statusMsg")); %>

	<br>
	<%
	//Read items and display in table
	itemController itemObj2 = new itemController();
	out.print(itemObj2.readItems());
	%>

</body>
</html>