<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, java.text.*"  %>
<div id="footer" class="footer">
<div class="container">
	<div class="row" style="margin-top: 10px; margin-bottom: 10px;">
		<div class="col-md-8">
			<span class="copyright">MY LITTLE LIBRARY</span> 
			<br/>
			<span class="copyright">Copyright &copy; 2018. YEONI94 ALL RIGHTS RESERVED</span>
			<br/>
			<span class="copyright">
	          <%
	           Date date = new java.util.Date();
	           java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd (E"+"요일"+")");
	           String today = formatter.format(date);
	           out.println(today);
	           java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("E");
	           String E = formatter2.format(date);
	           if(E.equals("토") || E.equals("일")){
	        	  out.println(" 오늘은 휴관일입니다.");  
	           }else{
	        	  out.println(" 개관 09:00 ~ 18:00");
	           }
	          %>			
			</span>
		</div>
	</div>
</div>
</div>
