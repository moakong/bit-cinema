<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
		<h2>결제 방법 선택</h2>
		<hr>
		
		<form id="payForm" action="finish" >
			<input type="hidden" name="schNo" value="${schNo}">
			<c:forEach var="s" items="${seats}">
				<input type="hidden" name="seat" value="${s}">
			</c:forEach>
			
			<input type="radio" name="payment" value="account" id="1" /><label for="1">계좌이체</label><br>
			<input type="radio" name="payment" value="credit" id="2" /><label for="2">신용/체크카드</label><br>
			<input type="radio" name="payment" value="kakao" id="3" /><label for="3">Kakao Pay</label><br>
			<input type="radio" name="payment" value="payco" id="4" /><label for="4">PAYCO</label><br>
			<input type="radio" name="payment" value="mobile" id="5" /><label for="5">휴대폰 소액 결제</label><br>
			<br><br>
			<!-- <button type="submit"  >결제하기</button> -->
			<!-- <input type="submit" onclick="return confirm('결제하시겠습니까?')" value="결제하기" > -->
			<input type="button" onclick="confirmPay()" value="결제하기" >
		</form>
	</div>
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>


</body>

<script>
	function confirmPay(){
		if (confirm('결제하시겠습니까?') == true){  
			alert("결제가 완료되었습니다.")
			document.getElementById("payForm").submit();
		}else{  
		    return;
		}
	} 
/* 
	document.querySelector('button#next').onclick = function(){
		swal({
			  title: "Auto close alert!",
			  text: "I will close in 2 seconds.",
			  timer: 2000,
			  showConfirmButton: false
			});
		
		swal("Good job!", "You clicked the button!", "success");
	};
 */	
 
 
 
 
	/* 
	function myFunction() {
		
		confirm("결제를 하시겠습니까?");
	}
	 */
</script>

</html>