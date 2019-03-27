<%--
  Class Name : Classic.jsp
  Description : 화면 Classic 레이아웃
  Modification Information
  
      수정일                         수정자                       수정내용
  -------      --------    ---------------------------
  2018.10.20   yeoni94     최초 생성
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/common/common_meta.html" %>
    <%@ include file="/common/common_css.html" %>
    <%@ include file="/common/common_js.html" %>
</head>
<style>
    *{
      box-sizing: border-box;
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
    }
    
    html {
       height: 100%;	
    }
    body {
       margin: 0;
       height: 100%;
    }
    #classicWrapper{
       min-height: 100%;
       position: relative;
       padding-bottom: 19px; /* footer height */
    }
    .footer{
       position: absolute;
       bottom: 0;
       left: 0;
       right: 0;
       color: white;
       background-color: #474a4f;	
    }
    
    .row{
      width: 100%;
    }
    
    @font-face {
      font-family:"Binggrae";
      src:url("/resources/font/Binggrae.ttf") format("truetype");
      font-style:normal;
      font-weight:normal;
    }
    
    *{
      font-family:Binggrae;		
    }
    
    
</style>
<body>
    <div id="classicWrapper">
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="content" />
        <tiles:insertAttribute name="footer" />
    </div>
</body>
</html>