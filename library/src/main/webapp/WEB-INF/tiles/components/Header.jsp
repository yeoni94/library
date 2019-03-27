<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.library.user.vo.UserVO"%>
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<c:url value='/main/UserMain.do'/>"><i class="fa fa-institution fa-4"></i> Library</a>
	</div>
  
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="<c:url value='/main/UserMain.do'/>"><i class="fa fa-pagelines fa-4"></i> Main</a></li>
            
            <li class="dropdown">
              <a tabindex="0" data-toggle="dropdown" data-submenu="">
                <c:out value="도서관리"/>
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                 <li>
                   <a tabindex="0" href="<%=application.getContextPath()%>/book/BookSearchView.do" name="searchBook">
                     <c:out value="도서검색"/>
                   </a>
                 </li>
            <%
            UserVO userVO = (UserVO)session.getAttribute("userVO");
            if(userVO != null){
                if(userVO.getGrade().equals("S")){	
            %> 
                 <li>
                   <a tabindex="0" href="<%=application.getContextPath()%>/book/BookRegistView.do" name="searchBook">
                     <c:out value="도서등록"/>
                   </a>
                 </li>
            <%
                }
            }    
            %>
              </ul>
            </li>
            
            <%
            if(userVO != null){
	            if(userVO.getGrade().equals("A")){
	            %>
	            <li class="dropdown">
	             <a tabindex="0" data-toggle="dropdown" data-submenu="">
	               <c:out value="대출/반납"/>
	               <span class="caret"></span>
	             </a>
	             <ul class="dropdown-menu">
	                <li>
	                  <a tabindex="0" href="<%=application.getContextPath()%>/book/BookLoanReturnView.do" name="loanReturn">
	                   <c:out value="대출/반납"/>
	                  </a>
	                </li>                                 
	             </ul>
	            </li>
	            <li class="dropdown">
	             <a tabindex="0" data-toggle="dropdown" data-submenu="">
	               <c:out value="도서 신청"/>
	               <span class="caret"></span>
	             </a>
	             <ul class="dropdown-menu">
	                <li>
	                  <a tabindex="0" href="<%=application.getContextPath()%>/request/BookRequestRegistView.do" name="bookRequest">
	                   <c:out value="도서 신청"/>
	                  </a>
	                </li>
	                <li>
	                  <a tabindex="0" href="<%=application.getContextPath()%>/request/BookRequestList.do" name="bookRequestHistory" onclick="">
	                   <c:out value="도서 신청 이력"/>
	                  </a>
	                </li>	                
	             </ul>
	            </li>            
	            <li class="dropdown">
	              <a tabindex="0" data-toggle="dropdown" data-submenu="">
	                <c:out value="마이페이지"/>
	                <span class="caret"></span>
	              </a>
	              <ul class="dropdown-menu">
	                 <li>
	                   <a tabindex="0" href="<%=application.getContextPath()%>/history/BookHistoryView.do" name="loanReturnHistory">
	                     <c:out value="대출/반납이력"/>
	                   </a>
	                 </li>
	                 <li>
	                   <a tabindex="0" href="<%=application.getContextPath()%>/user/UserModifyView.do" name="userInfoModify" onclick="">
	                     <c:out value="회원정보수정"/>
	                   </a>
	                 </li>                                  
	              </ul>
	            </li>
	            <%
	            }else if(userVO.getGrade().equals("S")){
	            %>
	            <li class="dropdown">
	              <a tabindex="0" data-toggle="dropdown" data-submenu="">
	                <c:out value="회원 관리"/>
	                <span class="caret"></span>
	              </a>
	              <ul class="dropdown-menu">
	                 <li>
	                   <a tabindex="0" href="<%=application.getContextPath()%>/user/UserRegistApproveView.do" name="notice">
	                     <c:out value="가입 승인"/>
	                   </a>
	                 </li>
	              </ul>
	            </li>
	            <li class="dropdown">
	             <a tabindex="0" data-toggle="dropdown" data-submenu="">
	               <c:out value="도서 신청"/>
	               <span class="caret"></span>
	             </a>
	             <ul class="dropdown-menu">
	               <li>
	                 <a tabindex="0" href="<%=application.getContextPath()%>/request/BookRequestApproveView.do" name="bookRequestApprove" onclick="">
	                  <c:out value="도서 신청 승인"/>
	                 </a>
	               </li>                                 
	             </ul>
	            </li>                
	            <%
	            }
            }
            %>
        </ul>
        
        <ul class="nav navbar-nav navbar-right">
            <%
            if(userVO == null){
            %>
            <li class="dropdown">
              <a href="<%=application.getContextPath()%>/user/login.do">
                <i class="glyphicon glyphicon-log-in"></i> 로그인
              </a>
            </li>
            <li class="dropdown">
              <a href="<%=application.getContextPath()%>/user/UserRegistView.do">
                <i class="fa fa-user fa-4">&nbsp;</i>회원가입
              </a>
            </li>
            <%
            }else{
            %>
            <li class="dropdown">
              <a>
                <c:out value="<%= userVO.getName()%>" />님 환영합니다.
              </a>
            </li>
            <li class="dropdown">
              <a href="<%=application.getContextPath()%>/user/logout.do">
                <i class="glyphicon glyphicon-log-out"></i> 로그아웃
              </a>
            </li>
            <%
            }
            %> 
        </ul>
    </div>
</nav>