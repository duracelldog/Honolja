<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="css/header.css" type="text/css" rel="stylesheet"> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
      
    
    <script type="text/javascript">
		function popupWindow(url, title, w, h) {
			
			var left = (screen.width/2) - (w/2);
			var top = (screen.height/2) - (h/2) - 50;
			
			return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
    	}
		
		function sendPost(url, name, value){
			
			var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "Post");
				form.setAttribute("action", url);

			 
			var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", name);
				hiddenField.setAttribute("value", value);
				
			form.appendChild(hiddenField);
			document.body.appendChild(form);

			form.submit();
		}
	
		function headerNullCheck(id){
			
			if(document.getElementById(id).value == ""){
				$(document).ready(function(){
					$('#alertbox').ready(function(){
						$("#error").html("검색어를 입력해 주세요.");
						$('#myModal').modal("show");
					});
				});
				return;
			}
			
			document.getElementById("guestSearch").submit();
			
		}
    </script>
</head>
<body>
	<!-- 상단 바 -->
	<div class = "header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="main.do">Honolja</a>
				</div>
				<ul class="nav navbar-nav">
					<li ${param.notice}><a href="notice.do" >공지사항</a></li>
					<li ${param.group}><a href="board.do" >소모임</a></li>
					<li ${param.myplace}><a href="guestlist.do?area=my" >내주변</a></li>
					<li ${param.area}>
						<a href="guestlocation.do
							?area=${param.area}
							&adult=${param.adult}
							&child=${param.child}
							&check_in=${param.check_in}
							&check_out=${param.check_out}
							&nights=${param.nights}" >지역</a>
					</li>
					<li ${param.img_board}><a href="img_board.do" >여행지 정보</a></li>
					<li ${param.test}><a href="test.do">TEST</a></li>
				</ul>

  				<!-- 게스트 하우스 검색 -->
  				<form class="navbar-form navbar-left" action="guestlist.do" id = "guestSearch">
     				<div class="form-group">
     					<div class="col-xs-8">
        					<input class="form-control" id="search" name="keyword" placeholder="게스트 하우스 입력" value="${sval}" size="25">
      					</div>
      					<div class="col-xs-2">
      					<button type="button" class="btn btn-primary" onclick="headerNullCheck('search');">검색</button>
      					</div>
      				</div>
    			</form>
    			

				<!-- 로그인 / 비 로그인, 버튼 전환 -->
				<c:choose>
					<c:when test="${param.checked == '' || param.checked == null}">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="join.do"><span class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a></li>
							<li onclick="popupWindow('login_popup.do?host=${param.host}', 'login', 410, 450)"><a href="#"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;마이페이지</a></li>
							<li onclick="location.href = 'logout.do?host=${param.host}'"><a href="#"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그아웃</a></li>
						</ul>
					</c:otherwise>
				</c:choose>

			</div>
		</nav>
	</div>

			<div class="popover-content popover-gnb-submenu animate-bounce-down" data-popover-content="true" id="id">
			<div class="layer-search-option layer-area-list">
			<ul class="area-list">
			<li class="area-item area-item-myfocus" value="서울">
			<a href="guestlocation.do?g_addr=seoul">서울</a></li>
			<li class="area-item" value="경기"><a href="guestlocation.do?g_addr=kyungki">경기</a></li>
			<li class="area-item" value="인천"><a href="guestlocation.do?g_addr=inchun">인천</a></li>
			<li class="area-item" value="강원"><a href="guestlocation.do?g_addr=gangwon">강원</a></li>
			<li class="area-item" value="제주"><a href="guestlocation.do?g_addr=jeju">제주</a></li>
			<li class="area-item" value="충남"><a href="guestlocation.do?g_addr=chongnam">충남</a></li>
			<li class="area-item area-item-active" value="충북">
			<a href="guestlocation.do?g_addr=chongbok">충북</a></li>
			<li class="area-item" value="경남"><a href="guestlocation.do?g_addr=kyungnam">경남</a></li>
			<li class="area-item" value="경북"><a href="guestlocation.do?g_addr=kyungbok">경북</a></li>
			<li class="area-item" value="부산"><a href="guestlocation.do?g_addr=busan">부산</a></li>
			<li class="area-item" value="전남"><a href="guestlocation.do?g_addr=junnam">전남</a></li>
			<li class="area-item" value="전주/전북"><a href="guestlocation.do?g_addr=junju">전주/전북</a></li>

	<!-- Modal(== alert) 기능 구현 시 필요 -->
	<jsp:include page="modal.jsp" />
	
			</ul>
			<div class="subarea-cnt">
			<div class="inner">
			<ul class="subarea-list row2">
			</ul></div></div></div></div>
			<div class="dimmed" id="id"></div>
			<script>
			jQuery('#id').css("display", "none"); 
			jQuery('#toggle').click(function () {  
			    if($("#id").css("display") == "block"){   
					jQuery('#id').css("display", "none");  
			    } else {  
			        jQuery('#id').css("display", "block");   
			    } 
			});  
			</script>
</body>
</html>