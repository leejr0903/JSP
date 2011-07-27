<%@page language="java" contentType="text/html; charset=euc-kr" errorPage="/program/common/error.jsp"%>
<% 
/******************************************************************************
	���α׷� :
	���̺�� : tbl_pj_report
	��    �� : �����ڿ� ���
	�� �� �� : 
	�� �� �� : 2011-06-08 16:45:033
******************************************************************************/
%>

<%@ page import="java.util.*"%>

<%@ page import="kr.co.iacts.jdf.*"%>
<%@ page import="kr.co.iacts.jdf.db.*"%>
<%@ page import="kr.co.iacts.jdf.jsp.*"%>

<%@ page import="kr.co.iacts.business.*"%>
<%@ page import="kr.co.iacts.business.project.*"%>


<%@ include file="/program/common/env.jsp" %>
<%-- ����� ���� ���� --%>
<%@ include file="/program/common/member_session.jsp"%>
<% 
//������ ���ٱ��� �˻� // memberSession.isManager(env�� �߰��Ͽ� ���Ѽ���)
if ( !memberSession.isManager(PAGE_CD_MGN_REPORT) ) { 
	%><%@ include file="/program/common/msg_access_manager.jsp"%><% 
	return ;
} 
%>


<jsp:useBean id="projectApp" class="kr.co.iacts.business.project.ProjectApp" scope="request" />
<jsp:useBean id="projectBean" class="kr.co.iacts.business.project.ProjectBean" scope="request" />
<%@ include file="/program/rhksflwk/design_head.jsp" %>
<h1>�������� ���</h1>


<% 
RequestParameterMap paramUtil = new RequestParameterMap(request);

//DB����� ����.
ProjectReportApp projectreportApp = new ProjectReportApp();  

ProjectReportBean projectreportBean = projectreportApp.getRecord(paramUtil.getInt("pjrp_sno", -1));
boolean isModify = true;
if ( paramUtil.getInt("pjrp_sno", -1) == -1 ) {
	projectreportBean.setBegin_date(new Date());
	projectreportBean.setEnd_date(new Date());
	isModify = false;
}


//���� ������ �������� ������Ʈ��
HashFieldMap projectParameter = new HashFieldMap ();
projectParameter.put("pj_member_id", memberSession.getLoginId());
projectParameter.put("pj_process_cd_not", "Y");
//������Ʈ �Ϸ� �������� �ΰ�
projectParameter.put("s_pj_process_cd", PJ_PROCESS_CD_END);

List myProjectList = projectApp.getRecordList(projectParameter);

 

%>
<script type="text/javascript" src="/program/includejs/loader.js"></script><noscript><p></p></noscript>
<script type="text/javascript">
<!-- 

function dosubmit_prev(theForm) {
	with(theForm) {
		//if( !FormValidate.isNumber(pjrp_sno, "pjrp_sno ���ڸ� ���԰��� �մϴ�.") ) return false;
		if( !FormValidate.$(pjrp_type_cd, "�������� ���� �ϼ���.", /[\s\S]/) ) return false;
		//if( !FormValidate.$(att_id, "att_id  �Է��ϼ���.", /[\s\S]/) ) return false; 
		//if( !FormValidate.$(member_id, "member_id  �Է��ϼ���.", /[\s\S]/) ) return false; 
		//if( !FormValidate.$(recv_member_id, "recv_member_id  �Է��ϼ���.", /[\s\S]/) ) return false; 
	 
		if( !FormValidate.$(content, "������  �Է��ϼ���.", /[\s\S]/) ) return false; 
		//if( !FormValidate.$(create_date, "�ۼ�����  �Է��ϼ���.", /[\s\S]/) ) return false; 
		
		//if( !FormValidate.isNumber(pj_sno, "pj_sno ���ڸ� ���԰��� �մϴ�.") ) return false;
		/*
		if ( pj_sno.value == "") { 
			if ( !confirm("���� ������Ʈ�� �������� �ʾҽ��ϴ�.\n����մϱ�?")) {
				return false;
			}
		}
		*/
		oEditors.getById["content"].exec("UPDATE_IR_FIELD", []);
		return true;

	}
}

function doclick_delete() {
	if( confirm("������ �ڷ�� �������� �ʽ��ϴ�.\n��� �Ͻðڽ��ϱ�?") ) {
		document.frm_projectreport.amode.value = "_del";
		document.frm_projectreport.submit();
	}
}

function doclick_deleteAttachement(_id, _no) {
	if( confirm("������ ���� �Ͻ÷ƴϱ�?\n��� �Ͻðڽ��ϱ�?") ) {
		document.frm_projectreport.amode.value = "_del_att";
		document.frm_projectreport.att_id.value = _id;
		document.frm_projectreport.att_no.value = _no;
		
		document.frm_projectreport._url.value="report_ins.jsp?<%= paramUtil.toParamString() %>";
		document.frm_projectreport.submit();
	}
}
// -->
</script><noscript><p></p></noscript>

<!-- board -->

<div class="board">
<form action="report_action.jsp" name="frm_projectreport" method="POST" enctype="multipart/form-data">
<input type="hidden" name="amode" value="<%= paramUtil.getInt("pjrp_sno", -1) == -1 ? "_ins" :  "_upd" %>">

<input type="hidden" name="pjrp_sno" value="<%= paramUtil.getInt("pjrp_sno", -1) %>">
<input type="hidden" name="_url" value="report_staff_cal.jsp?<%= paramUtil.toParamString(new String[]{"pjrp_sno"}, false) %>">

<!-- infomenu -->
<div class="infomenu">
<div class="left">
<span class="required" title="�ʼ��׸�">*</span> �� �ʼ��Է»����Դϴ�.

</div>
</div>
<!-- //infomenu -->

<table class="form_table" border="1" cellspacing="0" summary="">
<colgroup><col width="150"></colgroup>
<tbody>
<%--
<tr>
	<th scope="row" class="item"><label class="head" for="lblrecv_member_id">������ <!--<span class="required" title="�ʼ��Է�">*</span>--></label></th>
	<td>	<input type="text" name="recv_member_id" id="lblrecv_member_id" value="<%= HtmlUtil.translate(projectreportBean.getRecv_member_id()) %>"  class="text w100"  maxlength="30" />	</td>
</tr>
 --%>
 
<tr>
	<th scope="row" class="item"><label class="head" for="lblpjrp_type_cd"> ����������Ʈ <span class="required" title="�ʼ��Է�">*</span></label></th>
	<td>
	
	<select name="pj_sno" id="lblpj_sno"  class="select">
	<option value="">����������Ʈ</option>
<% for (int i=0; i < myProjectList.size(); i++) {
	projectBean = (ProjectBean)myProjectList.get(i);
	%>
	<option value="<%= projectBean.getPj_sno() %>" <%= projectBean.getPj_sno() == projectreportBean.getPj_sno() ? "selected='selected'" : "" %>><%= projectBean.getPj_title() %></option>
	<% } %>
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
		$(document.forms.frm_projectreport.pj_sno).change(function(){

			$.getJSON("report_task_sno_ajax.jsp",
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
  							
  							var options = '';
  						    for (var i = 0; i < data.length; i++) {
  						        options += '<option' + data[i].task_sno.equals(<%= projectreportBean.getTask_sno() %>) ? "selected" : "" + 'value="' + data[i].task_sno + '">' + data[i].title + '</option>';
  						       }
  						  	$("select#lbltask_sno").html(options);
  							
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

<tr>
	<th scope="row" class="item"><label class="head" for="lblpjrp_type_cd"> ������ <span class="required" title="�ʼ��Է�">*</span></label></th>
	<td>
	<select name="pjrp_type_cd" class="select">
	<jsp:include page="/program/public/code/code_select_option.jsp" flush="true" >
	<jsp:param name="selected" value="<%= projectreportBean.getPjrp_type_cd() %>"/>
	<jsp:param name="publ_cd" value="<%= PJRP_TYPE_CD %>"/>
	</jsp:include>
	</select>
	</td>
</tr>

<tr>
	<th scope="row" class="item"><label class="head" for="lblbegin_date">�ۼ��� <!--<span class="required" title="�ʼ��Է�">*</span>--></label></th>
	<td>
	<input type="text" name="member_id" value="<%= memberSession.getLoginId() %>"/>
	<a href="#" onclick="alert('�غ���!\n�ϴ� ���̵� �����ϼ���.'); return false;" >�ۼ��� ����</a>
	
	</td>
</tr>

<tr>
	<th scope="row" class="item"><label class="head" for="lblbegin_date">�Ⱓ <!--<span class="required" title="�ʼ��Է�">*</span>--></label></th>
	<td>
	<input type="text" name="begin_date" id="lblbegin_date" value="<%= projectreportBean.getBegin_date() == null ? "" : DateTime.getFormatString(projectreportBean.getBegin_date(), "yyyy-MM-dd")  %>"  class="text"  size="10" />	
	<a href="/program/common/DateSelectorIframe.jsp"  onclick="onClick_btnDate(this, 'frm_projectreport.begin_date');return false" title="�� â���� �˻� ���� ��¥�� �����մϴ�." onkeypress="" class="button">�޷�</a>
	~
	<input type="text" name="end_date" id="lblend_date" value="<%= projectreportBean.getEnd_date() == null ? "" : DateTime.getFormatString(projectreportBean.getEnd_date(), "yyyy-MM-dd")  %>"  class="text"  size="10" />	
	<a href="/program/common/DateSelectorIframe.jsp"  onclick="onClick_btnDate(this, 'frm_projectreport.end_date');return false" title="�� â���� �˻� ���� ��¥�� �����մϴ�." onkeypress="" class="button">�޷�</a>
	<a href="#" class="button" onclick='setPjTerm(-1);return false;' >1����</a>
	<a href="#" class="button" onclick='setPjTerm(-2);return false;' >2����</a>
	<a href="#" class="button" onclick='setPjTerm(-3);return false;' >3����</a>
	<a href="#" class="button" onclick='setPjTerm(-7);return false;' >��������</a>
	<script type="text/javascript">
	function setPjTerm(a){
		var date = (new Date()).dateAdd("d", a);
		$("#lblbegin_date").val(date.format("yyyy-mm-dd"));
		$("#lblend_date").val(date.format("yyyy-mm-dd"));	
	}
	</script>
	</td>
</tr>

<tr>
	<th scope="row" class="item"><label class="head" for="lblcontent">���� <span class="required" title="�ʼ��Է�">*</span></label></th>
	<td>
		
	<textarea name="content" id="content" style="width:100%; height:350px;display:none; ">
	<%= HtmlUtil.escapeHtml(projectreportBean.getContent().replaceAll("http://" + request.getServerName() + "/upload","/upload")) %></textarea>
	<script type="text/javascript" src="/SmartEditorBasic/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "content",
				sSkinURI: "/SmartEditorBasic/SEditorSkinUpload.html",
				fCreator: "/SmartEditorBasic/createSEditorInIFrame"
			});
			//�̹������� - ���ε� �Ϸ����������� ȣ���.
			function insertIMG(shtml){
			  oEditors.getById["content"].exec("PASTE_HTML", [shtml]);
			}
	</script>

	
	</td>
</tr>
<tr>
	<th scope="row" class="item"><label class="head" for="">��������<!--<span class="required" title="�ʼ��Է�">*</span>--></label></th>
	<td>
	
		
<%
if ( isModify && projectreportBean.getAtt_id() != null && !projectreportBean.getAtt_id().equals("") ) {
AttachementApp atachementApp = new AttachementApp ();
List fileList = atachementApp.getRecordList(projectreportBean.getAtt_id());
%>
<ul>
<% 
for(int i=0; i < fileList.size(); i++) {
	AttachementBean attachementBean =(AttachementBean ) fileList.get(i); 

%>

<li>
<a href="#" onclick="doclick_deleteAttachement('<%= attachementBean.getAtt_id() %>', '<%= attachementBean.getAtt_no() %>')" title="����"><img src="/program/img/board/b_x.gif"/></a>
<%= attachementBean.getFilename() %>
</li>
	
<% } %>
</ul>
<% } %>

	
	
	<input type="hidden" name="att_id" value="<%= projectreportBean.getAtt_id() %>"/>
	<input type="hidden" name="att_no" value=""/>
	<%@ include file="/plupload/e.jsp" %>
	
</td>
</tr>



<!-- 
<tr>
	<th scope="row" ><label class="head" for="lblname">�̸�<span class="required" name="Required">*</span></label></th>
	<td>
	<input type="text" name="name" id="lblname" value="<%//= data.getName() %>" class="text w100"/>
	</td>
</tr>
<tr>
	<th scope="row" ><label class="head" for="lbltitle">Ÿ��Ʋ <span class="required" title="Required">*</span></label></th>
	<td>
	<input type="text" name="title" id="lbltitle" value="<%//=  data.getTitle() %>" class="text w100"/>
	</td>
</tr>
<tr>
	<th scope="row" ><label class="head" for="lblcontent">����<span class="required" content="Required">*</span></label></th>
	<td>
	<textarea name="content" class="text w100" ><%//= data.getContent() %></textarea>
	</td>
</tr>
 -->

</tbody>
</table>

<div class="infomenu page">
<div class="left">
</div>
<div class="rigth">
<input type="submit" value="����" class="button" />
<% if ( paramUtil.getInt("pjrp_sno", -1) != -1 ) { %>
<a href="?" onclick="doclick_delete(); return false;" onkeypress="" class="button">����</a>
<% } %>
<a href="report_staff_lst.jsp?<%= paramUtil.toParamString(new String[]{"pjrp_sno"}, false) %>" class="button">���</a>
</div>
</div>

</form>
</div>








<%@include file="/program/rhksflwk/design_foot.jsp" %>