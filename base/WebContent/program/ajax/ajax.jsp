<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>ajax.jsp</title>

<script type="text/javascript" src="/base/program/includejs/jquery-1.6.2.js"></script>
<script type="text/javascript">
$(function(){
	$(document.forms.ajax_action.go_ajax).change(function(){
	
		$.getJSON("json.jsp",
				{ 
				// �ѱ��� �ѱ�� ������ ������ �߻�
		    	pj_sno: escape($("#lblgo_ajax").val())
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
						options += '<option value="' + data[i].val + '">' + unescape(data[i].name) + '</option>';
					}
					$("select#lblchange_ajax").html(options);
					
					
					
					for(var i=0; i <data.length; i++) {
						$("#lbltitle").val(data[i].val);
					}
					
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

$(function(){
	$(document.forms.ajax_action.change_ajax).change(function(){

		$.getJSON("json.jsp",
				{
				// �ѱ��� �ѱ�� ������ ������ �߻�
		    	pj_sno: $("#lblchange_ajax").val()
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
					$("select#lblchange_ajax2").html(options);
					
					
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
		<label class="head" for="lblchange_ajax"> Change Ajax1</label>
	</th>
	<td>
	<select name="change_ajax" id="lblchange_ajax" >
	<option value="">Change Ajax</option>
	</select>
	</td>
</tr>
<tr>
	<th scope="row" class="">
		<label class="head" for="lblchange_ajax2"> Change Ajax2</label>
	</th>
	<td>
	<select name="change_ajax2" id="lblchange_ajax2" >
	<option value="">Change Ajax</option>
	</select>
	</td>
</tr>
<tr>
	<th scope="row" class="">
		<label class="head" for="lbltitle">change ajax text</label>
	</th>
	<td>
		<input type="text" name="title" id="lbltitle" />
	</td>
</tr>

</table>
</form>


</body>
</html>