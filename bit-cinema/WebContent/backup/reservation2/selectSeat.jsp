<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    	html{
    	font-size: auto;
    	}
    	

	h1 {
        margin: 50px !important;
    }
    
       .reservation{
             border-radius: 4px;
           border: 1px solid gray !important;
        background-color: white !important;
        box-shadow: 3px 3px 5px 1px #9b9ea0 !important;
           padding: 100px; 
           display: flex !important;
           align-items: center !important;
           justify-content: center !important;
           margin: 30px;
       }
       
       
        *, *:before, *:after {
      box-sizing: border-box !important;
    }

       /*줄바꿈??*/
    .seats {
      display: flex !important;
      flex-direction: row !important;
      flex-wrap: nowrap !important;
      justify-content: center !important;
    }
       
       .theater {
           width: 300px !important;
           border-right: 5px solid #d8d8d8 !important;
          border-left: 5px solid #d8d8d8 !important;
           
       }
       
           /* 체크버튼 없애기*/
    input[type=checkbox] {
      position: absolute !important;
      opacity: 0 !important;
    }
       
       
          /*라벨 크기 조정*/
    label {
      display: flex !important;
      flex: 0 0 14.28571428571429% !important;
      padding: 5px !important;
      position: relative !important;
    }

       
       /* 기본 바튼 상태*/
    label {
      
      display: block !important;
      position: relative !important;
      width: 10px !important;
      text-align: center !important;
      font-size: 14px !important;
      font-weight: bold !important;
      line-height: 1.5rem !important;
      padding: 4px 0 !important;
      background: #bada55 !important;
      border-radius: 5px !important;
      animation-duration: 300ms !important;
      animation-fill-mode: both !important;
    }


    label:before {
      content: "" !important;
      position: absolute !important;
      width: 75% !important;
      height: 75% !important;
      top: 1px !important;
      left: 50% !important;
      transform: translate(-50%, 0%) !important;
      background: rgba(255, 255, 255, 0.4) !important;
      border-radius: 3px !important;
    }



    label:hover {
      cursor: pointer !important;
      box-shadow: 0 0 0px 2px #5C6AFF !important;
    }
       
       
       
       
       /* 체크된 상태*/
    input[type=checkbox]:checked + label {
      background: #F42536 !important;
      -webkit-animation-name: rubberBand !important;
      animation-name: rubberBand !important;
      animation-duration: 300ms !important;
      animation-fill-mode: both !important;
    }
       
       
       
       
     /* disabled박스*/
    input[type=checkbox]:disabled + label {
      background: #dddddd !important;
      text-indent: -9999px !important;
      overflow: hidden !important;
    }

    input[type=checkbox]:disabled + label:after {
      content: "X" !important;
      text-indent: 0 !important;
      position: absolute !important;
      top: 4px !important;
      left: 50% !important;
      transform: translate(-50%, 0%) !important;
    }

    input[type=checkbox]:disabled + label:hover {
      box-shadow: none !important;
      cursor: not-allowed !important;
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
    .rubberBand {
      -webkit-animation-name: rubberBand;
      animation-name: rubberBand;
    }
       
       
       
       
     #btn{
     	margin-bottom: 100px;
     }  
</style>  


</head>

<body>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
	
		
		

<div class="container text-center">
	<h1 >좌석 선택</h1>
	<div class="reservation">
		
		<form name="mForm" action="payment">
			<input type="hidden" name="schNo" value="${schNo}" />
			<input type="hidden" name="people" value="${people}" />
			
			
			
			
			<div class="theater">
				<c:forEach var="seat" items="${all}">
					<c:if test="${seat.c == 1}">
						<div class="seats">
					</c:if>
					
			          <input class="seat" type="checkbox" name="seat" id="${seat.seatId}" value="${seat.seatId}" onclick="CountChecked(this)"/>
			          <label for="${seat.seatId}">${seat.c}&#${seat.r + 64}</label>
				        
					<c:if test="${seat.c == seat.totalC}">
						</div> <br>
					</c:if>
				</c:forEach>
			</div>
			
		
		
		
		</form>
	</div>
	
	</div>
	
	
	<div class="container text-center">
		<button id="btn" class="btn btn-primary center-block" onclick="submit();">다음</button>
	</div>
	
	
	
	
	
	
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>
	

</body>
	
	
<script type="text/javascript">
	
	function submit() {
		var f= document.mForm;
		f.submit();
	}


	
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
			alert (maxChecked+"개의 자리를 모두 선택하셨습니다.");
		field.checked = false;
		totalChecked -= 1;
		}
	}
</script>
 
</html>


			<%-- ${(char)(seat.r + 64)} --%>  <!-- 형변환 안됨 -->
			<!-- 검색 : jsp convert int to char -->
			<!-- 참고 : https://unicode-table.com/en/#0043 -->







