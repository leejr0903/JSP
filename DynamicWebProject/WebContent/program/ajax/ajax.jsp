<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 
�̿ϼ�

 -->
<form name="ajax_action" id="ajax_action" >
<table>
<tr>
	<th scope="row" class="item"><label class="head" for="lblpjrp_type_cd"> ����������Ʈ <span class="required" title="�ʼ��Է�">*</span></label></th>
	<td>
	
	<select name="pj_sno" id="lblpj_sno"  class="select">
			<option value="">����</option>
			<option value="1" >1��</option>
			<option value="2" >2��</option>
			<option value="3" >3��</option>
			<option value="4" >4��</option>
			<option value="5" >5��</option>
	</select>
	</td>
</tr>

<tr>
	<th scope="row" class="item"><label class="head" for="lbltask_sno"> ��������Ʈ <span class="required" title="�ʼ��Է�">*</span></label></th>
	<td>
	<select name="task_sno" id="lbltask_sno" ></select>
	<script type="text/javascript" src="/DynamicWebProject/jquery/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$(document.forms.ajax_action.pj_sno).change(function(){
		
			$.getJSON("ajax_action.jsp",
					  {
					    pj_sno: $("#lblpj_sno").val()
					  },
					  function(data) {
						  
						  /*
						  for(var i=0; i <data.length; i++) {
								console.log(data[i].value);
						  }
						  */
						  /*
						  $('#lbltask_sno').empty();
						  
						  $.each(data, function(key, item){
							  $('#lbltask_sno').append(new Option(item.title, item.task_sno, true, true));
						    });
						  $("#lbltask_sno").val(85).attr("selected", "selected");
  							*/
  							/*
  							var options = '';
  						    for (var i = 0; i < data.length; i++) {
  						        options += '<option' + data[i].task_sno.equals() ? "selected" : "" + 'value="' + data[i].task_sno + '">' + data[i].title + '</option>';
  						       }
  						  	$("select#lbltask_sno").html(options);
  							*/
					  });
			
		});
	})
	/*
	var options = '';
    for (var i = 0; i < j.length; i++) {
        options += '<option value="' + j[i].optionValue + '">' + j[i].optionDisplay + '</option>';
       }
    */
	</script>

	</td>
</tr>
</table>
</form>




</body>
</html>