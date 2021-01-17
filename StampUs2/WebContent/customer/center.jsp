<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다!고객센터</title>
<style>

td {font-size:40pt;
	font-family:"HMKMRHD", sans-serif;
	font-weight:bold;
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
<jsp:include page="../left_nav.jsp" />
<div align="center">
 <table width=80% height="800" align="center">
 <tr align="center"><td>고객센터</td></tr>
 <tr align="center">
 <td><a href="../notice/notice_list.jsp"><img src="img/notice.PNG" width="30" height="300"></a></td>
 <td><a href="../rev/rev_list.jsp"><img src="img/partners.PNG" width="30" height="300"></a></td>
 <td><a href="../fnq/fnq_list.jsp"><img src="img/faq.PNG"  width="30" height="300"></a></td>
 </tr>
 <tr>
 <td align="center" width="333"><a href="../notice/notice_list.jsp">공지사항</a></td>
 <td align="center" width="333"><a href="../rev/rev_list.jsp">협력업체</a></td>
 <td align="center" width="333"><a href="../fnq/fnq_list.jsp">FAQ</a></td>
 </tr>
</table>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>