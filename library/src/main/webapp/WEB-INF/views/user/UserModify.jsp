<%--
  Class Name : UserModify.jsp
  Description : User Modify JSP
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
<%@ page import="java.util.*, java.text.*"  %>
<!DOCTYPE html>
<html>
<head>

	<title>library - User Modify</title>
<link href="<c:url value='/resources/css/jquery-ui.css'/>" rel="stylesheet">	
<script src="<c:url value='/resources/js/jquery.js'/>"></script>
<script src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!-- 
function fn_modify(){
	var pw = $("#pw").val();
	var enterPw = $("#enterPw").val();
	var phone = $("#phone").val();
	var email = $("#email").val();
	var regExpIdPw = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{3,19}$/;  
	var regExpPhone = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	
	if(pw.length > 0){
		if(!regExpIdPw.test(pw)) {
			alert("비밀번호는 영문, 숫자 혼합 4~20자여야 합니다.");
			return false;
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
	document.UserForm.action = "<c:url value='/user/UserModify.do'/>";
	document.UserForm.submit();
}

function fn_delete(){
    var delConfirm = confirm('회원 탈퇴하겠습니까? 탈퇴시 가입한 회원 정보는 삭제되며 복구되지 않습니다.');
    if(delConfirm){
    	document.UserForm.action = "<c:url value='/user/UserDelete.do'/>";
    	document.UserForm.submit();	
    }
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
            <a href="#">마이페이지</a>
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
                 <input type="hidden" id="useq" name="useq" value="<c:out value='${user.useq}'/>">
                 <div class="table-responsive">
                   <table class="table table-bordered table-hover" id="dataTables-example">
                     <tr>
                       <th width="20%">성명</th>
                       <td width="80%">
                         <input type="text" class="form-control" id="name" name="name" value="<c:out value='${user.name}'/>" readOnly>
                        </td>
                     </tr>                     
                     <tr>
                       <th width="20%">회원 ID</th> 
                       <td width="80%">
                         <input type="text" class="form-control" id="id" name="id" value="<c:out value='${user.id}'/>" readOnly>
                       </td>
                     </tr>
                     <tr>
                       <th width="20%">비밀번호</th>
                       <td width="80%">
                         <input type="password" class="form-control" id="pw" name="pw" maxlength="20" placeholder="비밀번호 변경을 원할 경우 입력하세요.">
                       </td>
                     </tr>
                     <tr>
                       <th width="20%">비밀번호 확인</th>
                       <td width="80%">
                         <input type="password" class="form-control" id="enterPw" maxlength="20" placeholder="변경할 비밀번호 확인">
                       </td>
                     </tr>
                     <tr>
                       <th width="20%">연락처</th>
                       <th width="80%">
                         <input type="text" class="form-control" id="phone" name="phone" maxlength="20" placeholder="xxx-xxxx-xxxx 형식으로 입력하세요." value="<c:out value='${user.phone}'/>">
                       </th>
                     </tr>
                     <tr>
                       <th width="20%">이메일</th>
                       <th width="80%">
                         <input type="text" class="form-control" id="email" name="email" maxlength="20" placeholder="sample@test.com" value="<c:out value='${user.email}'/>">
                       </th>
                     </tr>
                   </table>
                 </div>
                 <div class="text-center">
                   <button type="button" class="btn btn-success" href="#" onclick="fn_modify(); return false;">
                    수정하기
                   </button>
                   <button type="button" class="btn btn-primary" href="#" onclick="fn_delete(); return false;">
                    탈퇴하기
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