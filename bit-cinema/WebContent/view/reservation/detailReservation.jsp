<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<!-- sweet alert -->
<script src="../lib/sweetalert.min.js"></script> 
<link rel="stylesheet" href="../lib/sweetalert.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
	
	<div>
		<h1>상세 예매 내역</h1>
		<hr><br>
		<div>
		<strong>${rInfo.movieName}</strong><br>
		비트시네마 ${rInfo.screenName}<br>
		<fmt:formatDate value="${rInfo.startDate}" pattern="yyyy년 MM월 dd일" /><br>
		${rInfo.startTime} ~ ${rInfo.endTime}<br>
		<c:forEach var="seat" items="${sList}">
			[&#${seat.r + 64}-${seat.c}] 
		</c:forEach>
		<br><br>
		</div>
		
		<button onclick="cancelConfirm()" >예매 취소</button><br><br>
		<button onclick="location.href='check'" >나의 예매내역</button>
	</div>
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>


	<script type="text/javascript">
 		function cancelConfirm(){
			if (confirm("예매를 취소하시겠습니까?") == true){  
				alert("예매가 취소되었습니다.")
				location.href='cancelReservation?reservationId=${rInfo.reservationId}';
			}else{  
			    return;
			}
		} 

	/* 
		function cancelConfirm(){
			var cancel = swal({
				  title: "Are you sure?",
				  text: "You will not be able to recover this imaginary file!",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Yes, delete it!",
				  closeOnConfirm: false
				}) 
			
			if (cancel == true){  
				if((function(){
					  swal("Deleted!", "Your imaginary file has been deleted.", "success");
					})() == true){
					
				location.href='cancelReservation?reservationId=${rInfo.reservationId}';
				}
			}else{  
			    return;
			}
		}
		 */
		 
		 
		 /* 
 		function cancelConfirm(){
			 var cancel = sweetAlert({
				  title: "Are you sure?",
				  text: "You will not be able to recover this imaginary file!",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Yes, delete it!",
				  closeOnConfirm: false
				})
		 }
			if (cancel == true){ 
				
				location.href='cancelReservation?reservationId=${rInfo.reservationId}';
			}else{  
			    return;
			}
		 */	
		 

	</script>



</body>
</html>














