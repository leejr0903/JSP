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
<form name="action"></form>
<table>
<tr>
	<th scope="row" class="item">
		<label class="head" for="lblpjrp_type_cd">�����ϼ���</label>
	</th>
	<td>
		<select name="first" id="lblfirst" class="">
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
	<script type="text/javascript">
	$(function(){
		var options = "";
		$(document.forms.action.first).change(function(){

			$.getJSON("action.jsp",
					  {
					    //pj_sno: $("#lblpj_sno").val()
					  },
					  function(data) {
						  alert("A");
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





</body>
</html>