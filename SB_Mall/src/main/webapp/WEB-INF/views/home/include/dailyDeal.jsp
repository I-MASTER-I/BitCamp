<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

  <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
  
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <script type="text/javascript" src="slick/slick.min.js"></script>


<script>

		var secOrigin;
		var minOrigin;
		var hourOrigin;
		
		var secNum;
		var minNum
		var hourNum;
		
	window.onload=function(){
		secOrigin=document.getElementById("sec").innerHTML;
		minOrigin=document.getElementById("min").innerHTML;
		hourOrigin=document.getElementById("hour").innerHTML;
		
		if(secOrigin>9){secNum=0;
		}else{secNum=Number(secOrigin);}
		
		if(minOrigin>9){minNum=0;
		}else{minNum=Number(minOrigin);}
		
		if(hourOrigin>9){hourNum=0;
		}else{hourNum=Number(hourOrigin);}
		
		function secCnt() {
			var sec = document.getElementById("sec");
			var min = document.getElementById("min");
			var hour = document.getElementById("hour");
			
			if(sec.innerHTML==59){
				sec.innerHTML="00";
				if(min.innerHTML==59){
					min.innerHTML="00";
					if(hour.innerHTML==24){
						hour.innerHTML = "01";
					}else{//일반 시 증가.
						if(hour.innerHTML<9){
							hourNum++;
							hour.innerHTML="0"+hourNum;
							if(hourNum==9){
								hourNum=0;
							}
						}else{
							hour.innerHTML=Number(hour.innerHTML)+1;
						}
					}
				}else{//일반 분 증가.
					if(min.innerHTML<9){
						minNum++;
						min.innerHTML="0"+minNum;
						if(minNum==9){
							minNum=0;
						}
					}else{
						min.innerHTML=Number(min.innerHTML)+1;
					}
				}
			}else{//일반 초 증가.
				if(sec.innerHTML<9){
					secNum++;
					sec.innerHTML="0"+secNum;
					if(secNum==9){
						secNum=0;
					}
				}else{
					sec.innerHTML=parseInt(sec.innerHTML)+1;
				}
			}
			setTimeout(secCnt, 1000);
		}
		secCnt(); 
		
		
		$('.dailyDealImg').on('click',function(){
			var alt = $(this).attr('alt');
			location.href="<%=request.getContextPath()%>/crowd/crowdDetail/"+alt;
		})
		
		
		
		
		
		
	}
	
	
</script>

<div class="defaultLayout dailyDeal">

	<!-- time count -->
	<h1 id="dealHeadline" class="fontOpenSans">Daily Deal</h1>
	
	<div id="timeBigBox">
		<div class="timeBox">
			<span class="timeZone timeText" id="hour">${hour}</span>
		</div>
		
		<span class="timeDot timeText">:</span>
		
		<div class="timeBox">
			<span class="timeZone timeText" id="min">${min}</span>
		</div>
		
		<span class="timeDot timeText">:</span>
		
		<div class="timeBox">
			<span class="timeZone timeText" id="sec">${sec}</span>
		</div>
	</div>
	
	
</div>

<!-- 슬라이더 div -->
	<%-- <div id="dailySliderBox" class="blue">
		<div class="slider center">
			<c:forEach var="deal" items="${dailyDeal}">
				<div class="dealsibal">
					<img class ="dailyDealImg" src="<%=request.getContextPath()%>/img/SBCompanyLogo.png">
					<h4>${deal.productName}</h4>
					<h6>${deal.price}won</h6>
					<h6><fmt:formatNumber value="${deal.price*0.94}" pattern="0"/>won</h6>
				</div>
			</c:forEach>
		</div>
	</div> --%>
	
<div class="dailyDealMidBox">
  <div class="content">
    <div class="slider center">
      <c:forEach var="crowdHome" items="${crowdHome}">
	      <div>
	        <div class="sibal">
				<img class ="dailyDealImg" alt="${crowdHome.crowdBoardSeq}" src="${crowdHome.crPhoto}">
					<h4 class="dailyDeal_h4">${crowdHome.title}</h4>
					<h6 class="dailyDeal_h6">
					<fmt:formatNumber value="${crowdHome.targetPrice}"  pattern="#,###"/>원</h6>
					
					<span class="homeRatingBar">
					<c:choose>
						<c:when test="${crowdHome.achieve<100}">
							<span class="homeRatingBarInner" style="width:${crowdHome.achieve}%"></span>
						</c:when>
						<c:otherwise>
							<span class="homeRatingBarInner" style="width:100%"></span>
						</c:otherwise>
					</c:choose>
					</span>
					
					<h6 class="homeFundingH6">
						<fmt:formatNumber value="${crowdHome.achieve}"  pattern="#,###"/>%</h6>
					<h6 class="homeFundingH6-1">
						<fmt:formatNumber value="${crowdHome.totalOrderPrice}"  pattern="#,###"/>원</h6>
					
					<h6 class="viewCntHome">${crowdHome.viewSeq}</h6>
					<img class="viewImgHome" src="${pageContext.request.contextPath}/img/viewSeq01.png">
	        </div>
	      </div>
      </c:forEach>
    </div>
  </div>
  </div>
	
	
	
	
<script type="text/javascript">
      /* $('.your-class').slick({
    	  centerMode: true,
    	  centerPadding: '60px',
    	  slidesToShow: 3,
    	  responsive: [
    	    {
    	      breakpoint: 768,
    	      settings: {
    	        arrows: false,
    	        centerMode: true,
    	        centerPadding: '40px',
    	        slidesToShow: 3
    	      }
    	    },
    	    {
    	      breakpoint: 480,
    	      settings: {
    	        arrows: false,
    	        centerMode: true,
    	        centerPadding: '40px',
    	        slidesToShow: 1
    	      }
    	    }
    	  ]
        
      }); */
      
      $(".center").slick({
    	  centerMode: true,
    	  /* centerPadding: "0px", */
    	  slidesToShow: 3,
    	  draggable:false,
    	  speed: 800,
    	  variableWidth: true,
    	  infinite: true
    	  
    	});
  </script>