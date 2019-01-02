<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/crowdWrite.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<title>EarltBird Registration</title>

<script>
	var productCount=1; // 대표상품 이미지 추가 카운트
	var productNo;		//대표상품 코드
	var goodsCount=0; // 상품 추가 갯수 카운트
	var GCnt=0;
	var optionCount=0; // 총 옵션 추가 갯수 카운트
	var title2;
	
	$(document).ready(function() {
		
	    $('#summernote').summernote({
	            height: 300,              	 // set editor height
	            minHeight: 300,             // set minimum height of editor
	            maxHeight: 300,             // set maximum height of editor
	            focus: true,                  // set focus to editable area after initializing summernote
	            callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
	    });
	    
	    // 서머노트 이미지 처리
	    function sendFile(file, el) {
			var str = file.name;
		     var filename = guid() + str;
		      console.log(filename);
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	form_data.append('filename', filename);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: 'http://sbmallstore.com/file/upload/crsalesboard',
	        	cache: false,
	        	contentType: false,
	        	enctype: 'multipart/form-data',
	        	processData: false,
	        	success: function(img_name) {
	        		
	          		$(el).summernote('editor.insertImage', img_name);
	        	}
	      	});
	    }
	    
	    // 브라우져 첫 로딩,goodsNo 부여
	    function firstGoodsNo(){
	    	var goodsNo = guid();
	    	$('.goodsNoPk').val(goodsNo);
	    	$('.goodsNoFk').val(goodsNo);
	    	
	    	productNo = getProductNo();
	    	$('.crowdProductNo').val(productNo);
	    	$('.crowdPhotoNo0').val(productNo);
	    }
	    firstGoodsNo();
	    
	   	//userSeq 가져오기
	   	function firstUserSeq(){
	   		var member = '${memberInfo.userSeq}';
	   		if(member!=''){
	   			$('.userSeq').val(member);
	   		}
	   	}
	   	firstUserSeq();
	   	
	    /* goods 상품 추가 버튼 */
	    $('.goodsBtnPlus').on('click',function addGoodsOne(){
	    		
	    		if(GCnt<4){
	    			GCnt++;
	    			goodsCount++;
	    			optionCount++;
	    			var goodsNo = guid();
	    			/* alert(goodsNo); */
	    			
					var remoteAppend = 
						'<div class="remoteList remoteMidBox'+goodsCount+'">'
						+'	<span class="remoteImgBox">'
						+'		<img class="rmtImg remoteImg'+goodsCount+'" src="<%=request.getContextPath()%>/img/noImage2.png"> <!-- 상품 이미지 -->'
						+'	</span>'
						+'	<span class="remoteNameBox">'
						+'		<h5 class="rmtTitle2">'+(Number(GCnt)+1)+'.&nbsp</h5><h5 class="rmtNm remoteName'+goodsCount+'">상품이름</h5><br>'
						+'		<h6 class="rmtPri remotePrice'+goodsCount+'">가격</h6>'
						+'	</span>'
						+'	<span class="remoteDelBox">'
						+'		<a class="remoteDel" remoteDel="remoteMidBox'+goodsCount+'" goodsDel="SuperGoodsNum'+goodsCount+'">상품삭제</a>'
						+'	</span>'
						+'</div>';
						
						
					var append2 = 
						'<div class="superGoods SuperGoodsNum'+goodsCount+'">'
						+'	<div class="goodsCommandBox">'
						+'		<div class="goodsMidBox goodsList'+goodsCount+'">	<!-- goods Div -->'
						+'			<div class="goodsListTitleBox1">'
						+'				<h3 class="goodsListTitle2">0'+(Number(GCnt)+1)+'.</h3>'
						+'				<h3 class="goodsListTitle">상품 목록</h3>'
						+'				<div class="AddedGoodsDel">'
						+'					<h6 class="AddedGoodsH6 goodsBtnMinus plusMinusbtn" goodsminusbtn="SuperGoodsNum'+goodsCount+'" remotedel="remoteMidBox'+goodsCount+'">-</h6>'
						+'				</div>'
						+'			</div>'
						+'			<br>'
							
						+'			<div class="crTextBox"><h4 class="crBoardTextH4">상품 이름</h4></div>'
						+'			<div class="crInputMiniBox">'
						+'				<input type="hidden" class="goodsNoPk" name="goodsList['+goodsCount+'].goodsNo" value="'+goodsNo+'">'
						+'				<input class="crowdInput goodsName" type="text" remoteNm = "remoteName'+goodsCount+'" name="goodsList['+goodsCount+'].goodsName" placeholder="상품의 이름을 입력해주세요">'
						+'			</div>'
						+'			<br>'
							
						+'			<div class="crTextBox"><h4 class="crBoardTextH4">상품 가격</h4></div>'
						+'			<div class="crInputMiniBox">'
						+'				<input class="crowdInput goodsPrice" type="number" remotePri = "remotePrice'+goodsCount+'" name="goodsList['+goodsCount+'].crGoodsPrice" placeholder="상품의 가격을 입력해주세요" oninput="mathABS(this)">'      
						+'			</div>'
						+'			<br>'
							
						+'			<div class="crTextBox"><h4 class="crBoardTextH4">상품 이미지</h4></div>'
						+'			<div class="crInputMiniBox">'
						+'				<input type="hidden" id="goodsPhoto'+goodsCount+'" name="goodsList['+goodsCount+'].goodsPhoto">'
						+'				<input class="crowdInput" id="firstGoodsPhoto" type="file" onchange="goodsUpload(this, \'goodsPhoto'+goodsCount+'\', \'remoteImg'+goodsCount+'\')">'
						+'			</div>'
						+'		</div>'
						+'	</div>'
						+'	<br>'
						+'	<div class="optionBigBox">'
						+'		<div class="optTitleBox">'
						+'			<h3 class="goodsTitle">옵션</h3>'
						+'			<!-- 옵션 추가 버튼 -->'
						+'			<div class="addBtnBox"><h6 class="plusBtnText optionBtnPlus plusMinusbtn" goodsNo="goodsList'+goodsCount+'" optPlusBtn="optionBoxNum'+goodsCount+'" optCount="1">+</h6></div>'
						+'		</div>'
						+'		<br>'
							
						+'		<div class="optionTotalBox optionBoxNum'+goodsCount+'">'
						+'			<div class="optionMiniBox goodsList'+goodsCount+'_Opt0"> <!-- option테이블 -->'
									
						+'				<!-- option01 -->'
						+'				<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션1 내용</h4></div>'
						+'				<div class="crInputOptionBox">'
						+'					<input type="hidden" class="goodsNoFk" name="optionList['+optionCount+'].goodsNo" value="'+goodsNo+'">'
						+'					<input class="optionInput" type="text" name="optionList['+optionCount+'].opt1Name" placeholder="옵션1의 내용">'
						+'				</div>'
									
						+'				<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션1 추가금</h4></div>'
						+'				<div class="crInputOptionBox">'
						+'					<input class="optionInput" type="number" name="optionList['+optionCount+'].crOpt1Price" placeholder="옵션1의 추가금액" oninput="mathABS(this)">'
						+'				</div>'
						
						+'				<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션1 재고</h4></div>'
						+'				<div class="crInputOptionBox2">'
						+'					<input class="optionInput" type="number" name="optionList['+optionCount+'].crOptAmount" placeholder="옵션1 재고량" oninput="mathABS(this)">'
						+'				</div>'
						+'				<br>'
									
						+'				<!-- option02 -->'
						+'				<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션2 내용</h4></div>'
						+'				<div class="crInputOptionBox">'
						+'					<input class="optionInput" type="text" name="optionList['+optionCount+'].opt2Name" placeholder="옵션2의 내용">'
						+'				</div>'
						+'				<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션2 추가금</h4></div>'
						+'				<div class="crInputOptionBox">'
						+'					<input class="optionInput" type="number" name="optionList['+optionCount+'].crOpt2Price" placeholder="옵션2의 추가금액" oninput="mathABS(this)">'
						+'				</div>'
						+'				<div class="optDelBtn2">'
						+'					<h6 class="optMinusCss optionBtnMinus" id="goodsList'+goodsCount+'_Opt0" btn="optionBoxNum'+goodsCount+'">-</h6>'
						+'				</div>'
						+'			</div>'
						+'		</div>'
						+'	</div>'
						+'</div><!-- superGoodsNum (상품 삭제를 위한 div)-->';
					
					
					
					
					
				
					/* 상품 추가, 이벤트 연결 */
					$('#goodsBigBox').append(append2);
					
					$('.optionBtnPlus').off();	/* 옵션추가 */
					$('.optionBtnMinus').off() /* 옵션삭제 */
					$('.goodsBtnMinus').off(); /* 상품삭제 */
					optionAdd();
					removeGoods();
					optionRemove();
					
						
					
					
					/* 리모컨 추가, 이벤트 연결 */
					remoteNmEventOff();
					remoteRemoveEventOff();
					$('.remoteAddBox').append(remoteAppend);
					remoteNmEvent();
					remoteRemoveEvent();
				
	    		}else{
	    			alert('상품은 5개까지 추가 가능합니다')
	    			
	    		}
	    })
	    
	    /*  상품 삭제 */
	   	function removeGoods(){
		    $('.goodsBtnMinus').on('click',function(){
		    	
		    
				var check = confirm("상품을 삭제하시겠습니까?");
		    	
		    	if(check){
			    	var removeGoods = $(this).attr('goodsMinusBtn');	
			    	$('.'+removeGoods+'').remove();
			    	
			    	
			    	
			    	/* optionCount -= optLength; 상품에 추가된 옵션 갯수 만큼 빼기 */
			    	
			    	var removeTg = $(this).attr('remoteDel');
		    		$('.'+removeTg+'').remove();
		    		
	                var count=1;
	                $('.goodsListTitle2').each(function(){
	                	$(this).html('0'+count+'.');
	                	count++;
	                })
	                
	                var reCount=1;
	                $('.rmtTitle2').each(function(){
	                	$(this).html(reCount+'.&nbsp');
	                	reCount++;
	                })
			    	GCnt--;
		    	}
	    		
		    })
	    }
	    
	    
	    /* 옵션 추가 버튼 */
	    function optionAdd(){
		    $('.optionBtnPlus').on('click',function(){
				var goodsList = $(this).attr('optPlusBtn');
				var goodsNoFk = $(this).attr('goodsNo');
				var btnNum = $(this).attr('plus');
				var goodsNo = $('.'+goodsNoFk+'').find('input[class="goodsNoPk"]').val();
				if($(this).attr('optCount')<5){
					var optNum = $(this).attr('optCount');
					optionCount++;
					/* var optCount=$(this).attr('optCount'); */
					
						var appendOpt2 = 
							
							
							'	<div class="optionMiniBox '+goodsList+'_Opt'+optNum+'"> <!-- option테이블 -->'
							
							+'	<!-- option01 -->'
							+'		<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션1 내용</h4></div>'
							+'		<div class="crInputOptionBox">'
							+'			<input type="hidden" class="goodsNoFk" name="optionList['+optionCount+'].goodsNo" value="'+goodsNo+'">'
							+'			<input class="optionInput" type="text" name="optionList['+optionCount+'].opt1Name" placeholder="옵션1의 내용">'
							+'		</div>'
							
							+'		<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션1 추가금</h4></div>'
							+'		<div class="crInputOptionBox">'
							+'			<input class="optionInput" type="number" name="optionList['+optionCount+'].crOpt1Price" placeholder="옵션1의 추가금액" oninput="mathABS(this)">'
							+'		</div>'
							+'		<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션1 재고</h4></div>'
							+'		<div class="crInputOptionBox2">'
							+'		<input class="optionInput" type="number" name="optionList['+optionCount+'].crOptAmount" placeholder="옵션1 재고량" oninput="mathABS(this)">'
							+'		</div>'
							
							+'		<!-- option02 -->'
							+'		<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션2 내용</h4></div>'
							+'		<div class="crInputOptionBox">'
							+'			<input class="optionInput" type="text" name="optionList['+optionCount+'].opt2Name" placeholder="옵션2의 내용">'
							+'		</div>'
							+'		<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션2 추가금</h4></div>'
							+'		<div class="crInputOptionBox">'
							+'			<input class="optionInput" type="number" name="optionList['+optionCount+'].crOpt2Price" placeholder="옵션2의 추가금액" oninput="mathABS(this)">'
							+'		</div>'
							+'		<div class="optDelBtn2">'
							+'			<h6 class="optMinusCss optionBtnMinus" id="'+goodsList+'_Opt'+optNum+'" btn="'+goodsList+'">-</h6>'
							+'		</div>'
							+'	</div>';
							
							
							
						$('.optionBtnMinus').off();//선택자에 걸린 모든 이벤트 제거
						$('.'+goodsList+'').append(appendOpt2);
						optionRemove(); //선택자에 이벤트 연결
						
						$(this).attr('optCount',Number($(this).attr('optCount'))+1);/* 옵션 추가 후 옵션수카운트 */
				}else{
					alert('상품 등록은 5개까지 가능합니다');
				}
			})
	    }
	    optionAdd();
		
		/* 옵션 삭제 */
		function optionRemove(){
			$('.optionBtnMinus').on('click',function(){
				var goodsList = $(this).attr('id');
				$('.'+goodsList+'').remove();
				
				var optPlusBtn = $(this).attr('btn');
				$('h6[optPlusBtn='+optPlusBtn+']').attr('optCount',Number($('h6[optPlusBtn='+optPlusBtn+']').attr('optCount'))-1);
				/* optionCount--; */
			})
	    }
	    optionRemove();
	    
	    //리모컨 이름 변경 이벤트
	    function remoteNmEvent(){
	    	/* alert('리모컨 이벤트 연결.'); */
	    	// 상품 이름 변경
	    	$('.goodsName').keyup(function(){
	    		var goodsName = $(this).attr('remoteNm');
	    		$('.'+goodsName+'').html($(this).val());
	    	})
	    	
	    	$('.goodsPrice').keyup(function(){
	    		var goodsPri = $(this).attr('remotePri');
	    		$('.'+goodsPri+'').html($(this).val()+'원');
	    	})
	    }
	    remoteNmEvent();
	    
	    //리모컨 이름 변경 이벤트 제거
	    function remoteNmEventOff(){
	    	$('.goodsName').off();
	    }
	    
	    // 리모컨 삭제버튼
	    function remoteRemoveEvent(){
	    	$('.remoteDel').on('click',function(){
	    		var check = confirm("상품을 삭제하시겠습니까?");
		    	
		    	if(check){
		    		var goodsDel = $(this).attr('goodsDel');
		    		var optLength = $('.'+goodsDel+'').find($('div[class^="goodsList"]')).length;
			    	$('.'+goodsDel+'').remove();
			    	/* optionCount -= optLength; /* 상품에 추가된 옵션 갯수 만큼 빼기 */
		    		
		    		var removeTg = $(this).attr('remoteDel');
		    		$('.'+removeTg+'').remove();
		    		
		    		
		    		var count=1;
	                $('.goodsListTitle2').each(function(){
	                	$(this).html('0'+count+'.');
	                	count++;
	                })
	                
	                var reCount=1;
	                $('.rmtTitle2').each(function(){
	                	$(this).html(reCount+'.&nbsp');
	                	reCount++;
	                })
	                GCnt--;
		    	}
	    	})
	    }
	    
	    // 리모컨 삭제버튼 이벤트 제거
	    function remoteRemoveEventOff(){
	    	$('.remoteDel').off();
	    }
	    
	    
	}); //document ready end
	
	//product이미지 저장
	function productUpload(file, photoId, addInput) {
	      var str = file.value.substring(file.value.lastIndexOf("\\")+1); 
	      var filename = guid() + str;
	      /* alert(photoId); */
	      console.log(filename);
	      var form_data = new FormData();
	      	form_data.append('file', file.files[0]);
	      	form_data.append('filename', filename);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: 'http://sbmallstore.com/file/upload/crproduct',
	        	contentType: false,
	        	processData: false,
	        	enctype: 'multipart/form-data',
	        	success: function(img_name) {
	        		$("#"+photoId+'').val(img_name);
	        		$('.crowdPhotoList0').val(img_name);

	        	}
	      	});
	    }
	

	
	//goodsPhoto이미지 저장
	function prPhotoUpload(file, photoId) {
	      var str = file.value.substring(file.value.lastIndexOf("\\")+1); 
	      var filename = guid() + str;
	      console.log(filename);
	      var form_data = new FormData();
	      	form_data.append('file', file.files[0]);
	      	form_data.append('filename', filename);
	      	
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: 'http://sbmallstore.com/file/upload/crproduct',
	        	contentType: false,
	        	processData: false,
	        	enctype: 'multipart/form-data',
	        	success: function(img_name) {
	        		$('.'+photoId+'').val(img_name);

	        	}
	      	});
	    }
	
	
	//goods이미지 저장
	function goodsUpload(file, photoId,remotePhoto) {
	      var str = file.value.substring(file.value.lastIndexOf("\\")+1); 
	      var filename = guid() + str;
	      console.log(filename);
	      var form_data = new FormData();
	      	form_data.append('file', file.files[0]);
	      	form_data.append('filename', filename);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: 'http://sbmallstore.com/file/upload/crgoods',
	        	contentType: false,
	        	processData: false,
	        	enctype: 'multipart/form-data',
	        	success: function(img_name) {
	        		$('#'+photoId+'').val(img_name);
	        		$('.'+remotePhoto+'').attr('src',img_name);
	        	}
	      	});
	    }
	
	/* 상품 추가 버튼 */
	function addGoods(){
		$('.goodsBtnPlus').trigger('click');
	}
	 
	
	function guid() {
		  
	      timestamp = new Date().getTime();
	      return timestamp;
	}
	
	/* ProductNo */
	function getProductNo() {
	      timestamp = new Date().getTime();
	      return timestamp+'p';
	   }
	
	/* form submit */
	function sendCode(){
		$('.crowdBoardtext').val($('#summernote').summernote('code'));
		$('#crowdWriteForm').submit();
	}
	
	/* price 숫자면 받기 */
	function mathABS(e) {
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
	}
	
	/* 대표상품 이미지 삭제 버튼 */
	function prPhotoDel(delId,minusId){
		$('.'+delId+'').remove();
		
		var photoCnt = $('.prPh-oy').data('photocnt');
		$('.prPh-oy').data('photocnt',Number(photoCnt)-1);
		/* productCount--; */
	}
	
	/* 대표상품 이미지 추가 버튼 */
	function prPhotoPlus(){
		var photoCnt = $('.prPh-oy').data('photocnt');
		if(photoCnt<4){
			var append = 
				'<div class="crInputMidBox prPhotoList'+productCount+'">'
				+'	<div class="crInputMiniBox">'
				+'		<input type="hidden" class="crowdPhotoNo'+productCount+'" name="crowdPhoto['+productCount+'].productNo" value="'+productNo+'">'
				+'		<input type="hidden" class="crowdPhotoList'+productCount+'" name="crowdPhoto['+productCount+'].crPhotoList" value="0">'
				+'		<input type="file" class="crowdInput" name="crowdPhotoFake" onchange="prPhotoUpload(this,\'crowdPhotoList'+productCount+'\')">'          
				+'	</div>'
				+'	<div class="crPhotoPlus">'
				+'		<h6 class="prPhotoDel" onclick="prPhotoDel(\'prPhotoList'+productCount+'\')">-</h6>'
				+'	</div>'
				+'</div>';
				
			$('.productPhoto').append(append);	
			
			productCount++; /* 상품이미지 배열용 카운트 */
			$('.prPh-oy').data('photocnt',Number(photoCnt)+1); /* 상품 이미지 갯수 제한용 카운트 */
			
		}else{
			alert('이미지 등록은 5개까지 가능합니다');
		}
		
	}

</script>
</head>
<body>
<div class="commonBannerBox">
	<h3 class="rowdCommonBannerH3">얼리버드 상품등록</h3>
</div>


<div id="crowdWriteBixBox">
	
	<h1>게시글</h1>
	<form method="post" enctype="multipart/form-data" id="crowdWriteForm">
	
		<div class="referenceView">
			<h4></h4>
		</div>
		
		<div id="BoardBigBox">
			<div class="crTextBox"><h4 class="crBoardTextH4">게시글 제목</h4></div>
			<div class="crInputMiniBox">
				<input type="hidden" class="userSeq" name="crowdBoard.userSeq">
				<input class="crowdInput" type="text" name="crowdBoard.title" placeholder="게시판의 제목을 입력해주세요">
			</div>
			
			<br>
			
			<div class="crTextBox"><h4 class="crBoardTextH4">목표금액</h4></div>
			<div class="crInputMiniBox">
				<input class="crowdInput" type="number" name="crowdBoard.targetPrice" placeholder="목표하는 금액을 입력해주세요" oninput="mathABS(this)">
			</div>
			
		</div>
		<br>
		
		<div id="productBigBox"> <!-- Product테이블 -->
			<div class="crTextBox"><h4 class="crBoardTextH4">대표상품 이름</h4></div>
				<div class="crInputMiniBox">
					<input type="hidden" class="crowdProductNo" name="crowdProduct.productNo" value="">
					<input class="crowdInput" type="text" name="crowdProduct.crProductName" placeholder="상품의 이름을 입력해주세요">
				</div>
			<br>
			
			<div class="crTextBox"><h4 class="crBoardTextH4">대표상품 가격</h4></div>
				<div class="crInputMiniBox">
					<input class="crowdInput" type="number" name="crowdProduct.crPrice" placeholder="상품의 가격을 입력해주세요" oninput="mathABS(this)">
				</div>
			<br>
			
			<div class="crTextBox"><h4 class="crBoardTextH4">대표상품 이미지</h4></div>
				<div class="productPhoto">
					<div class="crInputMiniBox">
						<input type="hidden" id="crProduct_productNo" name="crowdProduct.crPhoto">
						<input class="crowdInput" type="file" name = "productFake" onchange="productUpload(this,'crProduct_productNo','productPhoto')" required="required">
					</div>
					<div class="crPhotoPlus">
						<h6 class="prPhotoDel prPh-oy" onclick="prPhotoPlus()" data-photoCnt="0">+</h6>
					</div>
					
					<div class="crInputHiddenBox prPhotoList0">
						<div class="crInputMiniBox">
							<input type="hidden" class="crowdPhotoNo0" name="crowdPhoto[0].productNo" value="">
							<input type="hidden" class="crowdPhotoList0" name="crowdPhoto[0].crPhotoList" value="0">
							<!-- <input type="file" class="crowdInput" name="crowdPhotoFake" onchange="prPhotoUpload(this, 'crowdPhotoList0', 'productPhoto')"> -->
						</div>
						
							<a class="prPhotoDel" onclick="prPhotoDel('prPhotoList0')">-</a>
						
					</div>
				</div>
			<br>
			
			<div class="crTextBox"><h4 class="crBoardTextH4">대표상품 설명</h4></div>
				<div class="crInputMiniBox">
					<input class="crowdInput" type="text" name="crowdProduct.crDetail" placeholder="상품의 설명을 입력해주세요">
				</div>
				
		</div><br>
		
		
		
		<div id="goodsBigBox"> <!-- Goods테이블 -->
			<div class="superGoods SuperGoodsNum0">
				<div class="goodsTitleBox">
					<h1 class="goodsTitle">상품</h1>
					<div class="addGoodsBtnBox"><h6 class="goodsBtnPlus plusProBtnText" goodsPlusBtn="goodsBigBox" goodsCount="0">+</h6></div> <!-- 상품 추가 -->
				</div>
				<br>
				
				<div class="goodsCommandBox">
					<div class="referenceView2">
						<h1></h1>
					</div>
					<div class="goodsMidBox goodsList0">	<!-- goods Div -->
						<div class="goodsListTitleBox1">
							<h3 class="goodsListTitle2">01.</h3>
							<h3 class="goodsListTitle">상품 목록</h3>
						</div>
						<br>
						
						<!-- <a class="goodsBtnMinus plusMinusbtn" goodsMinusBtn="goodsList0">-</a><br> -->
						
						<div class="crTextBox"><h4 class="crBoardTextH4">상품 이름</h4></div>
							<div class="crInputMiniBox">
								<input type="hidden" class="goodsNoPk" name="goodsList[0].goodsNo" value="">
								<input class="crowdInput goodsName" type="text" remoteNm = "remoteName0" name="goodsList[0].goodsName" placeholder="상품의 이름을 입력해주세요">
							</div>
						<br>
						
						<div class="crTextBox"><h4 class="crBoardTextH4">상품 가격</h4></div>
							<div class="crInputMiniBox">
								<input class="crowdInput goodsPrice" type="number" remotePri = "remotePrice0" name="goodsList[0].crGoodsPrice" placeholder="상품의 가격을 입력해주세요" oninput="mathABS(this)">
							</div>
						<br>
						
						<div class="crTextBox"><h4 class="crBoardTextH4">상품 이미지</h4></div>
								<div class="crInputMiniBox">
									<input type="hidden" id="goodsPhoto0" name="goodsList[0].goodsPhoto">
									<input class="crowdInput" id="firstGoodsPhoto" type="file" onchange="goodsUpload(this, 'goodsPhoto0', 'remoteImg0')">
								</div>
					</div>
				</div>
					<br>
					<div class="optionBigBox">
						<div class="optTitleBox">
							<h3 class="goodsTitle">옵션</h3>
							<!-- 옵션 추가 버튼 -->
							<div class="addBtnBox"><h6 class="plusBtnText optionBtnPlus plusMinusbtn" goodsNo="goodsList0" optPlusBtn="optionBoxNum0" optCount="1">+</h6></div>
						</div>
						<br>
						
						<div class="optionTotalBox optionBoxNum0">
							<div class="optionMiniBox optionBoxNum0_Opt0"> <!-- option테이블 -->
								
								<!-- option01 -->
								<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션1 내용</h4></div>
									<div class="crInputOptionBox">
										<input type="hidden" class="goodsNoFk" name="optionList[0].goodsNo" value="">
										<input class="optionInput" type="text" name="optionList[0].opt1Name" placeholder="옵션1의 내용">
									</div>
								
								<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션1 추가금</h4></div>
									<div class="crInputOptionBox">
										<input class="optionInput" type="number" name="optionList[0].crOpt1Price" placeholder="옵션1의 추가금액" oninput="mathABS(this)">
									</div>
								<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션1 재고</h4></div>
									<div class="crInputOptionBox2">
										<input class="optionInput" type="number" name="optionList[0].crOptAmount" placeholder="옵션1 재고량" oninput="mathABS(this)">
									</div>
								
								<!-- option02 -->
								<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션2 내용</h4></div>
									<div class="crInputOptionBox">
										<input class="optionInput" type="text" name="optionList[0].opt2Name" placeholder="옵션2의 내용">
									</div>
								<div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션2 추가금</h4></div>
									<div class="crInputOptionBox">
										<input class="optionInput" type="number" name="optionList[0].crOpt2Price" placeholder="옵션2의 추가금액" oninput="mathABS(this)">
									</div>
								<div class="optDelBtn2">
									<h6 class="optMinusCss optionBtnMinus" id="optionBoxNum0_Opt0" btn="optionBoxNum0">-</h6>
								</div>
								<!-- <div class="crOptionTextBox"><h4 class="crBoardTextH4">옵션2 재고</h4></div>
									<div class="crInputOptionBox2">
										<input class="optionInput" type="number" name="optionList[0].opt2Amount" placeholder="옵션2 재고량" oninput="mathABS(this)">
									</div> -->
								<!-- <a class="optionBtnMinus" id="goodsList1_Opt0" btn="goodsList1">-</a> -->
								
							</div>
						</div>
					</div>
				</div><!-- superGoodsNum (상품 삭제를 위한 div)-->
			</div><!-- 상품 등록 끝 -->
		
		
		<!-- 서머노트 -->
		<input type="hidden" class="crowdBoardtext" name="crowdBoard.text">
	</form>
		<textarea name="content" id="summernote"></textarea>
		<div class="writeCrowdBox">
				<button class="writeBtn" onclick="sendCode();">등록하기</button>
		</div>
</div>

<div id="writeRemote">
	<a class="remoteAddGoods" onclick="addGoods()">상품추가</a>
	
	<div class="remoteAddBox"> <!-- 상품 추가 박스 -->
	
		<div class="remoteList remoteMidBox0">
			<div class="remoteImgBox">
				<img class="rmtImg remoteImg0" src="<%=request.getContextPath()%>/img/noImage2.png"> <!-- 상품 이미지 -->
			</div>
			<div class="remoteNameBox">
				<h5 class="rmtTitle2">1.&nbsp</h5><h5 class="rmtNm remoteName0">상품이름</h5><br>
				<h6 class="rmtPri remotePrice0">가격</h6>
			</div>
			<div class="remoteDelBox">
				<!-- <a class="remoteDel" remoteDel="remoteMidBox0" optionNo = "">상품삭제</a> -->
			</div>
		</div>
		
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

</body>
</html>

