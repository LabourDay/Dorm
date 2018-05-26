<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
</head>
<body>
	<div class="banner-box">
	<div class="bd">
        <ul>          	    
            <li >
                <div class="m-width">
                <a href="javascript:void(0);"><img src="img/gate.jpg"/></a>
                </div>
            </li>
            <li >
                <div class="m-width">
                <a href="javascript:void(0);"><img src="img/sport.jpg" /></a>
                </div>
            </li>
            <li >
                <div class="m-width">
                <a href="javascript:void(0);"><img src="img/lib.jpg" /></a>
                </div>
            </li>
            <li >
                <div class="m-width">
                <a href="javascript:void(0);"><img src="img/corner.jpg"  /></a>
                </div>
            </li>
             <li >
                <div class="m-width">
                <a href="javascript:void(0);"><img src="img/gc.jpg" /></a>
                </div>
            </li>
             <li >
                <div class="m-width">
                <a href="javascript:void(0);"><img src="img/apartment.jpg" /></a>
                </div>
            </li>  
         
        </ul>
    </div>
    <div class="banner-btn">
        <a class="prev" href="javascript:void(0);"></a>
        <a class="next" href="javascript:void(0);"></a>
        <div class="hd"><ul></ul></div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function(){

	$(".prev,.next").hover(function(){
		$(this).stop(true,false).fadeTo("show",0.9);
	},function(){
		$(this).stop(true,false).fadeTo("show",0.4);
	});
	
	$(".banner-box").slide({
		titCell:".hd ul",
		mainCell:".bd ul",
		effect:"fold",
		interTime:3500,
		delayTime:500,
		autoPlay:true,
		autoPage:true, 
		trigger:"click" 
	});

});
</script>
</body>
</html>