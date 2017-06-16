<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="../lib/sweetalert.min.js"></script> 
<link rel="stylesheet" href="../lib/sweetalert.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
.container *{
	margin: 5px;
}


</style>
</head>
<body>

		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>
	<div class="container">
		
		<div>
		
		<span>글번호:<c:out value="${review.reviewNo } "></c:out></span>
		<span>별명:<c:out value="${review.nickname } "></c:out></span>
		<span>조회수:<c:out value="${review.recomCount } "></c:out></span>
		<span>등록일:<fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd"/></span>
		<div readonly class="form-control" id="title"><c:out value="${review.title } "></c:out></div>
<%-- 		<div class="form-control id="content"><c:out value="${review.content } "></c:out></div> --%>
		<textarea readonly class="form-control" rows="20" id="comment" >${review.content }</textarea>
		
		
		
		<span>
			<c:if test="${!empty files }">
			<c:forEach var="file" items="${files}">
			<img width="400px" height="400px"  src="${pageContext.request.contextPath}/download?path=${file.filePath}&sName=${file.sysName}">
			</c:forEach>
			</c:if>
		</span>
		
<!-- 		<table> 
				<tr>
					<th>번호</th>
					<td><c:out value="${review.reviewNo } "></c:out>	</td>
				</tr>
				<tr>
					<th>별명</th>
					<td><c:out value="${review.nickname } "></c:out>	</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><c:out value="${review.recomCount } "></c:out>	</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd"/>	</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><c:out value="${review.title } "></c:out>	</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><c:out value="${review.content } "></c:out>	</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td> </td>
				</tr>
		</table>
		-->
		</div>
		
		
		
	<center>
<%-- <a href="${pageContext.request.contextPath}/review/Review?id=${review.movieId}">되돌아가기</a> --%>
<button class="btn btn-primary" id="return" type="button" >되돌아가기</button>

<c:if test="${user.memberId eq mmid}">
<%-- <a id="del" href="${pageContext.request.contextPath}/review/delete?no=${review.reviewNo}&id=${review.movieId}">삭제하기</a> --%>
<button class="btn btn-primary" id="del" type="button" >삭제 하기</button>
<%-- <a href="${pageContext.request.contextPath}/review/updateform?no=${review.reviewNo}&id=${review.movieId}">수정하기</a> --%>
<button class="btn btn-primary" id="update" type="button" >수정 하기</button>
</c:if>
</center>
</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>



<script>
$("#return").on("click",  function(){
	location.href="${pageContext.request.contextPath}/review/Review?id=${review.movieId}";
});

$("#update").on("click",  function(){
	location.href="${pageContext.request.contextPath}/review/updateform?no=${review.reviewNo}&id=${review.movieId}";
});


	$("#del").on("click",  function(){
		
		swal({
			  title: "삭제 하시겠습니까?",
			  text: "You  file!",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: " 삭제하기",
			  closeOnConfirm: false
			},
			function(){
			  location.href="${pageContext.request.contextPath}/review/delete?no=${review.reviewNo}&id=${review.movieId}"
			});
		
		
		
		
		
// 		var result = confirm("삭제 하시겠습니까?");
// 		if (result){
			
// 		}
// 		// 그 이외의 경우
// 		else{
// 			console.log("이후 없음");
// 			return false;
// 		}
	});



</script>

</body>
</html>



