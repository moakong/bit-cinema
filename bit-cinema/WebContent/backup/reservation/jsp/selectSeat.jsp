<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	

	<!-- 자리에 대한 정보 이외에 hidden으로 schedule_id, 예매인원 reservationServlet으로 넘기고, 
	회원id는 reservationServlet에서 세션을 통해 얻는다 -->
	<div>
		<h2>좌석 선택</h2>
		<hr>
		
		<form action="payment">
			<input type="hidden" name="schNo" value="${schNo}" />
			<input type="hidden" name="people" value="${people}" />
			
			<c:forEach var="i" begin="1" end="${all[0].totalC}">
				&nbsp; &nbsp;${i}
			</c:forEach>
			<c:forEach var="seat" items="${all}">
				<c:if test="${seat.c == 1}">
				<br>&#${seat.r + 64};
				</c:if>
				<input type="checkbox" name="seat" id="${seat.seatId}" 
				value="${seat.seatId}" onclick="CountChecked(this)" />
			</c:forEach>
		<!-- disabled -->
			<br><br>
			<button>다음</button>
		</form>
	</div>
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>

</body>

<script type="text/javascript">

	/* 이미 예약된 좌석 비활성화 하기 */
 	<c:forEach var="seat" items="${reserved}">
		document.getElementById("${seat.seatId}").disabled = 'true';
	</c:forEach> 

 
 
 	/* 선택개수 제한하기 */
	var maxChecked = ${people};   //선택가능한 체크박스 갯수
	var totalChecked = 0; // 설정 끝

	function CountChecked(field) {
		if (field.checked)
			totalChecked += 1;
		else
			totalChecked -= 1;

		if (totalChecked > maxChecked) {
			alert (maxChecked+"개의 자리를 선택해주세요");
		field.checked = false;
		totalChecked -= 1;
		}
	}
</script>
 
</html>


			<%-- ${(char)(seat.r + 64)} --%>  <!-- 형변환 안됨 -->
			<!-- 검색 : jsp convert int to char -->
			<!-- 참고 : https://unicode-table.com/en/#0043 -->







