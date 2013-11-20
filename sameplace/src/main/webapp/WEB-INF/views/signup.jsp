<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<sf:form id="signUpForm" method="post" modelAttribute="User">
<table width="100%">
	<tr>
		<td width="45%"><div class="input_text">Username:</div></td>
		<td ><input id="username" type="text" class="input_field"/></td>
	</tr>
	<tr>
		<td width="45%"><div class="input_text">Password:</div></td>
		<td><input id="password" type="password" class="input_field"/></td>
	</tr>
	<tr>
		<td width="45%"><div class="input_text">Confirm Password:</div></td>
		<td><input id="password" type="password" class="input_field"/></td>
	</tr>
	<tr>
		<td colspan="2"><input id="sign_up" type="button" class="single_button" value="Create"/></td>
	</tr>
</table>
</sf:form>