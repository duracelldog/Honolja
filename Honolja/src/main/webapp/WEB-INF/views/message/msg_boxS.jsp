<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<title>[msg_boxS.jsp]</title>
	<meta charset="utf-8">
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<script type="text/javascript">

function allchk() {
	 var param = document.getElementById("allcheck").checked;
	 var check = document.getElementsByName('n_ck');
	 for(i=0; i<check.length; i++) {
		 check.item(i).checked = param;
	 }//for end
	 
	}//end

</script>

	 <style type="text/css">
	 
	 .ff {
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	 }
	 	 
	 table.ta {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  	margin : 20px 10px;
	}

	table.ta td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
	}
	 
	 </style>

<body>

	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>
	
	<div style="height: 100px;"></div>
	
	<div>
  		<c:import url="http://localhost:8080/honolja/side_mypage.do">
		</c:import>
	</div>

<div class="container">
<form name="myform" action="msg_deleteS.do?userid=${checked}" method="post">
<table class="ta">
    <tr>
        <td><input type="checkbox" id="allcheck" onclick="allchk();"></td>
        <td><b>제목</b></td>
        <td><b>받는이</b></td>
        <td><b>날짜</b></td>
    </tr>
    
<c:forEach var="listS" items="${listS}">
	 <tr>
		<td><input type="checkbox" id="n_ck" name="n_ck" value="${listS.m_no}"></td>
		<td><a href="javascript:void(window.open('msg_detailS.do?idx=${listS.m_no}', 'text', 'width=440, height=650, top=100, left=100'))">
		<c:if test="${listS.m_check eq false}">★</c:if>${listS.m_title}</a>
		</td>
		<td>${listS.m_id}</td>
		<td><fmt:parseDate value="${listS.m_date}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
	      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/></td>
	 </tr>
	 </c:forEach>
</table>

	<div style="height: 10px;"></div>
	
	<div style="margin-left: 81%">
		<input type="submit" class="btn" value="선택 삭제">
		<input type="button" class="btn" onclick="javascript:void(window.open('msg_send.do', 'text', 'width=440, height=650, top=100, left=100'))" value="쪽지 보내기">
	</div>
	
</form>
</div>

	<div class="ff">
		<c:import url="http://localhost:8080/honolja/footer.do" />
	</div>
=======

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[msg_boxS.jsp]</title>
	 <link href="css/cut.css" rel="stylesheet" type="text/css">
</head>

<script type="text/javascript">

function allchk() {
	 var param = document.getElementById("allcheck").checked;
	 var check = document.getElementsByName('n_ck');
	 for(i=0; i<check.length; i++) {
		 check.item(i).checked = param;
	 }//for end
	 
	}//end

</script>

<body>

<jsp:include page="/WEB-INF/views/mypage/mypage_menu.jsp"/>

<form name="myform" action="msg_deleteS.do?userid=${checked}" method="post">
<table border="2" align="center" width=700>

 <tr bgcolor="pink" align="center">
  <td><input type="submit" value="삭제"></td>
  <td colspan="4">${checked} 님의 보낸쪽지함</td>
 </tr>

 <tr align="center">
  <td width=50><input type="checkbox" id="allcheck" onclick="allchk();"></td>
  <td width=200>제목</td>
  <td width=200>내용</td>
  <td width=100>받는이</td>
  <td width=250>날짜</td>
 </tr>

<c:forEach var="listS" items="${listS}">
 <tr align="center">
  <td><input type="checkbox" id="n_ck" name="n_ck" value="${listS.m_no}"></td>
  <td><a href="javascript:void(window.open('msg_detailS.do?idx=${listS.m_no}', 'text', 'width=430, height=530, top=100, left=100'))">${listS.m_title}</a></td>
  <td class="target1"><a href="javascript:void(window.open('msg_detailS.do?idx=${listS.m_no}', 'text', 'width=430, height=530, top=100, left=100'))">${listS.m_content}</a></td>
  <td>${listS.m_id}</td>
  <td><fmt:parseDate value="${listS.m_date}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/></td>
 </tr>
 </c:forEach>

</table>
</form>
<p>

>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja

</body>
</html>