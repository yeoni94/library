<%--
  Class Name : BookRegistApprove.jsp
  Description : Book Regist Approve JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2019.02.05   yeoni94     최초 생성
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

	<title>library - Book Search</title>
<link href="<c:url value='/resources/css/jquery-ui.css'/>" rel="stylesheet">	
<script src="<c:url value='/resources/js/jquery.js'/>"></script>
<script src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!-- 
$(document).ready(function() {
    $('#dataTables-example').DataTable({
    	pageLength: 10,
        //pagingType : "full_numbers",
        bPaginate: true,
        bLengthChange: true,
        lengthMenu : [ [5, 10, 15], [5, 10, 15] ],
        responsive: true,
        bAutoWidth: false,
        processing: true,
        ordering: false
    });
});

function fn_regist_approve(){
	document.UserRegistApproveForm.action= "<c:url value='/user/UserRegistApprove.do'/>";
	document.UserRegistApproveForm.submit();
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
            <strong><a href='#'>가입 승인</a></strong>
          </li>
        </ol>
      </div>
      <div class="row">
         <div class="col-md-6 col-md-offset-3">
           <div class="panel-body">
               <form:form id="UserRegistApproveForm" name="UserRegistApproveForm" method="post">
                  <div class="row">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                      <thead>
                        <tr>
                         <th>번호</th>
                         <th>이름</th>
                         <th>아이디</th>
                         <th>선택</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="result" items="${UserBList}" varStatus="status">
                        <tr>
                          <td align="center"><c:out value="${status.index + 1}"/></td>
                          <td align="center"><c:out value="${result.name}"/></td>
                          <td align="center"><c:out value="${result.id}"/></td>
                          <td align="center"><input type="checkbox" name="userVOList[${status.index}].registApprove" value="Y"></td>
                          <input type="hidden" name="userVOList[${status.index}].useq" value="${result.useq}"/>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                  </div>
                  <br/>
                  <div class="row">
                     <div class="text-center"> 
                      <p>
                        <button type="button" class="btn btn-primary" onclick="fn_regist_approve(); return false;">가입 승인</button>
                      </p>
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