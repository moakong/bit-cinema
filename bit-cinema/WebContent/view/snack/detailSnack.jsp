<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	#name {
		text-align: left;
		font-size: 35px;
		margin-bottom: 20px;
	}
	#price, #count, #explan, #buy{
		text-align: left;
		margin: 10px;
		
		font-size: 18px;
	}
	.a{
		margin-top: 30px;
	}
	.container {
	}
	.btn-danger {
		display:block;
		padding: 5px;
		margin-bottom: 5px;
	}
	.list {
		text-align: right;
	}
</style>
</head>
<body>
	<div class="container">
		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>
		<div>
			<form name="m" action="${pageContext.request.contextPath}/cart/InsertCart" method="post">
				<div class="row">
					<div class="col-sm-5">
					<img width="400px" height="400px" src="<c:out value="${snack.img}"/>"/>
					</div>
					
					<div class="a col-sm-5">
						<div id="name">
						<c:out value="${snack.name}" /><br>
						</div>
						<div id="price">
						판매가 &nbsp; &nbsp; <c:out value="${snack.price}" />원						
						</div><br>
						<div id="count">
						수량  &nbsp; &nbsp; &nbsp;
						 <select name="count">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>개<br>
						</div>
						<input type="hidden" name="price" value="${snack.price}">
						<input type="hidden" name="name" value="${snack.name}">
						<input type="hidden" name="img" value="${snack.img}">
						<input type="hidden" name="snackId" value="${snack.snackId}">
						<input type="hidden" id="gocart" name="gocart" value="">				
						<div id="buy">유효기간 구매후 30일</div>
						<table>
						<tr>
						<td>
						 <button  class="btn btn-default"  type="submit" onclick="cart();">장바구니</button>
						</td>
						<td>
						<button class="btn btn-default"  onclick="doAction()" type="button">바로구매</button>			 
						</td>
						</tr>
						<tr>
						<td colspan="2" class="list">
						<button  class="btn btn-default" type="button" onclick="location.href='${pageContext.request.contextPath}/snack/ListSnack?category=<c:out value="${snack.categoryId}"/>'">목록</button>
						</td>
						</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
<script>
	function doAction() {
		var f = document.m;
		f.action = "../order/PayOneSnack";
		f.submit();
	}
	function cart() {
		var con = confirm('상품이 장바구니에 담겼습니다.\r\n장바구니로 이동하시겠습니까');
		var gocart = document.querySelector("#gocart");
		console.log(gocart);
		if(con){
			gocart.value = "go";
		}else{
			gocart.value = "no";
		}
	}
</script>
</body>
</html>