<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>BIT CINEMA</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color: black;
    }
      
      #nav-font li a{
          color: azure;
      }
      #brand{
          color: azure;
      }
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: black;
      padding: 10px;
    }
      #footer p{
          color: azure;
      }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
</head>
<body>

<nav class="navbar .navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button><strong>
      <a id="brand" class="navbar-brand" href="#">BIT CINEMA</a></strong>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul id="nav-font" class="nav navbar-nav">
        <li><a href="#">예매</a></li>
        <li><a href="#">스토어</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" style="color:white"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
      </ul>
    </div>
  </div>
</nav>




<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="../../img/main/1-resized.jpg" alt="Image">
        <div class="carousel-caption">
          <h3>불한당</h3>
          <p>범죄조직의 1인자를 노리는 재호와 세상 무서운 것 없는 패기 넘치는 신참 현수는
 교도소에서 만나 서로에게 끌리고 끈끈한 의리를 다져간다.</p>
        </div>      
      </div>

      <div class="item">
        <img src="../../img/main/army.jpg" alt="Image">
        <div class="carousel-caption">
          <h3>대립군</h3>
          <p>1592년 임진왜란이 발발하자, 선조는 어린 ‘광해’(여진구)에게 조정을 나눈 ‘분조’를 맡기고 의주로 피란한다.  </p>
        </div>      
      </div>
    
   <div class="item">
        <img src="../../img/main/2.jpg" alt="Image">
        <div class="carousel-caption">
          <h3>캐리비안의 해적: 죽은 자는 말이 없다</h3>
          <p>전설적인 해적 캡틴 ‘잭 스패로우’의 눈 앞에 죽음마저 집어삼킨 바다의 학살자 
 ‘살라자르’(하비에르 바르뎀)가 복수를 위해 찾아온다. 둘 사이에 숨겨진 엄청난 비밀··· </p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
  
  
  
  
  
  
  
<div class="container text-center">    
  <h3>Moive Ranking</h3><br>
  <div class="row">
    <div class="col-sm-3">
    <div class="btn-group btn-group-sm btn-block">
  <button type="button" class="btn btn-default col-sm-5" >박스오피스</button>
  <button type="button" class="btn btn-default col-sm-5" >예매순</button><br><br>
</div>
     
      <div class="well" style="text-align:left">
       <p>1위 미이라</p>
       <p>2위 원더우먼</p>
       <p>3위 캐리비안의 해적</p>
       <p>4위 노무현입니다</p>
       <p>5위 대립군</p>
       <p>6위 악녀</p>
       <p>7위 겟 아웃</p>
       <p>8위 박열</p>
       <p>9위 나의 붉은 고래</p>
       <p>10위 보스 베이비</p>
      </div>
    </div>
    <div class="col-sm-3"> 
        <p><strong>1위</strong></p>
      <img src="../../img/main/mummy.jpg" class="img-responsive" style="width:100%">
      <p><strong>미이라</strong></p>    
    </div>
    <div class="col-sm-3"> 
        <p><strong>2위</strong></p>
      <img src="../../img/main/wonder.jpg" class="img-responsive" style="width:100%">
      <p><strong>원더우먼</strong></p>   
    </div>
    <div class="col-sm-3"> 
        <p><strong>3위</strong></p>
      <img src="../../img/main/cari.jpg" class="img-responsive" style="width:100%">
      <p><strong>캐리비안의 해적</strong></p>    
    </div>

  </div>
</div><br>

   
   
  <div class="container text-center">   
    <div class="row">
            <div class="col-sm-3">
      <div class="well">
       <p>Some text..</p>
      </div>
      <div class="well">
       <p>Some text..</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="well">
       <p>Some text..</p>
      </div>
      <div class="well">
       <p>Some text..</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="well">
       <p>Some text..</p>
      </div>
      <div class="well">
       <p>Some text..</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="well">
       <p>Some text..</p>
      </div>
      <div class="well">
       <p>Some text..</p>
      </div>
    </div>
    </div>
    </div>

<footer id="footer" class="container-fluid text-center">
  <p>Copyright © 2011-2017 by Bit Cinema. Inc. All rights reserved</p>
</footer>

</body>
</html>