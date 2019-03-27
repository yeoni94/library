<%--
  Class Name : BookRegist.jsp
  Description : Book Regist JSP
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

	<title>library - Book Regist</title>
<script type="text/javascript">

<!-- 
$(function() {
    $("#publish_date").datepicker({
    	format : 'yyyy-mm-dd',
		autoclose : true,
		altField : "#publish_date",
		todayHighlight : true,
		changeYear: true,
		yearRange: '-1000:+0',
		changeMonth: true 
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

function fn_regist(){
	var title = $("#title").val();
	var writer = $("#writer").val();
	var publisher = $("#publisher").val();
	var publish_date = $("#publish_date").val();
	var select = $("#select").val();
	var selectText = $("#selectText").val();
	var call_number = $("#call_number").val();
	var location = $("#location").val();
	
	//file null 체크
	if( document.getElementById("file").files.length == 0){
		alert("파일을 선택하세요.");
		return false;
	}
	
	//file type 체크
	var fileInput = document.getElementById("file");
	var filePath = fileInput.value;
	//var fileAllowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
	var fileAllowedExtensions = /(\.jpg)$/i;
	if(!fileAllowedExtensions.exec(filePath)){
		alert("파일은 확장자가 jpg만 업로드 됩니다.");
		return false;
	}
	
	if(!title){
		alert("제목을 입력하세요.");
		return false;
	}else{
		var titleByte = getByteLength(title);
		if(titleByte > 200){
			alert("제목의 입력 가능 문자 수를 초과하였습니다. 최대값:200 입력값:"+titleByte);
			return false;
		}
	}
	
	if(!writer){
		alert("저자를 입력하세요.");
		return false;
	}else{
		var writerByte = getByteLength(writer);
		if(writerByte > 100){
			alert("저자의 입력 가능 문자 수를 초과하였습니다. 최대값:100 입력값:"+writerByte);
			return false;
		}
	}
	
	if(!publisher){
		alert("출판사를 입력하세요.");
		return false;
	}else{
		var publisherByte = getByteLength(publisher);
		if(publisherByte > 50){
			alert("출판사의 입력 가능 문자 수를 초과하였습니다. 최대값:50 입력값:"+publisherByte);
			return false;
		}
	}
	
	if(!publish_date){
		alert("출판일을 선택하세요.");
		return false;
	}
	
	if(!selectText){
		alert("ISBN/ISSN을 입력하세요.");
		return false;
	}else{
		var selectTextByte = getByteLength(selectText);
		if(selectTextByte > 30){
			alert("ISBN/ISSN의 입력 가능 문자 수를 초과하였습니다. 최대값:30 입력값:"+selectTextByte);
			return false;
		}else{
			if(select == 'ISBN'){
			  $('#isbn').val(selectText);	
			}else if(select == 'ISSN'){
			  $('#issn').val(selectText);	
			}
		}
	}
	
	if(!call_number){
		alert("청구 기호를 입력하세요.");
		return false;
	}else{
		var call_numberByte = getByteLength(call_number);
		if(call_numberByte > 100){
			alert("청구 기호의 입력 가능 문자 수를 초과하였습니다. 최대값:100 입력값:"+call_numberByte);
			return false;
		}
	}
	
	if(!location){
		alert("자료 위치를 입력하세요.");
		return false;
	}else{
		var locationByte = getByteLength(location);
		if(location > 50){
			alert("자료 위치의 입력 가능 문자 수를 초과하였습니다. 최대값:50 입력값:"+locationByte);
			return false;
		}
	}
	
	document.BookRegistForm.action = "<c:url value='/book/BookRegist.do'/>";
	document.BookRegistForm.submit();
}

function getByteLength(s,b,i,c){
    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
    return b;
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
            <strong><a href='#'>도서 등록</a></strong>
          </li>
        </ol>
      </div>
      <br/>
      <form:form id="BookRegistForm" name="BookRegistForm" method="post" enctype="Multipart/form-data">  
	      <div class="row">
	        <div class="col-md-8 col-md-offset-2">
	          <div class="panel panel-default">
	            <div class="panel-heading">
	              <h4 class="panel-title">서지 정보</h4>
	            </div>
	            <div class="panel-body">
	                 <div class="row">
	                   <div class="col-md-2"><h5>이미지 </h5></div>
	                   <div class="col-md-10"><input class="form-control" type="file" id="file" name="file" value="${bookInfoVO.file}"/></div>
	                 </div>   
	                 <div class="row">
	                   <div class="col-md-2"><h5>제목 </h5></div>
	                   <div class="col-md-10"><input class="form-control" type="text" id="title" name="title" value="${bookInfoVO.title}"/></div>
	                 </div>
	                 <div class="row">
	                   <div class="col-md-2"><h5>저자 </h5></div>
	                   <div class="col-md-10"><input class="form-control" type="text" id="writer" name="writer" value="${bookInfoVO.writer}"/></div>
	                 </div>
	                 <div class="row">
	                   <div class="col-md-2"><h5>출판사 </h5></div>
	                   <div class="col-md-10"><input class="form-control" type="text" id="publisher" name="publisher" value="${bookInfoVO.publisher}"/></div>
	                 </div>
	                 <div class="row">
	                   <div class="col-md-2"><h5>출판일 </h5></div>
	                   <div class="col-md-10">
	                     <div class="input-group date">
                           <input type="text" class="form-control" id="publish_date" name="publish_date" value="${bookInfoVO.publish_date}" readonly /> 
                           <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                         </div>
                       </div>
                     </div>
                     <div class="row">
                       <div class="col-md-2">
                         <select class="form-control" id="select">
                           <option value="ISBN" <c:if test="${not empty bookInfoVO.isbn}">selected="selected"</c:if>>ISBN</option>
                           <option value="ISSN" <c:if test="${not empty bookInfoVO.issn}">selected="selected"</c:if>>ISSN</option>
                         </select>
                       </div>
                       <div class="col-md-10"><input class="form-control" type="text" id="selectText" <c:if test="${not empty bookInfoVO.isbn}">value="${bookInfoVO.isbn}"</c:if>
                                                                                                      <c:if test="${not empty bookInfoVO.issn}">value="${bookInfoVO.issn}"</c:if>/></div>
                     </div>
                     <input type="hidden" id="isbn" name="isbn"/>
                     <input type="hidden" id="issn" name="issn"/>
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
	            <div class="panel-body">
	                <div class="row">
	                  <div class="col-md-2"><h5>청구 기호 </h5></div>
	                  <div class="col-md-10"><input class="form-control" type="text" id="call_number" name="call_number" value="${bookInfoVO.call_number}"/></div>
	                </div>
	                <div class="row">
	                  <div class="col-md-2"><h5>자료 유형 </h5></div>
	                  <div class="col-md-10">
	                    <select class="form-control" id="type" name="type">
	                      <option value="도서" <c:if test="${bookInfoVO.type == '도서'}">selected="selected"</c:if>>도서</option>
	                      <option value="비도서" <c:if test="${bookInfoVO.type == '비도서'}">selected="selected"</c:if>>비도서</option>
	                    </select>
	                  </div>
	                </div>
	                <div class="row">
	                  <div class="col-md-2"><h5>도서 위치 </h5></div>
	                  <div class="col-md-10"><input class="form-control" type="text" id="location" name="location" value="${bookInfoVO.location}"/></div>
	                </div>
	            </div>
	          </div> 
	        </div>
	      </div>
	      <div class="row">
	        <div class="col-md-8 col-md-offset-2">
	          <div class="text-right">
	           <p>
				  <button type="button" class="btn btn-success" onclick="javascript:fn_regist(); return false;">등록</button>
				  <button type="reset" class="btn btn-primary">다시 쓰기</button>								
    		   </p>
	          </div>
	        </div>
	      </div>
      </form:form> 
   </div>
</div>
</body>
</html>