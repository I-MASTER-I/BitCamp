<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-1.10.0.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/crowdOrder.css">
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Order</title>

<script>
	var crOrderDetailNo;
	
	$(document).ready(function(){
		
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
			}else{
				$(this).find('.checked').remove();
				$(this).css('border','1px solid #a0a0a0');
			}
			
		})
		
		$('.doFunding').on('click',function(){
			var agree = $('.checked').length;/* 3이여야 함 */
			
			if(agree==3){
				
				/* orderDetail 추가 */
				orderDetailNum = guid()+"OD";
				var userSeq = $('.userSeq').html();
				var totalAmount = $('.totalAmount').html();
				var cardNo = $('.cardNo1').val()+$('.cardNo2').val()+$('.cardNo3').val()+$('.cardNo4').val();
				var yearDay = $('.yearDay').val();
				var cardPassword = $('.cardPassword').val();
				var birthNo = $('.birthNo').val();
				var zipCode = $('.zipCode').val();
				var orderAddress1 = $('.address1').val();
				var orderAddress2 = $('.address2').val();
				var orderPhone = $('.orderPhone').val();
				var orderRequest = $('.orderRequest').val();
				var orderName = $('.orderName').val();
				
				var detailForm = 
					'<input type="hidden" name="orderDetail.orderDetailNum" value="'+orderDetailNum+'">'
					+'<input type="hidden" name="orderDetail.userSeq" value="'+userSeq+'">'
					+'<input type="hidden" name="orderDetail.totalAmount" value="'+totalAmount+'">'
					+'<input type="hidden" name="orderDetail.cardNo" value="'+cardNo+'">'
					+'<input type="hidden" name="orderDetail.yearDay" value="'+yearDay+'">'
					+'<input type="hidden" name="orderDetail.cardPassword" value="'+cardPassword+'">'
					+'<input type="hidden" name="orderDetail.birthNo" value="'+birthNo+'">'
					+'<input type="hidden" name="orderDetail.zipCode" value="'+zipCode+'">'
					+'<input type="hidden" name="orderDetail.orderAddress1" value="'+orderAddress1+'">'
					+'<input type="hidden" name="orderDetail.orderAddress2" value="'+orderAddress2+'">'
					+'<input type="hidden" name="orderDetail.orderPhone" value="'+orderPhone+'">'
					+'<input type="hidden" name="orderDetail.orderRequest" value="'+orderRequest+'">'
					+'<input type="hidden" name="orderDetail.orderName" value="'+orderName+'">';
					
				$('#orderDetailForm').append(detailForm);
				
				/* order 추가 */
				var bagCnt=0;
				$('.orderBag').each(function(index){
					var crOrderDetailNoFK = orderDetailNum;
					var salerSeq = $(this).find('.userSeq').html();
					var crowdBoardSeq = $(this).find('.crowdBoardSeq').html();
					var goodsNo = $(this).find('.goodsNo').html();
					var optionSeq = $(this).find('.optionSeq').html();
					var quantity = $(this).find('.quantity').html();
					var onePrice = $(this).find('.onePrice').html();
					var salePrice = $(this).find('.salePrice').html();
					
					var orderAppend = 
						'<input type="hidden" name="orderList['+bagCnt+'].orderDetailNum" value="'+crOrderDetailNoFK+'">'
						+'<input type="hidden" name="orderList['+bagCnt+'].userSeq" value="'+salerSeq+'">'
						+'<input type="hidden" name="orderList['+bagCnt+'].crowdBoardSeq" value="'+crowdBoardSeq+'">'
						+'<input type="hidden" name="orderList['+bagCnt+'].goodsNo" value="'+goodsNo+'">'
						+'<input type="hidden" name="orderList['+bagCnt+'].optionSeq" value="'+optionSeq+'">'
						+'<input type="hidden" name="orderList['+bagCnt+'].quantity" value="'+quantity+'">'
						+'<input type="hidden" name="orderList['+bagCnt+'].onePrice" value="'+onePrice+'">'
						+'<input type="hidden" name="orderList['+bagCnt+'].salePrice" value="'+salePrice+'">';
						
					$('#orderDetailForm').append(orderAppend);
					bagCnt++;
						
				})
				alert("결제 예약이 완료되었습니다.");
				$('#orderDetailForm').submit();
				
				
				
				
			}else{
				alert("결제 내용에 동의후 진행 가능합니다.");
			}
			
			
			
			
			
			
			
			
		})
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	})/* ready end */
	
	
	/* price 숫자면 받기 */
	function mathABS(e) {
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
	}
	
	/* 코드생성 */
	function guid() {
		  
	      timestamp = new Date().getTime();
	      return timestamp;
	   }
	
	
	


</script>

</head>
<body>
	<div class="commonBannerBox">
		<h3 class = rowdCommonBannerH3>CrowdOrder</h3>
	</div>
<div class="orderSuperBox">
	
	<div class="orderHeadBox">
		<h1 class="orderHeadLine">주문 / 결제</h1>
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
	<c:forEach var="orderList" items="${orderList.orders}">
	
		<div class="orderUnitBox orderBag">
			<h3 class="hidden crowdBoardSeq">${orderList.crowdBoardSeq}</h3>
			<h3 class="hidden userSeq">${orderList.userSeq}</h3>
			<h3 class="hidden goodsNo">${orderList.goodsNo}</h3>
			<h3 class="hidden optionSeq">${orderList.optionSeq}</h3>
			
			<div class="orderImgbox ib">
				<img class="orderImg" src="${orderList.crGoodsImg}">
			</div>
			
			<div class="orderTitlebox ib">
				<h1 class="orderTitle ib">${orderList.goodsName}</h1><br>
				<h3 class="orderSubLine ib">${orderList.opt1Name}</h3>
				<h3 class="orderSubLine ib">${orderList.opt2Name}</h3>
			</div>
			
			<div class="quantityBox ib">
				<h3 class="hidden quantity">${orderList.quantity}</h3>
				<h3 class="quantityF ib">${orderList.quantity}개</h3>
			</div>
			
			<div class="salesBox ib">
				<h2 class="hidden onePrice">${orderList.onePrice}</h2>
				<h2 class="salesPriceF ib"><fmt:formatNumber value="${orderList.onePrice}" pattern="#,###"/>원</h2>
			</div>
			
			<div class="totalBox ib">
				<div class="totalPriceBox ib">
					<h2 class="hidden salePrice">${orderList.salePrice}</h2>
					<h2 class="totalPriceF ib"><fmt:formatNumber value="${orderList.salePrice}" pattern="#,###"/>원</h2><br>
				</div>
				<h4 class="totalPriceD ib">(${orderList.quantity}x<fmt:formatNumber value="${orderList.onePrice}" pattern="#,###"/>원)</h4>
			</div>
			
			<div class="salerBox ib">
				<h4 class="delivery ib">무료</h4><br>
				<h4 class="saler ib">${orderList.userName}</h4>
			</div>
			
		</div>
	</c:forEach>
	
		<!-- 최종 결제금액 -->
		<div class="finalPriceBox ib">
			<h3 class="finalPriceTitle ib">최종결제금액</h3>	
			<h1 class="finalPriceF ib"><fmt:formatNumber value="${totalAmount}" pattern="#,###"/></h1>
			<h3 class="finalPriceWon ib">원</h3>
			
			<h3 class="hidden totalAmount">${totalAmount}</h3>
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
					<h3 class="ODtitle ib">SNS수신 동의</h3>
				</div>
				<div  class="ODbasicInfo ib">
					<input class="basicRadio ib" type="radio" name="agree"><h3 class="agree ib">예</h3>
					<input class="basicRadio ib" type="radio" name="agree"><h3 class="disagree ib">아니오</h3>
					<h3 class="basicAgree ib">(${memberInfo.phone}/${memberInfo.userId})</h3>
					<h5 class="subText ib">모바일 거래정보 알리미가 설정되어 있을 경우 SMS는 발송되지 않으며 알리미만 발송됩니다.</h5>
				</div>
			</div>
		</div>
	
		<div class="OStep1Box">
			<h3 class="OstepNo">3</h3>
			<h3 class="OStep1">결제 정보 입력</h3>
		</div>
		
		<div class="noticeBox ib">
			<h3 class="notice1 ib notiPoint">SB리워드 펀딩</h3><h3 class="notice1 ib">은 결제예약 시스템을 이용합니다.</h3><br>
			<h5 class="notice2 ib">쇼핑하기처럼 바로 결제되지 않습니다. 프로젝트의 성공여부에 따라 결제가 실행됩니다.</h5><br>
			<h5 class="notice2 ib">결제정보 입력 후 결제예약을 완료하시면, 결제대기중으로 예약상태로 등록됩니다.</h5><br>
			<h5 class="notice2 ib">프로젝트 종료일(2018.12.06) 의 다음 영업일에 펀딩 성공여부에 따라 결제실행/결제취소가 진행됩니다.</h5><br>
			<h5 class="notice2 ib">포인트를 사용하여 총 결제금액이 0원인 경우에는 결제정보를 입력할 필요 없이 결제완료로 처리됩니다.</h5><br>
		</div>
		
		<!-- 펀딩 결제 정보 -->
		<div class="paySuperBox">
			<div class="paymentInfoBox ib">
				<!-- 카드번호 -->
				<div class="payUnit ib">
					<h3 class="payTitle ib">신용(체크)카드번호</h3><br>
					<div class="between">
						<div class="payInput ib">
							<input class="cardNoInput cardNo1" type="number" oninput="mathABS(this)">
						</div>
						<div class="payInput ib">
							<input class="cardNoInput cardNo2" type="password" oninput="mathABS(this)">
						</div>
						<div class="payInput ib">
							<input class="cardNoInput cardNo3" type="password" oninput="mathABS(this)">
						</div>
						<div class="payInput ib">
							<input class="cardNoInput cardNo4" type="number" oninput="mathABS(this)">
						</div>
					</div>
				</div><br>
				
				<!-- 유효기간 -->
				<div class="payUnit ib between">
					<div class="cardPiece ib">
						<h3 class="payTitle ib">유효기간</h3><br>
						<div class="payInput ib">
							<input class="dateInput yearDay" type="number" oninput="mathABS(this)">
						</div>
					</div>
					<div class="cardPiece ib">
						<h3 class="payTitle ib">카드 비밀번호</h3><br>
						<div class="payInput ib">
							<input class="passwordInput cardPassword" type="password" oninput="mathABS(this)">
						</div>
					</div>
				</div>
				
				<!--  생년월일 -->
				<div class="payUnit ib">
					<div class="birthPiece ib">
						<h3 class="payTitle2 ib">생년월일 (주민번호 앞 6자리)</h3><br>
						<h4 class="paySubTitle ib">무기명 법인카드는 사업자등록번호 10자리를 입력하세요.</h4>
					</div><br>
					<div class="payInput ib">
						<input class="birthInput birthNo" type="number" oninput="mathABS(this)">
					</div>
				</div><br>
			</div>
			
			<div class="attentionBox ib">
				<h3 class="attention1 ib">결제 예약시 유의사항</h3><br>
				<h5 class="attention2 ib">결제실행일에 결제자 귀책사유(카드재발급, 한도초과, 이용정지 등)로 인하여 결제가 실패할 수 있으니, 결제수단이 유효한지 다시 한번 확인하세요.</h5><br>
				<h5 class="attention2 ib">1차 결제 실패 시 실패일로부터 3 영업일 동안 재 결제를 실행합니다. 결제 실패 알림을 받으면, 카드사와 카드결제 불가 사유(한도초과 또는 카드재발급 등)를 확인해 주세요.</h5><br>
				<h5 class="attention2 ib">결제 예약 이후, 결제할 카드를 변경하려면 마이페이지 > 나의 리워드의 결제정보에서 카드정보를 변경해주세요.</h5><br>
				<h5 class="attention2 ib">1차 결제 실패 이후 3 영업일 동안 재 결제를 시도합니다. 결제가 정상적으로 실행되지 않으면, 펀딩 참여가 취소됩니다.</h5>
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
					<div class="rowAgree ib"></div>
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
					<div class="rowAgree ib"></div>
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
					<div class="rowAgree ib"></div>
					<h3 class="rowAgreeH3">본인은 위 내용을 확인하였으며 이에 동의합니다.</h3>
				</div>
			</div>
		
		</div>
		<div class="doFundingBox">
			<a class="doFunding">결제 예약하기</a>
		</div>
		
		<form action="<%=request.getContextPath()%>/crowd/crowdOrderDetail" method="post" id="orderDetailForm" >
			
		</form>
	
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

</body>
</html>