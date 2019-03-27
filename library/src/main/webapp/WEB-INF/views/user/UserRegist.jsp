<%--
  Class Name : UserIdPw.jsp
  Description : User Id Pw JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2018.11.21   yeoni94     최초 생성
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

	<title>library - User Id Pw</title>
<link href="<c:url value='/resources/css/jquery-ui.css'/>" rel="stylesheet">	
<script src="<c:url value='/resources/js/jquery.js'/>"></script>
<script src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!-- 
$(function() {
	$("#birth").datepicker({
		format : 'yyyy-mm-dd',
		autoclose : true,
		altField : "#birth",
		todayHighlight : true,
		changeYear: true,
		yearRange: '-100:+0',
		changeMonth: true
	});
});

var idck = 0;
$(function(){
  $("#idckBtn").click(function(){
	var id = $("#id").val();
    $.ajax({
      async: true,
      type: 'POST',
      data: id,
      url: "/user/UserIdExistCnt.do",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      success: function(data){
    	 if(data.cnt > 0){
    		 $("#idckMsg").text("아이디가 중복 됩니다."); 
    	 }else{
    		var id = $("#id").val();
    		var regExpIdPw = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{3,19}$/;
    		if(!regExpIdPw.test(id)){
    			alert("아이디는 영문, 숫자 혼합 4~20자여야 합니다.");
    		}else{
        		$("#idckMsg").text("해당 아이디 사용 가능합니다."); 
        		$("#idckCnt").val("true");
        		$("#id").prop("readonly", true);	
    		} 
    	 }
      },
      error: function(error){
    	  alert("error : " + error);
      }
    });
  });	
});

function fn_regist(){
	var name = $("#name").val();
	var birth = $("#birth").val();
	var id = $("#id").val();
	var pw = $("#pw").val();
	var enterPw = $("#enterPw").val();
	var phone = $("#phone").val();
	var email = $("#email").val();
	var idckCnt = $("#idckCnt").val();
	var regExpIdPw = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{3,19}$/;  
	var regExpPhone = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	
	if(!name) {
		alert("성명을 입력하세요.");
		return false;
	}
	
	if(!birth) {
		alert("생년월일을 선택하세요.");
		return false;
	}
	
	if(!id) {
	    alert("아이디를 입력하세요.");
	    return false;
	}else{
	  if(!regExpIdPw.test(id)) {
		alert("아이디는 영문, 숫자 혼합 4~20자여야 합니다.");
		return false;
	   }	
	}
	
	if(!pw) {
		alert("비밀번호를 입력하세요.");
		return false;
	}else{
	  if(!regExpIdPw.test(pw)) {
		alert("비밀번호는 영문, 숫자 혼합 4~20자여야 합니다.");
		return false;
	  }		
	}
	
	if(!enterPw) {
		alert("비밀번호 확인을 입력하세요.");
		return false;
	}else{
	  if(!regExpIdPw.test(enterPw)) {
		alert("비밀번호 확인은 영문, 숫자 혼합 4~20자여야 합니다.");
		return false;
	  }		
	}	
	
    if(pw != enterPw){
    	alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    	$("#pw").val("");
    	$("#enterPw").val("");
    	return;
    }
    
	if(!phone) {
		alert("연락처를 입력하세요.");
		return false;
	}else{
	  if(!regExpPhone.test(phone)) {
		alert("연락처 형식을 확인하세요.");
		return false;
	  }		
	}	
	
	if(!email) {
		alert("이메일을 입력하세요.");
		return false;
	}else{
	  if(!regExpEmail.test(email)) {
		alert("이메일 형식을 확인하세요.");
		return false;
	  }		
	}		
	
    if(idckCnt == 'false'){
      alert("아이디 중복 확인을 해주세요.");
      return false;
    }
	document.UserForm.action = "<c:url value='/user/UserRegist.do'/>";
	document.UserForm.submit();
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
            <strong><a href='#'>회원가입</a></strong>
          </li>
        </ol>
      </div>
      <div class="row">
         <div class="col-md-6 col-md-offset-3">
           <div class="panel-body">
               <form:form id="UserForm" name="UserForm" method="post">
                 <div class="table-responsive">
                   <table class="table table-bordered table-hover" id="dataTables-example">
                     <tr>
                       <th width="20%">성명</th>
                       <td width="80%">
                         <input type="text" class="form-control" id="name" name="name" maxlength="20">
                        </td>
                     </tr>
                     <tr>
                       <th width="20%">생년월일</th>
                       <td width="80%">
                        <div class="input-group date">
                         <input type="text" class="form-control" id="birth" name="birth" readonly /> 
                         <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                       </td>
                     </tr>
                     <tr>
                       <th width="20%">회원 ID</th> 
                       <td width="80%">
                         <input type="text" class="form-control" id="id" name="id" maxlength="20">
                         <div id="doubleCheck" style="margin-top:10px;">
                          <button type="button" class="btn btn-default" href="#" id="idckBtn">
                            중복 확인
                          </button>
                          &nbsp;<a style="text-decoration:none" id="idckMsg"></a>
                          <input type="hidden" id="idckCnt" value="false">
                         </div>
                       </td>
                     </tr>
                     <tr>
                       <th width="20%">비밀번호</th>
                       <td width="80%">
                         <input type="password" class="form-control" id="pw" name="pw" maxlength="20">
                       </td>
                     </tr>
                     <tr>
                       <th width="20%">비밀번호 확인</th>
                       <td width="80%">
                         <input type="password" class="form-control" id="enterPw" maxlength="20">
                       </td>
                     </tr>
                     <tr>
                       <th width="20%">연락처</th>
                       <th width="80%">
                         <input type="text" class="form-control" id="phone" name="phone" maxlength="20" placeholder="xxx-xxxx-xxxx 형식으로 입력하세요.">
                       </th>
                     </tr>
                     <tr>
                       <th width="20%">이메일</th>
                       <th width="80%">
                         <input type="text" class="form-control" id="email" name="email" maxlength="20" placeholder="sample@test.com">
                       </th>
                     </tr>
                   </table>
                 </div>
                 <div class="text-center">
                   <button type="button" class="btn btn-success" href="#" onclick="fn_regist(); return false;">
                    회원 가입 신청
                   </button>
                 </div>
               </form:form>
           </div>
         </div>
      </div>  
   </div>
</div>
</body>
</html>