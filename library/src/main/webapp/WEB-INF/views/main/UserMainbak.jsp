<%--
  Class Name : UserMain.jsp
  Description : User Main JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2018.10.20   yeoni94     최초 생성
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"  %>
<!DOCTYPE html>
<html>
<head>

	<title>library - User Main</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!-- 

 -->
<c:if test="${!empty message}">
alert("${message}");
</c:if>
</script>
</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>    
<!-- 전체 레이어 시작 -->
<div id="wrapper">
   <div class="container-full">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <div class="col-md-6 col-md-offset-3">
            <div class="input-group">
              <input id="btn-input" type="text" class="form-control input-sm" placeholder="검색어를 입력하세요.">
              <span class="input-group-btn">
                <button class="btn btn-primary btn-sm" type="submit">
                  <c:out value="통합검색"/>
                </button>
              </span>
            </div>
          </div>
        </div>
      </div>
      <br/>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-5">
           <div id="myCarousel" class="carousel slide" data-ride="carousel">
             <ol class="carousel-indicators">
               <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
               <li data-target="#myCarousel" data-slide-to="1"></li>
               <li data-target="#myCarousel" data-slide-to="2"></li>
             </ol>
             
             <div class="carousel-inner">
               <div class="item active">
                  <img src="/resources/img/slide/1.jpg" alt="1">
               </div>
               <div class="item">
                  <img src="/resources/img/slide/2.jpg" alt="2">
               </div>
               <div class="item">
                  <img src="/resources/img/slide/3.jpg" alt="3">
               </div>
             </div>
             
             <a class="left carousel-control" href="#myCarousel" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left"></span>
               <span class="sr-only">Previous</span>
             </a>
             <a class="right carousel-control" href="#myCarousel" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right"></span>
               <span class="sr-only">Next</span>
             </a>
          </div> 
        </div>
        <div class="col-md-2">
          <div class="pannel panel-primary">
            <div class="panel-heading">
               오늘의 도서관
            </div>
            <div class="panel-body" style="border-right:1px solid #337ab7; border-left:1px solid #337ab7; border-bottom:1px solid #337ab7;">
	            <h5>
	            <%
	            Date date = new java.util.Date();
	            java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd (E"+"요일"+")");
	            String today = formatter.format(date);
	            out.println(today);
	            %>
	           </h5>
	           <h5>
	            <%
	             java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("E");
	             String E = formatter2.format(date);
	             if(E.equals("토") || E.equals("일")){
	          	  out.println("개관 09:00 ~ 18:00");
	             }else if(E.equals("월")){
	          	  out.println("오늘은 휴관일입니다."); 
	             }else{
	          	  out.println("개관 09:00 ~ 21:00");
	             }
	            %>
	           </h5>
	           <h5>
	             오늘의 대출 수 : ${inDayCount}권
	           </h5>
	           <h5>
	             오늘의 반납 수 : ${outDayCount}권
	           </h5>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="pannel panel-primary">
            <div class="panel-heading">
              빈 공간
            </div>
            <div class="panel-body"  style="border-right:1px solid #337ab7; border-left:1px solid #337ab7; border-bottom:1px solid #337ab7;">

            </div>
          </div>
        </div>
        <div class="col-md-1"></div>
      </div>
      <br/>
      <div class="row">
       <div class="col-md-1"></div>
       <div class="col-md-2">
          <h4>새로 들어온 책 TOP5</h4>
       </div>   
      </div>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-2">
         <a>
           <img src="/resources/img/book/1.JPG" width="120px">
         </a>
        </div>
        <div class="col-md-2">
         <a>
           <img src="/resources/img/book/2.jpg" width="120px">
         </a>
        </div>
        <div class="col-md-2">
          <a>
            <img src="/resources/img/book/3.jpg" width="120px">
          </a>
        </div>
        <div class="col-md-2">
          <a>
            <img src="/resources/img/book/4.jpg" width="120px">
          </a>
        </div>
        <div class="col-md-2">
          <a>
            <img src="/resources/img/book/5.jpg" width="120px">
          </a>
        </div>
        <div class="col-md-1"></div>
      </div>
      <br/>
   </div>
</div>
</body>
</html>