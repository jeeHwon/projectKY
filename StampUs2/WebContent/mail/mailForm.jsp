<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />

<section id="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
	<div class="container">
		<div class="row">
			<div class="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
			    <div>
        <form action="sendMail.jsp" method="post">
            <table>
                <tr><th colspan="2">JSP 메일 보내기</th></tr>
                <tr><td>from    --고객--</td><td><input type="hidden" name="from" value="jsyoo010@naver.com" readonly="true"></td></tr>
                <tr><td>to      --관리자--</td><td><input type="hidden" name="to" value="ahy0119@naver.com" readonly="true"></td></tr>
                <tr><td>subject</td><td><input type="text" name="subject" /></td></tr>
                <tr><td>content</td><td><textarea name="content" style="width:170px; height:200px;"></textarea></td></tr>
                <tr><td colspan="2" style="text-align:right;"><input type="submit" value="Transmission"/></td></tr>
            </table>
        </form>
    </div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/footer.jsp" />