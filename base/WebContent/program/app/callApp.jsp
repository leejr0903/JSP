<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta name="viewport" content="width=device-width" />
<title>Insert title here</title>
</head>
<body>
  
<script type="text/javascript">
var uagent = navigator.userAgent.toLowerCase();

var andorid = uagent.search("android");
var iphone = uagent.search("iphone");

// 안드로이드
if(andorid > -1){
	document.write("<h2><a id='applink1' href='http://app.iacts.co.kr/gjupload.jsp?sid=sid_val&boardId=boardId_val' >open facebook with fallback to androidmarket</a></h2>");

// 아이폰
}else if(iphone > -1){
	document.write("<h2><a id='applink1' href='gjupload://' >open facebook with fallback to appstore</a></h2>");
}
</script>

<script type="text/javascript">  
// To avoid the "protocol not supported" alert, fail must open another app. 
var appstorefail = "itms://itunes.apple.com/us/app/facebook/id284882215?mt=8&uo=6"; 
 
function applink(fail){ 
    return function(){ 
        var clickedAt = +new Date; 
        // During tests on 3g/3gs this timeout fires immediately if less than 500ms. 
        setTimeout(function(){ 
            // To avoid failing on return to MobileSafari, ensure freshness! 
            if (+new Date - clickedAt < 2000){ 
                window.location = fail; 
            } 
        }, 500);     
    }; 
} 

document.getElementById("applink1").onclick = applink(appstorefail); 
 
</script> 
</body>
</html>