<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="js/jquery.min.js"></script>
		<style>
html,body {
	width:100%;
	height:100%;
	position:relative;
}
* {
	padding:0;
	margin:0;
	list-style:none;
}
li img {
	width:200px;
	height:160px;
	margin-left:10px;
}
.wrap li {
	width:200px;
	height:158px;
	margin-left:10px;
	margin-top:10px;
	float:left;
}
.wrap {
	width:1000px;
	height:340px;
	padding-top:50px;
	padding-left:50px;
}
.mask {
	width:100%;
	height:100%;
	background:rgba(0,0,0,0.6);
	position:fixed;
	top:0;
}
.mask img {
	width:600px;
	height:480px;
	position:absolute;
	top:0;
	left:0;
	right:0;
	bottom:0;
	margin:auto;
}
.btnl {
	font-size:100px;
	width:40px;
	height:70px;
	left:10px;
	top:0;
	bottom:0;
	margin:auto;
	position:absolute;
}
.btnr {
	font-size:100px;
	width:40px;
	height:70px;
	right:10px;
	top:0;
	bottom:0;
	margin:auto;
	position:absolute;
}
.close {
	width:30px;
	height:30px;
	position:absolute;
	top:10px;
	right:20px;
	font-size:50px;
}
</style>
	</head>
	<body>
		<ul class="wrap">
  <li> <img src="img/sheep1.jpg" alt="" /> </li>
  <li> <img src="img/sheep2.png" alt="" /> </li>
  <li> <img src="img/sheep3.jpg" alt="" /> </li>
  <li> <img src="img/sheep4.jpg" alt="" /> </li>
  <li> <img src="img/sheep5.jpg" alt="" /> </li>
  <li> <img src="img/sheep6.jpg" alt="" /> </li>
  <li> <img src="img/sheep7.jpg" alt="" /> </li>
  <li> <img src="img/sheep8.jpg" alt="" /> </li>
</ul>

<div class="mask">
  <div class="btnl"> < </div>
  <div class="btnr"> > </div>
  <div class="close"> × </div>
  <img src="img/1.jpg" alt="" /> 
</div><script>
$(function(){
		var warp=$('.wrap'),
		//父子选择器
		lis=$('.wrap >li'),
		index=0,
		mask=$('.mask'),
		close=$(".close"),
		btnl=$(".btnl"),
		btnr=$(".btnr"),
		imgs=$("img",warp)
		
		/*console.log(lis)*/
        cw=
		mask.hide();
		//在被选元素及子元素上添加一个或多个事件处理程序。
        lis.on('click',function(){
        	//用于设置或返回当前jQuery对象所匹配的元素的属性值
			var imgP=$(this).find('img').prop('src');
			mask.show();
			mask.find('img').prop('src',imgP);
			index=$(this).index();
		
		})
        close.on('click',function(){
			mask.hide();
		})
		btnr.on('click',function(){
			index++;
			if(index==lis.length){
				index=0;
			}
			//选择器选取带有指定 index 值的元素
			var imgP=lis.eq(index).find('img').prop('src');
			$('img',mask).fadeOut(900).prop('src',imgP).fadeIn(900);
		})
		
		btnl.on('click',function(){
			index--;
			if(index<0){
				index=lis.length-1;
			}
			var imgP=lis.eq(index).find('img').prop('src');
			$('img',mask).fadeOut(900).prop('src',imgP).fadeIn(900);
		})
	/*imgs.on('click',function(e){
		var posX=e.pageX;
		if(posX>cw/2){
			btnr.triggerHandler('click')
		}else{
			btnl.triggerHandler('click')
		}
	})*/
	
	$(document).on('dbclick',mask,function(){
		/*var obj=e.target;
		$(!$(obj).is('img')&&!$(obj).is('btnl')&&!$(obj).is('btnr')&&!$(obj).is('obj'))*/
		mask.hide()
	})
})</script>
	</body>
</html>
