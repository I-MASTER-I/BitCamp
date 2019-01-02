<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<style type="text/css">
.selectPayment{
	padding: 7px;
    border: 1px solid #dcdcdc;
    border-radius: 5px;
}
.paySuperBox{
	background-color: #f5f5f5;
}
.paymentInfoBox{
	padding-left: 20px; 
}
.orderAccountText{
	margin-left: 30px;
}
</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

var IMP = window.IMP; // 생략가능
IMP.init('imp01587367'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	$(document).ready(function(){
		$('.rowdCommonBannerH3').text('결제');
		$('.ODDelivery').keyup(function(){
			var length = $(this).val();
			
			if(length.length<51){
				$('.nowLimit').html("("+length.length+"/50자)");
			}else{
				$(this).val($(this).val().substring(0,50));
				$('.nowLimit').html("("+length.length+"/50자)");
			}
		})
		
		$('.rowAgree').on('click',function(){
			var append = '<img class="checked" src="<%=request.getContextPath()%>/img/checking.png">';
			var check = $(this).find('.checked');
			
			if(check.length==0){
				$(this).append(append);
				$(this).css('border','none');
				$(this).attr('data-cnt',1);
			}else{
				$(this).find('.checked').remove();
				$(this).css('border','1px solid #a0a0a0');
				$(this).attr('data-cnt',0);
			}
			
		})
		
		$('.doFunding').on('click',function(){
			var agree = $('.checked').length;/* 3이여야 함 */
			
			if(agree==3){
			}	
			
		});
		
		for(i=0;i<$('.totalPriceF').length;i++){
			var finalPrice = Number($('.finalPriceF').eq(0).attr('data-totalPrice'))
							+Number($('.totalPriceF').eq(i).attr('data-salePrice'));
			$('.finalPriceF').eq(0).attr({
				'data-totalPrice': finalPrice
			}).text(numComma(finalPrice));
		}
		
		$('#orderBtn').on('click',function(){
			var checkCnt=0;
			for(i=0;i<$('.rowAgree').length;i++){
				checkCnt+=Number($('.rowAgree').eq(i).attr('data-cnt'));
			}
			if(checkCnt==3){
				orderDo();	
			}else{
				alert('모든 약관에 동의하셔야 합니다.');
			}
			
		});
		
		$('.selectPayment').on('change',function(){
			if($(this).val()=="0"){
				$('.orderAccountText').text('농협 : 4310-01-59773105');
			}else if($(this).val()=="1"){
				$('.orderAccountText').text('');
			}
		});
		
	});/* ready end */
	function orderDo() {
		switch ($('.selectPayment').val()) {
		case "1":
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : $('.finalPriceF').eq(0).attr('data-totalPrice'),
			    buyer_name : '${memberInfo.userName}',
			    buyer_tel : $('.orderPhone')[0].value,
			    buyer_addr : $('.address1')[0].value+' '+$('.address2')[0].value,
			    buyer_postcode : $('.zipCode')[0].value,
			    m_redirect_url : 'http://localhost/mall/order/cart'
			}, function(rsp) {
			    if ( rsp.success ) {
			    	
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        $.ajax({
						url : '<%=request.getContextPath()%>/order/orders/insert',
						type : 'POST',
						data : {'orders':makeOrdersJson()+''},
						error : function(error) {
							alert("error!");
						},
						success : function(data) {
							var msg = "결제에 실패하였습니다. DB오류, 에러코드 : "
								if(data=="200"){
									alert("결제가 완료되었습니다.");
								}else{
									alert(msg+data);
								}
							location.href="<%=request.getContextPath()%>/store";
						}
					});
			        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '결제오류 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
				
			break;

		default:
			alert("무통장 결제의 경우, 전용계좌에 입금하셔야 합니다.")
			$.ajax({
				url : '<%=request.getContextPath()%>/order/orders/insert',
				type : 'POST',
				data : {'orders':makeOrdersJson()+''},
				error : function(error) {
					alert("error!");
				},
				success : function(data) {
					var msg = "주문에 실패하였습니다. DB오류, 에러코드 : "
						if(data=="200"){
							alert("주문이 완료되었습니다.");
						}else{
							alert(msg+data);
						}
					location.href="<%=request.getContextPath()%>/store";
				}
			});
			break;
		}
		
	}
	function alertOrderResult(data) {
		
	}
	
	function makeOrdersJson() {
		var orders = ${ordersJson};
		var orderDetail = {
				'orderDetailNum':new Date().simpleDateForm('yyMMddHHmmssms'),
				'userSeq':'${memberInfo.userSeq}',
				'payment':$('.selectPayment').val(),
				'orderTime':'',
				'status':$('.selectPayment').val(),
				'totalAmount':'0',
				'orderType': '${orderType}',
				'zipCode':$('.zipCode')[0].value,
				'orderPhone':$('.orderPhone')[0].value,
				'orderAddress1':$('.address1')[0].value,
				'orderAddress2':$('.address2')[0].value,
				'orderRequest':$('.orderRequest')[0].value
		};
		var orderArr={
			'orders':orders,
			'orderDetail':orderDetail
		}
		return JSON.stringify(orderArr);
	}
	
	//simpleDateFormat 생성로직
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};

	Date.prototype.simpleDateForm = function(f) {
	    if (!this.valueOf()) return " ";
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|hh|mm|ss|ms|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "ms": return (d.getMilliseconds()>=100)?d.getMilliseconds():"0"+d.getMilliseconds();
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	//simpleDateForm end
	
	/* price 숫자면 받기 */
	function mathABS(e) {
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
	}
	
	/* 코드생성 */
	function guid() {
		timestamp = new Date().getTime();
		return timestamp;
	}
	
	//3자리마다 콤마
	function numComma(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

</script>

</head>
<body>
<div class="orderSuperBox">
	
	<div class="orderHeadBox">
		<h2 class="orderHeadLine">주문 / 결제</h2>
	</div>
	
	<div class="OStep1Box">
		<h3 class="OstepNo">1</h3>
		<h3 class="OStep1">주문상품 확인</h3>
	</div>
	
	<!-- 주문 품목 -->
	<div class="orderInfoBox ib">
		<div class="chartBigBox ib">
			<div class="goodsInfoBox ib">
				<h3 class="chartTitle ib">상품/옵션정보</h3>
			</div>
			<div class="quanInfoBox ib">
				<h3 class="chartTitle ib">수량</h3>
			</div>
			<div class="salesInfoBox ib">
				<h3 class="chartTitle ib">상품 가격</h3>
			</div>
			<div class="finalInfoBox ib">
				<h3 class="chartTitle ib">상품 총 가격</h3>
			</div>
			<div class="salerInfoBox ib">
				<h3 class="chartTitle ib">배송비/판매자</h3>
			</div>
		</div>
	<c:forEach var="order" items="${orders}">
		<div class="orderUnitBox orderBag">
			<div class="orderImgbox ib">
				<img class="orderImg" src="${order.goodsPhoto}">
			</div>
			
			<div class="orderTitlebox ib">
				<h1 class="orderTitle ib">${order.goodsName}</h1><br>
				<c:if test="${order.opt1Name!=null}">
					<h3 class="orderSubLine ib">
						${order.opt1Name}(+<fmt:formatNumber value="${order.opt1Price}" pattern="#,###"/>원)
					</h3>
				</c:if>
				<c:if test="${order.opt2Name!=null}">
					<h3 class="orderSubLine ib">
						${order.opt2Name}(+<fmt:formatNumber value="${order.opt2Price}" pattern="#,###"/>원)
					</h3>
				</c:if>
			</div>
			
			<div class="quantityBox ib">
				<h3 class="quantityF ib">${order.quantity}개</h3>
			</div>
			
			<div class="salesBox ib">
				<h2 class="salesPriceF ib">
				<fmt:formatNumber value="${order.goodsPrice}" pattern="#,###"/>원
				</h2>
			</div>
			
			<div class="totalBox ib">
				<div class="totalPriceBox ib">
					<h2 class="totalPriceF ib" data-saleprice="${order.salePrice}">
						<fmt:formatNumber value="${order.salePrice}" pattern="#,###"/>원
					</h2>
					<br>
				</div>
				<h4 class="totalPriceD ib">
					(${order.quantity}x<fmt:formatNumber value="${order.salePrice}" pattern="#,###"/>원)
				</h4>
			</div>
			
			<div class="salerBox ib">
				<h4 class="delivery ib">무료</h4><br>
				<h4 class="saler ib">SB_company</h4>
			</div>
			
		</div>
	</c:forEach>
	
		<!-- 최종 결제금액 -->
		<div class="finalPriceBox ib">
			<h3 class="finalPriceTitle ib">최종결제금액</h3>	
			<h1 class="finalPriceF ib" data-totalPrice="0">totalprice</h1>
			<h3 class="finalPriceWon ib">원</h3>
		</div>
		
	</div><!-- 주문정보 끝 -->
	
	<!-- 결제정보 -->
	<div class="orderDetailBox">
	
		<div class="OStep1Box">
			<h3 class="OstepNo">2</h3>
			<h3 class="OStep1">배송지 정보 입력</h3>
		</div>
		
		<!-- 결제 수단 -->
		<div class="deliveryInfoBox">
			<div class="ODunit marBottom ib">
				<div class="ODtitleBox ib">
					<h3 class="ODtitle ib">받으시는 분</h3>
				</div>
				
				<div class="ODinputBox ib">
					<input class="ODinput orderName" type="text" value="${memberInfo.userName}">
				</div>
			</div>
			
			<div class="ODunit marBottom ib">
				<div class="ODtitleBox2 ib">
					<h3 class="ODtitle2 ib">주소</h3>
				</div>
				
				<div class="ODAddressBigBox ib">
				
					<div class="ODzipCodeBox marBottom ib">
						<input class="ODzipCode zipCode ib" type="text" value="${memberInfo.zipCode}" readonly="readonly">
					</div>
					<div class="findAddressBox ib">
						<button class="findAddress ib">주소찾기</button>
					</div><br>
					
					<div class="ODAddressBox marBottom ib">
						<input class="ODAddress address1 " type="text" value="${memberInfo.address1}" readonly="readonly">
					</div><br>
					<div class="ODAddressBox ib">
						<input class="ODAddress address2" type="text" value="${memberInfo.address2}" placeholder="상세주소">
					</div>
					
				</div>
			</div>
			
			<div class="ODunit marBottom ib">
				<div class="ODtitleBox ib">
					<h3 class="ODtitle ib">휴대전화</h3>
				</div>
				
				<div class="ODinputBox ib">
					<input class="ODinput orderPhone" type="number" value="${memberInfo.phone}" oninput="mathABS(this)">
				</div>
			</div>
			
			<div class="ODunit ib">
				<div class="ODtitleBox ib">
					<h3 class="ODtitle ib">배송시 요구사항</h3>
				</div>
				
				<div class="ODinputBox ib">
					<input class="ODDelivery orderRequest" type="text">
				</div>
				<h4 class="limitText nowLimit ib">(0/50자)</h4>
			</div>
		</div>
		<div class="basicBigBox ib">
			<div class="basicUnit ib">
				<div class="ODtitleBox ib">
					<h3 class="ODtitle ib">주문자 정보</h3>
				</div>
				<div class="ODbasicInfo ib">
					<h3 class="hidden userSeq">${memberInfo.userSeq}</h3>
					<h3 class="basicUser ib">${memberInfo.userName}</h3>
				</div>
			</div><br>
			
			<div class="basicUnit ib">
				<div class="ODtitleBox ib">
					<h3 class="ODtitle ib">SMS수신 동의</h3>
				</div>
				<div  class="ODbasicInfo ib">
					<input class="basicRadio ib" type="radio" name="agree"><h3 class="agree ib">예</h3>
					<input class="basicRadio ib" type="radio" name="agree"><h3 class="disagree ib">아니오</h3>
					<h3 class="basicAgree ib">(${memberInfo.phone})</h3>
					<h5 class="subText ib">모바일 거래정보 알리미가 설정되어 있을 경우 SMS는 발송되지 않으며 알리미만 발송됩니다.</h5>
				</div>
			</div>
		</div>
	
		<div class="OStep1Box">
			<h3 class="OstepNo">3</h3>
			<h3 class="OStep1">결제 정보</h3>
		</div>
		
		<div class="noticeBox ib">
			<h3 class="notice1 ib notiPoint">카드 / 무통장</h3><h3 class="notice1 ib">&nbsp;결제 가능합니다.</h3><br>
			<h5 class="notice2 ib">구입 금액에 따라 포인트가 적립됩니다.</h5><br>
			<h5 class="notice2 ib">불가축천민 1% 평민 2% 귀족 3% 다이아 5% 그랜드마스터 10%</h5><br>
			<h5 class="notice2 ib">회원님의 등급은 </h5>
			<h3 class="notice1 ib notiPoint">
			<c:if test="${memberInfo.gradeNum==0}">
			불가축천민
			</c:if>
			<c:if test="${memberInfo.gradeNum==1}">
			평민
			</c:if>
			<c:if test="${memberInfo.gradeNum==2}">
			귀족
			</c:if>
			<c:if test="${memberInfo.gradeNum==3}">
			다이아
			</c:if>
			<c:if test="${memberInfo.gradeNum==4}">
			그랜드마스터
			</c:if>
			</h3>
			<h5 class="notice2 ib">입니다.</h5><br>
		</div>
		
		<div class="paySuperBox">
			<div class="paymentInfoBox ib">
				<!-- 결제방식 -->
				<div class="payUnit ib">
					<h3 class="payTitle ib">결제 방식</h3><br>
							<select class="selectPayment">
								<option value="0">무통장결제</option>
								<option value="1">카드결제</option>
							</select>
					<h3 class="notice1 ib orderAccountText">농협 : 4310-01-59773105</h3><br>
				</div><br>
			</div>
		</div>
		
		<!-- 유의사항 동의 -->
		<div class="rowBigBox">
			<div class="rowSubBox">
				<div class="rowStep ib">
					<div class="rowh3Box ib">
						<h3 class="rowh3 ib">제 1 조 결제</h3>
					</div><br>
					<h4 class="rowh4 ib">① 회원은 회사가 제공하는 결제수단을 통하여 후원에 참여할 수 있습니다.</h4><br>
					<h4 class="rowh4 ib">② 후원 취소는 프로젝트의 후원 마감기한 이내에만 가능하며, 후원 금액을 수정하고 싶은 경우는 이전 결제를 취소한 후 재결제를 하여야 합니다.</h4><br>
					<h4 class="rowh4 ib">③ 회원은 하나의 프로젝트에 중복으로 참여할 수 있으며, 참여시 최저 금액은 1,000원 이상입니다.</h4><br>
					<h4 class="rowh4 ib">④ 신용카드 및 체크카드로 결제 시 최저 금액은 1,000원 이상입니다.</h4><br>
					<h4 class="rowh4 ib">⑤ 회사에 운영하는 포인트 정책에 따라 리워드 포인트를 사용하여 결제할 수 있습니다.</h4><br>
					<h4 class="rowh4 ib">⑥ 제5항의 포인트의 사용에 따라 총 결제금액이 차감되어 다른 결제수단으로 결제하여야 할 잔여 금액이 없는 경우 결제정보를 입력하지 않아도 됩니다.</h4><br>
					
					<div class="rowh3Box ib">
					<h3 class="rowh3 ib">제 2 조 결제 취소 및 환불</h3>
					</div><br>
					<h4 class="rowh4 ib">① 결제의 취소 및 환불 규정은 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법령을 준수합니다.</h4><br>
					<h4 class="rowh4 ib">② 결제의 취소는 프로젝트의 진행 기간 중에만 가능하며, 마감 기한이 지나면 취소 할 수 없습니다.</h4><br>
					<h4 class="rowh4 ib">③ 후원의 취소 등 기타 사정으로 인해 환불되는 금원은 원화로 지급되며, 제1조에 따라 사용한 포인트는 반환됩니다.</h4><br>
					<h4 class="rowh4 ib">④ 개별 서비스의 성격에 따라 회사는 별도 약관 및 이용조건에 따른 취소 및 환불 규정을 정할 수 있으며, 이 경우 개별 약관 및 이용조건 상의 취소 및 환불규정이 우선 적용됩니다.</h4><br>
					<h4 class="rowh4 ib">⑤ 기타 본 약관 및 사이트의 이용안내에 규정되지 않은 취소 및 환불에 대한 사항에 대해서는 소비자피해보상규정에서 정한 바에 따릅니다.</h4><br>
					
					<div class="rowh3Box ib">
					<h3 class="rowh3 ib">제 3 조 프로젝트 실패 시 환불</h3>
					</div><br>
					<h4 class="rowh4 ib">회사는 회원이 참여한 프로젝트가 중도 철회 또는 신청한 목표금액을 충족시키지 못해 실패한 경우, 사유발생일로부터 영업일 기준 3일 이내에 기존에 이루어진 금액 결제에 대해 일괄적으로 취소 처리를 시행합니다. 단, 실제로 결제취소에 따른 환불 처리는 카드사 등 금융기관에 따라 완료되는 기간이 달라질 수 있습니다. 결제 취소 시 제1조에 따라 사용한 포인트는 반환됩니다.</h4><br>
					
					<div class="rowh3Box ib">
					<h3 class="rowh3 ib">제 4 조 취소 및 환불 수수료</h3>
					</div><br>
					<h4 class="rowh4 ib">① 회원의 단순 변심에 의하여 결제를 취소하는 경우 환불처리에 발생하는 수수료는 회원이 부담합니다.</h4><br>
					<h4 class="rowh4 ib">② 취소 및 환불 수수료는 결제 수단에 따라 다르게 처리되며, 취소 및 환불 수수료 부과 방법은 회사가 별도로 정한 규정에 따라 달라질 수 있습니다.</h4><br>
					
					
				</div>
				<div class="rowAgreeBox ib">
					<div class="rowAgree ib" data-cnt="0"></div>
					<h3 class="rowAgreeH3">본인은 위 리워드 서비스 결제 및 취소와 환불규정 등의 주의사항을 모두 읽어보았으며 이에 동의합니다.</h3>
				</div>
			</div>
			
			<div class="rowSubBox">
				<div class="rowStep ib">
					<div class="rowh3Box ib">
						<h3 class="rowh3 ib">제 3자에 대한 개인정보 제공 동의</h3>
					</div><br>
					<h4 class="rowh4 ib">'펀딩하기'를 통한 결제 및 리워드 전달 서비스를 제공하기 위해, 이용자의 사전 동의 아래 제3자(프로젝트 메이커)에게 제공합니다.<br>
					메이커에게 전달되는 개인 정보는 기재된 목적 달성 후 파기에 대한 책임이 메이커에게 있으며, 파기하지 않아 생기는 문제에 대한 법적 책임은 메이커에게 있습니다.<br>
					아래 내용에 대하여 동의를 거부하실 수 있으며, 거부 시 서비스 이용이 제한됩니다. </h4>
				</div>
				<div class="rowAgreeBox ib">
					<div class="rowAgree ib" data-cnt="0"></div>
					<h3 class="rowAgreeH3">본인은 제3자에 대한 개인정보제공에 동의합니다.</h3>
				</div>
			</div>
			
			<div class="rowSubBox">
				<div class="rowStep ib">
					<div class="rowh3Box ib">
						<h3 class="rowh3 ib">책임 규정</h3>
					</div><br>
					<h4 class="rowh4 ib">SB mall은 플랫폼을 제공하는 중개자(통신판매중개자)로 크라우드펀딩을 받는 당사자가 아닙니다. 
					보상품 제공 등에 관한 지연, 제품의 하자 등으로 인한 일체의 법적책임은 펀딩을 받는 프로젝트 개설자가 부담합니다. 
					하지만, 와디즈는 프로젝트 진행자와 후원자간의 원활한 의사소통을 위해 최선의 노력을 다하고 있습니다.</h4>
				</div>
				<div class="rowAgreeBox ib">
					<div class="rowAgree ib" data-cnt="0"></div>
					<h3 class="rowAgreeH3">본인은 위 내용을 확인하였으며 이에 동의합니다.</h3>
				</div>
			</div>
		
		</div>
		
		<div class="doFundingBox">
			<button type="button" id="orderBtn" class="doFunding">결제하기</button>
		</div>
		
		<form method="post" id="orderForm"></form>
	
	</div>
</div>



</body>
</html>