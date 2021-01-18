<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</div>
		</div>
    </div>   
</section>    

	

<script src="../assets/js/modernizr-custom.js"></script><!-- =>html5 css3 감지 -->
<script src="../assets/js/ie-checker.js"></script><!-- =>익스플로러 ver 체크 -->   
<script>
    //인증요일 비활성화
   	var day_li = $(".day > ul > li.day")

	$(document).ready(function() { 
		var check_day = '<c:out value="${check_day}"/>'
		day_li.addClass('deactive')
		dayList = ['mon','tue','wed','thu','fri','sat','sun']
		for(var i=0; i<dayList.length; i++) {
			if(check_day.includes(dayList[i])){
				$('#'+dayList[i]).removeClass('deactive')
			}
		}
	})
	
	//인증타입 비활성화
   	var type_li = $(".type > ul > li.type")

	$(document).ready(function() { 
		var certi_type = '<c:out value="${certi_type}"/>'
		type_li.addClass('deactive')
		typeList = ['pic','txt','mov','tim','spa']
		for(var i=0; i<typeList.length; i++) {
			if(certi_type.includes(typeList[i])){
				$('#'+typeList[i]).removeClass('deactive')
			}
		}
	})

    
    
</script>
<jsp:include page="../footer.jsp" />