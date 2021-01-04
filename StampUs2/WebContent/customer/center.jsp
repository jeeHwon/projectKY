<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp" />
<h1 align="center"><고객센터></a></h1>
 <table width=80% align="center">
 <tr>
 <td  width="333"><a href="../notice/notice_list.jsp"><img src="img/notice.png" width="200"></a></td>
 <td  width="333"><a href="../rev/rev_list.jsp"><img src="img/partners.png" width="200"></a></td>
 <td  width="333"><a href="../fnq/fnq_list.jsp"><img src="img/faq.png" width="200"></a></td>
 </tr>
 <tr>
 <td align="center" width="333"><a href="../notice/notice_list.jsp"><h1>공지사항</h1></a></td>
 <td align="center" width="333"><a href="../rev/rev_list.jsp"><h1>협력업체</h1></a></td>
 <td align="center" width="333"><a href="../fnq/fnq_list.jsp"><h1>FAQ</h1></a></td>
 </tr>
</table>
<jsp:include page="../footer.jsp" />
</body>
</html>