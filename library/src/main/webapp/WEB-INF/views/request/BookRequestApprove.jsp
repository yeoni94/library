<%--
  Class Name : BookRequestApprove.jsp
  Description : Book Request Approve JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2019.02.27   yeoni94     최초 생성
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

	<title>library - Book Request Approve</title>
	
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
            <strong><a href='#'>도서 신청 승인</a></strong>
          </li>
        </ol>
      </div>
      <br/>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <form:form id="BookRequestForm" name="BookRequestForm" method="post">
             <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                  <tr>
                     <th width="5%">선택</th>
                     <th width="10%">제목</th>
                     <th width="10%">저자</th>
                     <th width="10%">출판사</th>
                     <th width="10%">출판일</th>
                     <th width="10%">ISBN/ISSN</th>
                     <th width="10%">신청자</th>
                     <th width="10%">신청일</th>
                     <th width="10%">신청사유</th>
                     <th width="10%">상태</th>
                     <th width="5%">확인</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="result" items="${bookRequestList}" varStatus="status">
                    <tr>
                      <td align="center"><input type="checkbox" name="bookRequestVOList[${status.index}].registApprove" value="Y">
                      <input class="form-control" type="hidden" name="bookRequestVOList[${status.index}].rseq" value="${result.rseq}"/> 
                      </td>
                      <td align="center"><c:out value="${result.title}"/></td>
                      <td align="center"><c:out value="${result.writer}"/></td>
                      <td align="center"><c:out value="${result.publisher}"/></td>
                      <td align="center"><fmt:formatDate value="${result.publish_date}" pattern="yyyy-MM-dd"/></td>
                      <td align="center">
                        <c:if test="${not empty result.isbn}">
                           <c:out value="${result.isbn}"/>
                        </c:if>
                        <c:if test="${not empty result.issn}">
                           <c:out value="${result.issn}"/>
                        </c:if>
                      </td>
                      <td align="center"><c:out value="${result.id}"/></td>
                      <td align="center"><fmt:formatDate value="${result.create_date}" pattern="yyyy-MM-dd"/></td>
                      <td align="center"><c:out value="${result.request_reason}"/></td>
                      <td align="center">
                        <select class="form-control" id="bookState${status.index}" name="bookRequestVOList[${status.index}].state">
                          <option value="N" <c:if test="${result.state == 'N'}">selected="selected"</c:if>>신청중</option>
                          <option value="P" <c:if test="${result.state == 'P'}">selected="selected"</c:if>>처리중</option>
                          <option value="S" <c:if test="${result.state == 'S'}">selected="selected"</c:if>>소장중</option>
                          <option value="F" <c:if test="${result.state == 'F'}">selected="selected"</c:if>>취소됨</option>
                        </select>                            
                      </td>
                      <td align="center">
                        <button type="button" class="btn btn-primary btn_one" data-role="${result.rseq}" data-id="bookState${status.index}">확인</button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
          </form:form>    
        </div>
      </div>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <div class="text-right"> 
           <p>
             <button type="button" class="btn btn-primary btn_list">일괄 처리</button>
           </p>
          </div>
        </div>  
     </div>
   </div>
</div>
</body>

<script type="text/javascript">
	
$(document).ready(function() {
    $(".btn_one").click(function(){
    	var rseq = $(this).attr("data-role");
    	var tmp = $(this).attr("data-id");
    	var state = $("#"+tmp+" option:selected").val();
    	alert("rseq: " + rseq + "/state:" + state);
    	location.href = "<c:url value='/request/BookRequestApproveOne.do'/>?rseq="+rseq+"&state="+state;
    });
    
    $(".btn_list").click(function(){
    	document.BookRequestForm.action = "<c:url value='/request/BookRequestApproveList.do'/>";
    	document.BookRequestForm.submit();
    });
    
});

	
</script>

</html>