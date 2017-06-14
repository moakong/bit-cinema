/**
 * 
 */



//평점 체크



//스포일러 유무 체크
function chkBox() {
	var spoChk1 = document.querySelector('#spoiler');
	//var spoChk2 = document.querySelector('#updateSpoiler');
	
	//console.log(spoChk.checked);
	
	
	if(spoChk1.checked) {
		
		
		spoChk1.value = 1;
		
		
		console.log("chk spoChk1 = " + spoChk1.value);
		
	}
	
	
	
	if (!spoChk1.checked) {
		
		
		spoChk1.value = 0;
		
		
		console.log("unchk spoChk1 = " + spoChk1.value);
		
		
	}
	
	
	/*
	if(spoChk2.checked) {
		
		spoChk2.value = 1;
		
		
		console.log("chk spoChk2 = " + spoChk2.value);
	}
	
	
	
	if (spoChk2.checked == false) {
		
		
		
		spoChk2.value = 0;
		
		console.log("unchk spoChk2 = " + spoChk2.value);
		
	}
	*/
	
}






