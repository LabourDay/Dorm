$(document).ready(function(){
	$(document.body).on('click', '#resetBtn', function(){
		if(confirm("亲：您确定要复位吗？")){
			window.location.reload();
		}
	});
	
	var arr = [], mydsq = null;		
	
	function RunNumFn(){
		clearInterval(mydsq);
		var i = 0;
		mydsq = window.setInterval(function(){	
			i++;
			if(i >= arr.length){
				i = 0;
			}
			$('#showNum').html(arr[i]);
		}, 8);
	};
	
	$(document.body).on('click', '#beginBtn', function(){
		var begin = Number($('#begin').val()),
			end = Number($('#end').val());
		if(begin < 0){
			alert("亲：起始值 不能小于 0 哦！");
			return false;
		}else if(begin > end){
			alert("亲：起始值 不能大于 结束值哦！");
			return false;
		}
		else if(end > 6){
			alert("亲：结束值 不能大于 6 哦！");
			return false;
		}
		else{
			if($(this).text() == '开 始'){
				document.getElementById("myMusic").play();
				for(var i = begin; i <= end; i++){
					arr.push(i);
				}
				for(var i = begin; i <= end; i++){
					arr.push(i);
				}
				arr = arr.sort(function(){
					return Math.random() - 0.5;
				})
				arr = arr.sort(function(){
					return Math.random() - 0.1;
				})
				RunNumFn();
				$(this).text('暂 停').css('background', '#ff0076');
			}else{
				document.getElementById("myMusic").pause();
				clearInterval(mydsq);
				arr = [];
				begin = 0;
				$(this).text('开 始').css('background', 'green');
			}
		}
	});
});