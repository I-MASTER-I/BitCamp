<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Store</title>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">
var insCnt=0;

var setGoodsBackColor = function(e) {
	$('#goodsList>li').css('background-color','white');
	e.style.backgroundColor='#f2f2f2';
}
var setOpt1BackColor = function(e) {
	$('#goodsOpt1List li').css('background-color','white');
	e.style.backgroundColor='#f2f2f2';
}
var setOpt2BackColor = function(e) {
	$('#goodsOpt2List li').css('background-color','white');
	e.style.backgroundColor='#f2f2f2';
}
//제품선택시
var goodsRadioClick = function(e) {
	var gno = e.dataset.gno;
	//임시카트에 표기될 제품이름
	insGoodsName=e.dataset.gname+'('+numberWithCommas(e.dataset.price)+'원)';
	//선택제품 제품헤더버튼 2번째 span에 저장
	$('#goodsSelectHeader').children('span:nth-child(2)').text(e.dataset.gname);
	//옵션쪽 span은 초기화 
	$('#goodsOpt1SelectHeader').children('span:nth-child(2)').text('');
	//goodsNo에 맞는 옵션목록1  받아오기!
	$.ajax({
		url:'<%=request.getContextPath()%>/store/goodsOption',
		type:'GET',
		data:{'goodsNo':gno},
		success:function(data){
			//옵션1 리스트 초기화
			$('#goodsOpt1List').text('');
			//opt1존재하지 않을시
			if(data.length<1){
				$('#goodsOpt1List').hide();
				//선택된옵션들 제품목록에 추가
				addGoodsList();
				//클로즈버튼 강제클릭으로 셀렉창 닫기
				$('#closeBoardSelector').trigger('click');
				return false;
			}
			
			var dupliCheck = "";
			//옵션1 리스트 생성
			for(var key in data){
				//옵션2다수존재에 의한 옵션1중복 체크
				if(data[key].opt1Name!=dupliCheck){
					
					dupliCheck=data[key].opt1Name;
					var opt1Id='opt1List'+key
					$('<li/>').attr({
						id:opt1Id,
						onclick:'setOpt1BackColor(this)'
					}).appendTo('#goodsOpt1List');
					$('<input/>').attr({
						id:'radio'+opt1Id,
						name:'opt1Radio',
						type:'radio',
						hidden:'hidden',
						onclick:'opt1RadioClick(this)',
						'data-gno':gno,
						'data-name':data[key].opt1Name,
						'data-price':data[key].opt1Price
					}).appendTo('#'+opt1Id);
					$('<label/>').attr({
						id:'la'+opt1Id,
						'for': 'radio'+opt1Id,
						style:'cursor:pointer'
					}).appendTo('#'+opt1Id);
					$('<span/>').attr({
					}).text(data[key].opt1Name+':(+'+numberWithCommas(data[key].opt1Price)+'원)').appendTo('#la'+opt1Id);
					
				}
			}
		}
	});
	//opt2 선택버튼 숨기기
	$('.goodsOptListSet2').hide();
	//opt1 선택버튼 보여주기
	$('.goodsOptListSet1').show();
	//상품목록 닫기
	$('#goodsList').hide();
	//옵션목록1펼치기
	$('#goodsOpt1List').show('fast');
};
//옵션1 선택시
var opt1RadioClick = function(e) {
	var gno = e.dataset.gno;
	insGoodsName = $('input[name=goodsRadio]:checked').attr('data-gname')
					+'('+numberWithCommas($('input[name=goodsRadio]:checked').attr('data-price'))+'원)'
					+'/'+e.dataset.name+'(+'+numberWithCommas(e.dataset.price)+'원)';
	//옵션1선택시 옵션버튼헤더 2번째 span에 선택옵션 표기
	$('#goodsOpt1SelectHeader').children('span:nth-child(2)')
	.text(e.dataset.name+'(+'+numberWithCommas(e.dataset.price)+'원)');
	//goodsNo와 opt1Name에 맞는 옵션목록2  받아오기
	$.ajax({
		url:'<%=request.getContextPath()%>/store/goodsOption',
		type:'GET',
		data:{"goodsNo":gno},
		success:function(data){
			//옵션2 리스트 초기화
			$('#goodsOpt2List').text('');
			//opt2존재하지 않을시
			for(var key in data){
				if(data[key].opt1Name==e.dataset.name && data[key].opt2Name.length<1){
					$('#goodsOpt2List').hide();
					//선택된옵션들 제품목록에 추가
					addGoodsList();
					//클로즈버튼 강제클릭으로 셀렉창 닫기
					$('#closeBoardSelector').trigger('click');
					return false;
				}
			}
			
			//옵션1이름과 같은 조건의 옵션2 리스트 생성
			for(var key in data){
				if(data[key].opt1Name==e.dataset.name){
					var opt2Id='opt2List'+key
					$('<li/>').attr({
						id:opt2Id,
						onclick:'setOpt2BackColor(this)'
					}).appendTo('#goodsOpt2List');
					$('<input/>').attr({
						id:'radio'+opt2Id,
						name:'opt2Radio',
						type:'radio',
						hidden:'hidden',
						onclick:'opt2RadioClick(this)',
						'data-gno':gno,
						'data-name':data[key].opt2Name,
						'data-price':data[key].opt2Price
					}).appendTo('#'+opt2Id);
					$('<label/>').attr({
						id:'la'+opt2Id,
						'for': 'radio'+opt2Id,
						style:"cursor:pointer"
					}).appendTo('#'+opt2Id);
					$('<span/>').attr({
					}).text(data[key].opt2Name+':(+'+numberWithCommas(data[key].opt2Price)+'원)').appendTo('#la'+opt2Id);
				}
			}
		}
	});
	//opt2 선택창 보여주기
	$('.goodsOptListSet2').show();
	//옵션목록1 닫기
	$('#goodsOpt1List').hide();
	//옵션목록2펼치기
	$('#goodsOpt2List').show('fast');
	
	
}

//옵션2선택시
var opt2RadioClick = function (e) {
	insGoodsName += '/'+e.dataset.name+'(+'+numberWithCommas(e.dataset.price)+'원)';
	//옵션목록2닫기
	$('#goodsOpt2List').hide();
	//선택된옵션들 제품목록에 추가
	addGoodsList();
	//클로즈버튼 강제클릭으로 셀렉창 닫기
	$('#closeBoardSelector').trigger('click');
}
var addGoodsList= function() {
	var goodsNo=$('input[name=goodsRadio]:checked').attr('data-gno');
	var goodsName=$('input[name=goodsRadio]:checked').attr('data-gname');
	var goodsPhoto=$('input[name=goodsRadio]:checked').attr('data-goodsPhoto');
	var goodsPrice=Number($('input[name=goodsRadio]:checked').attr('data-price'));
	var opt1Name=$('input[name=opt1Radio]:checked').attr('data-name');
	var opt1Price=Number($('input[name=opt1Radio]:checked').attr('data-price'));
	var opt2Name=$('input[name=opt2Radio]:checked').attr('data-name');
	var opt2Price=Number($('input[name=opt2Radio]:checked').attr('data-price'));
	var duplInsCart = false;
	var optionSeq ='';
	
	//선택된 제품 및 옵션 표기 초기화
	$('#goodsSelectHeader').children('span:nth-child(2)').text('');
	$('#goodsOpt1SelectHeader').children('span:nth-child(2)').text('');
	
	$('#insCartList>li').each(function(index, item){ 
		if(item.dataset.goodsno==goodsNo && item.dataset.opt1name==opt1Name && item.dataset.opt2name==opt2Name){
			duplInsCart = true;
		}
	});
	
	if(duplInsCart){ //같은 옵션의 제품이 추가되어 있을시 두번 추가시키지 않고  false
		alert('이미 등록된 물품입니다.');
		return false;
	}
	
	$('<li/>').attr({
		id:'insCartLi'+insCnt,
		'data-goodsno': goodsNo,
		'data-goodsname': goodsName,
		'data-goodsprice': goodsPrice,
		'data-goodsphoto': goodsPhoto,
		'data-optionseq': '',
		'data-opt1name':opt1Name,
		'data-opt1price':opt1Price,
		'data-opt2name':opt2Name,
		'data-opt2price':opt2Price
	}).appendTo('#insCartList');
	//선택된 정보로 GoodsOption정보 ajax요청
	$.ajax({
		url : '<%=request.getContextPath()%>/store/goodsOption/'+goodsNo,
		type : 'GET',
		data : {'opt1Name':opt1Name,'opt2Name':opt2Name},
		error : function(error) {
			alert("Error!");
		},
		success : function(data) {
			if(data!=null){
				//마지막으로생성된 li요소에 optionSeq값 넣기 (ajax 시간차 주의)
				$('#insCartList>li').last().attr('data-optionseq',data.optionSeq)
			}
		}
	});
	
	//각 옵션가격이 존재하지 않을때
	if(isNaN(opt1Price)){
		$('#insCartLi'+insCnt).removeAttr('data-opt1price');
		opt1Price=0;
	}
	if(isNaN(opt2Price)){
		$('#insCartLi'+insCnt).removeAttr('data-opt2price');
		opt2Price=0;
	}
	
	$('<div/>').attr({
		id:'insCartBox'+insCnt,
		style:'overflow:hidden'
	}).appendTo('#insCartLi'+insCnt);
	$('<div/>').attr({
		id:'insCartDetail'+insCnt,
		'class':'insCartDetail'
	}).html('<p>'+insGoodsName+'</p>')
	.appendTo('#insCartBox'+insCnt);
	$('<div/>').attr({
		id:'insCartDeleteBox'+insCnt,
		'class':'insCartDivRight'
	}).appendTo('#insCartDetail'+insCnt);
	$('<button/>').attr({
		value:insCnt,
		onclick:'removeGoodsList(this)',
		'class':'insCartDeleteBtn'
	}).text('X').appendTo('#insCartDeleteBox'+insCnt);
	$('<div/>').attr({
		id:'insCartNumberBox'+insCnt,
		'class': 'insCartNumberBox'
	}).appendTo('#insCartBox'+insCnt);
	$('<input/>').attr({
		type:'number',
		id:'insCartNumber'+insCnt,
		'class':'insCartNumber',
		'data-inscnt':insCnt,
		oninput:'changeInsCartPrice(this)',
		value:1,
		min:1,
		max:999,
	}).appendTo('#insCartNumberBox'+insCnt);
	$('<button/>').attr({
		'class':'insCartNumBtn',
		type:'button',
		value:insCnt,
		onclick:'minusInsCartNum(this)'
	}).text('-').appendTo('#insCartBox'+insCnt);
	$('<button/>').attr({
		'class':'insCartNumBtn',
		type:'button',
		value:insCnt,
		onclick:'plusInsCartNum(this)'
	}).text('+').appendTo('#insCartBox'+insCnt);
	$('<span/>').attr({
		id:'insCartPrice'+insCnt,
		'class': 'insCartPrice',
		'data-price':goodsPrice+opt1Price+opt2Price,
		'data-calprice':goodsPrice+opt1Price+opt2Price
	}).text(numberWithCommas(goodsPrice+opt1Price+opt2Price)+'원').appendTo('#insCartBox'+insCnt);
	
	changeInsCartTotalPrice();
	insCnt++;
}

var removeGoodsList = function(e) {
	$('#insCartLi'+e.value).remove();
	changeInsCartTotalPrice();
}

	$(document).ready(function () {
		
		$('.rowdCommonBannerH3').text('스토어');
		
		$('.storeDeleteBtn').click(function () {
			if (confirm("정말 삭제하시겠습니까??") == true){
				$('#storeDeleteForm').submit();
			}else{//취소
			    return;
			}
		});
		
		$('.storeModifyBtn').click(function () {
			if (confirm("게시글을 수정하시겠습니까??") == true){
				$('#storeModifyForm').submit();
			}else{//취소
			    return;
			}
		});
		
		$('#boardSelectViewBTN').click(function () {
			var seq = '${proAndSal.productSeq}';
			$('.goodsOptListSet1').hide();
			$('.goodsOptListSet2').hide();
			$('#boardSelector').css('visibility','visible');
			$.ajax({
				url:'<%=request.getContextPath()%>/store/getGoodsList?productSeq='+seq,
				type:'GET',
				success: function(data) {
					$('#goodsList').text('');
					
					for(var key in data){
						var gid = 'GoodsList'+key;
						$('<li/>').attr({
							id:gid,
							'class':'goodsListItem goodsListSelect',
							value:data[key].goodsNo,
							onclick:'setGoodsBackColor(this)'
						}).appendTo('#goodsList');
						$('<input/>').attr({
							id:'radio'+gid,
							name:'goodsRadio',
							type:'radio',
							onclick:'goodsRadioClick(this)',
							hidden:'hidden',
							'data-gno':data[key].goodsNo,
							'data-gname':data[key].goodsName,
							'data-price':data[key].goodsPrice,
							'data-goodsPhoto':data[key].goodsPhoto
						}).appendTo('#'+gid);
						$('<label/>').attr({
							id:'la'+gid,
							'for': 'radio'+gid,
							style:"cursor:pointer"
						}).appendTo('#'+gid);
						$('<span/>').attr({
							id:'GoodsListImgBox'+key,
							'class':'goodsListImgBox'
						}).appendTo('#la'+gid);
						
						$('<img/>').attr({
							src:data[key].goodsPhoto,
							onerror:'imgError(this)'
						}).appendTo('#GoodsListImgBox'+key);
						
						$('<span/>').attr({
							'class':'goodsListItemName'
						}).text(data[key].goodsName).appendTo('#la'+gid);
						
						$('<span/>').text(numberWithCommas(data[key].goodsPrice)+'원').appendTo('#la'+gid);
					}
				}
			});
			$('#goodsList').show('fast');
		});
		
		$('#closeBoardSelector').click(function () {
			$('#boardSelector>ul').text('');
			$('#boardSelector').css('visibility','hidden');
		});
		
		
		$('#goodsSelectHeader').click(function () {
			//opt1헤더버튼 숨기기
			$('#goodsOptListSet1').hide();
			//opt2헤더버튼 숨기기
			$('#goodsOptListSet2').hide();
			if($('#goodsList').css('display')!='none'){
				$('#goodsList').hide();
			}else{
				$('#goodsOpt1List').hide();
				$('#goodsOpt2List').hide();
				$('#goodsList').show('fast');
			}
		});
		
		$('#goodsOpt1SelectHeader').click(function () {
			//opt2헤더버튼 숨기기
			$('#goodsOptListSet2').hide();
			if($('#goodsOpt1List').css('display')!='none'){
				$('#goodsOpt1List').hide();
			}else{
				$('#goodsList').hide();
				$('#goodsOpt2List').hide();
				$('#goodsOpt1List').show('fast');
			}
		});
		
		$('#goodsOpt2SelectHeader').click(function () {
			if($('#goodsOpt2List').css('display')!='none'){
				$('#goodsOpt2List').hide();
			}else{
				$('#goodsList').hide();
				$('#goodsOpt1List').hide();
				$('#goodsOpt2List').show('fast');
			}
		});
	}); // end ready
	
	function imgError(e) {
		e.src='<%=request.getContextPath()%>/img/noImage.png'
	}
	
	function addCart() {
		$('#hForm').text('');
		var cartCnt = $('#insCartList>li').length;
		if(cartCnt==0){
			alert('장바구니에 추가할 상품이 없습니다.');
			return false;
		}
		makeHInput(cartCnt);
        $.ajax({
				    url : '<%=request.getContextPath()%>/order/carts/insert',
				    type : 'POST',
					data : $('#hForm').serialize(),
					error : function(error) {
				        alert("Error!");
				    },
					success : function(data) {
						if(data=="200"){
							alert("상품이 장바구니에 추가되었습니다.");
						}else if(data=="500"){
							alert("장바구니 추가에 실패하였습니다.(서버오류)");
						}else{
							alert("장바구니 추가에 실패하였습니다.(원인불명)");
						}
					}
				});
	}
	
	function buyProduct() {
		//카트에 담긴 상품 수
		var cartCnt = $('#insCartList>li').length;
		if(cartCnt==0){
			alert('주문할 상품이 없습니다.');
			return false;
		}
			makeHInput(cartCnt);
			$("#hForm").attr("action", "<%=request.getContextPath()%>/order/order");
			$('#hForm').submit();
	}
	
	function makeHInput(cartCnt) {
		$('#hForm').text('');
		
		for(i=0;i<cartCnt;i++){
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].userSeq',
				value:'${memberInfo.userSeq}'
			}).appendTo('#hForm');
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].goodsNo',
				value:$('#insCartList>li')[i].dataset.goodsno
			}).appendTo('#hForm');
			
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].quantity',
				value:$('#insCartList>li').eq(i).find('input[type=number]')[0].value
			}).appendTo('#hForm');
			
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].goodsName',
				value:$('#insCartList>li')[i].dataset.goodsname
			}).appendTo('#hForm');
			
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].goodsPhoto',
				value:$('#insCartList>li')[i].dataset.goodsphoto
			}).appendTo('#hForm');
			
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].goodsPrice',
				value:$('#insCartList>li')[i].dataset.goodsprice
			}).appendTo('#hForm');
			
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].salePrice',
				value:$('#insCartList>li .insCartPrice')[i].dataset.calprice
			}).appendTo('#hForm');
			
			if($('#insCartList>li')[i].dataset.optionseq!=null && $('#insCartList>li')[i].dataset.optionseq.length>0){
				$('<input/>').attr({
					type:'hidden',
					name:'orders['+i+'].optionSeq',
					value:$('#insCartList>li')[i].dataset.optionseq
				}).appendTo('#hForm');
				
				if($('#insCartList>li')[i].dataset.opt1name!=null){
					$('<input/>').attr({
						type:'hidden',
						name:'orders['+i+'].opt1Name',
						value:$('#insCartList>li')[i].dataset.opt1name
					}).appendTo('#hForm');
					$('<input/>').attr({
						type:'hidden',
						name:'orders['+i+'].opt1Price',
						value:$('#insCartList>li')[i].dataset.opt1price
					}).appendTo('#hForm');
				}
				
				if($('#insCartList>li')[i].dataset.opt2name!=null){
					$('<input/>').attr({
						type:'hidden',
						name:'orders['+i+'].opt2Name',
						value:$('#insCartList>li')[i].dataset.opt2name
					}).appendTo('#hForm');
					$('<input/>').attr({
						type:'hidden',
						name:'orders['+i+'].opt2Price',
						value:$('#insCartList>li')[i].dataset.opt2price
					}).appendTo('#hForm');
				}
			}//end optionif
		}//end for
	}
	
	function changeInsCartPrice(e) {
		var insCnt = e.dataset.inscnt;
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
		if(e.value>9999){
			e.value=9999;
		}else if(e.value<1){
			e.value=1;
		}
		
		var calprice =$('#insCartPrice'+insCnt).attr('data-price')*e.value;
		$('#insCartPrice'+insCnt).text(numberWithCommas(calprice)+"원");
		$('#insCartPrice'+insCnt).attr('data-calprice',calprice);
		
		var totalPrice=0;
		$('.insCartPrice').each(function(index,item) {
			totalPrice+=Number(item.dataset.calprice);
		});
		$('#insCartListTotalPrice').attr('data-price',totalPrice);
		$('#insCartListTotalPrice').text(numberWithCommas(totalPrice)+'원');
	}
	function changeInsCartTotalPrice() {
		var totalPrice=0;
		$('#insCartListTotal').text('');
		
		if($('.insCartPrice').length==0){ //임시카트에 담긴 제품이 없을때
			return false;
		}
		
		$('.insCartPrice').each(function(index,item) {
			totalPrice+=Number(item.dataset.calprice);
		});
		
		$('<div/>').attr({
		}).appendTo('#insCartListTotal');
		$('<strong/>').attr({
			'class':'insCartListTotalLeft'
		}).text('결제예정금액').appendTo('#insCartListTotal>div');
		$('<span/>').attr({
			'class':'insCartListTotalRight'
		}).appendTo('#insCartListTotal>div');
		$('<strong/>').attr({
			id:'insCartListTotalPrice',
			'data-price':totalPrice
		}).text(numberWithCommas(totalPrice)+'원').appendTo('#insCartListTotal>div>span');
	}
	function plusInsCartNum(e) {
		var selector = $('#insCartNumber'+e.value)
		selector.val(Number(selector.val())+1);
		$(selector).trigger('input');
	}
	function minusInsCartNum(e) {
		var selector = $('#insCartNumber'+e.value)
		selector.val(Number(selector.val())-1);
		$(selector).trigger('input');
	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
</script>
</head>
<body>
<div id=boardDetailContainer>
	<div id="boardProductContainer">
		<div id="boardProductThumbBox"> 
			<img src="${proAndSal.photo}" alt="이미지없음" id="boardProductThumb" onerror="imgError(this)">
		</div>
		<div id="boardProductOptionBox">
			<ul>
				<li id="boardProductName">
					<h2>${proAndSal.productName}</h2>
				</li>
				<li>
					<p>가격: <fmt:formatNumber value="${proAndSal.price}" pattern="#,###"/></p>
				</li>
				<li>
					<p>등록일: <fmt:formatDate value="${proAndSal.writeDate}" pattern="yyyy-MM-dd HH:mm"/></p>
				</li>
				<li id="boardSelectLi">
					<div id="boardSelectContainer">
					<div id="boardSelectBox">
						<button type="button" id="boardSelectViewBTN">
							<span class="boardBtnTextLeft">제품선택하기</span>
							<span class="boardBtnTextRight">▽</span>
						</button>
					</div>
					<div id="boardSelector">
						<div class="boardSelectorHeader">
							<span class="boardBtnTextLeft">제품선택</span>
							<button type="button" id="closeBoardSelector" class="boardBtnTextRight">
								<span>X</span>
							</button>
						</div>
						<div class="goodsListSet">
							<button type="button" class="boardSelectorHeader" id="goodsSelectHeader">
								<span class="boardBtnTextLeft">제품</span>
								<span class="boardBtnTextLeft"></span>
								<span class="boardBtnTextRight">▼</span>
							</button>
						</div>
						<ul id="goodsList">
						</ul>
						<div class="goodsOptListSet1">
							<button type="button" class="boardSelectorHeader goodsOptListSet1" 
							 id="goodsOpt1SelectHeader">
								<span class="boardBtnTextLeft">옵션1</span>
								<span class="boardBtnTextLeft"></span>
								<span class="boardBtnTextRight">▼</span>
							</button>
						</div>
						<ul id="goodsOpt1List" class="goodsOptUl goodsOptListSet1">
						</ul>
						<div class="goodsOptListSet2">
							<button type="button" class="boardSelectorHeader goodsOptListSet2" 
							 id="goodsOpt2SelectHeader">
								<span class="boardBtnTextLeft">옵션2</span>
								<span class="boardBtnTextLeft"></span>
								<span class="boardBtnTextRight">▼</span>
							</button>
						</div>
						<ul id="goodsOpt2List" class="goodsOptUl goodsOptListSet2">
						</ul>
					</div>
					</div>
				</li>
				<li>
					<ul id="insCartList">
					</ul>
				</li>
				<li id="insCartListTotal">
					
				</li>
				<li>
					<p>
						<button class="boardBtn baordOrderBtn" onclick="addCart()">
							<p class="boardBtnMsg">장바구니추가</p>
						</button>
						<button class="boardBtn baordOrderBtn" onclick="buyProduct()">
							<p class="boardBtnMsg">주문하기</p>
						</button>
					</p>
				</li>
			</ul>
			<br>
		</div>
	</div>
	<div id="boardDetailHeader">
	<p>상세설명</p>
	</div>
	<br>
	<div id="boardTextContainer">
		${proAndSal.text}
		<img id="boardDetailBottom" src="<%=request.getContextPath()%>/img/delivery01.png">
	</div>
	<br>
	<div id="boardReplyContainer">
		<c:if test="${memberInfo.gradeNum>=3}">
			<form method="get" action="<%=request.getContextPath()%>/store/ModifyBoard" id="storeModifyForm">
				<input type="hidden" value="${salSeq}" name="salSeq">
				<input type="button" class="storeBtn storeAdminBtn storeModifyBtn boardEditorBtn" value="글수정">
			</form>
			<form method="post" action="<%=request.getContextPath()%>/store/deleteBoard" id="storeDeleteForm">
				<input type="hidden" value="${salSeq}" name="salSeq">
				<input type="button" class="storeBtn storeAdminBtn storeDeleteBtn boardEditorBtn" value="글삭제">
			</form>
		</c:if>
		
	</div>
</div>
	<form id="hForm" method="post"></form>
</body>
</html>