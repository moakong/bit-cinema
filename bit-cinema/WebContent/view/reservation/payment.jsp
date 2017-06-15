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

<style type="text/css">
.container{
          padding-top: 50px;
          padding-bottom: 100px;
      }
      .well {
    	border: 1px solid black !important;
        background-color: white !important;
        box-shadow: 3px 3px 5px 1px #9b9ea0 !important;
    }
    
    
    
    
    
    
    
    
    
    .selection {
	clear: both;
}

label {
  width: 180px;
  border-radius: 3px;
  border: 1px solid #D1D3D4
}

/* hide input */
input.radio:empty {
	margin-left: -9999px;
}

/* style label */
input.radio:empty ~ label {
	background-color: white;
	position: relative;
	float: left;
	line-height: 1.8em;
	text-indent: 3.25em;
	margin-top: -1em;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

input.radio:empty ~ label:before {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	left: 0;
	content: '';
	width: 2.5em;
	background: #D1D3D4;
	border-radius: 3px 0 0 3px;
}

/* toggle hover */
input.radio:hover:not(:checked) ~ label:before {
	/* transition: 0.7s; */
	content:'\2714';
	text-indent: .9em;
	color: #C2C2C2;
}

input.radio:hover:not(:checked) ~ label {
	transition: 0.7s;
	color: dodgerblue;
}

/* toggle on */
input.radio:checked ~ label:before {
	transition: 0.7s;
	content:'\2714';
	text-indent: .9em;
	color:black;
	background-color: deepskyblue;
}

input.radio:checked ~ label {
	/* transition: 0.2s; */
	-webkit-animation-name: rubberBand !important;
      animation-name: rubberBand !important;
      animation-duration: 300ms !important;
      animation-fill-mode: both !important;
	color: dodgerblue;
}

/* radio focus */
input.radio:focus ~ label:before {
	box-shadow: 0 0 0 3px #999;
}









 /*애니메이션*/
    @-webkit-keyframes rubberBand {
      0% {
        -webkit-transform: scale3d(1, 1, 1);
        transform: scale3d(1, 1, 1);
      }
      30% {
        -webkit-transform: scale3d(1.25, 0.75, 1);
        transform: scale3d(1.25, 0.75, 1);
      }
      40% {
        -webkit-transform: scale3d(0.75, 1.25, 1);
        transform: scale3d(0.75, 1.25, 1);
      }
      50% {
        -webkit-transform: scale3d(1.15, 0.85, 1);
        transform: scale3d(1.15, 0.85, 1);
      }
      65% {
        -webkit-transform: scale3d(0.95, 1.05, 1);
        transform: scale3d(0.95, 1.05, 1);
      }
      75% {
        -webkit-transform: scale3d(1.05, 0.95, 1);
        transform: scale3d(1.05, 0.95, 1);
      }
      100% {
        -webkit-transform: scale3d(1, 1, 1);
        transform: scale3d(1, 1, 1);
      }
    }
    @keyframes rubberBand {
      0% {
        -webkit-transform: scale3d(1, 1, 1);
        transform: scale3d(1, 1, 1);
      }
      30% {
        -webkit-transform: scale3d(1.25, 0.75, 1);
        transform: scale3d(1.25, 0.75, 1);
      }
      40% {
        -webkit-transform: scale3d(0.75, 1.25, 1);
        transform: scale3d(0.75, 1.25, 1);
      }
      50% {
        -webkit-transform: scale3d(1.15, 0.85, 1);
        transform: scale3d(1.15, 0.85, 1);
      }
      65% {
        -webkit-transform: scale3d(0.95, 1.05, 1);
        transform: scale3d(0.95, 1.05, 1);
      }
      75% {
        -webkit-transform: scale3d(1.05, 0.95, 1);
        transform: scale3d(1.05, 0.95, 1);
      }
      100% {
        -webkit-transform: scale3d(1, 1, 1);
        transform: scale3d(1, 1, 1);
      }
    }
    
    
    
    
    
    
    
    
    
    
    .selection{
        margin-left: 180px;
        text-align: left
        
    }
</style>

</head>
<body>

<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	

<div class="container text-center" style="width:600px">
	<div class="well">
		<h2>결제 방법 선택</h2>
		<hr>
		
		<div class="well" style="background: #f2f2f2 !important;" >
			<h3>성인 ${people}명</h3>
			<h4>${people * 9000}원</h4>
		</div>
		
		<form id="payForm" action="finish" >
			<input type="hidden" name="schNo" value="${schNo}">
			<c:forEach var="s" items="${seats}">
				<input type="hidden" name="seat" value="${s}">
			</c:forEach>
			
			<div class='selection'>
			<input class='radio' type="radio" name="payment" value="account" id="1" />
			<label for="1">계좌이체</label><br>
			</div>
			
			<div class='selection'>
			<input class='radio' type="radio" name="payment" value="credit" id="2" /><label for="2">신용/체크카드</label><br>
			</div>
			
			<div class='selection'>
			<input class='radio' type="radio" name="payment" value="kakao" id="3" /><label for="3">Kakao Pay</label><br>
			</div>
			
			<div class='selection'>
			<input class='radio' type="radio" name="payment" value="payco" id="4" /><label for="4">PAYCO</label><br>
			</div>
			
			<div class='selection'>
			<input class='radio' type="radio" name="payment" value="mobile" id="5" /><label for="5">휴대폰 소액 결제</label><br>
            </div>
			<br><br>
			
			<!-- <input type="button" onclick="confirmPay()" value="결제하기" > -->
			<button type="button" class="btn btn-primary" onclick="confirmPay()">결제하기</button>
		</form>
	</div>
	
</div>	
	
	
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>


</body>

<script>


function confirmPay() {
	
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
	
	
	}


/* 
	function confirmPay(){
		if (confirm('결제하시겠습니까?') == true){  
			alert("결제가 완료되었습니다.")
			document.getElementById("payForm").submit();
		}else{  
		    return;
		}
	} 
 */
	
	
</script>

</html>