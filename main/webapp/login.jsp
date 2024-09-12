<%@ page contentType="text/html; charset=utf-8" %>
<%
	String memberId = request.getParameter("memberId");
	session.setAttribute("MEMBER", memberId);
%>
<html>
<head>
	<title>로그인</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
로그인 처리
<br><hr>
==========================================아래는 제이쿼리 이벤트 연습입니다.
<div class="sm_top">
        <div class="child_div">자식 DIV 1</div>
        <input type="text" class="input_field" id="on" placeholder="입력 1">

        <div class="child_div">자식 DIV 2</div>
        <input type="text" class="input_field" id="second" placeholder="입력 2">

        <div class="child_div">자식 DIV 3</div>
        <input type="text" class="input_field" id="thirty" placeholder="입력 3">

        <div class="child_div">자식 DIV 4</div>
        <input type="text" class="input_field" id="forty" placeholder="입력 4">

        <div class="child_div">자식 DIV 5</div>
        <input type="text" class="input_field" id="fifty" placeholder="입력 5">
    </div>

<script>
	$(document).ready(function() {
		
		$('.sm_top').each(function() {
			var selector = $(this).find('.input_field');
			selector.on('focus keydown', function() {
				//alert($(this).attr('placeholder') + '에 포커스되었습니다.');
				if ($(this).attr('id') !== 'forty') {
					if (event.type === 'focus') {						
		            	console.log($(this).attr('placeholder') + '에 포커스되었습니다.')
					}
				} else if ($(this).attr('id') === 'forty') {
					if (event.type === 'keydown' && event.key === 'Enter') {
						console.log($(this).attr('placeholder') + '에 포커스되었습니다.')
					}
				}
			});
		});

	});
</script>
</body>
</html>
