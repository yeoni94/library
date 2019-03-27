<%--
  Class Name : BookHistory.jsp
  Description : Book History JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2019.02.13   yeoni94     최초 생성
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

	<title>library - Book History</title>
	
<script type="text/javascript">

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
          <li class="breadcrumb-item">
            <a href="#">마이페이지</a>
          </li>
          <li class="breadcrumb-item active">
            <strong><a href='#'>대출/반납이력</a></strong>
          </li>
        </ol>
      </div>
      <br/>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
             <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                  <tr>
                     <th width="5%">번호</th>
                     <th width="30%">제목</th>
                     <th width="20%">저자</th>
                     <th width="15%">대출일</th>
                     <th width="15%">반납예정일</th>
                     <th width="15%">반납일</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="result" items="${bookHistoryList}" varStatus="status">
                    <tr>
                      <td align="center"><c:out value="${status.index + 1}"/></td>
                      <td align="center"><c:out value="${result.title}"/></td>
                      <td align="center"><c:out value="${result.writer}"/></td>
                      <td align="center"><fmt:formatDate value="${result.out_day}" pattern="yyyy-MM-dd"/></td>
                      <td align="center"><fmt:formatDate value="${result.will_day}" pattern="yyyy-MM-dd"/></td>
                      <td align="center"><fmt:formatDate value="${result.in_day}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>  
        </div>
      </div>
   </div>
</div>
</body>
</html>