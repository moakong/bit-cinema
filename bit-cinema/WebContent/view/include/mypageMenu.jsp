<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
/* body { */
/*   padding-top: 80px; */
/* } */

#sidebar {
  position: relative;
/*   top: 0px; */
/*    left: 220px; */
   width: 220px; 
      min-height: 890px;
/*   margin-left: -220px; */
  border: none;
  border-radius: 0;
  overflow-y: auto;
  background-color: white;
  /* bottom: 0; */
  overflow-x: hidden;
/*   padding-bottom: 40px; */
margin-right: 40px;
padding-left:10px;
padding-right:10px;
padding-top:50px;
float: left;
border-right: 0.5px solid black;

}

.side-bar > li > a { 
  color: #eee; 
  color: black; 
   width: 220px; 
 } 

 .side-bar li a:hover, 
 .side-bar li a:focus { 
  background-color: #333; 
  color: white;
 } 
#mp {
	margin-bottom: 30px;
	margin-left: 20px;
}
ul.nav > span {
	font-weight: bold;
	font-size: 20px;
}












</style>


<!-- <div class="container"> -->
<!--   <div class="col-md-3"> -->

   <div id="sidebar">
      <ul class="nav navbar-nav side-bar">
<!--       	<li class="side-bar"><span> </span></li> -->
<%--       	<li class="side-cbar tmargin"><img src="<c:out value="${user.profile}"/>" id="mp" class="img-circle" width="150px" height="150px"/></li> --%>
        <ul class="nav navbar-nav side-bar"><span>나의 예매내역</span>
        <li class="side-bar tmargin"><a href="${pageContext.request.contextPath}/reservation/check" ><span class="glyphicon glyphicon-list">&nbsp;</span>예매내역</a></li>
        <li class="side-bar tmargin"><a href="${pageContext.request.contextPath}/reservation/checkCancelledR" ><span class="glyphicon glyphicon-remove">&nbsp;</span>예매취소내역</a></li>
        </ul>

        <ul class="nav navbar-nav side-bar"><span>팝콘 스토어</span>
        <li class="side-bar"><a href="${pageContext.request.contextPath}/cart/ListCart" ><span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>장바구니</a></li>
        <li class="side-bar"><a href="${pageContext.request.contextPath}/order/ListOrder" ><span class="	glyphicon glyphicon-barcode">&nbsp;</span>구매내역</a></li>
        </ul>
        <ul class="nav navbar-nav side-bar"><span>회원정보</span>
        <li class="side-bar"><a href="${pageContext.request.contextPath}/member/ModifyInfoForm" ><span class="glyphicon glyphicon-pencil">&nbsp;</span>개인정보변경</a></li>
        <li class="side-bar"><a href="${pageContext.request.contextPath}/view/member/withdraw.jsp" ><span class="glyphicon glyphicon-cog">&nbsp;</span>회원탈퇴</a></li>
		</ul>
      </ul>
   </div>
<!--   </div> -->
  
<!-- </div> -->
