<%--
  Class Name : UserLogin.jsp
  Description : User Login JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2018.11.07   yeoni94     최초 생성
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

	<title>library - User Login</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!-- 
   function fn_login(){
	 document.loginForm.action = "<c:url value='/user/loginCheck.do'/>";
	 document.loginForm.submit();
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
            <strong><a href='#'>로그인</a></strong>
          </li>
        </ol>
      </div>
      <div class="row">
          <div class="col-md-4 col-md-offset-4">
                <br/><br/>
                <div class="panel-heading">
                 <h3 class="panel-title">My Little Library</h3>
                </div
                <div class="panel-body">
                <form:form id="loginForm" name="loginForm" method="post">
                    <fieldset>
                        <div class="form-group">
                        	<input class="form-control" placeholder="Id" id="id" name="id" maxlength="20" autofocus/>
                        </div>
                        <div class="form-group">
                        	<input class="form-control" placeholder="Password" id="pw" name="pw" type="password" onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }">
                        </div>
                        <button type="submit" onclick="fn_login(); return false;" class="btn btn-success btn-lg btn-block">Login</button>
                        <br/>
                        <div class="form-group">
                            <a href="<c:url value='/user/UserRegistView.do'/>"><i class="fa fa-user fa-4">&nbsp;</i>회원가입</a>
                            &nbsp;&nbsp;
                            <a href="<c:url value='/user/UserIdPw.do'/>"><i class="fa fa-search fa-4">&nbsp;</i>아이디/패스워드 조회</a>
                        </div>
                    </fieldset>
                </form:form>
                </div>
          </div>
      </div>  
   </div>
</div>
</body>
</html>