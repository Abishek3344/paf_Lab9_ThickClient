<%@ page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<link rel="stylesheet" href="Views/bootstrap.min.css">
	<script src="Component/jquery-3.6.0.min.js"></script> 
	<script src="Component/items.js"></script>
	
<%
//Save---------------------------------
if (request.getParameter("itemCode") != null)
{
	Item itemObj = new Item();
	String stsMsg = "";
	//Insert--------------------------
	if (request.getParameter("hidItemIDSave") == "")
	{
		stsMsg = itemObj.insertItem(request.getParameter("itemCode"), request.getParameter("itemName"),
				request.getParameter("itemPrice"), request.getParameter("itemDesc"));
	}
	else//Update----------------------
	{
		stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),
					request.getParameter("itemCode"),
					request.getParameter("itemName"),
					request.getParameter("itemPrice"),
					request.getParameter("itemDesc"));
	}
	
	session.setAttribute("statusMsg", stsMsg);
}

//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null)
{
	Item itemObj = new Item();
	String stsMsg = itemObj.deleteItem(request.getParameter("hidItemIDDelete"));
				session.setAttribute("statusMsg", stsMsg);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
	<div class="container">
 <div class="row">
 <div class="col">
	<h1>Items Management</h1>
	<form id="formItem" name="formItem" method="post" action="items.jsp">
 Item code:
<input id="itemCode" name="itemCode" type="text"
 class="form-control form-control-sm">
<br> Item name:
<input id="itemName" name="itemName" type="text"
 class="form-control form-control-sm">
<br> Item price:
<input id="itemPrice" name="itemPrice" type="text"
 class="form-control form-control-sm">
<br> Item description:
<input id="itemDesc" name="itemDesc" type="text"
 class="form-control form-control-sm">
<br>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
</form>
	<div class="alert alert-success">
		 <% out.print(session.getAttribute("statusMsg"));%>
    </div>
	<br>
	<%
		Item itemObj = new Item();
		out.print(itemObj.readItems());
	%>
	</div>
 </div>
</div>
</body>
</html>