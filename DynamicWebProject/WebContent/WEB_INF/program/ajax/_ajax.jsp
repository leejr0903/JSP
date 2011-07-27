<%@page language="java" contentType="text/html; charset=euc-kr" errorPage="/program/common/error.jsp"%>
<% 
/******************************************************************************
	프로그램 :
	테이블명 : tbl_pj_report
	설    명 : 관리자용 등록
	작 성 자 : 
	작 성 일 : 2011-06-08 16:45:033
******************************************************************************/
%>

<%@ page import="java.util.*"%>

<%@ page import="kr.co.iacts.jdf.*"%>
<%@ page import="kr.co.iacts.jdf.db.*"%>
<%@ page import="kr.co.iacts.jdf.jsp.*"%>

<%@ page import="kr.co.iacts.business.*"%>
<%@ page import="kr.co.iacts.business.project.*"%>


<%@ include file="/program/common/env.jsp" %>
<%-- 사용자 세션 정보 --%>
<%@ include file="/program/common/member_session.jsp"%>
<% 
//페이지 접근권한 검사 // memberSession.isManager(env에 추가하여 권한설정)
if ( !memberSession.isManager(PAGE_CD_MGN_REPORT) ) { 
	%><%@ include file="/program/common/msg_access_manager.jsp"%><% 
	return ;
} 
%>


<jsp:useBean id="projectApp" class="kr.co.iacts.business.project.ProjectApp" scope="request" />
<jsp:useBean id="projectBean" class="kr.co.iacts.business.project.ProjectBean" scope="request" />
<%@ include file="/program/rhksflwk/design_head.jsp" %>
<h1>업무보고 등록</h1>


<% 
RequestParameterMap paramUtil = new RequestParameterMap(request);

//DB연결용 생성.
ProjectReportApp projectreportApp = new ProjectReportApp();  

ProjectReportBean projectreportBean = projectreportApp.getRecord(paramUtil.getInt("pjrp_sno", -1));
boolean isModify = true;
if ( paramUtil.getInt("pjrp_sno", -1) == -1 ) {
	projectreportBean.setBegin_date(new Date());
	projectreportBean.setEnd_date(new Date());
	isModify = false;
}


//현재 본인이 참여중인 프로젝트만
HashFieldMap projectParameter = new HashFieldMap ();
projectParameter.put("pj_member_id", memberSession.getLoginId());
projectParameter.put("pj_process_cd_not", "Y");
//프로젝트 완료 유지보수 인계
projectParameter.put("s_pj_process_cd", PJ_PROCESS_CD_END);

List myProjectList = projectApp.getRecordList(projectParameter);

 

%>
<script type="text/javascript" src="/program/includejs/loader.js"></script><noscript><p></p></noscript>
<script type="text/javascript">
<!-- 

function dosubmit_prev(theForm) {
	with(theForm) {
		//if( !FormValidate.isNumber(pjrp_sno, "pjrp_sno 숫자만 기입가능 합니다.") ) return false;
		if( !FormValidate.$(pjrp_type_cd, "보고구분을 선택 하세요.", /[\s\S]/) ) return false;
		//if( !FormValidate.$(att_id, "att_id  입력하세요.", /[\s\S]/) ) return false; 
		//if( !FormValidate.$(member_id, "member_id  입력하세요.", /[\s\S]/) ) return false; 
		//if( !FormValidate.$(recv_member_id, "recv_member_id  입력하세요.", /[\s\S]/) ) return false; 
	 
		if( !FormValidate.$(content, "내용을  입력하세요.", /[\s\S]/) ) return false; 
		//if( !FormValidate.$(create_date, "작성일을  입력하세요.", /[\s\S]/) ) return false; 
		
		//if( !FormValidate.isNumber(pj_sno, "pj_sno 숫자만 기입가능 합니다.") ) return false;
		/*
		if ( pj_sno.value == "") { 
			if ( !confirm("연관 프로젝트를 선택하지 않았습니다.\n계속합니까?")) {
				return false;
			}
		}
		*/
		oEditors.getById["content"].exec("UPDATE_IR_FIELD", []);
		return true;

	}
}

function doclick_delete() {
	if( confirm("삭제된 자료는 복구되지 않습니다.\n계속 하시겠습니까?") ) {
		document.frm_projectreport.amode.value = "_del";
		document.frm_projectreport.submit();
	}
}

function doclick_deleteAttachement(_id, _no) {
	if( confirm("파일을 삭제 하시렵니까?\n계속 하시겠습니까?") ) {
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
<span class="required" title="필수항목">*</span> 는 필수입력사항입니다.

</div>
</div>
<!-- //infomenu -->

<table class="form_table" border="1" cellspacing="0" summary="">
<colgroup><col width="150"></colgroup>
<tbody>
<%--
<tr>
	<th scope="row" class="item"><label class="head" for="lblrecv_member_id">보고자 <!--<span class="required" title="필수입력">*</span>--></label></th>
	<td>	<input type="text" name="recv_member_id" id="lblrecv_member_id" value="<%= HtmlUtil.translate(projectreportBean.getRecv_member_id()) %>"  class="text w100"  maxlength="30" />	</td>
</tr>
 --%>
 
<tr>
	<th scope="row" class="item"><label class="head" for="lblpjrp_type_cd"> 연관프로젝트 <span class="required" title="필수입력">*</span></label></th>
	<td>
	
	<select name="pj_sno" id="lblpj_sno"  class="select">
	<option value="">연관프로젝트</option>
<% for (int i=0; i < myProjectList.size(); i++) {
	projectBean = (ProjectBean)myProjectList.get(i);
	%>
	<option value="<%= projectBean.getPj_sno() %>" <%= projectBean.getPj_sno() == projectreportBean.getPj_sno() ? "selected='selected'" : "" %>><%= projectBean.getPj_title() %></option>
	<% } %>
	</select>
	</td>
</tr>

<tr>
	<th scope="row" class="item"><label class="head" for="lbltask_sno"> 연관사이트 <span class="required" title="필수입력">*</span></label></th>
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
	<th scope="row" class="item"><label class="head" for="lblpjrp_type_cd"> 보고구분 <span class="required" title="필수입력">*</span></label></th>
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
	<th scope="row" class="item"><label class="head" for="lblbegin_date">작성자 <!--<span class="required" title="필수입력">*</span>--></label></th>
	<td>
	<input type="text" name="member_id" value="<%= memberSession.getLoginId() %>"/>
	<a href="#" onclick="alert('준비중!\n일단 아이디 기입하세요.'); return false;" >작성자 변경</a>
	
	</td>
</tr>

<tr>
	<th scope="row" class="item"><label class="head" for="lblbegin_date">기간 <!--<span class="required" title="필수입력">*</span>--></label></th>
	<td>
	<input type="text" name="begin_date" id="lblbegin_date" value="<%= projectreportBean.getBegin_date() == null ? "" : DateTime.getFormatString(projectreportBean.getBegin_date(), "yyyy-MM-dd")  %>"  class="text"  size="10" />	
	<a href="/program/common/DateSelectorIframe.jsp"  onclick="onClick_btnDate(this, 'frm_projectreport.begin_date');return false" title="새 창에서 검색 시작 날짜를 선택합니다." onkeypress="" class="button">달력</a>
	~
	<input type="text" name="end_date" id="lblend_date" value="<%= projectreportBean.getEnd_date() == null ? "" : DateTime.getFormatString(projectreportBean.getEnd_date(), "yyyy-MM-dd")  %>"  class="text"  size="10" />	
	<a href="/program/common/DateSelectorIframe.jsp"  onclick="onClick_btnDate(this, 'frm_projectreport.end_date');return false" title="새 창에서 검색 시작 날짜를 선택합니다." onkeypress="" class="button">달력</a>
	<a href="#" class="button" onclick='setPjTerm(-1);return false;' >1일전</a>
	<a href="#" class="button" onclick='setPjTerm(-2);return false;' >2일전</a>
	<a href="#" class="button" onclick='setPjTerm(-3);return false;' >3일전</a>
	<a href="#" class="button" onclick='setPjTerm(-7);return false;' >일주일전</a>
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
	<th scope="row" class="item"><label class="head" for="lblcontent">내용 <span class="required" title="필수입력">*</span></label></th>
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
			//이미지삽입 - 업로드 완료페이지에서 호출됨.
			function insertIMG(shtml){
			  oEditors.getById["content"].exec("PASTE_HTML", [shtml]);
			}
	</script>

	
	</td>
</tr>
<tr>
	<th scope="row" class="item"><label class="head" for="">관련파일<!--<span class="required" title="필수입력">*</span>--></label></th>
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
<a href="#" onclick="doclick_deleteAttachement('<%= attachementBean.getAtt_id() %>', '<%= attachementBean.getAtt_no() %>')" title="삭제"><img src="/program/img/board/b_x.gif"/></a>
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
	<th scope="row" ><label class="head" for="lblname">이름<span class="required" name="Required">*</span></label></th>
	<td>
	<input type="text" name="name" id="lblname" value="<%//= data.getName() %>" class="text w100"/>
	</td>
</tr>
<tr>
	<th scope="row" ><label class="head" for="lbltitle">타이틀 <span class="required" title="Required">*</span></label></th>
	<td>
	<input type="text" name="title" id="lbltitle" value="<%//=  data.getTitle() %>" class="text w100"/>
	</td>
</tr>
<tr>
	<th scope="row" ><label class="head" for="lblcontent">내용<span class="required" content="Required">*</span></label></th>
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
<input type="submit" value="저장" class="button" />
<% if ( paramUtil.getInt("pjrp_sno", -1) != -1 ) { %>
<a href="?" onclick="doclick_delete(); return false;" onkeypress="" class="button">삭제</a>
<% } %>
<a href="report_staff_lst.jsp?<%= paramUtil.toParamString(new String[]{"pjrp_sno"}, false) %>" class="button">목록</a>
</div>
</div>

</form>
</div>








<%@include file="/program/rhksflwk/design_foot.jsp" %>