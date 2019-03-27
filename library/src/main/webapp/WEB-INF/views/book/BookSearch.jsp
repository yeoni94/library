<%--
  Class Name : BookSearch.jsp
  Description : Book Search JSP
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
function fn_search(){
	var searchKeyword1 = $("#searchKeyword1").val();
	var searchKeyword2 = $("#searchKeyword2").val();
	var searchKeyword3 = $("#searchKeyword3").val();
	var year1 = $("#year1").val();
	var year2 = $("#year2").val(); 
	if(searchKeyword1.length > 0){
	  if(searchKeyword1.length <= 2){
		  alert("검색어는 3자 이상 입력하세요.");
		  return false;
	  }
	}
	if(searchKeyword2.length > 0){
	  if(searchKeyword2.length <= 2){
		  alert("검색어는 3자 이상 입력하세요.");
		  return false;
	  }
	}
	if(searchKeyword3.length > 0){
	  if(searchKeyword3.length <= 2){
		  alert("검색어는 3자 이상 입력하세요.");
		  return false;
	  }
	}
	var yearRegex = /^[0-9]{4}$/;
	if((year1.length > 0 && !yearRegex.test(year1)) || (year2.length > 0 && !yearRegex.test(year2))){
		alert("yyyy형식으로 입력하세요.");
		return false;
	}
    document.BookSearchForm.action = "<c:url value='/book/BookSearchDetailSelect.do'/>";
    document.BookSearchForm.submit();
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
            <strong><a href='#'>도서 검색</a></strong>
          </li>
        </ol>
      </div>
      <div class="row">
         <div class="col-md-6 col-md-offset-3">
           <div class="panel-body">
               <form:form id="BookSearchForm" name="BookSearchForm" method="post">
                  <div class="row">
                    <div class="col-sm-3"> 
                       <select class="form-control" name="searchCondition1" id="searchCondition1" class="select" title="검색조건 선택">
				        <option value="0" selected="selected">제목</option>
				        <option value="1">저자</option>
                        <option value="2">출판사</option>
				       </select>
				     </div>
				     <div class="col-sm-6">
				       <input class="form-control" placeholder="내용을 입력해주세요." name="searchKeyword1" id="searchKeyword1" maxlength="35">
				     </div>
				     <div class="col-sm-3">
				       <select class="form-control" name="andOrCondition1" id="andOrCondition1" class="select" title="검색조건 선택">
				        <option value="and" selected="selected">AND</option>
				        <option value="or">OR</option>
				       </select>
				     </div>
                  </div>
                  <br/>
                  <div class="row">
                     <div class="col-sm-3">
                       <select class="form-control" name="searchCondition2" id="searchCondition2" class="select" title="검색조건 선택">
                        <option value="0">제목</option>
                        <option value="1" selected="selected">저자</option>
                        <option value="2">출판사</option>
                       </select>
                     </div>
                     <div class="col-sm-6">
                       <input class="form-control" placeholder="내용을 입력해주세요." name="searchKeyword2" id="searchKeyword2" maxlength="35">
                     </div>
                     <div class="col-sm-3">
                       <select class="form-control" name="andOrCondition2" id="andOrCondition2" class="select" title="검색조건 선택">
                        <option value="and" selected="selected">AND</option>
                        <option value="or">OR</option>
                       </select>
                     </div>
                  </div>
                  <br/>
                  <div class="row">
	                 <div class="col-sm-3">
	                   <select class="form-control" name="searchCondition3" id="searchCondition3" class="select" title="검색조건 선택">
	                    <option value="0">제목</option>
	                    <option value="1">저자</option>
	                    <option value="2" selected="selected">출판사</option>
	                   </select>
	                 </div>
	                 <div class="col-sm-6">
	                   <input class="form-control" placeholder="내용을 입력해주세요." name="searchKeyword3" id="searchKeyword3" maxlength="35">
	                 </div>                 
                  </div>
                  <br/>
                  <div class="row">
                     <div class="form-group">
                       &nbsp; &nbsp;
                       <label>자료 유형 &nbsp; &nbsp;</label>
                       <label class="radio-inline"><input type="radio" name="type" checked="true" value="A">전체 </label>
                       <label class="radio-inline"><input type="radio" name="type" value="B">도서 </label>
                       <label class="radio-inline"><input type="radio" name="type" value="N">비도서</label>
                     </div>
                  </div>
                  <div class="row">
                     <div class="form-group">
                      &nbsp; &nbsp;
                      <label>발행년 &nbsp; &nbsp;</label>
                      <label class="inline"><input class="form-control" name="year1" id="year1" style="width:70px;" placeholder="yyyy"></label>
                      <label> - </label>
                      <label class="inline"><input class="form-control" name="year2" id="year2" style="width:70px;" placeholder="yyyy"></label>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-sm-4"></div>
                     <div class="col-sm-4"> 
                      <p>
                        <button type="button" class="btn btn-primary" onclick="fn_search(); return false;">검색</button>
                        &nbsp; &nbsp;
                        <button type="reset" class="btn btn-primary">다시 쓰기</button>
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