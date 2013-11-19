<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" href="resources/development-bundle/themes/base/jquery.ui.all.css">
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
			  $(".address_search_div").show();
			  initialLocation = siberia;
			}
		map.setCenter(initialLocation);
		}
	  }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>
  <body>
	<!-- <div id="logo-frame"><img id="logo" border="0" src="resources/images/"> </div>-->
	<div id="input-panel">
		<div id="address_search_div" class="address_search_div">
			<input type="text" placeholder="Current address?"/>
			<input type="button" value="Search">
		</div>
		
		<div class="button_div">
		<input id="need_help" type="button" class="center" value="Need help"/>
		</div>
		
		<div class="button_div">
		<input id="find_job" type="button" class="center" value="Find job"/>
		</div>
	</div>
	<div id="map-canvas"></div>
	<script>
		$(window).load(function(){
			$(".button_div").show();
		});
	</script>
  </body>
</html>