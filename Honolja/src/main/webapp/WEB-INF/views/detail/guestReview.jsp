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
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lpJuL0fDxe8fMB7Sysgn&submodules=geocoder"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lpJuL0fDxe8fMB7Sysgn&submodules=geocoder"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./resources/js/detail.js"></script>

<link rel="stylesheet" href="./resources/css/detail.css">
</head>
<body>
	<div class="container-fluid" id="review-All">
		<c:choose>
			<c:when test="${empty sessionScope.checked}">
				<div class="place-room__message">
					<i class="badge-live">바른후기</i> 는 로그인한 회원만 작성할 수 있습니다.
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<label for="content">comment</label>
					<form id="reviewForm" action="reviewAdd.do" method="post">

						<input type="hidden" name="g_no" value="${g_no}"> <input
							type="hidden" name="u_id" value="${u_id}">
						<div class="review-userinfo">
							<div class="col">
								<img
									src="http://member.yanolja.com/include/img/picture/default_picture.png"
									class="img-circle" alt="프로필사진" width="34px;" /><span
									class="nicname">로그인섹션값</span>
							</div>
						</div>
						<div class="form-group">
							<input class="form-control" id="re_title" name="re_title"
								placeholder="제목을 입력하세요.">
						</div>
						<div class="form-group">
							<textarea class="form-control" id="re_content" name="re_content"
								rows="3" placeholder="댓글을 입력하세요."></textarea>
						</div>
						<div class="form-group col-md-3">
							<button type="button" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-picture"></span> Picture
							</button>
						</div>
						<div class="form-group col-md-3">
							<select class="form-control" id="re_like" name="re_like">
								<option value="추천" selected="selected">추천</option>
								<option value="비추천">비추천</option>
							</select>
						</div>
						<div class="form-group col-md-3">
							<select class="form-control" id="re_score" name="re_score">
								<option value="1" selected="selected">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5">★★★★★</option>
							</select>
						</div>
						<div class="form-group col-md-3">
							<button class="btn btn-info btn-block" type="button"
								onclick="reviewBtn()">등록</button>
						</div>
					</form>
				</div>
				<hr>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${rcnt == 0}">
				<div class="empty-content">
					<img
						src="https://yaimg.yanolja.com/joy/pw/common/empty/empty-icon__review.svg"
						class="empty__image" alt="img">
					<div class="empty__texts">
						<em class="empty__text">아직 작성된 후기가 없습니다.</em>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="review" items="${review}">
					<div class="place-review__item.is-thumbnail"
						id="reviewModify_${review.re_no}">
						<div class="row">
							<c:if test="${review.re_img != null}">
								<div class="col-sm-4">
									<div class="place-review__image"
										style="background-image: url(./resources/images/${review.re_img}.jpg); background-size: cover; background-position: center center;"></div>
								</div>
							</c:if>
							<br>
							<div class="col" class="review-info">
								<div class="review-info__title">
									<span class="badge-rap"><i class="badge-best"><em>${review.re_like}</em></i></span><strong>${review.re_title}
									</strong>
									<c:if test="${review.re_score == 5 }">
										<span class="score-rap pull-right"><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score10"></i></span>
									</c:if>
									<c:if test="${review.re_score == 4 }">
										<span class="score-rap pull-right"><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score00"></i></span>
									</c:if>
									<c:if test="${review.re_score == 3 }">
										<span class="score-rap pull-right"><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score00"></i><i
											class="icon-staylist icon-staylist-score score00"></i></span>
									</c:if>
									<c:if test="${review.re_score == 2 }">
										<span class="score-rap pull-right"><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score00"></i><i
											class="icon-staylist icon-staylist-score score00"></i><i
											class="icon-staylist icon-staylist-score score00"></i></span>
									</c:if>
									<c:if test="${review.re_score == 1 }">
										<span class="score-rap pull-right"><i
											class="icon-staylist icon-staylist-score score10"></i><i
											class="icon-staylist icon-staylist-score score00"></i><i
											class="icon-staylist icon-staylist-score score00"></i><i
											class="icon-staylist icon-staylist-score score00"></i><i
											class="icon-staylist icon-staylist-score score00"></i></span>
									</c:if>
								</div>
								<p class="review-info__content">${review.re_content}</p>
								<div class="review-userinfo">
									<div class="col">
										<img
											src="//member.yanolja.com/include/img/picture/default_picture.png"
											class="img-circle" alt="프로필사진" width="34px;" /> <span
											class="nicname">${review.u_id}</span><i class="bar"></i><span
											class="roomtype">${review.i_name}</span><i class="bar"></i><span
											class="date"><fmt:formatDate value="${review.re_date}"
												pattern="yyyy-MM-dd" /></span>
										<div class="btn-group pull-right">
											<button type="button" class="btn btn-info" role="button"
												onclick="premodify(${review.re_no})">수정</button>
											<button type="button" class="btn btn-secondary" role="button"
												onclick="remove(${review.re_no}, ${g_no})">삭제</button>
										</div>
									</div>
								</div>
								<br>
								<c:choose>
									<c:when test="${review.ansCnt > 0}">
										<div>
											<button type="button" class="btn btn-primary"
												onclick="answerView(${review.re_no})">
												답변 <span class="badge badge-light">1</span>
											</button>
										</div>
									</c:when>
									<c:otherwise>
										<div>
											<button type="button" class="btn btn-primary"
												onclick="answer(${review.re_no}, ${g_no})">답변</button>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<hr>
					</div>
					<div id="view_${review.re_no}" style="display: none;"></div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>