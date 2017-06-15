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

<style type="text/css">
.well {
    	border: 1px solid gray !important;
        background-color: white !important;
        box-shadow: 3px 3px 5px 1px #9b9ea0 !important;
       
        width: 700px;
        margin-left: 100px;
        margin-top: 50px;
    }

</style>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
	
	
	<div class="container text-center">
	<div class="well">
		<h1>상세 예매 내역</h1>
		<hr style="border-top: 3px double #8c8b8b;"><br>
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
		
		<button class="btn btn-danger" onclick="cancelConfirm()" >예매 취소</button><br><br>
		<button class="btn btn-default" onclick="location.href='check'" >나의 예매내역</button>
	</div>
	</div>
	
	
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>





	<script type="text/javascript">
	
		function cancelConfirm() {
		
			swal({
				  title: "예매를 취소하시겠습니까?",
				  text: "",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "예매취소",
				  cancelButtonText: "아니요",
				  closeOnConfirm: false,
				  //closeOnCancel: false
				},
				function(){
					 swal({
			                title: '예매가 취소되었습니다!',
			                text: '',
			                type: 'success'
			            }, function() {
			            	location.href='cancelReservation?reservationId=${rInfo.reservationId}';
			            });
				});
			
			
			
			}
		
	/* 
 		function cancelConfirm(){
			if (confirm("예매를 취소하시겠습니까?") == true){
				alert("예매가 취소되었습니다.");
				location.href='cancelReservation?reservationId=${rInfo.reservationId}';
			}else{  
			    return;
			}
		} 
 */
	</script>


</body>
</html>














