$(document).ready(function(e) {

	$('.sub_mn').hide();
	
   $('.nav>li').hover(
      function(){ //마우스를 올렸을 때
         $(this).find('.sub_mn').css({display:'block'}); //서브메뉴를 찾아서 보이게
         $(this).find('a:first').addClass('on'); //on메소드 작동
		 $(this).find('a').css({color:'#000'});
      },
      function(){ //마우스를 뗐을 때
         $(this).find('.sub_mn').css({display:'none'}); //서브메뉴 찾아서 안보이게
         $(this).find('a:first').removeClass('on'); //on메소드 해제
		 $(this).find('a').css({color:'#ccc'});
      }
   );
	
});