<%--
  Class Name : BookLoanReturn.jsp
  Description : Book Loan Return JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2019.02.09   yeoni94     최초 생성
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.text.*"  %>
<!DOCTYPE html>
<html>
<head>

	<title>library - Book Loan Return</title>

<script type="text/javaScript">
<!-- 
  function fn_loan_return(){
	var bnum = $("#bnum").val();
	if(!bnum){
	  alert("도서 번호를 입력하세요.");
	  return false;
	}
	document.BookLoanReturnForm.action = "<c:url value='/book/BookLoanReturn.do'/>";
	document.BookLoanReturnForm.submit();
  }
<c:if test="${!empty message}">
alert("${message}");
</c:if>
 -->
</script>
</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>    
<!-- 전체 레이어 시작 -->
<div id="wrapper">
   <div class="container-full">
      <div class="col-lg-12"> 
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="<c:url value='/main/UserMain.do'/>">Home</a>
          </li>
          <li class="breadcrumb-item active">
            <strong><a href='#'>대출/반납</a></strong>
          </li>
        </ol>
      </div>
      <div class="row">
         <div class="col-md-6 col-md-offset-3">
           <div class="panel-body">
               <form:form id="BookLoanReturnForm" name="BookLoanReturnForm" method="post">
                  <div class="row">
                    <div class="col-sm-2">
                      <div class="text-left">
                        <h5>도서 번호</h5>
                      </div>
                    </div>
                    <div class="col-sm-10">
                      <input class="form-control" placeholder="번호를 입력해주세요." name="bnum" id="bnum">
                    </div>
                  </div>
                  <br/>
                  <div class="row">
                     <div class="text-center"> 
                        <button type="button" class="btn btn-primary" onclick="fn_loan_return(); return false;">확인</button>
                     </div> 
                  </div>
               </form:form>
           </div>
         </div>
      </div>  
   </div>
</div>
</body>
</html>