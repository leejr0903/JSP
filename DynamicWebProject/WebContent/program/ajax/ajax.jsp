<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ajax.jsp</title>

<script type="text/javascript" src="/DynamicWebProject/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(document.forms.ajax_action.go_ajax).change(function(){
	
		$.getJSON("json.jsp",
				{
				// �ѱ��� �ѱ�� ������ ������ �߻�
		    	pj_sno: $("#lblgo_ajax").val()
				},
				  function(data) {
					
					// �ֿܼ��� ����
					/*
					for(var i=0; i <data.length; i++) {
						console.log(data[i].val + " " + data[i].name);
					}*/
					
					// option ���
					// option+=
					
					var options = '';
					for(var i=0; i <data.length; i++) {
						options += '<option value="' + data[i].val + '">' + data[i].name + '</option>';
					}
					$("select#lblchange_ajax").html(options);
					
					
					// option ���
					// IE7,8���� ���� ����
					// jquery ����
					/*
					$('#lbltask_sno').empty();
					  
					$.each(data, function(key, item){
						$('#lblchange_ajax').append(new Option(item.name, item.val, true, true));
					    });
					$("#lbltask_sno").val(0).attr("selected", "selected");
 						*/
				  });
	});
});
</script>
	
</head>
<body>

<form action="" name="ajax_action" id="ajax_action" method="post">
<table>
<tr>
	<th scope="row" >
		<label class="" for="lblgo_ajax"> Go Ajax </label>
	</th>
	<td>
		<select name="go_ajax" id="lblgo_ajax" class="" >
				<option value="">����</option>
				<option value="�ѱ�" >�ѱ�</option>
				<option value="english" >����</option>
				<option value="9999" >����</option>
		</select>
	</td>
</tr>

<tr>
	<th scope="row" class="">
		<label class="head" for="lblchange_ajax"> Change Ajax</label>
	</th>
	<td>
	<select name="change_ajax" id="lblchange_ajax" >
	<option value="">Change Ajax</option>
	</select>
	</td>
</tr>
</table>
</form>


</body>
</html>