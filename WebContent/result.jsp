<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>States</title>
<link rel="stylesheet" type="text/css" href="indexstyle.css">

</head>
	<script src="http://maps.googleapis.com/maps/api/js" align="center"></script>
	<script>
		function initialize() {
  		var mapProp = {
    	center:new google.maps.LatLng(${state.latitude},${state.longitude}),
    	zoom:5,
    	mapTypeId:google.maps.MapTypeId.ROADMAP
  		};
  		var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
<body class="resultPage">
	<header>
		<div class="area">
	<a href="index.html" class="bruno"> trillo ツ </a>
	</div>
	</header>
	<div class="resultdiv">
	<c:choose>
		<c:when test="${! empty state}">
			<ul id="stateInfo">
				<li>Name: ${state.name}</li><br>
				<li>Abbreviation: ${state.abbreviation}</li><br>
				<li>Capital: ${state.capital}</li><br>
				<li>Population:${state.population}</li>
			</ul>
		</c:when>
		<c:otherwise>
			<p>No state found</p>
		</c:otherwise>
	</c:choose>
	</div>
	<div id="mapPicture">
	<img src="./images/${state.abbreviation}.png" />
	</div>
		<form action="submit.do" method="GET">
			<INPUT TYPE="submit" name="prev" VALUE="prev">
			<INPUT TYPE="submit" name="next" VALUE="next">
		</form>
	<br>
	<br>
	<div id="googleMap" style="width: 550px; height: 380px;"></div>
	<footer><p>Created by: BAT</p></footer>
</body>
</html>