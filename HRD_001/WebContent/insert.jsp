<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    LocalDate date = LocalDate.now();
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
<script>
	function send(){
// 		if(frm.custno.value==""){
// 			alert("회원성명이 입력되지 않앗습니다");
// 			frm.custno.focus();
// 			return;
// 		}
		if(frm.custname.value==""){
			alert("회원성명이 입력되지 않앗습니다");
			frm.custname.focus();
			return;
 		}
		if(frm.phone.value==""){
			alert("전화번호가 입력되지 않앗습니다");
			frm.phone.focus();
			return;
		}
		if(frm.address.value==""){
			alert("주소가 입력되지 않앗습니다");
			frm.address.focus();
			return;
		}
		if(frm.joindate.value==""){
			alert("가입일자가 입력되지 않앗습니다");
			frm.joindate.focus();
			return;
		}
		if(frm.grade.value==""){
			alert("고객등급이 입력되지 않앗습니다");
			frm.grade.focus();
			return;
		}
		if(frm.city.value==""){
			alert("도시코드가 입력되지 않앗습니다");
			frm.city.focus();
			return;
		}
	frm.action="insert";
	frm.submit();
	}
</script>
<body>
<div style="text-align:center;"><h2>쇼핑몰 회원관리 ver 1.0</h2></div>
<nav>
	<ul>
		<li><a href="insert">회원등록</a></li>
		<li><a href="list">회원목록 조회/수집</a></li>
		<li><a href=#">회원매출조회</a></li>
		<li><a href="index">홈으로</a></li>		
	</ul>
</nav>
<br>
<h3 style="text-align:center;">홈쇼핑 회원 등록</h3>
<form name="frm" method="post">
<table border="1" style="text-align:center;">
	<tr>
		<td>회원번호(자동발생)</td>
		<td><input type="text" name="custno"></td>		
	</tr>
	<tr>
		<td>회원성명</td>
		<td><input type="text" name="custname"></td>		
	</tr>
	<tr>
		<td>회원전화</td>
		<td><input type="text" name="phone"></td>		
	</tr>
	<tr>
		<td>회원주소</td>
		<td><input type="text" name="address"></td>		
	</tr>
	<tr>
		<td>가입일자</td>
		<td><input type="text" name="joindate" value="<%=date%>" readonly></td>		
	</tr>
	<tr>
		<td>고객등급[A:VIP,B:일반,C:직원]</td>
		<td><input type="text" name="grade"></td>		
	</tr>
	<tr>
		<td>도시코드</td>
		<td><input type="text" name="city"></td>		
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="등록" onclick="send()"><input type="button" value="조회" onclick="javascript:'list'"></td>		
	</tr>
</table>
</form>

<footer>
	<div style="text-align:center;">
		HRDKOREA Copyright 2016 All ri
	</div>
</footer>
</body>
</html>