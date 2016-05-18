<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="container">
	<c:if test="${!empty itemPostMessage}">
		<div class="row">
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>${itemPostMessage}</strong>
			</div>
		</div>
	</c:if>
	<br /> <br />
	<div class="row">
		<h4 class="text-success">Check The Items You Have In Your Room</h4>
		<form:form modelAttribute="checkInFormData">
			<table class="table table-hover">
				<tr>
					<th>S.N.</th>
					<th>Item Name</th>
					<th>Description</th>
					<th>Available</th>
					<th>Current Status</th>
				</tr>

				<c:forEach items="${checkinFormItems}" var="it" varStatus="counter">
					<tr>
						<td><c:out value="${counter.index + 1}" /></td>
						<td><form:input path="itemName" value="${it.itemName}"
								readonly="true" /></td>
						<td><textarea rows="2" cols="40" name="description"
								readonly="readonly">${it.description}</textarea></td>

						<td><label class="radio-inline"><input type="radio"
								name="available[${counter.index}]" value="1" checked>Yes</label>
							<label class="radio-inline"><input type="radio"
								name="available[${counter.index}]" value="0">No</label></td>

						<td><form:textarea path="status" rows="2" cols="40"
								value="status" /></td>
						<td><input type="hidden" name="id" value="${it.id}" />
					</tr>
				</c:forEach>
			</table>
			<input type="submit" value="Done" class="btn btn-primary" />
			<br/><br/>
		</form:form>
	</div>
</div>