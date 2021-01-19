<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.MemberDAO"%>
<%@ page import="dto.MemberDTO"%>
<%
	// 로그인 안했을 시 로그인 페이지로 강제 이동
	if(session.getAttribute("userid")==null){
		response.sendRedirect("../login/log.jsp");
	} else{
		// 사용자 정보 DB에서 불러오기
		String userid = session.getAttribute("userid").toString(); 
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.userInfo(userid);
		pageContext.setAttribute("mdto", mdto);
		
	}
	
%>
<jsp:include page="../header.jsp" />
<style>
	#pay_title .pay_title{padding: 20px 0 10px 0; position: relative;}
	#pay_title h2 {font-size: 30px; font-weight: 500; margin-bottom: 10px;}
	
	#pay_my{position: relative; background: #DE6A5A; border: 0px solid black; }
	#pay_my .pay_my_box {overflow: hidden;}
	#pay_my .pay_my_box > div {float: left; width: 33.333%; margin: 0 0 0 0; box-sizing: border-box; background: #CB230C; border: 0px solid black; height: 150px; padding: 30px;}
	#pay_my .pay_my_box > div h3 {color: #fff; font-weight: 500; font-size: 22px; margin-bottom: 10px;}
	#pay_my .pay_my_box > div .my_left { border: 0px solid blue;}
	#pay_my .pay_my_box > div .my_middle { border: 0px solid blue; height: 0px;}
	#pay_my .pay_my_box > div .my_right {float: right; border: 0px solid blue;}
	#pay_my .pay_my_box > div#my_1 p a {color: #fff; font-size: 18px;}
	#pay_my .pay_my_box > div#my_1 p a:hover {color: #0C41CB; }
	#pay_my .pay_my_box > div#my_2 {background: #DE6A5A;}
	#pay_my .pay_my_box > div#my_2 .bar{position: absolute;}
	#pay_my .pay_my_box > div#my_2 .bar:after{content: ''; position: absolute; right: -380px; top: -45px; width: 1px; height: 100px; background: #ddd;}
	#pay_my .pay_my_box > div#my_2 .my_right {font-size: 20px; color: #fff;}
	#pay_my .pay_my_box > div#my_2 .my_right #my_2_middle {height: 10px;}
	#pay_my .pay_my_box > div#my_2 .my_right span {font-size: 50px; color: #0C41CB;}
	#pay_my .pay_my_box > div#my_3 {background: #DE6A5A;}
	#pay_my .pay_my_box > div#my_3 .my_right {font-size: 20px; color: #fff;}
	#pay_my .pay_my_box > div#my_3 .my_right span {font-size: 50px; color: #0C41CB;}
	
	#pay_charge .pay_charge {padding: 20px 0; height: 400px; border: 0px solid green;}
	#pay_charge .pay_charge h2 {font-size: 30px; font-weight: 500; margin-bottom: 20px; }
	#pay_charge .pay_charge > div {}
	#pay_charge .pay_charge > div h3 {font-size: 22px; width: 280px; font-weight: 500; margin-bottom: 5px; border-bottom: 1px solid #4f4f4f; border-top: 1px solid #4f4f4f; color: #222; padding:10px 0 10px 10px;}
	#pay_charge .pay_charge .chz1{float: left; width: 280px; padding: 15px 10px 0 15px; border: 0px solid red;}
	#pay_charge .pay_charge .chz2{float: left; width: 280px; padding: 15px 10px 0 15px; border: 0px solid red;}
	#pay_charge .pay_charge .chz3{float: left; width: 280px; padding: 15px 10px 0 15px; border: 0px solid red;}
	#pay_charge .pay_charge .chz4{float: left; width: 280px; padding: 15px 10px 0 15px; border: 0px solid red;}
	#pay_charge .pay_charge > div > ul > li {width:280px; height:30px; color: #666; border-bottom:1px solid #ececec; text-align:left; padding:5px 0 5px 10px; font-size: 18px;}
	#pay_charge .pay_charge > div > ul > li.active {background: #555;} 
	#pay_charge .pay_charge > div > ul > li.active a {color: #fff;} 
	
	#pay_check {background: #f8f8f8; margin-top: 20px;}
	#pay_check .pay_check {position: relative; padding: 20px 0 20px 0; height: 400px; border: 0px solid green;}
	#pay_check .pay_check h3 {font-size: 30px; font-weight: 500; margin-bottom: 10px; }
	#pay_check .pay_check .check_form {float: left ;padding: 10px; width: 70%; border: 0px solid yellow;}
	#pay_check .pay_check .check_form strong {font-size: 20px; width: 150px; display: inline-block; font-weight: 500; margin-bottom: 10px;}
	#pay_check .pay_check .check_form span {font-size: 16px; color: #222;} 
	#pay_check .pay_check .check_form span a {color: #CB230C;} 
	#pay_check .pay_check .check_form span.detail {font-size: 14px; border-bottom:1px solid #222;} 
	
	#pay_check .pay_check .pay_confirm {float: left; width: 28%; border: 0px solid pink;}
	#pay_check .pay_check .pay_confirm .total_bill {padding: 10px; background: #DE6A5A; color: #fff; margin-bottom: 30px;}
	#pay_check .pay_check .pay_confirm .total_bill .won_icon{font-size: 50px;}
	#pay_check .pay_check .pay_confirm .total_bill p {text-align: right; font-size: 18px;}
	#pay_check .pay_check .pay_confirm .total_bill p strong {font-size: 30px;}
	#pay_check .pay_check .pay_confirm .total_charge {height: 60px; background: #CB230C; text-align: center; padding: 10px 0 ; box-sizing: border-box;}
	#pay_check .pay_check .pay_confirm .total_charge strong a{font-size: 28px;  color: #fff;}

</style>

	<section id="pay_title">
        <div class="container">
            <div class="row">
               <div class="pay_title">
                  <h2>결제</h2>
               </div>
            </div>            
        </div>
    </section>    
    <!--//pay_title  -->
    
    <section id="pay_my">
        <div class="container">
            <div class="row">
               <div class="pay_my_box">
                    <div class="my" id="my_1">
                        <div class="my_left"><h3>${mdto.name}님</h3></div>
                        <p><a href="#" style="cursor: pointer">-&nbsp;마이페이지이동</a></p>
                    </div>                    
                    <div class="my" id="my_2">
                        <div class="my_left" ><h3>스탬프캐시 잔액</h3></div>
                        <div class="my_middle" id="my_2_middle"><strong class="bar"></strong></div>
                        <div class="my_right"><span>${mdto.money}</span>&nbsp;&nbsp;원</div>
                    </div>                    
                    <div class="my" id="my_3">
                        <div class="my_left"><h3>포인트</h3></div>
                        <div class="my_middle"><strong class="bar"></strong></div>
                        <div class="my_right"><span>500</span>&nbsp;&nbsp;p</div>
                    </div>
               </div>
            </div>            
        </div>
    </section>
    <!-- //pay_my -->
    
    <section id="pay_charge">
        <div class="container">
            <div class="row">
                <div class="pay_charge">
                   <h2>충전수단 선택</h2>
                   <div class="chz1">
                        <h3>상품권</h3>
                        <ul>
                            <li><a href="#">상품권</a></li>
                            <li><a href="#">모바일상품권</a></li>
                            <li><a href="#">기프티콘</a></li>
                        </ul>
                   </div>
                   <div class="chz2">
                        <h3>온라인</h3>
                        <ul>
                            <li class="active"><a href="#">신용카드</a></li>
                            <li><a href="#">가상계좌</a></li>
                            <li><a href="#">계좌이체</a></li>
                            <li><a href="#">카카오페이</a></li>
                            <li><a href="#">Toss토스()</a></li>
                            <li><a href="#">해피캐쉬간편결제</a></li>
                        </ul>
                   </div>
                   <div class="chz3">
                        <h3>모바일</h3>
                        <ul>
                            <li><a href="#">플라스틱카드티머니</a></li>
                            <li><a href="#">모바일티머니</a></li>
                            <li><a href="#">모바일캐시비</a></li>
                            <li><a href="#">휴대폰소액결제</a></li>
                            <li><a href="#">휴대폰자동충전</a></li>
                        </ul>
                   </div>
                   <div class="chz4">
                        <h3>기타</h3>
                        <ul>
                            <li><a href="#">해머</a></li>
                            <li><a href="#">OK캐쉬백</a></li>
                            <li><a href="#">팝카드</a></li>
                            <li><a href="#">편의점충전</a></li>
                        </ul>
                   </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //pay_charge -->
    
    <section id="pay_check">
        <div class="container">
            <div class="row">
                <div class="pay_check">
                    <h3>충전</h3>
                    <div class="check_form">
                        <strong>충전금액</strong>
                        <span>
                            <input type="number" value="0" size="10" id="money_input">원&nbsp;&nbsp;&nbsp;
                            <input type="button" value="1천" onclick="plusBtn(1000)" style="width:40px">&nbsp;
                            <input type="button" value="5천" onclick="plusBtn(5000)" style="width:40px">&nbsp;
                            <input type="button" value="1만" onclick="plusBtn(10000)" style="width:40px">&nbsp;
                            <input type="button" value="5만" onclick="plusBtn(50000)" style="width:40px">&nbsp;
                            <input type="button" value="정정" onclick="refresh()" style="width:40px">&nbsp;
                        </span><br/>
                        <strong>쿠폰</strong><span>사용가능한 <a href="#">쿠폰</a>이 없습니다</span><br/>
                        <strong>추가인증</strong><span>휴대폰 <a href="#">추가인증</a> 후 충전이 가능합니다</span><br/>
                        <strong>총 충전금액</strong><span id="chong_charge"></span>원<br/><br/>
                        <strong>환불</strong><span class="detail">실결제수단(가상계좌, 계좌이체, 카카오페이, 카드, 모바일티머니)로 충전한 경우 10일 이내에 환불 가능합니다</span><br/>
                        <strong>사용</strong><span class="detail">해피캐시로 해피머니상품권을 제외한 모든 상품권을 구매(상품 별 월 한도 제한)할 수 있습니다.</span><br/>
                        <strong>주의</strong><span class="detail">쿠폰 중복 사용 불가</span><br/>
                    </div>
                    <div class="pay_confirm">
                       <div class="total_bill">
                           <div class="won_icon">&#8361; </div>
                           <p>결제금액</p>
                           <p><strong id="total_bill"></strong>원</p>
                       </div>
                       <div class="total_charge">
                           <strong><a href="#" onclick="charge()">충전하기</a></strong>
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //pay_check -->
    
<script src="../assets/js/jquery.min_1.12.4.js"></script>
<script src="../assets/js/modernizr-custom.js"></script><!-- =>html5 css3 감지 -->
<script src="../assets/js/ie-checker.js"></script><!-- =>익스플로러 ver 체크 -->   
<script>	
	//결제 충전선택시 css 변경
	var chargeType = $(".pay_charge > div > ul > li")
	chargeType.click(function(e){
	    e.preventDefault()
	    var target = $(this)
	    chargeType.removeClass("active")
	    target.addClass("active")
	})

	// 버튼 클릭 시 금액 더해주는 함수
	function plusBtn(plus_money){
		var current_money = document.getElementById("money_input").value
		current_money = parseInt(current_money) + parseInt(plus_money)
		document.getElementById("money_input").value = current_money
		document.getElementById("chong_charge").innerHTML = current_money
		document.getElementById("total_bill").innerHTML = current_money
		
	}
	
	// 정정 버튼 클릭 시 페이지 새로고침
	function refresh(){
		location.reload(true);
	}
	
	// 충전하기 버튼 클릭 시 아이디와 금액 가지고 pay_charge_ok.jsp로 이동
	function charge(){
		var userid = '<c:out value="${mdto.userid}"/>'
		var total_bill = document.getElementById("total_bill").innerText
        var form = document.createElement('form');
        form.setAttribute('method', 'post'); 
        form.setAttribute('action', 'pay_charge_ok.jsp');
      
        document.charset = "utf-8";
        params = {'userid':userid, 'total_bill':total_bill}
        for ( var key in params) {
            var hiddenField = document.createElement('input');
            hiddenField.setAttribute('type', 'hidden'); 
            hiddenField.setAttribute('name', key);
            hiddenField.setAttribute('value', params[key]);
            form.appendChild(hiddenField);
        }
        document.body.appendChild(form);
        form.submit();
		
	}
</script>

<jsp:include page="../footer.jsp" />

















