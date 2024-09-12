<%@ page contentType="text/html; charset=utf-8" %>
<%
	String memberId = request.getParameter("memberId");
	session.setAttribute("MEMBER", memberId);
%>
<html>
<head>
	<title>로그인</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 기본적으로 script파일 임포트 소스가 HTML태그보다 앞서 위치해 있다면, 엘리먼트를 찾지못해 이벤트 등록이 안된다.
	     그것을 방지하기 위해 쓰는 방법. 
	     1. defer속성을 넣는다. 
	     2. <body>맨 아래에 위치시킨다.(일반적으로 많이 사용)
	     3. DOMContentLoaded를 사용.
	-->
	<script src="./js/focusEvent.js" defer></script>
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
    <a href="#none" class="focusEventDuplicate">a태그에 focus이벤트 중복해서 넣을겁니다.</a>

<script>
	$(document).ready(function() {
		<%--제이쿼리
			1. 여러개 이벤트 등록.
			2. event변수값을 이용하여 type과 key값을 이용하여 분기하는 방법 (S)
		--%>
		alert('document ready!!!')
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
		<%-- (E)--%>
		
		$('.focusEventDuplicate').on('focus', (event) => {
			console.log('포커스 이벤트 등록 순서1');
		});
		

	});
</script>
</body>
</html>
