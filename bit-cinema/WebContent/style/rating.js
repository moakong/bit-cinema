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

	
	
	/* 수정 & 삭제 */
	
	
	$('button[name=dBtn]').on('click', function() {
		var param = $(this).data("param");
		console.log("$(this).data('param') = " + $(this).data("param"))
		location.href	=	"deleteRating?"+ param;
//		f.submit();
		
	});


	
	$('button[name=uBtn]').on('click', function() {
		
		var content = $('textarea[name=updateContent]');
		//this.parent().after(content);
		content.focus();
		
		
		var param = $(this).data("param");
		console.log("$(this).data('param') = " + $(this).data("param"))
		location.href	=	"Rating?"+ param;
		
	});
	
	$('button[name=updateBtn]').on('click', function() {
		var f = document.updateForm;
		
		
		f.submit();
			
		});
	};