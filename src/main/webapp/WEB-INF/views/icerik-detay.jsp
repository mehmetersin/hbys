<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>

    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>


<title>Contact List Screen</title>

<jsp:include page="../views/header.jsp" />
	<div align="center">


</head>
<body>

 
<div class="container" style="border:1px solid#000; padding-bottom: 20px;">
<div  align = center style="padding-top: 20px;">

                <c:if test="${not empty RandevuDetay}">
       

	         
           <table class="table">
           
          	  <tr class="success"><td style="width: 216px;">Randevu Tarihi</td><td style="padding-left: 50px;">: ${RandevuDetay.randevu_tarihi}</td></tr>
              <tr class="success"><td style="width: 216px;">Randevu Saati</td><td style="padding-left: 50px;">: ${RandevuDetay.randevu_saati}</td></tr>
              
              </table>      
               
       
    </c:if>
    
 
   <c:if test="${!empty icerik}">
   
        <table class="table table-bordered">

            <c:forEach items="${icerik}" var="icerik" >
     
           <c:if test="${!empty icerik.bilgigirisi}">
   <c:forEach items="${icerik.bilgigirisi}" var="bilgigirisi">
   
  
   <tr>
<%--     <td style="width:600px"><a href="hastaliktipidetay?hastaliktipiid=${hastalik_tipi.id}&randevu_no=${RandevuDetay.randevu_no}&icerik=${icerik.id}">${bilgigirisi.bilgi_giris_adi}</a></td> --%>
<%--     <td style="width:600px"><a href="yorumeklemesayfasi?hastaliktipiid=${hastaliktipi_id}&randevu_no=${RandevuDetay.randevu_no}&icerik=${icerik.id}&bilgi_id=${bilgigirisi.id}">${bilgigirisi.bilgi_giris_adi}</a></td> --%>
     	<td style="width:600px">${bilgigirisi.bilgi_giris_adi}</td>
<%--     --%>
   </tr>
 	

   </c:forEach>
  </c:if>

            </c:forEach>
            <tr>
            </tr>
        </table>
    </c:if>
    

          
            
</body>
</html>