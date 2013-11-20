<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="resources/development-bundle/themes/base/jquery.ui.all.css"/>
	<script type="text/javascript" src="resources/js/jquery-1.9.1.js"></script>
	<script src="resources/development-bundle/ui/jquery.ui.core.js"></script>
	<script src="resources/development-bundle/ui/jquery.ui.widget.js"></script>
	<script src="resources/development-bundle/ui/jquery.ui.button.js"></script>	
	<link rel="stylesheet" type="text/css" href="resources/css/layout.css"/>
	<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8_h_OaZwi_KRiDev5M8PUxhKRuKbOj1Q&sensor=true">
	</script>
	<script type="text/javascript">
	  $(function(){
			$("input[type=submit],input[type=button],a,button")
				.button()
				.click(function(event){
					event.preventDefault();
				});
	  });
	  var initialLocation;
	  var siberia = new google.maps.LatLng(60, 105);
	  var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
	  var browserSupportFlag =  new Boolean();
      function initialize() {
        var mapOptions = {
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
		if(navigator.geolocation) {
		  browserSupportFlag = true;
		  navigator.geolocation.getCurrentPosition(function(position) {
          initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
          map.setCenter(initialLocation);
		  }, function() {
			handleNoGeolocation(browserSupportFlag);
		  });
		}
		// Browser doesn't support Geolocation
		else {
		  browserSupportFlag = false;
		  handleNoGeolocation(browserSupportFlag);
		}
		
		function handleNoGeolocation(errorFlag) {
		  if (errorFlag == true) {
		    alert("Geolocation service failed.");
			$(".address_search_div").show();
		    initialLocation = newyork;
		  } else {
			  alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
			  initialLocation = siberia;
			}
		map.setCenter(initialLocation);
		}
	  }
      google.maps.event.addDomListener(window, 'load', initialize);
	</script>
</head>
<body>
	<table width="100%" height="100%">
		<tr>
			<td width="35%" height="100%"><t:insertAttribute name="menu"/></td>
			<td width="65%" height="100%"><t:insertAttribute name="map"/></td>
		</tr>
	</table>
</body>
</html>