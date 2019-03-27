<%--
  Class Name : UserIdPwResult.jsp
  Description : User Id Pw Result JSP
  Modification Information
 
  수정일         수정자        수정내용
  -------      --------    ---------------------------
  2018.11.24   yeoni94     최초 생성
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

	<title>library - User Id Pw Result</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!-- 

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
            <a href='#'>로그인</a>
          </li>
          <li class="breadcrumb-item active">
            <strong><a href='#'>아이디/패스워드 조회</a></strong>
          </li>
        </ol>
      </div>
      <div class="row">
         <div class="col-md-6 col-md-offset-3">
            <br/><br/><br/>
            <c:if test="${result == true}">
             <div class="well well-lg" style="text-align: center; padding: 50px;">
               <h5>회원 가입 정보에 등록된 메일로 아이디와 임시 비밀번호를 발송하였습니다.</h5>
               <h5><font color="red">이메일: ${email}</font></h5>
             </div>
             <div class="button" style="text-align: center;">
               <button type="button" class="btn btn-primary" onclick="location.href='/user/login.do'">확인</button>
             </div>
            </c:if>
            <c:if test="${result == false}">
             <div class="well well-lg" style="text-align: center; padding: 50px;">
               <h5>입력한 이름, 이메일에 해당하는 아이디가 없습니다. 다시 시도해주세요.</h5>
             </div>
             <div class="button" style="text-align: center;">
               <button type="button" class="btn btn-primary" onclick="location.href='/user/UserIdPw.do'">확인</button>
             </div>
            </c:if>
         </div>
      </div>  
   </div>
</div>
</body>
</html>