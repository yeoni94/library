<%--
  Class Name : BookDetailAdmin.jsp
  Description : Book Detail Admin JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2019.01.19   yeoni94     최초 생성
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

	<title>library - Book Detail Admin</title>
	
<script type="text/javascript">

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
          <li class="breadcrumb-item">
            <a href="#">도서 목록</a>
          </li>
          <li class="breadcrumb-item active">
            <strong><a href='#'>도서 상세 정보</a></strong>
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
        <div class="col-md-8 col-md-offset-2">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">서지 정보</h4>
            </div>
            <div class="collapseOne" class="panel-collapse collapse in">
              <div class="panel-body">
                 <div class="col-md-3">
                   <img src="<c:out value='/resources/img/book/${bookDetail.image}.jpg' />" width="127px" height="158">
                 </div>
                 <div class="col-md-9">
                   <p>제목 : <c:out value="${bookDetail.title}"/></p>
                   <p>저자 : <c:out value="${bookDetail.writer}"/></p>
                   <p>출판사 : <c:out value="${bookDetail.publisher}"/></p>
                   <p>출판일 : <fmt:formatDate value="${bookDetail.publish_date}" pattern="yyyy-MM-dd"/></p>
                  <c:if test="${bookDetail.isbn ne '' && bookDetail.isbn != null}">
                   <p>ISBN : <c:out value="${bookDetail.isbn}"/></p>
                  </c:if>
                  <c:if test="${bookDetail.issn ne '' && bookDetail.issn != null}">
                   <p>ISSN : <c:out value="${bookDetail.issn}"/></p>
                  </c:if>                  
                 </div>
              </div>
            </div>
          </div> 
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">소장 정보</h4>
            </div>
            <div class="collapseOne" class="panel-collapse collapse in">
              <div class="panel-body">
                <div class="table-responsive table-bordered">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>등록 번호</th>
                        <th>청구 기호</th> 
                        <th>자료 유형</th> 
                        <th>도서 위치</th> 
                        <th>대출 여부</th>
                        <th>반납 예정일</th> 
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><c:out value="${bookDetail.bnum}"/></td>
                        <td><c:out value="${bookDetail.call_number}"/></td>
                        <td><c:out value="${bookDetail.type}"/></td>
                        <td><c:out value="${bookDetail.location}"/></td>
                        <td>
                         <c:if test="${bookDetail.state eq 'N'}">
                          <c:out value="대출 불가"/>
                         </c:if>
                         <c:if test="${bookDetail.state eq 'Y'}">
                          <c:out value="대출 가능"/>
                         </c:if>
                        </td>
                        <td>
                         <c:if test="${bookDetail.return_date ne '' && bookDetail.return_date != null}"> 
                          <fmt:formatDate value="${bookDetail.return_date}" pattern="yyyy-MM-dd"/>
                         </c:if> 	  
                        </td>
                      </tr>
                    </tbody>
                  </table>
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