<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>글쓰기</title>

<script type="text/javascript" src="./resources/ckeditor/ckeditor.js"></script>

  <meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
 	<script type="text/javascript">
	  function check( ){
		  var title=myform.b_title.value;
		  var content=myform.b_content.value;
		 
			if (title == "" || title == null) {
				alert("제목을 입력해주세요.");  
			myform.b_title.focus();
			return false;
			}
			if (content == "" || content == null) {
				alert("내용을 입력해주세요.");
			myform.b_content.focus();
			return false;
			}
			document.myform.submit(); 
	  }
	  </script>
	  

	  
</head>
<body id="page-top" style="margin-top:51px;" >
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}" />
		<c:param name="host" value="main.do" />
	</c:import>

	<div class="container">
		<div id="content-categories">
			<h3> <font color=blue></font>새 글쓰기</h3>
		</div>
	
		<form action="boardinsert.do" name="myform" method="post" enctype="multipart/form-data" id="fileform" onsubmit="check(); return false;">
				<label for="usr">제목 :</label> 
				<input type="text" name="b_title" class="form-control" id="usr" placeholder="제목을 입력하세요."> 
				<br>
				 <label for="comment">내용:</label>
				<textarea name="b_content" class="form-control" rows="10" id="b_content" placeholder="내용을 입력하세요." class="ckeditor"></textarea>
					<script type="text/javascript">
    					CKEDITOR.replace('b_content', {height: 500});
					</script>					
			<div id="fileDiv">
				  <span style="float: right"> 	<input type="submit" class="btn btn-primary" value="확인"> </span>
				첨부파일 :	<input class="multi" type="file" name="b_uploadfilename2" multiple="multiple"> 
			</div>
		</form>
	</div>

<div class="foot" style="position:absolute; bottom:0; width:100%">
<c:import url="http://localhost:8080/honolja/footer.do" />
</div>

</body>
</html> 