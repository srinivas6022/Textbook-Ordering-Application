$(document).ready(function(){var i=1;
$("#add_row").click(function(){

	$('#textbook'+i).html("<td>"+ (i+1) +"</td><td><input name='title"+i+"' type='text' placeholder='Title' class='form-control input-md'  /></td><td><input  name='author"+i+"' type='text' placeholder='Author'  class='form-control input-md'></td><td><input  name='copyright"+i+"' type='text' placeholder='Copyright'  class='form-control input-md'></td><td><input  name='edition"+i+"' type='text' placeholder='Edition'  class='form-control input-md'></td><td><input  name='isbn"+i+"' type='text' placeholder='ISBN'  class='form-control input-md'></td><td><input  name='publisher"+i+"' type='text' placeholder='Publisher'  class='form-control input-md'></td><td><input  name='iscoderequired"+i+"' type='text' placeholder='Is Code Required'  class='form-control input-md'></td><td><input  name='isebooksok"+i+"' type='text' placeholder='Ebooks Required'  class='form-control input-md'></td>");

	$('#previoustextbook'+i).html('<td align="center" colspan="9"> <label class="control-label col-md-3"> Select from previous textbook</label><div class="col-md-7 selectContainer"><select class="form-control" name="previoustext'+i+'"><c:forEach var="textbook" items="${textbooks}"><option  value="${textbook.textbook_id}"><c:out value="${textbook.title}- ${textbook.author} - ${textbook.edition}- ${textbook.isbn}" /></option></c:forEach></select></div>    </td>');

	$('#tab_logic').append('<tr id="textbook'+(i+1)+'"></tr>');
	$('#tab_logic').append('<tr id="previoustextbook'+(i+1)+'"></tr>');
	i++;
});
$("#delete_row").click(function(){
	if(i>1){
		$("#previoustextbook"+(i-1)).html('');
		$("#textbook"+(i-1)).html('');
		i--;
	}
});

    $("#radio-textrequiredNo").click(function(){

    	$("#table-divison").hide();

});


    $("#radio-textrequiredYes").click(function(){

    	$("#table-divison").show();

});

});
