<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	if("${row}" != 0){
		alert("회원등록이 완료 되었습니다.");
		location.href = "list";
	}else{
		alert("회원등록 실패");
		history.back();
	}
</script>
</body>
</html>