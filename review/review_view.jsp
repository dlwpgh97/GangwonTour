<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행후기 상세</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script>
	function delete_go(){
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href = "${pageContext.request.contextPath }/controller3?type=reviewDelete&idx=${rvo.idx }"; 
		}
	}

	function zzim_go(){ 
		if('${ch.id}' == "") {
			alert("로그인 후 이용해주세요.");
			return;
		}
		if('${ch.id}' == 'admin') {
			alert("찜하기는 회원만 가능합니다.");
			return;
		}
		location.href = "${pageContext.request.contextPath }/controller3?type=zzimAdd&id=${ch.id }&boardName=여행후기&boardIdx=${rvo.idx}&image=${rvo.image1}&title=${rvo.title}";
		
	}
	
</script>
</head>
<body>

<!-- navbar -->
<%@ include file="../jspf/storynav.jspf" %>

<!-- content -->
<div class="container">

<div class="row">

<!-- 사이드 내비 -->
<%@ include file="../jspf/storySidenav.jspf" %>


<!-- 내용 -->
<div class="col-10">
	<!-- 상단버튼 -->
	<div class="row border-bottom justify-content-end py-1">
	<c:if test="${ch.id eq rvo.id}">
		<input class="btn btn-outline-secondary m-1" type="button" value="수정" onclick="javascript:location.href='${pageContext.request.contextPath }/controller3?type=reviewModifyForm&idx=${rvo.idx}'">
		<input class="btn btn-outline-secondary m-1" type="button" value="삭제" onclick="delete_go()">
	</c:if>
		<input class="btn btn-outline-secondary m-1" type="button" value="찜하기" onclick="zzim_go()">
	</div>
	
	<!-- 진짜 내용 -->
	<div class="row py-1 ">
	<table class="table table-borderd">
		<thead>
			<tr>
				<td colspan="3"><strong>${rvo.title }</strong></td>
			</tr>
			<tr>
				<td>작성자: ${rvo.id }</td>
				<td>등록일: ${rvo.regdate }</td>
				<td>찜 갯수: ${zzimCount }</td>
			</tr>
			
		</thead>
		
		<tbody>
			<tr>
				<td colspan="3">
					<div id="carouselExampleControlsNoTouching" class="carousel slide" data-touch="false" data-interval="false">
  					<div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="${pageContext.request.contextPath }/imgs/${rvo.image1 }" class="d-block w-100" alt="..." style="height:500px;">
					    </div>
					    <c:if test="${rvo.image2 ne null}">
					    <div class="carousel-item">
					      <img src="${pageContext.request.contextPath }/imgs/${rvo.image2 }" class="d-block w-100" alt="..." style="height:500px;">
					    </div>
					    </c:if>
					    <c:if test="${rvo.image3 ne null}">
					    <div class="carousel-item">
					      <img src="${pageContext.request.contextPath }/imgs/${rvo.image3 }" class="d-block w-100" alt="..." style="height:500px;">
					    </div>
					    </c:if>
					  </div>
					  <button class="carousel-control-prev" type="button" data-target="#carouselExampleControlsNoTouching" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-target="#carouselExampleControlsNoTouching" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </button>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">${rvo.content } </td>
			</tr>
		</tbody>
	</table>
	</div>
	
	
<!-- 검색리스트에서 상세보기 후 목록보기 하면 검색리스트로 돌아가야함 -->		
	<div class="row py-3 border-top">
	<c:choose>
		<c:when test="${search eq null}">
		<input class="btn btn-secondary btn-lg" type="button" value="목록보기" onclick="javascript:location.href='${pageContext.request.contextPath }/controller3?type=reviewTravel&cPage=${cPage}'">
		</c:when>
		<c:otherwise>
		<input class="btn btn-secondary btn-lg" type="button" value="목록보기" onclick="javascript:location.href='${pageContext.request.contextPath }/controller3?type=reviewSearch&search=${search }&searchKeyword=${searchKeyword }&cPage=${cPage}'">
		</c:otherwise>
	</c:choose>
	</div>		
	
	</div>
</div>
</div>
	
<!-- 푸터 -->

<%@ include file="../jspf/footer.jspf" %>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>