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
   <div class="container-full">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <form:form id="IntegratedSearchForm" name="IntegratedSearchForm" method="post"> 
            <div class="input-group">
               <input id="integratedSearchKeyword" name="integratedSearchKeyword" type="text" class="form-control input-sm" placeholder="검색어를 입력하세요.">
               <span class="input-group-btn">
                 <button class="btn btn-primary btn-sm" onclick="fn_integrated_search(); return false;">
                   <c:out value="통합검색"/>
                 </button>
               </span>  
            </div>
          </form:form> 
        </div>
      </div>
      <br/>
      <div class="row">
       <div class="col-md-1"></div>
       <div class="col-md-3">
          <h4>새로 들어온 책 TOP5</h4>
       </div>   
      </div>
      <div class="row">
        <div class="col-md-1"></div>
        <c:forEach var="result" items="${newTop5}" varStatus="status">
         <div class="col-md-2">
          <a><img src="<c:out value='/resources/img/book/${result.image}.jpg' />" width="127px" height="158"></a>
         </div>
        </c:forEach>
        <div class="col-md-1"></div>
      </div>
      <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-3">
         <h4>대출이 많이된 책 TOP5</h4>
      </div>   
     </div>
     <div class="row">
       <div class="col-md-1"></div>
       <c:forEach var="result" items="${borrowTop5}" varStatus="status">
        <div class="col-md-2">
         <a><img src="<c:out value='/resources/img/book/${result.image}.jpg' />" width="127px" height="158"></a>
        </div>
       </c:forEach>
       <div class="col-md-1"></div>
     </div>     
      <br/>
   </div>
</div>
</body>
</html>