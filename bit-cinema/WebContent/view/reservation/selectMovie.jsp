<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비트시네마</title>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	

	<div>
		<h2>영화 선택</h2>
		<hr>
		
		<a href="selectMovie?order=name">이름순</a> 
		<a href="selectMovie?order=reservation">예매순</a> <br><br>
		
		<form id="selectMovie">
			<c:forEach var="movie" items="${list}">
			<input type="radio" name="movieId" value="${movie.movieId}" id="${movie.movieId}" /><label for="${movie.movieId}">${movie.movieName}</label><br>
			</c:forEach>
		</form>
	</div>



	<div id="selectArea"></div>


	<div id="selectTheater"></div>


	<div id="selectDate"></div>


	<div id="selectTime"></div>


	<div id="selectPeople"></div>


	<div id="selectSeat"></div>



	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
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
			
			$("#selectArea").html("<h2>지역 선택</h2><hr><form id='selectAreaForm' ></form>");
			
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
						output += "<input type='radio' name='area' value='" + m.locationId + "' id='" + m.locationId + "' /><label for='" + m.locationId + "'>" + m.locationName + "</label><br>";						
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
		
		$("#selectTheater").html("<h2>극장 선택</h2><hr><form id='selectTheaterForm' ></form>");
		
//		var params = $("#selectAreaForm").serialize(); // 왜 안되지?
		var params = "area=" + areaId;
		//console.log("전 params : ", params); // test
		params += "&movieId=" + movieId
		//console.log("후 params : ", params); // test

		$.ajax({ 
			url: "selectTheater",
			data: params,
			dataType: "json", 
			success: function(data) {
				var output = "";
				for(var i = 0; i < data.length; i++){
					var m = data[i];
					
					//output += "<input type='radio' name='area' value='" + m.locationId + "' id='" + m.locationId + "' /><label for='" + m.locationId + "'>" + m.locationName + "</label><br>";						
					output += '<input type="radio" name="theaterId" value="' + m.theaterId + '" id="' + m.theaterId + '" /><label for="' + m.theaterId + '">' + m.theaterName + '</label><br>';						
					
					// console.log("m.locationName : ", m.locationName);						
				}
				
				$("#selectTheaterForm").html(output);
			}
		});
	});
	
	
	
	
	$("#selectTheater").on("click", function(e) {
		theaterId = $("#selectTheaterForm input[name='theaterId']:checked").val();
		//console.log("theaterId : ", theaterId); // test
		
		$("#selectDate").html("<h2>날짜 선택</h2><hr><form id='selectDateForm' ></form>");
		
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
					output += '<input type="radio" name="date" value="' + m + '" id="' + m + '" /><label for="' + m + '">' + m + '</label><br>';						
					
					//console.log("날짜: ", m); // 확인용					
				}
						
				$("#selectDateForm").html(output);
			}
		});
	});
	
	
	
	
	
	$("#selectDate").on("click", function(e) {
		date = $("#selectDateForm input[name='date']:checked").val();
		//console.log("date : ", date); // test
		
		$("#selectTime").html("<h2>시간 선택</h2><hr><form id='selectTimeForm' ></form>");
		
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
					output += '<input type="radio" name="time" value="' + m.scheduleId + '" id="' + m.scheduleId + '" /><label for="' + m.scheduleId + '">' + m.screenName + ' : ' + m.startTime + ' ~ ' + m.endTime + '</label><br>';						
					
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
		
		$("#selectPeople").html("<h2>인원 선택</h2><hr><form id='selectPeopleForm' action='selectSeat' ></form>");
		

		var output = "";
		for(var i = 0; i < 10; i++){
			output += '<input type="radio" name="people" value="' + i + '" id="' + i + '" /><label for="' + i + '">' + i + '</label><br>';						
		}
		
		output += '<input type="hidden" name="schNo" value="' + schId + '" >';
		output += "<br><br><button>좌석 선택</button>";
		$("#selectPeopleForm").html(output);
		
	});
	
	
	
	</script>
	
</body>
</html>
















