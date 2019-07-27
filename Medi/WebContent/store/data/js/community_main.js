$(document).ready(function(e) {
	
	var visual = $('.event_img>li'); //변수선언: 메인이미지의 li들
	var button = $('.ev_btn>li'); //변수선언: 버튼 li들
	var current = 0; //현재값은 0
	var setIntervalld; //자동실행문
	
	button.on({ //버튼 실행문
		click:function(){ //버튼을 클릭했을 때 함수
			
		var tg = $(this); //변수 tg는 지금 클릭한 것
		var i = tg.index(); //변수 i는 tg의 인덱스값
			
		button.removeClass('on'); 
		tg.addClass('on'); 
		move(i); // i를 움직여라
		
		}
		});
	
	$('.event_img').on({
		mouseover:function(){ //마우스를 올렸을 때
			clearInterval(setIntervalld); //자동실행문 해제
			},
		mouseout:function(){ //마우스를 뗐을 때
			timer(); //타이머 실행
			}
		});
	
	timer();
	function timer(){
		setIntervalld=setInterval(function(){ //자동실행문
						
			var n = current+1; 
			
			if(n == visual.size()){n=0;} 
                        

			button.eq(n).trigger('click');//버튼n을 클릭
			},3000); //3초마다
		};
		
	function move(i){ //움직이는 함수
		if(current==i)return;
		
		var currentEl = visual.eq(current);
		var nextEl = visual.eq(i);
		
		currentEl.css({left:0}).stop().animate({left:'-100%'});
		nextEl.css({left:'100%'}).stop().animate({left:'0'});
		
		current = i;
		
		}
});
