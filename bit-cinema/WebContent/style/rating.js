/**
 * 
 */
window.onload = function() {
	
	
	var chkUser = $('input[name=memberId]').val();
	
	
	/*
	var chkListRating = $('input[name=listRatingMemberId]').val();

	console.log("chkUser = ", chkUser);
	
	console.log("chkListRating = ", chkListRating);
	
	if (chkUser != chkListRating) {
		
		$('#edit').hide();
		
	}
	else {
		
		$('#edit').show();
		
	}

	*/
	
	$('#wBtn').on('click', function() {
		
		var f = document.writeForm;
		
		var content = $('textarea[name=content]');
		
		
		
			if(chkUser == "") {
				
				alert("로그인이 필요합니다");
				//f.action='writeForm'
				return false;
				
			}
	
			
		if((chkUser != null) && (content.val() == "")) {
			//if(pass2.value == "") {
				alert("내용을 입력하세요");
				//pass2[0].focus();
				content.focus();
				
				return false;
			}
		
		//form action 변경
		//f.action='rating.jsp';
		
		//모든 체크가 올바르면, form 을 submit
		f.submit();
		
	});

	
	$('input[name=spoiler]').on('click', function () {
		
		
		if(this.checked) {
			
			  $("label[for=" + this.name + "]").html("스포일러 - 스포 존재");
			
		}
		else {
		
			$("label[for=" + this.name + "]").html("스포일러");
	
		}
		
		
	});
	
	
	
	
	$('textarea[name=content]').on('keyup', function() {
	    
		
	    if (this.length == 0) {
	       ('#totalChars').html(0);
	        return;
	    }

	   var totalChars = this.value.length;
	    //$('#totalChars').val(); 
	    
	    $('#totalChars').html(totalChars);
	   
	});


};