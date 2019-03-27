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
	
<style>
  .one{
      background-image: url("/resources/img/main/main.jpg");
  }

  .input-group{
	  margin: 150px 0px;
  }
  
  input[type="text"]{
	  font-size: 20px;
      line-height: 50px;
  }
  
  input::placeholder{
	  line-height: 50px;
      font-size: 20px;
  }
</style>
<script type="text/javaScript" language="javascript" defer="defer">
<!-- 

function fn_integrated_search(){
	var integratedSearchKeyword = $('#integratedSearchKeyword').val();
	if(!integratedSearchKeyword){
		alert("검색어를 입력하세요.");
		return false;
	}
	document.IntegratedSearchForm.action= "<c:url value='/book/BookSearchIntegratedSelect.do'/>";
	document.IntegratedSearchForm.submit();
}

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
   <div class="container-full one">
		 <div class="row" style="height: 350px;">
		   <div class="col-md-6 col-md-offset-3">
		     <form:form id="IntegratedSearchForm" name="IntegratedSearchForm" method="post"> 
		       <div class="input-group">
		          <input id="integratedSearchKeyword" name="integratedSearchKeyword" type="text" class="form-control input-sm" placeholder="검색어를 입력하세요." style="height:50px;">
		          <span class="input-group-btn">
		            <button class="btn btn-primary btn-sm" onclick="fn_integrated_search(); return false;" style="height:50px;">
		              <h4><c:out value="통합검색"/></h4>
		            </button>
		          </span>  
		       </div>
		     </form:form> 
		   </div>
		 </div>
   </div>
   <div class="container-full two">
      <br/>
      <div class="row">
        <div class="col-md-10 col-md-offset-1">
          <div class="panel panel-default">
            <div class="panel-body">
            
              <ul class="nav nav-tabs">
                <li class="active"><a href="#new" data-toggle="tab">새로 들어온 책</a></li>
                <li><a href="#borrow" data-toggle="tab">대출이 많이 된 책</a></li>
              </ul>
              
              <div class="tab-content">
                <br/>
                <div class="tab-pane fade in active" id="new">
		          <c:forEach var="result" items="${newTop6}" varStatus="status">
		          <div class="col-md-2">
		            <a><img src="<c:out value='/resources/img/book/${result.image}.jpg' />" width="127px" height="158"></a>
		          </div>
		          </c:forEach>    
                </div>
                <div class="tab-pane fade" id="borrow">
  		          <c:forEach var="result" items="${borrowTop6}" varStatus="status">
  		          <div class="col-md-2">
  		            <a><img src="<c:out value='/resources/img/book/${result.image}.jpg' />" width="127px" height="158"></a>
  		          </div>
  		          </c:forEach>                 
                </div>
              </div> <!-- .tab-content --> 
  
            </div>
          </div>
        </div><!-- .row -->
      </div>
      
      <div class="row">
        <div class="col-md-10 col-md-offset-1">
          <div class="col-md-3">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="col-xs-2">
                  <div class="huge"><i class="fa fa-book"></i></div>
                </div>
                <div class="col-xs-2">
                  <div class="huge"><i class="fa fa-arrow-circle-o-right"></i></div>
                </div>
                <div class="col-xs-8 text-right">
                  <div class="huge">${inDayCount}권</div>
                  <div>오늘의 대출 수</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="col-xs-2">
                  <div class="huge"><i class="fa fa-book"></i></div>
                </div>
                <div class="col-xs-2">
                  <div class="huge"><i class="fa fa-arrow-circle-o-left"></i></div>
                </div>
                <div class="col-xs-8 text-right">
                  <div class="huge">${outDayCount}권</div>
                  <div>오늘의 반납 수</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="col-xs-2">
                  <div class="huge"><i class="fa fa-book"></i></div>
                </div>
                <div class="col-xs-2">
                  <div class="huge"><i class="glyphicon glyphicon-plus-sign"></i></div>
                </div>
                <div class="col-xs-8 text-right">
                  <div class="huge">${newDay7Count}권</div>
                  <div>한 주간 새로 들어온 도서</div>
                </div>
              </div>
            </div>
          </div>
	      <div class="col-md-3">
	        <div class="panel panel-default">
	          <div class="panel-body">
	            <div class="col-xs-2">
	              <div class="huge"><i class="fa fa-book"></i></div>
	            </div>
	            <div class="col-xs-2">
	              <div class="huge"><i class="fa fa-gittip"></i></div>
	            </div>
	            <div class="col-xs-8 text-right">
	              <div class="huge">${borrowTotalCount}권</div>
	              <div>누적 도서관 대출 수</div>
	            </div>
	          </div>
	        </div>
	      </div>          
        </div>
      </div>
      
   </div>
</div>
</body>
</html>