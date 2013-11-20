<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>


<sf:form method="get" id="home">
<table width="100%">
	<tr>
		<td><input id="sign_in" type="button" class="center" value="Sign In"/></td>
	</tr>
	
	<tr>
		<td><input id="sign_up" type="button" class="center" value="Sign Up"/></td>
	</tr>
</table>

</sf:form>

<script type="text/javascript">
$("#sign_up").click(function(){
	var url=$("#home").attr("action");
	$("#home").attr("action",url+"/signup");
	$("#home").trigger("submit");
});
</script>


