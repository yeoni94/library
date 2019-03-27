<%--
  Class Name : BookRequestList.jsp
  Description : Book Request List JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2019.02.23   yeoni94     최초 생성
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

	<title>library - Book Request List</title>
	
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
            <a href="#">도서 신청</a>
          </li>
          <li class="breadcrumb-item active">
            <strong><a href='#'>도서 신청 이력</a></strong>
          </li>
        </ol>
      </div>
      <br/>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-7">
          <form:form id="BookRequestForm" name="BookRequestForm" method="post">
             <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                  <tr>
                     <th width="10%">번호</th>
                     <th width="30%">제목</th>
                     <th width="30%">저자</th>
                     <th width="20%">신청일</th>
                     <th width="10%">상태</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="result" items="${bookRequestList}" varStatus="status">
                    <tr>
                      <td align="center"><c:out value="${status.index + 1}"/></td>
                      <td align="center"><c:out value="${result.title}"/></td>
                      <td align="center"><c:out value="${result.writer}"/></td>
                      <td align="center"><fmt:formatDate value="${result.create_date}" pattern="yyyy-MM-dd"/></td>
                      <td align="center">
                        <c:if test="${result.state eq 'N'}">
                              <c:out value="신청중"/>
                        </c:if>
                        <c:if test="${result.state eq 'P'}">
                              <c:out value="처리중"/>
                        </c:if>                              
                        <c:if test="${result.state eq 'S'}">
                              <c:out value="소장중"/>
                        </c:if>
                        <c:if test="${result.state eq 'F'}">
                              <c:out value="취소됨"/>
                        </c:if>                              
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
          </form:form>    
        </div>
        <div class="col-md-3">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">도서 신청 처리절차</h4>
            </div>
            <div class="panel-body">
              <ul>
                <li>신청중 : 담당자검토 중</li>
                <li>처리중 : 선정되어 도서가 주문중이거나 도서관에서 해당도서 정리 중</li>
                <li>취소됨 : 선정에서 제외됨</li>
                <li>소장중 : 도서관에 입수되어 비치</li>
              <ul>
            </div>
          </div>
        </div>
      </div>
   </div>
</div>
</body>
</html>