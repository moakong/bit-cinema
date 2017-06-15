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
      min-height: 800px;
/*   margin-left: -220px; */
  border: none;
  border-radius: 0;
  overflow-y: auto;
  background-color: #222;
  /* bottom: 0; */
  overflow-x: hidden;
/*   padding-bottom: 40px; */
margin-right: 40px;
padding-left:10px;
padding-top:50px;
float: left;

}

.side-bar > li > a {
  color: #eee;
  width: 220px;
}

.side-bar li a:hover,
.side-bar li a:focus {
  background-color: #333;
}
#mp {
	margin-bottom: 30px;
	margin-left: 20px;
}

</style>


<!-- <div class="container"> -->
<!--   <div class="col-md-3"> -->

   <div id="sidebar">
      <ul class="nav navbar-nav side-bar">
      	<li class="side-bar"><span> </span></li>
      	<li class="side-bar tmargin"><img src="<c:out value="${user.profile}"/>" id="mp" class="img-circle" width="150px" height="150px"/></li>
        <li class="side-bar tmargin"><a href="${pageContext.request.contextPath}/reservation/check"><span class="glyphicon glyphicon-list">&nbsp;</span>예매내역</a></li>
        <li class="side-bar"><a href="${pageContext.request.contextPath}/cart/ListCart"><span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>스토어 장바구니</a></li>
        <li class="side-bar"><a href="${pageContext.request.contextPath}/order/ListOrder"><span class="	glyphicon glyphicon-barcode">&nbsp;</span>스토어 구매내역</a></li>
        <li class="side-bar"><a href="${pageContext.request.contextPath}/member/ModifyInfoForm"><span class="glyphicon glyphicon-cog">&nbsp;</span>개인정보변경</a></li>

      </ul>
   </div>
<!--   </div> -->
  
<!-- </div> -->
