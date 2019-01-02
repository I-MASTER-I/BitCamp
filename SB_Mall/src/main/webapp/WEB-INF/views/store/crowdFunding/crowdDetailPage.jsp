<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/crowdDetail.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/crowdReply.css">
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>EarlyBird</title>
<script type="text/javascript">
	var goodsList = 0;
	var opt1List = 0;
	var opt2List = 0;
	var bAdd=1;
	
	var userSeq;
	
	var boardSeq;
	
	var goodsName;
	var goodsPrice;
	var goodsNo;
	var goodsImg;
	
	var opt1Name;
	var opt1Price;
	var opt2Name;
	var opt2Price;
	var optSeq;
	
	var bagCount;
	
	$(document).ready(function(){
		boardSeq = $('.boardSeq').html();
		
		/* 상품리스트 열기 */
		$('.goods').on('click',function(){
			if(goodsList == 0){
				$('.goodsListBox').css('display','inline-block');
				goodsList++;
			}else{
				$('.goodsListBox').css('display','none');
				goodsList--;
			}
			
			if(opt1List==1){
				$('.opt1PickListBox').css('display','none');
				opt1List--;
			}
			if(opt2List==1){
				$('.opt2PickListBox').css('display','none');
				opt2List--;
			}
			
		})
		
		/* 옵션1 열기 */
		$('.opt1').on('click',function(){
			if(opt1List == 0){
				$('.opt1PickListBox').css('display','inline-block');
				opt1List++;
			}else{
				$('.opt1PickListBox').css('display','none');
				opt1List--;
			}
			if(goodsList==1){
				$('.goodsListBox').css('display','none');
				goodsList--;
			}
			if(opt2List==1){
				$('.opt2PickListBox').css('display','none');
				opt2List--;
			}
		})
		
		/* 옵션2 열기 */
		$('.opt2').on('click',function(){
			if(opt2List == 0){
				$('.opt2PickListBox').css('display','inline-block');
				opt2List++;
			}else{
				$('.opt2PickListBox').css('display','none');
				opt2List--;
			}
			if(goodsList==1){
				$('.goodsListBox').css('display','none');
				goodsList--;
			}
			if(opt1List==1){
				$('.opt1PickListBox').css('display','none');
				opt1List--;
			}
		})
		
		/* 상품 선택시 */
		$('.goodsList').on('click',function(){
			userSeq = $('.userSeq').html();
			goodsNo = $(this).find('.goodsNo').html();
			goodsImg = $(this).find('.goodsImg').attr('src');
			
			goodsName = $(this).find('.goodsName').html();
			goodsPrice = $(this).find('.goodsPrice').html();
			goodsNo = $(this).find('.GoodsNo').html();
			var ProSeq = $(this).find('.ProductSeq').html();
			
			$('.goodsPickName').html(goodsName);
			$('.goodsPickPrice').html(commaUnit(goodsPrice)+"원");
			$('.goods').trigger('click');
			$('.goods').css('background-color','#ffc828');
			$('.goodsOCity').css('opacity','0.6');
			
			/* goodsPrice = goodsPrice.substr(0,goodsPrice.length-1); */
			
			$.ajax({
				url:"<%=request.getContextPath()%>/crowd/detail/opt1",
				type: "get",
				data: {goodsNo : goodsNo, ProSeq:ProSeq},
				error:function(){
					alert("error")
				},
				success:function(data){
					var opt1List = $(data).filter('.opt1List').html();
					$('.opt1PickListBox').html(data);
					opt1Event();
					$('.opt1PickBox').css('display','inline-block');
					$('.opt1').trigger('click');
				}
			})
		})/* 상품 선택 후 */
		
		
		/* opt1 이벤트 연결 */
		function opt1Event(){
			$('.opt1List').off();
			$('.opt1List').on('click',function(){
				opt1Name = $(this).find('.opt1Name').html();
				opt1Price = $(this).find('.opt1Price').html();
				optSeq = $(this).find('.optionSeq').html();
				var goodsFk = $(this).find('.GoodsNoFk').html();
				
				$('.opt1PickName').html(opt1Name);
				$('.opt1PickPrice').html(commaUnit(opt1Price)+"원");
				
				$('.opt1').trigger('click');
				$('.opt1').css('background-color','#ffc828');
				$('.opt1OCity').css('opacity','0.6');
				
				/* opt1Price = opt1Price.substr(1,opt1Price.length-2); */
				
				$.ajax({
					url:"<%=request.getContextPath()%>/crowd/detail/opt2",
					type: "get",
					data: {goodsNo : goodsFk, opt1Name : opt1Name},
					error:function(){
						alert("error")
					},
					success:function(data){
						var opt2List = $(data).filter('.opt2List').html();
						$('.opt2PickListBox').html(data);
						opt2Event();
						$('.opt2PickBox').css('display','inline-block');
						$('.opt2').trigger('click');
					}
				})
				
			})
		}
		
		
		
		/* opt2 이벤트 연결 */
		function opt2Event(){
			$('.opt2List').off();
			$('.opt2List').on('click',function(){
				var check = true;
				optSeq = $(this).find('.optSeq').html();
				
				$('.bag').each(function(index){
					if(optSeq==$(this).find('.bagOptSeq').html()){
						check=false;
						$(this).find('.bAddPlu').trigger('click');
					}
				})
				
				if(check){
					opt2Name = $(this).find('.opt2Name').html();
					opt2Price = $(this).find('.opt2Price').html();
					optSeq = $(this).find('.optSeq').html();
					
					/* opt2Price = opt2Price.substr(1,opt2Price.length-2); */
					
					var resultPrice = Number(goodsPrice)+Number(opt1Price)+Number(opt2Price);
					var jsPrice = commaUnit(resultPrice);
					
					var bag = 
							'<!-- bag시작 -->'
							+'<div class="bag bAdd'+bAdd+'">'
							+'	<!-- 수량 -->'
							+'	<div class="bagQuanBox">'
							+'		<div class="bAddMin" bAdd="bAdd'+bAdd+'">-'
							+'		</div><div class="bAddQuan">1'
							+'		</div><div class="bAddPlu" bAdd="bAdd'+bAdd+'">+</div>'
							+'	</div>'
								
							+'	<!-- 상품 이미지 -->'
							+'	<div class="bagImgBox">'
							+'		<img src="'+goodsImg+'" class="bagImg">'
							+'	</div>'
								
							+'	<!-- 상품정보 -->'
							+'	<div class="bagGoodsBox">'
									
							+'		<h4 class="bagGoodsName">'+goodsName+'</h4>'
									
							+'		<h5 class="bagOpt1Name">'+opt1Name+'</h5>'
							+'		<h5 class="bagOpt2Name">'+opt2Name+'</h5>'
									
							+'		<h6 class="bagHidden bagBoardSeq">'+boardSeq+'</h6>'
							+'		<h6 class="bagHidden bagUserSeq">'+userSeq+'</h6>'
							+'		<h6 class="bagHidden bagGoodsNo">'+goodsNo+'</h6>'
							+'		<h6 class="bagHidden bagOptSeq">'+optSeq+'</h6>'
									
							+'	</div>'
								
							+'	<!-- 상품 가격 -->'
							+'	<div class="bagPriceBox">'
							+'		<h4 class="bagHidden salePrice">'+resultPrice+'</h4>'
							+'		<h4 class="bagHidden onePrice">'+resultPrice+'</h4>'
							+'		<h4 class="bagPrice">'+jsPrice+'</h4>'
							+'		<h4 class="bagPriceWon">원</h4>'
							+'	</div>'
								
							+'	<!-- 상품 삭제 -->'
							+'	<div class="bagDelBox">'
							+'		<a class="bAddDel" bAdd="bAdd'+bAdd+'" >x</a>'
							+'	</div>'
							
							+'</div><!--  bag끝  -->';
					
					$('.bagBox').append(bag);
					bagEvent();
					bAdd++;
					$('.fundingBtnBox').css('background-color','#ffc828');
				}else{
					
				}
				
				afterBagAdd();
				
				/* 토탈금액 계산 */
				getSalePrice();
				$('.resultBigBox').show();
				
				
			})
		}
		
		/* bag 이벤트 연결 */
		function bagEvent(){
			$('.bAddMin').off();
			$('.bAddPlu').off();
			$('.bAddDel').off();
			
			$('.bAddMin').on('click',function(){
				var bAdd = $(this).attr('bAdd');
				var quan = $('.'+bAdd+'').find('.bAddQuan').html();
				var price = $('.'+bAdd+'').find('.onePrice').html();
				
				
				if(quan>1){
					quan--;
					var salePrice = price*quan;
					var jsPrice = commaUnit(salePrice); 
					$('.'+bAdd+'').find('.bAddQuan').html(quan);
					$('.'+bAdd+'').find('.salePrice').html(salePrice);
					$('.'+bAdd+'').find('.bagPrice').html(jsPrice);
					getSalePrice();
				}
				
			})
			
			
			$('.bAddPlu').on('click',function(){
				var bAdd = $(this).attr('bAdd');
				var quan = $('.'+bAdd+'').find('.bAddQuan').html();
				var price = $('.'+bAdd+'').find('.onePrice').html();
				
				if(quan<99){
					quan++;
					var salePrice = price*quan;
					var jsPrice = commaUnit(salePrice); 
					$('.'+bAdd+'').find('.bAddQuan').html(quan);
					$('.'+bAdd+'').find('.salePrice').html(salePrice);
					$('.'+bAdd+'').find('.bagPrice').html(jsPrice);
					getSalePrice();
				}
				
			})
			
			
			$('.bAddDel').on('click',function(){
				var bAdd = $(this).attr('bAdd');
				var check = confirm("상품을 삭제하시겠습니까?");
				if(check){
					/* 해당 bag삭제 */
					$('.'+bAdd+'').remove();
                    
					/* bag의 갯수만큼 for문으로 total금액 구하기 */
                    getSalePrice();
					
					/* bag이 없으면 펀딩금액 숨기기 */
					var bagLength = $('.bag').length;
                    if(bagLength==0){
                        $('.resultBigBox').hide();
                        $('.fundingBtnBox').css('background-color','#dcdcdc');
                    }
				}
			})
			
			
			
			
		}/* bag이벤트 끝 */
		
		
		
		function afterBagAdd(){
			
			/* 리스트 혹시나 열려 있으면 닫기 */
			if(goodsList==1){
				$('.goodsListBox').css('display','none');
				goodsList--;
			}
			if(opt1List==1){
				$('.opt1PickListBox').css('display','none');
				opt1List--;
			}
			if(opt2List==1){
				$('.opt2PickListBox').css('display','none');
				opt2List--;
			}
			/* 옵션 리스트 초기화 */
			$('.opt1PickListBox').html('');
			$('.opt2PickListBox').html('');
			
			/* 상품 관련 초기화 */
			$('.goodsPickName').html('');
			$('.goodsPickPrice').html('');
			$('.goods').css('background-color','#dcdcdc');
			$('.goodsOCity').css('opacity','1');
			
			/* opt1 관련 초기화 */
			$('.opt1PickName').html('');
			$('.opt1PickPrice').html('');
			$('.opt1').css('background-color','#dcdcdc');
			$('.opt1OCity').css('opacity','1');
			
			/* 옵션리스트 다시 숨기기 */
			$('.opt1PickBox').css('display','none');
			$('.opt2PickBox').css('display','none');
			
		}
		
		function getSalePrice(){
			/* 총 펀딩금액 관련 */
			bagCount = $('.bag');
			var allsalePrice=0;
			$(".bag").each(function(index){
				var $this = $(this);
				var salePrice = $this.find(".salePrice").html();
				allsalePrice += Number(salePrice);
			})
			$('.resultPrice').html(commaUnit(allsalePrice));
		}
		
		
		
		/* 썸네일 이미지 클릭시 */
		$('.cImg').on('click',function(){
			var src = $(this).attr('src');
			$('.thumBigImg').attr('src',src);
		})
		
		/*  #,###으로 만들기 */
		function comma(num){
		    var len, point, str; 
		       
		    num = num + ""; 
		    point = num.length % 3 ;
		    len = num.length; 
		   
		    str = num.substring(0, point); 
		    while (point < len) { 
		        if (str != "") str += ","; 
		        str += num.substring(point, point + 3); 
		        point += 3; 
		    } 
		    return str;
		}
		
		/*  #,###으로 만들기 */
		function commaUnit(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		$('.loveImg').on('mouseover',function(){
			$(this).attr('src',"<%=request.getContextPath()%>/img/like01.png");
        })
		$('.loveImg').on('mouseout',function(){
			$(this).attr('src',"<%=request.getContextPath()%>/img/like02.png");
        })
        
        
        $('.fundingBtn').on('click',function(){
        	var bagLength = $('.bag').size();
    		var inputCnt=0;
        	
        	if(bagLength>0){
        		$('.bag').each(function(){
        			
        			var userSeq = $(this).find('.bagUserSeq').html();
        			var crowdBoardSeq=$(this).find('.bagBoardSeq').html();
        			var goodsNo=$(this).find('.bagGoodsNo').html();
        			var goodsName=$(this).find('.bagGoodsName').html();
        			var crGoodsImg=$(this).find('.bagImg').attr('src');
        			var optionSeq=$(this).find('.bagOptSeq').html();
        			var opt1Name=$(this).find('.bagOpt1Name').html();
        			var opt2Name=$(this).find('.bagOpt2Name').html();
        			var quantity=$(this).find('.bAddQuan').html();
        			var onePrice=$(this).find('.onePrice').html();
        			var salePrice=$(this).find('.salePrice').html();
        			
        			var inputAdd=
        				'<input type="hidden" name="orders['+inputCnt+'].userSeq" value="'+userSeq+'">'
        				+'<input type="hidden" name="orders['+inputCnt+'].crowdBoardSeq" value="'+crowdBoardSeq+'">'
        				+'<input type="hidden" name="orders['+inputCnt+'].goodsNo" value="'+goodsNo+'">'
        				+'<input type="hidden" name="orders['+inputCnt+'].goodsName" value="'+goodsName+'">'
        				+'<input type="hidden" name="orders['+inputCnt+'].crGoodsImg" value="'+crGoodsImg+'">'
        				+'<input type="hidden" name="orders['+inputCnt+'].optionSeq" value="'+optionSeq+'">'
        				+'<input type="hidden" name="orders['+inputCnt+'].opt1Name" value="'+opt1Name+'">'
        				+'<input type="hidden" name="orders['+inputCnt+'].opt2Name" value="'+opt2Name+'">'
        				+'<input type="hidden" name="orders['+inputCnt+'].quantity" value="'+quantity+'">'
        				+'<input type="hidden" name="orders['+inputCnt+'].onePrice" value="'+onePrice+'">'
        				+'<input type="hidden" name="orders['+inputCnt+'].salePrice" value="'+salePrice+'">';
        			$('.realForm').append(inputAdd);
        			inputCnt++;
        		})
        		console.log($('.realForm').html());
        		$('.realForm').submit();
        		
        	}else{
        		alert("구매하실 상품을 선택해주세요") 
        	}
        })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
		
	})
	
	
	


</script>

</head>
<body>
	<div class="commonBannerBox">
		<h3 class = rowdCommonBannerH3>CrowdDetail</h3>
	</div>
	<!-- 게시판 레이아웃 -->
	<div class="BDBigLayout">
		<!-- 상품 이미지 및 정보 -->
		<div class="BDtopLayout">
			<!-- 이미지 -->
			<div class="BDImgBox">
				<!-- 큰 이미지 -->
				<div class="thumBigImgBox">
					<img class="thumBigImg" src="${photo[0].crPhotoList}">
				</div><br>
				<!-- 썸네일 이미지 -->
				<div class="thumBox">
					
					<c:forEach var="photo" items="${photo}" end="5" varStatus="count">
						<div class="thumMiniBox ">
							<img class="thumImg cImg" src="${photo.crPhotoList}">
						</div>
					</c:forEach>
					
					<c:forEach var="photo" begin="1" end="${photoCnt}" step="1">
						<div class="thumMiniBox">
							<img class="thumImg" src="http://sbmallstore.com/file/crproduct/1545810459647noImage2.png">
						</div>
					</c:forEach>
					
				</div>
			</div>
			 
			<!--  상품 정보  -->
			<div class="BDInfoLayout">
				<!-- productNo -->
				<div class="prNoBox">
						<h6 class="prNo">상품번호&nbsp;&nbsp;:&nbsp;</h6>
						<h6 class="prNo">${boardPro[0].productNo}</h6>
						<h6 class="hiddenPick boardSeq">${boardPro[0].crowdBoardSeq}</h6>
				</div>
				
				<!-- title -->
				<div class="BDTitleBox">
					<h1 class="BDTitle">${boardPro[0].crProductName}</h1>
				</div>
				
				<!-- 평점 , 조회수 ㅋ -->
				<div class="ratingBixBox">
					<!-- 평점 -->
					<div class="ratingPart">
						<c:choose>
							<c:when test="${Rating.top!=0}">
								<c:forEach begin="1" end="${Rating.top}" varStatus="count">
									<img class="ratingImg ratingTop" alt="${Rating.top}" src="<%=request.getContextPath()%>/img/star.png">
								</c:forEach>
								
								<c:if test="${Rating.mid!=0}">
									<img class="ratingImg ratingMid" src="<%=request.getContextPath()%>/img/star${Rating.mid}.png">
								</c:if>
								
								<%-- <c:if test="${Rating.mid==0}">
									<img class="ratingImg ratingMid" src="<%=request.getContextPath()%>/img/star_em.png">
								</c:if> --%>
								
								<c:if test="${Rating.bottom!=0}">
									<c:forEach begin="1" end="${Rating.bottom}">
										<img class="ratingImg raqtingBottom" alt="${Rating.bottom}" src="<%=request.getContextPath()%>/img/star_em.png">
									</c:forEach>
								</c:if>
							</c:when>
							<c:when test="${Rating.top==0}">
								<c:forEach begin="1" end="5" >
									<img class="ratingImg" src="<%=request.getContextPath()%>/img/star_em.png">
								</c:forEach>
							</c:when>
						</c:choose>
						<h5 class="ratingH5">${Rating.top}.${Rating.mid}</h5>
						<h6 class="ratingH6">(${Rating.count})</h6>
					</div>
					
					<!-- 좋아요 -->
					<div class="loveBox">
						<h5 class="like">Like</h5>
						<a class="doLoving">
							<img class="loveImg" src="<%=request.getContextPath()%>/img/like02.png">
						</a>
					</div>
					
					<!-- 조회수 -->
					<div class="viewSeqBox">
						<img class="viewSeqImg" src="<%=request.getContextPath()%>/img/viewSeq01.png">
						<h6 class="viewSeqH6">${viewSeq}</h6>
					</div>
				</div>
				
				<!-- 가격 및 배송정보 -->
				<div class="basicInfoBox">
					<div class="priceInfoBox">
						<h4 class="hidden price">${boardPro[0].crPrice}</h4>
						<h4 class="priceF">
						<fmt:formatNumber value="${boardPro[0].crPrice}" pattern="#,###"/></h4>
						<h6 class="won">원</h6>
					</div>
					<div class="deliInfoBox">
						<h4 class="deli">본 상품은</h4>
						<h4 class="deliDate">${data}</h4>
						<h4 class="deli">이후 일괄 배송됩니다.</h4><br>
						<h4 class="deliMini">배송비 : 무료 | 도서산간배송비 추가</h4>
					</div>
				</div>
				
				<!-- 상품 옵션 선택 박스 -->
				<div class="AllSelectBox"> 
					<!-- goods선택 -->
					<div class="SbigBox goodsBox">
					
						<div class="Sbox goods"> <!-- 옵션 클릭시 리스트 보여줌 -->
						
							<h3 class="Stitle goodsOCity">상품</h3>
							<h3 class="Spick goodsPickName"></h3>
							<h3 class="Spick2 goodsPickPrice"></h3>
							<h6 class="hiddenPick userSeq">${boardPro[0].userSeq}</h6>
							<div class="SimgBox">
								<img alt="" class="Simg" src="<%=request.getContextPath()%>/img/optBtn.png">
							</div>
						</div>
						<div class="SLbigbox goodsListBox">
							<c:forEach var="goods" items="${goods}">
							
								<!-- 셀렉트 리스트 박스 -->
								<div class="SL goodsList">
								
									<!-- 셀렉트 왼쪽 -->
									<div class="SLleft">
										<div class="SLbox goodsImgBox">
											<h6 class="hidden GoodsNo">${goods.goodsNo}</h6>
											<h6 class="hidden ProductSeq">${goods.crProductSeq}</h6>
											<img class="SLimg goodsImg" src="${goods.goodsPhoto}">
										</div>
										<h3 class="SLname goodsName">${goods.goodsName}</h3>
									</div>
									
									<!-- 셀렉트 오른쪽 -->
									<div class="SLright">
										<h3 class="hidden goodsPrice">${goods.crGoodsPrice}</h3>
										<h3 class="SLprice"><fmt:formatNumber value="${goods.crGoodsPrice}" pattern="#,###"/>원</h3>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				
					<!-- 옵션1 -->
					<div class="opt1PickBox">
					
						<div class="Sbox opt1"> <!-- 옵션 클릭시 리스트 보여줌 -->
						
							<h3 class="Stitle opt1OCity">옵션01</h3>
							<h3 class="Spick opt1PickName"></h3>
							<h3 class="Spick2 opt1PickPrice"></h3>
							<div class="SimgBox">
								<img alt="" class="Simg" src="<%=request.getContextPath()%>/img/optBtn.png">
							</div>
						</div>
						
						<div class="SLbigbox opt1PickListBox"> <!-- 옵션1 들어올 공간 -->
							<div class="SL opt1List">
							
							</div>
						</div>
					</div>
				
				
					<!-- 옵션2 -->
					<div class="opt2PickBox">
					
						<div class="Sbox opt2"> <!-- 옵션 클릭시 리스트 보여줌 -->
						
							<h3 class="Stitle opt2OCity">옵션02</h3>
							<h3 class="Spick opt2PickName"></h3>
							<h3 class="Spick2 opt2PickPrice"></h3>
							<div class="SimgBox">
								<img alt="" class="Simg" src="<%=request.getContextPath()%>/img/optBtn.png">
							</div>
						</div>
						
						<div class="SLbigbox opt2PickListBox"> 
							<div class="SL opt2List"> <!-- 옵션1 들어올 공간 -->
							
							</div>
						</div>
					</div>
				</div><!-- 옵션선택박스 끝 -->
				
				<!-- 옵션 선택이 끝난 상품 -->
				<div class="bagBigBox">
					<div class="bagBox">
						
					</div>
				</div>
				
				<div class="resultBigBox">
					<!-- 총 금액 텍스트 -->
					<div class="resultTitleBox">
						<h3 class="resultTitle">총 펀딩금액</h3>
					</div>
					
					<!-- 총 금액 -->
					<div class="resultPriceBox">
						<h1 class="resultPrice"></h1>
						<h4 class="resultPriceWon">원</h4>
					</div>
				</div>
				
				<!-- 장바구니, 바로구매 -->
				<div class="fundingBigBox">
					<div class="fundingBtnBox">
						<a class="fundingBtn">펀딩하기</a>
					</div>
				</div>
				
				<form action="<%=request.getContextPath()%>/crowd/crowdOrder" method="post" class="realForm">
				
				</form>
				
				
				
			</div>
		</div>
		
		<!-- 상품 디테일 설명 -->
		<div class="proDetailBox">
			<div class="detTitleBox">
				<h1 class="detTitle">상품상세</h1>
			</div>
			<!-- 디테일 내용 -->
			<div class="detContent">
				${boardPro[0].text}
			</div>
		
			<!-- 상품 배송관련 -->
			<div>
				<img class="delivImg" src="<%=request.getContextPath()%>/img/delivery01.png">
			</div>
		</div>
		
		
		
		
	
	</div>

<%@ include file="/WEB-INF/views/store/crowdFunding/crowdReply.jsp" %>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%@ include file="/WEB-INF/views/common/header.jsp"%>



</body>
</html>
