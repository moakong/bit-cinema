<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
	<div class="container">
		<div>
			<c:import url="/view/include/mypageMenu.jsp" />
		</div>
		<div>
			<p>마이페이지 메인화면입니다</p>
		</div>
		<div>
			<p>내가 예매한 영화</p>
		</div>
		<div>
			<p>내가 쓴 평점</p>
		</div>
		<div>
			<p>내가 쓴 리뷰</p>
		</div>
	</div>	
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>