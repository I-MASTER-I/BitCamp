<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Store Write</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

<script type="text/javascript">
	var goodsArr=[];
	var goodsPhotoName="";
	var optionArr=[];
	var gi=0; //상품수카운트
	var oi=0; //옵션수카운트
	var radioClick = function(e){
		$('.goodsListItem').css('background-color','white');
        if($(e).prop('checked')){
            console.log($(e).next().find('.goodsListItem').text());
            $(e).next().find('.goodsListItem').css('background-color', '#f0f0f0');
        }
	};
	$(document).ready(function() { 
		$('input,textarea').css('border-width','2px !important');
		$('.rowdCommonBannerH3').text('상품등록');
		$('#summernote').summernote({
			  height: 750,                 // set editor height
			  minHeight: 500,             // set minimum height of editor
			  maxHeight: 1200,             // set maximum height of editor
			  focus: true,                  // set focus to editable area after initializing summernote
			  callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
		});
		
		$('#goodsListBox input:radio').on('click',radioClick);
		
	});
	function sendCode() {
		if($('#productTitle').val()==""){
        	alert('글 제목을 입력해 주세요.');
        	$('#productTitle').focus();
        	return false;
        }
        
        if($('#productName').val()==""){
        	alert('대표상품 이름을 입력해 주세요.');
        	$('#productName').focus();
        	return false;
        }
        
        if($('#productDetail').val()==""){
        	alert('상품 설명을 입력해 주세요.');
        	$('#productDetail').focus();
        	return false;
        }
        
        var gcnt=0;
        var ocnt=0;
        for(var key in goodsArr){
        	$('<input/>').attr({
        		type:'hidden',
        		name:'goods['+gcnt+'].goodsNo',
        		value: goodsArr[key].goodsNo
        	}).appendTo('#sform');
        	$('<input/>').attr({
        		type:'hidden',
        		name:'goods['+gcnt+'].goodsName',
        		value: goodsArr[key].goodsName
        	}).appendTo('#sform');
        	$('<input/>').attr({
        		type:'hidden',
        		name:'goods['+gcnt+'].goodsPrice',
        		value: goodsArr[key].goodsPrice
        	}).appendTo('#sform');
        	$('<input/>').attr({
        		type:'hidden',
        		name:'goods['+gcnt+'].goodsPhoto',
        		value: goodsArr[key].goodsPhoto
        	}).appendTo('#sform');
        	gcnt++;
        }
        
        if(gcnt==0){
        	alert('최소한 하나의 상품을 등록해야 합니다.'); //히든인풋이 생기지 않았을때만 false 주도록 주의
        	return false;
        }
        
        $('#text').val($('#summernote').summernote('code'));
        
        for(var key in optionArr){
        	$('<input/>').attr({
        		type:'hidden',
        		name:'goodsOptions['+ocnt+'].goodsNo',
        		value: optionArr[key].goodsNo
        	}).appendTo('#sform');
        	$('<input/>').attr({
        		type:'hidden',
        		name:'goodsOptions['+ocnt+'].opt1Name',
        		value: optionArr[key].opt1Name
        	}).appendTo('#sform');
        	$('<input/>').attr({
        		type:'hidden',
        		name:'goodsOptions['+ocnt+'].opt1Price',
        		value: optionArr[key].opt1Price
        	}).appendTo('#sform');
        	$('<input/>').attr({
        		type:'hidden',
        		name:'goodsOptions['+ocnt+'].opt2Name',
        		value: optionArr[key].opt2Name
        	}).appendTo('#sform');
        	$('<input/>').attr({
        		type:'hidden',
        		name:'goodsOptions['+ocnt+'].opt2Price',
        		value: optionArr[key].opt2Price
        	}).appendTo('#sform');
        	ocnt++;
        }
        $('<input/>').attr({
        	type:'hidden',
        	name:'salesBoard.userSeq',
        	value:'${memberInfo.userSeq}'
        }).appendTo('#sform');
        
        $('#sform').submit();
        
    }
	
	function mathABS(e) {
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
	}
	
	function sendFile(file, el) {
		var form_data = new FormData();
      	form_data.append('file', file);
      	form_data.append('filename', guid()+file.name);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: 'http://sbmallstore.com/file/upload/product',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
          		$(el).summernote('editor.insertImage',img_name.trim());
        	}
      	});
    }
	
	 function fileUpload(file) {
	      var str = file.value.substring(file.value.lastIndexOf("\\")+1); 
	      var filename = guid() + str;
	      var form_data = new FormData();
	      console.log(filename);
	      form_data.append('file', file.files[0]);
	      form_data.append('filename', filename);
	      $.ajax({
	        data: form_data,
	        type: "POST",
	        url: 'http://sbmallstore.com/file/upload/salesboard',
	        contentType: false,
	        processData: false,
	        enctype: 'multipart/form-data',
	        error: $('#productUploadImg').attr('src',"<%=request.getContextPath()%>/img/noImage.png"),
	        success: function(img_name) {
	        	$("#filename").val(img_name.trim());
	        	$('#productUploadImg').attr('src',img_name.trim());
	        }
	      });
	}
	 
	 function goodsUpload(file,gi) {
	      var str = file.value.substring(file.value.lastIndexOf("\\")+1); 
	      var filename = guid() + str;
	      var form_data = new FormData();
	      console.log(filename);
	      form_data.append('file', file.files[0]);
	      form_data.append('filename', filename);
	      $.ajax({
	        data: form_data,
	        type: "POST",
	        url: 'http://sbmallstore.com/file/upload/goods',
	        contentType: false,
	        processData: false,
	        enctype: 'multipart/form-data',
	        error: $('#goodsImg'+gi).attr('src',"<%=request.getContextPath()%>/img/noImage.png"),
	        success: function(img_name) {
	        	$('#goodsImg'+gi).attr('src',img_name.trim());
	        	goodsArr[gi].goodsPhoto = img_name.trim();
	        }
	      });
	}
	 
	function guid() {
		timestamp = new Date().getTime();
		return timestamp;
	}
	
	function imgError(e) {
		e.src='<%=request.getContextPath()%>/img/noImage.png';
	}
	
	function addOption() {
		if($('input[name=goodsItem]:checked').val()==null){
			alert('옵션을 추가할 상품을 선택해 주세요.');
			return false;
		}
		
		var option1Name= $('#option1Name').val();
		var option1Price= $('#option1Price').val();
		var option2Name= $('#option2Name').val();
		var option2Price= $('#option2Price').val();
		var optionStr = "";
		
		if(option1Name==""){
			alert('옵션1 이름을 지정해 주세요.');
			return false;
		}else if(option2Name==""){
			optionStr = option1Name+":"+numberWithCommas(option1Price)+"원";
		}else {
			optionStr = option1Name+":"+numberWithCommas(option1Price)+"원"
			+"/"+option2Name+":"+numberWithCommas(option2Price)+"원";
		}
		
		$('<option/>').attr({
			value:oi
		}).text(optionStr)
		.appendTo($('input[name=goodsItem]:checked').next().find('.goodsListItem .goodsNameBox select'));
		
		var i = $('input[name=goodsItem]:checked').val();
		var opt = {'cnt':oi,'goodsNo':i, 'opt1Name':option1Name,'opt1Price':option1Price,
				'opt2Name':option2Name,'opt2Price':option2Price}
		optionArr.push(opt);
		oi+=1;
	}
	
	function deleteOption(th,i) {
		cnt=$("select[id='goodsOptionSel"+i+"'] option:selected").val();
		$("select[id='goodsOptionSel"+i+"'] option:selected").remove();
		for(var key in optionArr){
			if(optionArr[key].cnt==cnt){
				delete optionArr[key];
			}
		}
	}
	
	function addGoods() {
		var Str = "";
		var name=$('#goodsName').val();
		var price = $('#goodsPrice').val();
		var gNo = guid();
		var goods = {'cnt':gi,'goodsNo':gNo,'goodsName':name,'goodsPrice':price,'goodsPhoto':""};
		if(name==""){
			alert('제품이름을 지정해 주세요.');
			return false;
		}
		goodsArr.push(goods);
		$('<input/>').attr({
			type:'radio',
			value:gNo,
			id:'goodsRadio'+gi,
			name:'goodsItem',
			onclick:'radioClick(this)',
			style:'display:none'
			}).appendTo('#goodsListBox');
		$('<label/>').attr({
			'for':'goodsRadio'+gi,
			id:'goodsLabel'+gi
		}).appendTo('#goodsListBox');
		$('<span/>').attr({
			'class':'goodsListItem',
			id:'goodsList'+gi
		}).appendTo('#goodsLabel'+gi);
		$('<span/>').attr({
			'class':'goodsImgBox',
			id:'goodsImgBox'+gi
		}).appendTo('#goodsList'+gi);
		$('<img/>').attr({
			id:'goodsImg'+gi,
			onerror:'imgError(this)'
		}).appendTo('#goodsImgBox'+gi);
		$('<span/>').attr({
			'class':'goodsNameBox',
			id:'goodsName'+gi
		}).text(name).appendTo('#goodsList'+gi);
		$('<select/>').attr({
			id:'goodsOptionSel'+gi
		}).appendTo('#goodsName'+gi);
		$('<button>옵션삭제</button>').attr({
			'class':'boardEditorBtn',
			value:gNo,
			onclick:'deleteOption(this,'+gi+')'
		}).appendTo('#goodsName'+gi);
		$('<span/>').attr({
			'class':'goodsPriceBox',
			id:'goodsPrice'+gi
		}).text(numberWithCommas(price)+"원").appendTo('#goodsList'+gi);
		$('<span/>').attr({
			id:'goodsBTN'+gi
		}).appendTo('#goodsList'+gi);
		$('<button>X</button>').attr({
			'class':'boardEditorBtn',
			type:'button',
			value:gNo,
			onclick:'deleteGoods(this,'+gi+')'
		}).appendTo('#goodsBTN'+gi);
		goodsUpload($('#goodsPhoto')[0],gi);
		console.log(goods.cnt);
		gi+=1;
	}
	
	function deleteGoods(th,i) {
		$("input:radio[name ='goodsItem']:input[value='"+th.value+"']").remove();
		$('#goodsRadio'+i).remove();
		$('#goodsLabel'+i).remove();
		delete goodsArr[i];
		for(var key in optionArr){
			if(optionArr[key].goodsNo==th.value){
				delete optionArr[key];
			}
		}
	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

</script>
</head>
<body>
	<c:if test="${memberInfo.gradeNum<3}">
		<script type="text/javascript">
			alert("운영진만 글 작성이 가능합니다.");
			location.href="<%=request.getContextPath()%>/store";
		</script>
	</c:if>
	<div id="summernoteBox">
		<div id="productUpload">
			<div id="productFormBox">
			<form method="post" enctype="multipart/form-data" id="sform">
				<span>글제목</span> 
				<input type="text" name="salesBoard.title" id="productTitle"><br>
				<span>대표사진</span>
				<input type="file" name="uploadfile" onchange="fileUpload(this)"><br>
				<!--  추가된 코드-->
				<input type="hidden" id="filename" name="product.photo">
				<span>대표상품이름</span>
				<input type="text" name="product.productName" id="productName"><br>
				<span>최소가격</span>
				<input type="number" name="product.price" value="0" min="0" oninput="mathABS(this)"><br>
				<span>대표상품설명</span>
				<textarea rows="3" cols="22" name="product.detail" id="productDetail"></textarea><br>
				<input type="hidden" name="salesBoard.text" id="text">
			</form>
			</div>
			<div id="productView">
				<img src="" alt="" onerror="imgError(this)" id="productUploadImg" class="productListThumb">
			</div>
		</div>
		<div id="goodsUpload">
			<div id="goodsFormBox">
				<form id="goodsForm">
					<span>상품이름</span>
					<input type="text" id="goodsName">
					<span>상품가격</span>
					<input type="number" id="goodsPrice" value="0" min="0" oninput="mathABS(this)">
					<br/>
					<span>상품사진</span>
					<input type="file" id="goodsPhoto">
				</form>
				<button type="button" class="boardEditorBtn" type="button" onclick="addGoods()">상품추가</button>
			</div>
			<div id="goodsListBox">
				
			</div>
			<div id="optionFormBox">
				<form id="optionForm">
					<span>옵션1이름</span>
					<input type="text" id="option1Name">
					<span>옵션1추가금</span>
					<input type="number" id="option1Price" value="0" min="0" oninput="mathABS(this)">
					<br/>
					<span>옵션2이름</span>
					<input type="text" id="option2Name">
					<span>옵션2추가금</span>
					<input type="number" id="option2Price" value="0" min="0" oninput="mathABS(this)">
					<br/>
					<button type="button" class="boardEditorBtn" onclick="addOption()">옵션추가</button>
				</form>
			</div>
		</div>
		
		<div id="summernote"></div>
		<button type="button" class="storeBtn storeWriteBtn boardEditorBtn" onclick="sendCode();">판매글등록</button>
	</div>
</body>
</html>