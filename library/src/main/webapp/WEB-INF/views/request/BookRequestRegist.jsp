<%--
  Class Name : BookRequestRegist.jsp
  Description : Book Request Regist JSP
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
<%@ page import="java.util.*, java.text.*"  %>
<!DOCTYPE html>
<html>
<head>

	<title>library - Book Request Regist</title>
<link href="<c:url value='/resources/css/jquery-ui.css'/>" rel="stylesheet">	
<script src="<c:url value='/resources/js/jquery.js'/>"></script>
<script src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javaScript" language="javascript" defer="defer">
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

function fn_request(){
	var title = $("#title").val();
	var writer = $("#writer").val();
	var publisher = $("#publisher").val();
	var publish_date = $("#publish_date").val();
	var select = $("#select").val();
	var selectText = $("#selectText").val();
	var request_reason = $("textarea#request_reason").val();
	alert(request_reason);
	
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
	
	if(!request_reason){
		alert("신청 사유를 작성하세요.");
		return false;
	}else{
		var request_reasonByte = getByteLength(request_reason);
		if(request_reasonByte > 1000){
			alert("신청 사유의 입력 가능 문자 수를 초과하였습니다. 최대값:1000 입력값:"+request_reasonByte);
			return false;
		}
	}
	
	document.BookRequestForm.action = "<c:url value='/request/BookRequestRegist.do'/>";
	document.BookRequestForm.submit();
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
            <a href="#">도서 신청</a>
          </li>
          <li class="breadcrumb-item active">
            <strong><a href='#'>도서 신청</a></strong>
          </li>
        </ol>
      </div>
      <div class="row">
         <div class="col-md-6 col-md-offset-3">
           <div class="panel-body">
               <form:form id="BookRequestForm" name="BookRequestForm" method="post">
                 <input type="hidden" id="useq" name="useq" value="<c:out value='${user.useq}'/>">
                 <div class="table-responsive">
                   <table class="table table-bordered table-hover" id="dataTables-example">
                     <tr>
                       <th width="20%">제목</th>
                       <td width="80%">
                         <input type="text" class="form-control" id="title" name="title">
                        </td>
                     </tr>                     
                     <tr>
                       <th width="20%">저자</th> 
                       <td width="80%">
                         <input type="text" class="form-control" id="writer" name="writer">
                       </td>
                     </tr>
                     <tr>
                       <th width="20%">출판사</th>
                       <td width="80%">
                         <input type="text" class="form-control" id="publisher" name="publisher">
                       </td>
                     </tr>
                     <tr>
                       <th width="20%">출판일</th>
                       <td width="80%">
	                   <div class="input-group date">
                         <input type="text" class="form-control" id="publish_date" name="publish_date" value="${bookInfoVO.publish_date}" readonly /> 
                         <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                       </div>
                       </td>
                     </tr>
                     <tr>
                       <th width="20%">
                         <select class="form-control" id="select">
                           <option value="ISBN" selected="selected">ISBN</option>
                           <option value="ISSN">ISSN</option>
                         </select>                       
                       </th>
                       <td width="80%">
                         <input type="text" class="form-control" id="selectText" name="selectText">
                       </td>
                       <input type="hidden" id="isbn" name="isbn"/>
                       <input type="hidden" id="issn" name="issn"/>
                     </tr>
                     <tr>
                       <th width="20%">신청 사유</th>
                       <td width="80%">
                         <textarea class="form-control" id="request_reason" name="request_reason" cols="40" rows="4"></textarea>
                       </td>
                   </tr>                       
                   </table>
                 </div>
                 <div class="text-center">
                   <button type="button" class="btn btn-success" href="#" onclick="fn_request(); return false;">
                    신청하기
                   </button>
                   <button type="reset" class="btn btn-primary">다시 쓰기</button>								 
                 </div>
               </form:form>
           </div>
         </div>
      </div>  
   </div>
</div>
</body>
</html>