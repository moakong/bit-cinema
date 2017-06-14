<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비트시네마</title>
<style type="text/css">
/* 
	input {
	    visibility:hidden;
	}
	 */
	
	 
	label {
	    cursor: pointer;
	}
	
	/* 클릭한 내용 하이라이트! */
	/* input:checked + label {
	    background: yellow;
	} */
	
	
 	.container{
          padding-top: 50px;
          padding-bottom: 100px;
      }
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 10px;
      background-color: ;
      height: 100%;
    }

    
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
      
    
    
    
    
    
    
      .selection {
	clear: both;
}

label {
  width: 260px;
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
    
    
    .well {
        background-color: ghostwhite !important;
        box-shadow: 3px 3px 5px 1px #9b9ea0 !important;
    }
</style>
</head>
<body>


	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	






<div class="container">    
  <div class="row content" >
   
   
   
    <div class="col-sm-3 sidenav well">
      <h3>영화 </h3>
		 <div class="btn-group btn-group-sm btn-block">
	  		<button type="button" class="btn btn-default col-sm-5" onclick="location.href='selectMovie?order=name'">이름순</button>
	  		<button type="button" class="btn btn-default col-sm-5" onclick="location.href='selectMovie?order=reservation'">예매순</button><br><br>
		</div>
		
		
		<form id="selectMovie">
			<c:forEach var="movie" items="${list}">
			<div class="selection">
			<input class="radio" type="radio" name="movieId" value="${movie.movieId}" id="m${movie.movieId}" /><label for="m${movie.movieId}">${movie.movieName}</label><br>
			</div>
			</c:forEach>
		</form>
    </div>
    
    
    
    <div class="col-sm-2 sidenav well">
	    <div id="selectArea"> 
	    </div>
	    
	     <div id="selectTheater">
   		 </div>
    </div>
    
    
    
    
    <div class="col-sm-2 sidenav well" id="selectDate">
    </div>
    
    
    
    
    <div class="col-sm-3 sidenav well" id="selectTime">
    </div>
    
    
    
    
    
    <div class="col-sm-2 sidenav well" id="selectPeople">
    </div>
    
    
    
    
    
    
    
    
  		  </div>
  		  
  		  
	<div class="container text-center" id="submitBtn">
	</div>
	  		  
	<!--     <div id="submitBtn">
	    </div> -->
	    
	    
	    
</div>
    
    
    
    
    
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
    
    
    
	<script type="text/javascript">
	var movieId;
	var theaterId;
	var date;
	var schId;
	var people;
	
	$("#selectMovie").on("click", function(e) {
			movieId = $("#selectMovie input[name='movieId']:checked").val();
			//console.log("movieId : ", movieId); // test
			
			$("#selectArea").html("<h3>지역</h3><form id='selectAreaForm' ></form>");
			
			var params = $("#selectMovie").serialize();
			//console.log("params : ", params); // test

			$.ajax({ 
				url: "selectArea",
				data: params,
				dataType: "json", 
				success: function(data) {
					var output = "";
					for(var i = 0; i < data.length; i++){
						var m = data[i];
						output += "<div class='selection'><input class='radio' type='radio' name='area' value='" + m.locationId + "' id='l" + m.locationId + "' /><label for='l" + m.locationId + "'>" + m.locationName + "</label></div>";						
						//console.log("m.locationId : ", m.locationId);						
						//console.log("m.locationName : ", m.locationName);						
					}
					
					$("#selectAreaForm").html(output);
				}
			});
		});
	
	
	
	
	
	
	
	$("#selectArea").on("click", function(e) {
		var areaId = $("#selectAreaForm input[name='area']:checked").val();
		//console.log("areaId : ", areaId); // test
		//console.log("movieId : ", movieId); // test
		
		$("#selectTheater").html("<hr><h3>극장</h3><form id='selectTheaterForm' ></form>");
		
		var params = $("#selectAreaForm").serialize(); // 왜 안되지?
		//var params = "area=" + areaId;
		console.log("전 params : ", params); // test
		params += "&movieId=" + movieId
		console.log("후 params : ", params); // test

		$.ajax({ 
			url: "selectTheater",
			data: params,
			dataType: "json", 
			success: function(data) {
				var output = "";
				for(var i = 0; i < data.length; i++){
					var m = data[i];
					
					//output += "<input type='radio' name='area' value='" + m.locationId + "' id='" + m.locationId + "' /><label for='" + m.locationId + "'>" + m.locationName + "</label><br>";						
					output += '<div class="selection"><input class="radio" type="radio" name="theaterId" value="' + m.theaterId + '" id="t' + m.theaterId + '" /><label for="t' + m.theaterId + '">' + m.theaterName + '</label></div>';						
					
					// console.log("m.locationName : ", m.locationName);						
				}
				
				$("#selectTheaterForm").html(output);
			}
		});
	});
	
	
	
	
	$("#selectTheater").on("click", function(e) {
		theaterId = $("#selectTheaterForm input[name='theaterId']:checked").val();
		//console.log("theaterId : ", theaterId); // test
		
		$("#selectDate").html("<h3>날짜</h3><form id='selectDateForm' ></form>");
		
		//var params = "theaterId=" + theaterId + "&movieId=" + movieId;
		//console.log("params : ", params); // test

		$.ajax({ 
			url: "selectDate",
			//data: params,
			dataType: "json", 
			success: function(data) {
				var output = "";
				for(var i = 0; i < data.length; i++){
					var m = data[i];
					output += '<div class="selection"><input class="radio" type="radio" name="date" value="' + m + '" id="d' + m + '" /><label for="d' + m + '">' + m + '</label></div>';						
					
					//console.log("날짜: ", m); // 확인용					
				}
						
				$("#selectDateForm").html(output);
			}
		});
	});
	
	
	
	
	
	$("#selectDate").on("click", function(e) {
		date = $("#selectDateForm input[name='date']:checked").val();
		//console.log("date : ", date); // test
		
		$("#selectTime").html("<h3>시간</h3><form id='selectTimeForm' ></form>");
		
		var params = "theaterId=" + theaterId + "&movieId=" + movieId + "&date=" + date;
		//console.log("params : ", params); // test

		$.ajax({ 
			url: "selectTime",
			data: params,
			dataType: "json", 
			success: function(data) {
				var output = "";
				for(var i = 0; i < data.length; i++){
					var m = data[i];
					output += '<div class="selection"><input class="radio" type="radio" name="time" value="' + m.scheduleId + '" id="time' + m.scheduleId + '" /><label for="time' + m.scheduleId + '">' + m.screenName + ' : ' + m.startTime + ' ~ ' + m.endTime + '</label></div>';						
					
					//console.log("스케쥴 ID: ", m.scheduleId); // 확인용					
				}
				
				if(data.length == 0){
					output = "해당 영화의 상영 스케쥴이 없습니다.";
				}
						
				$("#selectTimeForm").html(output);
			}
		});
	});
	
	
	
	
	
	//int schNo =  Integer.parseInt(request.getParameter("schNo"));
	//int people =  Integer.parseInt(request.getParameter("people"));
	$("#selectTime").on("click", function(e) {
		schId = $("#selectTimeForm input[name='time']:checked").val();
		console.log("schId : ", schId); // test
		
		$("#selectPeople").html("<h3>인원</h3><form id='selectPeopleForm' action='selectSeat' ></form>");
		

		var output = "";
		for(var i = 1; i < 11; i++){
			output += '<div class="selection"><input class="radio" type="radio" name="people" value="' + i + '" id="r' + i + '" /><label for="r' + i + '">' + i + '</label></div>';						
		}
		
		output += '<input type="hidden" name="schNo" value="' + schId + '" >';
		//output += '<br><br><button class="btn btn-primary">좌석 선택</button>';
		$("#selectPeopleForm").html(output);
		
	});
	
	
	
	
	
	
	//http://localhost:8000/bit-cinema/reservation/selectSeat?people=2&schNo=1
	$("#selectPeople").on("click", function(e) {
		$("#submitBtn").html('<button class="btn btn-primary" onclick="submit();">좌석 선택</button>');
	});
	
	
	
	
	
	function submit() {
		var f= $("#selectPeopleForm");
		f.submit();
	}
	
	</script>
	
</body>
</html>
















