<%@ page import="java.util.Date" %>
<html><head><title>testJSP.jsp</title></head><body>

<h1> This is the page testJSP.jsp </h1>

<p>
   It's <%= new Date() %>.
   You called from <%= request.getRemoteHost()         %>
   (IP Address     <%= request.getRemoteAddr()         %>); 
   with browser <i><%= request.getHeader("user-agent") %></i>.
</p>

<%
   String uri= request.getScheme()+"://";
   uri       +=request.getServerName()+":"+request.getServerPort();
   uri       +=request.getRequestURI();
%>
<p>
  You found this page at <%= uri  %>.
  Your request method was <%= request.getMethod() %>.
<!--
  That's header info; we could enumerate your header names with
  <code>request.getHeaderNames()</code> and get the value of
  each with <code>request.getHeader(name)</code>.
-->
</p>

<%
   String qParam=request.getParameter("Q");
%>

<p>
  The value of the parameter named "Q" is 
     <b><%= qParam %></b>. 
<!--
  We could enumerate the parameter names you provided with
  <code>request.getParameterNames()</code> and get the value of
  each with <code>request.getParameter(name)</code>, or
  with <code>request.getParameterValues(name)</code> for any
  parameters that might be multi-valued.
-->
</p>

<%
    if( qParam==null || qParam.length() == 0){
      String retryURI = request.getRequestURI() + "?Q=hello";
%>
      <a href="<%= retryURI %>" >Try again with Q="hello"</a>
<%
    }
%>
</body></html>
