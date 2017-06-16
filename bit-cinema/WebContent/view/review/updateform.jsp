<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.container *{
		margin: 5px;
	}

</style>
<body>

		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>
<div class="container">

	<form action="${pageContext.request.contextPath}/review/update" method="post">
	<input type="hidden" name="no" value="${reviewNo }" >
	<input type="hidden" name="id" value="${id }"> 
	
	<input type="text" class="form-control" name="title" value="${review.title }" placeholder="수정할 제목을 입력하세요" >
	스포일러<input type="radio" name="spo" value="1" >있음
		<input type="radio" name="spo" value="0" checked="checked">없음<br>
	<textarea class="form-control" rows="20" id="comment" name="content" placeholder="내용을 입력하세요">${review.content}</textarea>
	
		<center><button>수정 하기</button></center>
	</form>
</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	
	
	
</body>
</html>