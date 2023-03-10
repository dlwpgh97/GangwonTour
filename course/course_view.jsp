<%@page import="com.mystudy.story.vo.CourseVO"%>
<%@page import="com.mystudy.story.dao.CourseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천코스 상세</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script>
	function delete_go(){
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href = "${pageContext.request.contextPath }/controller3?type=courseDelete&idx=${cvo.idx }"; // 
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
		location.href = "${pageContext.request.contextPath }/controller3?type=zzimAdd&id=${ch.id }&boardName=추천여행코스&boardIdx=${cvo.idx}&image=${cvo.image}&title=${cvo.title}";
		
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
	<div class="row justify-content-end py-1">
	<c:if test="${ch.id eq 'admin' }">
	<input class="btn btn-outline-secondary m-1" type="button" value="수정" onclick="javascript:location.href='${pageContext.request.contextPath }/controller3?type=courseModifyForm&idx=${cvo.idx}'">
	<input class="btn btn-outline-secondary m-1" type="button" value="삭제" onclick="delete_go()">
	</c:if>
	<input class="btn btn-outline-secondary m-1" type="button" value="찜하기" onclick="zzim_go()">
	</div>
	
	<!-- 진짜 내용 -->
	<div class="row py-3 ">
	
	<table class="table table-borderless">
		<thead>
			<tr class="border-bottom">
				<th><h4><em>${cvo.title }</em></h4></th>
			</tr>
			
		</thead>
		
		<tbody>
			<tr>
				<td><p>${cvo.intro } </p></td>
			</tr>
			<tr>
				<td>
				<img src="${pageContext.request.contextPath }/imgs/${cvo.image }">
				
				
				<%-- 
    			<div id="staticMap" style="width:600px;height:350px;"></div>    
					${cvo.placeMa}, ${cvo.placeLa}, ${cvo.placeMa}
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1746f5f4179eca3d72bce9f0ea169370"></script>
					<script>    
					// 이미지 지도에 표시할 마커입니다
					// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
					var markers = [
					    {
					        position: new kakao.maps.LatLng(${cvo.placeMa}, ${cvo.placeLa}),
					    	text: '${cvo.placeName}'
					    },
					    {
					        position: new kakao.maps.LatLng(33.450001, 126.570467), 
					        text: '표시할 수 있어요!' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
					    }
					];
					
					var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
					    staticMapOption = { 
					        center: new kakao.maps.LatLng(${cvo.placeMa}, ${cvo.placeLa}), // 이미지 지도의 중심좌표
					        level: 3, // 이미지 지도의 확대 레벨
					        marker: markers // 이미지 지도에 표시할 마커 
					    };    
					
					// 이미지 지도를 생성합니다
					var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
					</script>
    
     --%>
    			</td>
    		</tr>
			<tr class="border-bottom">
				<th>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
  					<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
					</svg>
					1일차 
				</th>
			</tr>
			<tr>
				<td>${cvo.day1 } </td>
			</tr>
			
			<tr class="border-bottom">
				<th>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
  					<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
					</svg>
					2일차 
				</th>
			</tr>
			<tr>
				<td>${cvo.day2 } </td>
			</tr>
			<c:if test="${cvo.tDay == 2}">
			<tr class="border-bottom">
				<th>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
  					<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
					</svg>
					3일차 
				</th>
			</tr>
			<tr>
				<td>${cvo.day3 } </td>
			</tr>
			</c:if>
		</tbody>
	</table>
	</div>
	
	
<!-- 검색리스트에서 상세보기 후 목록보기 하면 검색리스트로 돌아가야함 -->	
	<div class="row py-3 border-top"> 
	<c:choose>
		<c:when test="${tDay eq null}"> <!-- 전체 리스트로 가기 -->
			<input class="btn btn-secondary btn-lg" type="button" value="목록보기" onclick="javascript:location.href='${pageContext.request.contextPath }/controller3?type=courseTravel&cPage=${cPage}'">
		</c:when>
		<c:otherwise> <!-- 검색리스트로 가기 -->
			<input class="btn btn-secondary btn-lg" type="button" value="목록보기" onclick="javascript:location.href='${pageContext.request.contextPath }/controller3?type=courseSearch&tDay=${cvo.tDay }&cPage=${cPage}'">
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