<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(document).ready(function() {
		$('.rowdCommonBannerH3').text('장바구니');
		//페이지로딩 후 카트정보 불러옴
		$.ajax({
			url : '<%=request.getContextPath()%>/order/carts',
			type : 'GET',
			data : {'userSeq':'${memberInfo.userSeq}'},
			error : function(error) {
				alert("error!");
			},
			success : function(data) {
				for(var key in data ){
					$('<tr/>').appendTo('#cartTable');
					$('<td/>').appendTo('#cartTable>tbody>tr:last-child');
					$('<input/>').attr({
						'name':'cartItem',
						'type':'checkbox',
						'onchange':'calTotalPrice()',
						'data-goodsno':data[key].goodsNo,
						'data-goodsprice':data[key].goodsPrice,
						'data-goodsphoto':data[key].goodsPhoto,
						'data-goodsname':data[key].goodsName,
						'data-quantity':data[key].quantity,
						'data-optionseq':data[key].optionSeq,
						'data-opt1name':data[key].opt1Name,
						'data-opt1price':data[key].opt1Price,
						'data-opt2name':data[key].opt2Name,
						'data-opt2price':data[key].opt2Price,
						'data-saleprice':data[key].salePrice,
					}).appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					
					$('<td/>').appendTo('#cartTable>tbody>tr:last-child');
					$('<a/>').attr({
						'href':'<%=request.getContextPath()%>'+'/store/board/'+data[key].salesSeq
					}).text(data[key].goodsNo).appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					$('<td/>').appendTo('#cartTable>tbody>tr:last-child');
					$('<img/>').attr({
						'src':data[key].goodsPhoto
					}).appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					$('<td/>').html('<p>'+data[key].goodsName+'</p>').appendTo('#cartTable>tbody>tr:last-child');
					
					//옵션1,2 존재유무 판단하여 텍스트 추가
					if(data[key].opt1Name.length>0){
						$('<p/>').text(data[key].opt1Name+'(+'+numComma(data[key].opt1Price)+'원)')
						.appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					}
					if(data[key].opt2Name.length>0){
						$('<p/>').text(data[key].opt2Name+'(+'+numComma(data[key].opt2Price)+'원)')
						.appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					}
					
					$('<td/>').html('<p>'+numComma(data[key].goodsPrice)+'원</p>').appendTo('#cartTable>tbody>tr:last-child');
					$('<td/>').appendTo('#cartTable>tbody>tr:last-child');
					$('<input/>').attr({
						'type':'Number',
						'data-index':key,
						'value':data[key].quantity,
						'oninput':'changeInsCartPrice(this)'
					}).appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					$('<td/>').html('<strong>'+numComma(data[key].salePrice)+'원</strong>')
					.appendTo('#cartTable>tbody>tr:last-child');
				}
			}
		});//end ajax
		
		//구매버튼
		$('.cartOrderBtn').click(function() {
			if($('input[name=cartItem]:checked').length>0){ //최소 하나의 상품이 선택되었을때
				makeInputList();
				$('#hCartForm').attr({
					action:'<%=request.getContextPath()%>/order/order',
					method:'POST'	
				});
				$('#hCartForm').submit();
			}else{
				alert('구입하실 물품을 선택해 주세요.');
			}
			
		});
		
		//삭제버튼
		$('.cartdeleteBtn').click(function() {
			if($('input[name=cartItem]:checked').length>0){ //최소 하나의 상품이 선택되었을때
				if (confirm("정말 삭제하시겠습니까??") == true){
					
					makeInputList();
					
					$.ajax({
						url : '<%=request.getContextPath()%>/order/carts/delete',
						type : 'POST',
						data : $('#hCartForm').serialize(),
						error : function(error) {
							alert("error!");
						},
						success : function(data) {
							$('input[name=cartItem]:checked').parent().parent().remove();
							calTotalPrice();
						}
					});
					$('#hCartForm').text('');
				}else{//취소
				    return;
				}
			}else{
				alert('삭제하실 물품을 선택해 주세요.');
			}
		});
		
		$('.cartItem').click();
		$('#checkAllItems').click(function () { //체크박스 전체체크
			if($(this)[0].checked==true){
				$('input[name=cartItem]').prop('checked',true);
			}else{
				$('input[name=cartItem]').prop('checked',false);
			}
			calTotalPrice();
		});
		
	});
	
	//히든인풋생성
	function makeInputList() {
		$('#hCartForm').text('');
		for(i=0;i<$('input[name=cartItem]:checked').length;i++){
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].userSeq',
				value:'${memberInfo.userSeq}',
			}).appendTo('#hCartForm');
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].goodsNo',
				value:$('input[name=cartItem]:checked').eq(i).attr('data-goodsNo'),
			}).appendTo('#hCartForm');
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].goodsName',
				value:$('input[name=cartItem]:checked').eq(i).attr('data-goodsname'),
			}).appendTo('#hCartForm');
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].goodsPrice',
				value:$('input[name=cartItem]:checked').eq(i).attr('data-goodsprice'),
			}).appendTo('#hCartForm');
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].goodsPhoto',
				value:$('input[name=cartItem]:checked').eq(i).attr('data-goodsphoto'),
			}).appendTo('#hCartForm');
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].optionSeq',
				value:$('input[name=cartItem]:checked').eq(i).attr('data-optionSeq'),
			}).appendTo('#hCartForm');
			
			//opt1존재시
			if($('input[name=cartItem]:checked').eq(i).attr('data-opt1Name')!=(null||"")){
				$('<input/>').attr({
					type:'hidden',
					name:'orders['+i+'].opt1Name',
					value:$('input[name=cartItem]:checked').eq(i).attr('data-opt1Name'),
				}).appendTo('#hCartForm');
				$('<input/>').attr({
					type:'hidden',
					name:'orders['+i+'].opt1Price',
					value:$('input[name=cartItem]:checked').eq(i).attr('data-opt1Price'),
				}).appendTo('#hCartForm');
			}
			
			//opt2존재시
			if($('input[name=cartItem]:checked').eq(i).attr('data-opt2Name')!=(null||"")){
				$('<input/>').attr({
					type:'hidden',
					name:'orders['+i+'].opt2Name',
					value:$('input[name=cartItem]:checked').eq(i).attr('data-opt2Name'),
				}).appendTo('#hCartForm');
				$('<input/>').attr({
					type:'hidden',
					name:'orders['+i+'].opt2Price',
					value:$('input[name=cartItem]:checked').eq(i).attr('data-opt2Price'),
				}).appendTo('#hCartForm');
			}
			
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].quantity',
				value:$('input[name=cartItem]:checked').eq(i).attr('data-quantity'),
			}).appendTo('#hCartForm');
			$('<input/>').attr({
				type:'hidden',
				name:'orders['+i+'].salePrice',
				value:$('input[name=cartItem]:checked').eq(i).attr('data-salePrice'),
			}).appendTo('#hCartForm');
		} //end for
		
		$('<input/>').attr({
			type:'hidden',
			name:'orderType',
			value:1,
		}).appendTo('#hCartForm');
	}
	
	function changeInsCartPrice(e) { //cart 수량 변경시마다
		
		//숫자만 입력가능 정규식
		var num = e.value.replace(/[^0-9]/g,"");
		if(num>999){
			num=999;
		}
		if(num<1){
			num=1;
		}
		//정규화된 자연수 밸류값에 적용
		e.value=num;
		
		var paSelector = $(e).parent().parent();
		var calPrice = e.value*
			(Number($(paSelector).find('td:first-child>input[type=checkbox]').attr('data-goodsprice'))+
			Number($(paSelector).find('td:first-child>input[type=checkbox]').attr('data-opt1price'))+
			Number($(paSelector).find('td:first-child>input[type=checkbox]').attr('data-opt2price')));
		$(paSelector).find('td:first-child>input[type=checkbox]').attr('data-quantity',e.value);
		$(paSelector).find('td:first-child>input[type=checkbox]').attr('data-saleprice',calPrice);
		$(paSelector).find('td:last-child>strong').text(numComma(calPrice)+'원');
		
		calTotalPrice();
	}
	
	function calTotalPrice() {
		var calPrice = 0;
		for(i=0;i<$('input[name=cartItem]:checked').length;i++){
			calPrice += Number($('input[name=cartItem]:checked').eq(i).attr('data-saleprice'));
		}
		$('#cartTotalPrice').text(numComma(calPrice));
	}
	
	//3자리마다 콤마
	function numComma(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
</script>
<div id="cartListContainer">
	<div id="carListBox">
		<div id="cartHeaderBox">
			<h2>장바구니</h2>
		</div>
		<table id="cartTable">
			<tr id="cartTableHeader">
				<td><input type="checkbox" id="checkAllItems"></td>
				<td>상품번호</td>
				<td colspan="2">상품정보</td>
				<td>상품가격</td>
				<td>수량</td>
				<td>주문금액</td>
			</tr>
		</table>
	</div>
	<div class="cartSubBtnBox">
		
		<span id="cartTotalPriceBox">
			<span>결제예정금액</span>
			<span id="cartTotalPrice">0</span>
			<span>원</span>
		</span>
	</div>
	<div class="cartOrderBtnBox">
		<input type="button" class="cartdeleteBtn storeBtn" value="선택상품삭제">
		<input type="button" class="cartOrderBtn storeBtn" value="선택상품결제">
	</div>
	<form id="hCartForm"></form>
	<form id="hCartForm2"></form>
</div>
<br>