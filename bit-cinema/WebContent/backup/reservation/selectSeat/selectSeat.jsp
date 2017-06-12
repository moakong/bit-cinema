<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	/* 전체 가로 크기 + 사이드 선 */
    .theater {
      margin: 20px auto !important;
      max-width: 300px !important;
        
      border-right: 5px solid #d8d8d8 !important;
      border-left: 5px solid #d8d8d8 !important;
    }


    /* 전체 가로 크기 안으로 버튼 넣기*/
    *, *:before, *:after {
      box-sizing: border-box !important;
    }



 

    /*리스트 스타일 지우기*/
    ol {
      list-style: none !important;
      padding: 0 !important;
      margin: 0 !important;
    }



    /*줄바꿈??*/
    .seats {
      display: flex !important;
      flex-direction: row !important;
      flex-wrap: nowrap !important;
      justify-content: flex-start !important;
    }




    /* 체크버튼 없애기*/
    .seat input[type=checkbox] {
      position: absolute !important;
      opacity: 0 !important;
    }






    /*라벨 크기 조정*/
    .seat {
      display: flex !important;
      flex: 0 0 14.28571428571429% !important;
      padding: 5px !important;
      position: relative !important;
    }


    /* 세번째 좌석 옆에 비우기*/
    .seat:nth-child(3) {
      margin-right: 13% !important;
    }



    /* 기본 바튼 상태*/
    .seat label {
      display: block !important;
      position: relative !important;
      width: 100% !important;
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


    .seat label:before {
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



    .seat label:hover {
      cursor: pointer !important;
      box-shadow: 0 0 0px 2px #5C6AFF !important;
    }







     /* 체크된 상태*/
    .seat input[type=checkbox]:checked + label {
      background: #F42536 !important;
      -webkit-animation-name: rubberBand !important;
      animation-name: rubberBand !important;
      animation-duration: 300ms !important;
      animation-fill-mode: both !important;
    }











    /* disabled박스*/
    .seat input[type=checkbox]:disabled + label {
      background: #dddddd !important;
      text-indent: -9999px !important;
      overflow: hidden !important;
    }

    .seat input[type=checkbox]:disabled + label:after {
      content: "X" !important;
      text-indent: 0 !important;
      position: absolute !important;
      top: 4px !important;
      left: 50% !important;
      transform: translate(-50%, 0%) !important;
    }

    .seat input[type=checkbox]:disabled + label:hover {
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
        
    </style>
</style>


</head>

<body>

	<div>
		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>	
	<div>
		<h2>좌석 선택</h2>
		<hr>
		
		<form action="payment">
			<input type="hidden" name="schNo" value="${schNo}" />
			<input type="hidden" name="people" value="${people}" />
			
			
			
			<div class="theater">
			
			<c:forEach var="seat" items="${all}">
				<c:if test="${seat.c == 1}">
					<ol class="seats">
				</c:if>
				
					<li class="seat">
			          <input type="checkbox" name="seat" id="${seat.seatId}" value="${seat.seatId}" onclick="CountChecked(this)"/>
			          <label for="${seat.seatId}">${seat.c} &#${seat.r + 64}</label>
			        </li>
			        
				<c:if test="${seat.c} == ${seat.totalC}">
					</ol>
				</c:if>
			</c:forEach>
			
				<br><br>
				<button>다음</button>
			</div>
			
			
			
			
			<%-- 
			<c:forEach var="i" begin="1" end="${all[0].totalC}">
				&nbsp; &nbsp;${i} <!-- 열 번호 출력 -->
			</c:forEach>
			
			<c:forEach var="seat" items="${all}">
				<c:if test="${seat.c == 1}">
				<br>&#${seat.r + 64}; <!-- 행 알파벳 출력 -->
				</c:if>
				
				<input type="checkbox" name="seat" id="${seat.seatId}" 
				value="${seat.seatId}" onclick="CountChecked(this)" /><label for="${seat.seatId}"></label>
			</c:forEach>
				<br><br>
				<button>다음</button>
			 --%>
			
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







