<%@ page language='java' contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<form action='productRegistComplete' method="post" enctype="multipart/form-data" id='frm'>
		<input type='text' placeholder="상품이름" name='pname' id='pname' ><br>
		<input type='text' placeholder="가격" name='price' ><br>
		<input type='text' placeholder='부가설명' name='content' id='content'><br>
		메인 이미지:<input type="file" name='file'><br>
		<div id='subpic'>서브이미지 :<input type='file' name='images'><input type='button' value="+" id='picplus'><br></div>
		
		<input type='submit' value='등록'>
		
		
	</form>
	
	<script>
		$("#picplus").on("click",function(){
			$("#subpic").append("<input type='file' name='images'><br>");
		})
		/* $("#frm").on("submit",function(){
			var name=$("#pname").val();
			
		}) */
	</script>
</body>
</html>