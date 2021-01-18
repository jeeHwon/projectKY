<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
ul.mylist li:before,
ol.mylist li:before {
    vertical-align: middle;
    padding: 2px 5px 6px 0px;
}
ul.mylist{border:5px solid #BBBBBB;
   background-color: #DD0000;
   
}
.at{color:#FFFFFF;
   font-weight:bold;
   hover:#FFFFFF;
   }

</style>    
    
<div style="position: fixed; left: 130px; top: 100px">
<ul class="mylist">
		<hr>
		<li>
		<input type="button" value="   <<   " onclick="history.back(-1);">
		<input type="button" value="   >>   " onclick="history.forward(+1);">
		</li>
		<hr>
        <li><a href="../index.jsp" class="at">홈페이지</a></li>
        <hr>
        <li><a href="../room/room_list.jsp" class="at">인증방참여하기</a></li>
        <hr>
        <li><a href="#" class="at">결제</a></li>
        <hr>
        <li><a href="../event/event_list.jsp" class="at">이벤트</a></li>
        <hr>
        <li><a href="../customer/center.jsp" class="at">고객센터</a></li>
        <hr>
        <li><a href="#" onclick="window.open('https://open.kakao.com/o/sSgNRIQc', '카카오톡'); return false" color:#FFFFFF;>카카오톡 문의</a>
        <li width="30"><img src="../customer/img/qr.png"></li>
        </li>
        
    </ul>
 		
 </div>