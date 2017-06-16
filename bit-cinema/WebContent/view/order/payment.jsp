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
<style>
	#n {
		margin-bottom: 5px;
	}
	#text {
		border: none;
		text-align: right;
	}
	#amount {
		font-size: 15px;
	}
	.ho {
		border: none;
	}
	.n {
		border:none;
		text-align: right;
	}
	table {
		width: 450px;
	}
	
	.amount {
		text-align: right;
		font-size: 20px;
	}
</style>
</head>
<body>

<div class="container">
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	

	<div>
		<div>
			<c:import url="/view/include/mypageMenu.jsp" />
		</div>
		<div class="row">
			<form id="payForm" action="InsertOrder" method="post">
			<h1> 주문</h1>
		<table>
			<c:if test="${!empty cto}">
			<input type="hidden" name="flag" value="1"/>
			<input type="hidden" name="snackId" value="${cto.snackId}"/>
					<tr>
					<td>
					<a href="${pageContext.request.contextPath}/snack/DetailSnack?snackId=<c:out value="${cto.snackId}"/>">
					<div id="n">
						<img width="100px" height="100px" src="<c:out value="${cto.img}"/>"/></a>
					<c:out value="${cto.name}" />
					</td>
					<td>
					<c:out value="${cto.price}" />원					
					</td>

					<input type="hidden" name="count" value="<c:out value="${cto.count}" />"/>
					<td>
					<c:out value="${cto.count}" />개
					</td>
					<td class="amount">
					<c:out value="${cto.amount}" />원
					</td>				
					</tr>
					</div>
			</c:if>
			<c:if test="${!empty cartList}">
			<input type="hidden" name="flag" value="0"/>
				<c:forEach var="cart" items="${cartList}">
					<tr>
					<input type="hidden" name="snackId" value="${cart.snackId}"/>
					<td>
					<a href="${pageContext.request.contextPath}/snack/DetailSnack?snackId=<c:out value="${cart.snackId}"/>">
					<div id="n">
						<img width="100px" height="100px" src="<c:out value="${cart.img}"/>"/></a>
					<c:out value="${cart.name}" />
					</td>
					<td>
					<c:out value="${cart.price}" />원					
					</td>
					<td>
					<c:out value="${cart.count}" />개
					</td>					
					<td class="amount">
					<c:out value="${cart.amount}" />원
					</td>
					</tr>
					</div>
				</c:forEach>
			</c:if>
		</table>
				<hr>
				<h3>총 주문 금액 :<input id="text" type="text" readonly name="totalCount" value="${ totalCount }" />원</h3>
				<br><br>
				결제 방법 선택
				<hr>
				<input type="radio" name="payment" value="account" id="1" /><label for="1">계좌이체</label><br>
				<input type="radio" name="payment" value="credit" id="2" /><label for="2">신용/체크카드</label><br>
				<input type="radio" name="payment" value="kakao" id="3" /><label for="3">Kakao Pay</label><br>
				<input type="radio" name="payment" value="payco" id="4" /><label for="4">PAYCO</label><br>
				<input type="radio" name="payment" value="mobile" id="5" /><label for="5">휴대폰 소액 결제</label><br>
				<br><br>
				<div class="center-block" style="width: 200px;">
				<button class="btn btn-default" type="button" onclick="confirmPay()">결제하기</button>
				</div>
			</form>
		</div>
		
	</div>
	
</div>
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	


</body>

<script>


/* function confirmPay() {
	
	swal({
		  title: "결제하시겠습니까?",
		  text: "",
		  type: "warning",
		  showCancelButton: true,
		  //confirmButtonColor: "#DD6B55",
		  confirmButtonText: "결제하기",
		  cancelButtonText: "취소",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
		  if (isConfirm) {
			  swal({
				  title: "결제중입니다",
				  text: "몇 초정도 걸릴 수 있습니다.",
				  timer: 1500,
				  showConfirmButton: false
				  }, function() {
					  swal({
		                title: '결제가 완료되었습니다!',
		                text: '',
		                type: 'success'
		            }, function() {
		            	document.querySelector("#payForm").submit();
		            })
		            
		            }
				  
			  );
			  
			  
		  } else {
		    swal("결제가 취소되었습니다", "", "error");
		  }
		});
	
	
	} */


	function confirmPay(){
		if (confirm('결제하시겠습니까?') == true){  
			alert("결제가 완료되었습니다.")
			document.getElementById("payForm").submit();
		}else{  
		    return;
		}
	} 
 
	
	
</script>

</html>