<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
		
		<table>
				<tr>
					<th>번호</th>
					<td><c:out value="${review.reviewNo } "></c:out>	</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><c:out value="${review.title } "></c:out>	</td>
				</tr>
				<tr>
					<th>별명</th>
					<td><c:out value="${review.nickname } "></c:out>	</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><c:out value="${review.content } "></c:out>	</td>
				</tr>
				<tr>
					<th>추천수</th>
					<td><c:out value="${review.recomCount } "></c:out>	</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd"/>	</td>
				</tr>
		</table>
<a href="${pageContext.request.contextPath}/review/Review?id=${review.movieId}">되돌아가기</a>


<c:if test="${user.memberId eq mmid}">
<a id="del" href="${pageContext.request.contextPath}/review/delete?no=${review.reviewNo}&id=${review.movieId}">삭제하기</a>
<a href="${pageContext.request.contextPath}/review/updateform?no=${review.reviewNo}&id=${review.movieId}">수정하기</a>
</c:if>


<script>


	$("#del").on("click",  function(){
		var result = confirm("삭제 하시겠습니까?");
		if (result){
			
		}
		// 그 이외의 경우
		else{
			console.log("이후 없음");
			return false;
		}
	});



</script>

</body>
</html>



