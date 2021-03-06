<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>



<link href="static/css/style.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript" src="static/js/myscript.js"></script>
<script type="text/javascript"
	src="static/js/activeselection.js"></script>


<script type="text/javascript"
	src="static/js/validateordertextbook.js"></script>

<script>

 function getCourseList() {
            var departmentId = $("#departmentId").val();
            console.debug(departmentId);
            $.ajax({
                url: '/getCourseList',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify({ departmentId: departmentId }),
                success: function (result) {
                    console.debug(result);
                    $("#coursedropdown").html("");
                    $("#coursedropdown").append($('<option></option>').html("---Select Course---"));
                    $.each(result, function (i, Course) {
                        $("#coursedropdown").append($('<option></option>').val(Course.class_id).html(Course.courseId));
                    })


                },
                error: function (err) {
                console.debug(result);
                $("#coursedropdown").html("");
                    $("#coursedropdown").append($('<option></option>').html("---Select Course---"));
                 alert("Sorry for inconvenience.There are no courses for this department. Select other department to continue.") },
            });
        }
</script>


</head>

<body>


	<div class="container text-center">
		<h3>You are ordering a textbook for class present in department
			"${user.department.departmentname}"</h3>
		<hr>
		<form class="form-horizontal" method="POST" action="create-order"name="ordertextbookform"  onsubmit="return validateOrderTextbookForm()">

			<input type="hidden" name="user_id" value="${user.user_id}" />
			<input type="hidden" name="department_id" value="${user.department}" />
			<label class="control-label" id= "error" style="color:red; font-size:20px; text-align: left;"></label>

			<div class="form-group">
			<label class="control-label col-md-3"> Select Department </label>
			<div class= "col-md-7">
			<select class ="form-control" name="department" id= "departmentId" onchange = "getCourseList()">
        <c:forEach var="department" items="${departments}">
            <option  value="${department.department_id}"   ${user.department.department_id == department.department_id ? 'selected' : ''}>
                <c:out value="${department.departmentname}"/>
            </option>
        </c:forEach>
    </select>
			</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-3"> Select course</label>

				<div class="col-md-7 selectContainer">
					<select class="form-control" name="course" id = "coursedropdown">
					<option >
								---Select Course---
							</option>
						<c:forEach var="course" items="${courses}">
							<option  value="${course.class_id}">
								<c:out value="${course.courseId}" />
							</option>
						</c:forEach>
					</select>


				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-3"> Select Term</label>

				<div class="col-md-7 selectContainer">
					<select class="form-control" name="term">
						<c:forEach var="term" items="${terms}">
							<option  value="${term.term_id}">
								<c:out value="${term.semester}- ${term.year}" />
							</option>
						</c:forEach>
					</select>


				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-3"> Comments</label>

				<div class="col-md-7 ">

				<input type="text" name='ordercommets' placeholder='Comments'
										class="form-control" />

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-3"> Is Textbook Required</label>
				<div class="col-md-7">
					<input type="radio" class="col-sm-1" id= "radio-textrequiredYes" name="textbookRequired" value=true
						 checked />
				<div class="col-sm-1"> Yes</div>
						 <input type="radio" id= "radio-textrequiredNo" class="col-sm-1" name="textbookRequired"
						value=false  />
				<div class="col-sm-1"> No</div>
				</div>
				</div>

			<div id = "table-divison" class="form-group tableToHide" >
				<div class="row clearfix">
					<div class="col-md-12 column">
						<table class="table table-bordered table-hover" id="tab_logic">
							<thead>
								<tr>
									<th class="text-center">Serial Number</th>
									<th class="text-center">Title</th>
									<th class="text-center">Author</th>
									<th class="text-center">Copyright</th>
									<th class="text-center">Edition</th>
									<th class="text-center">ISBN</th>
									<th class="text-center">Publisher</th>
									<th class="text-center">Code Required</th>
									<th class="text-center">Ebook Required</th>
									<th class="text-center">Any Acceptable Editions</th>
								</tr>
							</thead>
							<tbody>
								<tr id='textbook0'>
									<td>1</td>
									<td><input type="text" name='title0' placeholder='Title'
										class="form-control" /></td>
									<td><input type="text" name='author0' placeholder='Author'
										class="form-control" /></td>
									<td><input type="text" name='copyright0'
										placeholder='Copyright' class="form-control" /></td>
									<td><input type="text" name='edition0'
										placeholder='Edition' class="form-control" /></td>
									<td><input type="text" name='isbn0' placeholder='ISBN'
										class="form-control" /></td>
									<td><input type="text" name='publisher0' placeholder='Publisher'
										class="form-control" /></td>
									<td>

					<div class="text-center"><input type="radio"  id= "iscoderequiredYes" name="iscoderequired0" value=true
						 checked />Yes</div ><div class="text-center"><input type="radio" id= "iscoderequiredNo" name="iscoderequired0"
						value=false/>No</div>



									</td>
									<td><div >
					<input type="radio"  id= "isebooksokYes" name="isebooksok0" value=true
						 checked />
				Yes</div>
						<div> <input type="radio" id= "isebooksokNo"  name="isebooksok0"
						value=false  />
				No</div>
				</td>
				<td><input type="text" name='acceptableeditions0' placeholder='Editions'
										class="form-control" /></td>
								</tr>
								<%-- <tr id = 'previoustextbook0'>
								<td align="center" colspan="11"> <label class="control-label col-md-3"> Select from previous textbook</label>

				<div class="col-md-7 selectContainer">
					<select class="form-control" name="previoustext0">
						<c:forEach var="textbook" items="${textbooks}">
							<option  value="${textbook.textbook_id}">
								<c:out value="${textbook.title}- ${textbook.author} - ${textbook.edition}- ${textbook.isbn}" />
							</option>
						</c:forEach>
					</select>


				</div>    </td>
								</tr> --%>
								<tr id='textbook1'></tr>
								<tr id='previoustextbook1'></tr>
							</tbody>
						</table>
					</div>
				</div>
				<a id="add_row" class="btn btn-default pull-left">Add Row</a> <a
					id='delete_row' class="pull-right btn btn-default">Delete Row</a>
			</div>



			<div class="form-group">

				<input type="submit" class="btn btn-primary" value="order" onclick="return confirm('Are you sure to proceed?')" />
			</div>




		</form>


	</div>



<jsp:include page="booksearch.jsp"></jsp:include>
</body>
</html>