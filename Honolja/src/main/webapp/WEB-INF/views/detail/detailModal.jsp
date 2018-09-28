<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="./resources/js/detail.js"></script>
<link rel="stylesheet" href="./resources/css/detail.css">
<style type="text/css">
.thank-you-pop {
	width: 100%;
	padding: 20px;
	text-align: center;
}

.thank-you-pop img {
	width: 76px;
	height: auto;
	margin: 0 auto;
	display: block;
	margin-bottom: 25px;
}

.thank-you-pop h1 {
	font-size: 42px;
	margin-bottom: 25px;
	color: #5C5C5C;
}

.thank-you-pop p {
	font-size: 20px;
	margin-bottom: 27px;
	color: #5C5C5C;
}

.thank-you-pop h3.cupon-pop {
	font-size: 25px;
	margin-bottom: 40px;
	color: #222;
	display: inline-block;
	text-align: center;
	padding: 10px 20px;
	border: 2px dashed #222;
	clear: both;
	font-weight: normal;
}

.thank-you-pop h3.cupon-pop span {
	color: #03A9F4;
}

.thank-you-pop a {
	display: inline-block;
	margin: 0 auto;
	padding: 9px 20px;
	color: #fff;
	text-transform: uppercase;
	font-size: 14px;
	background-color: #8BC34A;
	border-radius: 17px;
}

.thank-you-pop a i {
	margin-right: 5px;
	color: #fff;
}

#ignismyModal .modal-header {
	border: 0px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="modal fade" id="ignismyModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="">
								<span>×</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="thank-you-pop">
								<img
									src="http://goactionstations.co.uk/wp-content/uploads/2017/03/Green-Round-Tick.png"
									alt="">
								<h1 id="modal_title"></h1>
								<p id="modal_body"></p>
								<!-- 	<h3 class="cupon-pop">
									Your Id: <span>12345</span>
								</h3> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>