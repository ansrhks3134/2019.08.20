<%@page import="DBPKG.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBPKG.DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    LocalDate date = LocalDate.now();
	DAO dao = DAO.getInstance();
	List<DTO> list = dao.list();
    //List<DTO> list = new ArrayList<DTO>();
    %>
<!DOCTYPE html>
<html>
<style>
li{list-style:none;float:left;margin-left:5%;}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align:center;"><h2>쇼핑몰 회원관리 ver 1.0</h2></div>
<nav>
	<ul>
		<li><a href="insert">회원등록</a></li>
		<li><a href="edit">회원목록 조회/수집</a></li>
		<li><a href="list">회원매출조회</a></li>
		<li><a href="index">홈으로</a></li>		
	</ul>
</nav>
<br>
<h3 style="text-align:center;">홈쇼핑 회원 등록</h3>
<form name="frm" method="post">
<table border="1" style="text-align:center;">
	<tr>
		<td>회원번호(자동발생)</td>
		<td>회원성명</td>
		<td>전화번호</td>
		<td>주소</td>
		<td>가입일자</td>
		<td>고객등급</td>
		<td>거주지역</td>			
	</tr>	
	<%for(int i=0;i<list.size();i++) {%>
	<tr>
		<td><a href="edit?custno="<%=list.get(i).getCustno() %>><%=list.get(i).getCustno() %></a></td>
		<td><%=list.get(i).getCustname() %></td>
		<td><%=list.get(i).getPhone() %></td>
		<td><%=list.get(i).getAddress() %></td>
		<td><%=list.get(i).getJoindate() %></td>
		<%
		String grade ="";
		switch(list.get(i).getGrade()){
		case "A":
			grade="VIP";
			break;
		case "B":
			grade="일반";
			break;		
		case "C":
			grade="직원";
			break;
		}
		%>
		<td><%=grade %></td>
		<td><%=list.get(i).getCity() %></td>			
	</tr>
<%} %>
</table>
</form>

<footer>
	<div style="text-align:center;">
		HRDKOREA Copyright 2016 All ri
	</div>
</footer>
</body>
</html>