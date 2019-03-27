<%--
  Class Name : BookList.jsp
  Description : Book List JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2018.12.19   yeoni94     최초 생성
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

	<title>library - Book List</title>
	
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

function fn_integrated_search(){
	var integratedSearchKeyword = $('#integratedSearchKeyword').val();
	if(!integratedSearchKeyword){
		alert("검색어를 입력하세요.");
		return false;
	}
	document.IntegratedSearchForm.action= "<c:url value='/book/BookSearchIntegratedSelect.do'/>";
	document.IntegratedSearchForm.submit();
}

function fn_detail(bseq){
	document.BookDetailForm.bseq.value= bseq;
	document.BookDetailForm.action= "<c:url value='/book/BookDetailView.do'/>";
	document.BookDetailForm.submit();
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
          <li class="breadcrumb-item">
            <a href="#">도서 검색</a>
          </li>
          <li class="breadcrumb-item active">
            <strong><a href='#'>도서 목록</a></strong>
          </li>
        </ol>
      </div>
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
        <div class="col-md-10">
          <form:form id="BookDetailForm" name="BookDetailForm" method="post">
             <input name="bseq" type="hidden" value="" />
             <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                  <tr>
                     <th width="5%">번호</th>
                     <th width="30%">제목</th>
                     <th width="25%">저자</th>
                     <th width="20%">출판사</th>
                     <th width="10%">발행일</th>
                     <th width="10%">상태</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="result" items="${bookList}" varStatus="status">
                    <tr>
                      <td align="center"><c:out value="${status.index + 1}"/></td>
                      <td align="center"><a href="#" onclick="javascript:fn_detail('${result.bseq}'); return false;"><c:out value="${result.title}"/></a></td>
                      <td align="center"><c:out value="${result.writer}"/></td>
                      <td align="center"><c:out value="${result.publisher}"/></td>
                      <td align="center"><fmt:formatDate value="${result.publish_date}" pattern="yyyy-MM-dd"/></td>
                      <td align="center">
                        <c:if test="${result.state eq 'N'}">
                              <c:out value="대출 불가"/>
                        </c:if>
                        <c:if test="${result.state eq 'Y'}">
                              <c:out value="대출 가능"/>
                        </c:if>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
          </form:form>    
        </div>
      </div>
   </div>
</div>
</body>
</html>