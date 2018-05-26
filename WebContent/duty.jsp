<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/duty.css" />
		<script src="js/jquery-1.7.2.min.js"></script>
		<script src="js/duty.js"></script>
</head>
<body>
	<audio id="myMusic" loop src="audio/mp3.mp3" type="audio/mpeg"></audio>
		<section>
			<span style="color: red;">请先为宿舍成员编号</span>
			<label>
				起始值：<input type="number" id="begin" value="1" min="2" max="6" />
			</label>
			<label>
				结束值：<input type="number" id="end" value="6" min="1" max="6" />
			</label>
			
			<div class="showNum" id="showNum">Ready</div><br />
			
			<footer>
				<button id="resetBtn" class="reset">复 位</button>
				<button id="beginBtn" class="begin">开 始</button>
			</footer>
		</section>
</body>
</html>