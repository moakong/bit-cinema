<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
li { list-style: none;}
ul.a > li {
	float: left;
	margin-right: 30px; 
	background: #FDF5DC;
	text-align: right;
	font-size: 24px;
}
u1.a > li:HOVER {
	background: skyblue;
}

</style>
</head>
<body>
		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>
		
		
		
	<div>
		
		
		<div>
			<div>
				<c:import url="/view/include/snackMenu.jsp"/>
			</div>
			<div class="row">
			<!-- <ul class="a"> -->
				<c:forEach var="snack" items="${list}">
				<div class="col-sm-3">
				<a href ="DetailSnack?snackId=<c:out value='${snack.snackId}'/>">
					<img width="200px" height="200px" src="<c:out value="${snack.img}"/>"/><br>
				</a>	
					<c:out value="${snack.name}"/><br>
					<c:out value="${snack.price}"/><br>
					</div>
				</c:forEach>
			</div>
		</div>
		
		
		
	</div>
	
	
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
</body>
</html>