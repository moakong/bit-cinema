<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
#main{
}
.container *{
	margin: 5px;
}
#title{
	width:800px;
}
#content{
	width:800px;
}
button{
	 text-align: center;
}
.filee{
	width: 50%; height: 50%;
}
</style>
</head>
<body>

		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>
		
 <div class="container">
	<form action="${pageContext.request.contextPath}/write" method="post" enctype="multipart/form-data">
		<input  type="hidden" name="mid" value="${mid }">
<!-- 		<input id="title" type="text" name="title" placeholder="제목을 입력하세요"><br> -->
		<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요">
		<input class="filee" type="file" name="f">
		<input class="filee" type="file" name="f1">
		스포일러<input type="radio" name="spo" value="1" >있음
		<input type="radio" name="spo" value="0" checked="checked">없음<br>
<!-- 		<textarea id="content" cols="100" rows="20" name="content" placeholder="내용을 입력하세요"></textarea><br> -->
		<textarea class="form-control" rows="20" id="comment" name="content" placeholder="내용을 입력하세요"></textarea>
		 <center><button  class="btn btn-primary">글작성</button>	
		 <button id="return" type="button"  class="btn btn-primary">되돌아가기</button>	</center>
	</form>		
 </div>

		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>

<script >
$("#return").on("click",  function(){
	location.href="${pageContext.request.contextPath}/review/Review?id=${mid}";
});


</script>

</body>
</html>