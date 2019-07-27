//Product
	function productDetail(pnum) {
		document.detail.pnum.value=pnum;
		document.detail.submit();
	}
	
	function gostory(snum) {
		document.gostory.snum.value=snum;
		document.gostory.submit();
	}
//Cart
	function cartUpdate(form){
		form.flag.value="update"
		form.submit();
	}
	
	function cartDelete(form) {
		form.flag.value="del";
		form.submit();
	}