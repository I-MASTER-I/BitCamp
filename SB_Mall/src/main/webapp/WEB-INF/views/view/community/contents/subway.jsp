<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>지하철</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subway.css">
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">
//노선도 정보로 지하철역 리스트 값 얻기.
	var stationUrl = 'http://openAPI.seoul.go.kr:8088/55686455676570643239595a596655/xml/SearchSTNBySubwayLineService/1/300/';
	var LineNum = 0;
	var stationCode=0;
	var days=1;
	var fast='n';
	
	var mapSize = 1200;
	
	$(document).ready(function() {
		
		/* 지하철 호선 선택 */
		$('.selectLine').on('click',function(){
			$('#selectBox').html('');
			var line='';
			
			for (var i = 1; i <= 14; i++) {
				if(i<10){
					line = '<button class="selectedLine" value='+i+'>'+i+'호선</button>'
				}else{
					line = '<div class="fakeSelected"></div>'
				}
				$('#selectBox').append(line);
			}
			
			$('.selectedLine').on('click',function(){
				LineNum = $(this).val();
				$('.selectLine').html($(this).html());//지하철 노선 html().
				$('.selectLine').val($(this).val()); //지하철 value().
				$('.selectLine').css('background-color','#ffc828');
				$('#selectBox').html('');
			})
			
		})
		
		
		
		
		$('.selectStation').on('click',function(){
				$('#selectBox').html('');
				if(LineNum!=0){
					getStations();
					//ajax끝
				}else{
					alert('노선을 선택해주세요');
				}
		})
		
		/* 시간표 보이기 */
		$('.viewSubwayTime').on('click',function(){
			if(LineNum !=0 && stationCode!=0){
				$('#SubwayTimeBigBox').show();
			}else{
				alert('노선 또는 역을 선택하지 않으셨습니다.');
			}
		})
		
		$('.timeClose').on('click',function(){
			$('#SubwayTimeBigBox').hide();
		})
		
		
		$('.selectDays').change(function() {
			days=$(this).val();
			
			getUpTrain();
			getDownTrain();
		})
		
		$('.selectFast').change(function() {
			if($(this).is(":checked")){
				fast='y';
			}else{
				fast='n';
			}
			getUpTrain();
			getDownTrain();
		})
		
		/* $('input[type=checkbox]:checked')
		})
		
		
		$('input:checkbox[id="checkbox_id"]').is(":checked") == true */

		
		
		
		
		
		
	/* 노선 선택 후, 지하철 역 정보 가져오기 */
	function getStations(){
			$.ajax({
				url: stationUrl+LineNum,
				success : function(data){
					cnt=1;
					
					$(data).find('SearchSTNBySubwayLineService').find('row').each(function(){
						var st_code = $(this).find('STATION_CD').text();
						var st_name = $(this).find('STATION_NM').text();
						
							$('#selectBox').append('<button class="stationOn" value="'+st_code+'">'+st_name+'</button>');
						cnt++;
					})
					if(cnt%7!=0){
						for(var i=0; i<=7-cnt%7; i++){
							$('#selectBox').append('<div class="fakeSelected"></div>');
						}
					}
					
					
					$('.stationOn').on('click',function(){
						
						$('.selectStation').html($(this).html());
						$('.selectStation').val($(this).val());
						$('.selectStation').css('background-color','#ffc828');
						stationCode=$(this).val();
						$('.viewSubwayTime').css('background-color','#ffc828');
						
						$('#selectBox').html('');
						
						$('.tBoxLineNum').html(LineNum+'호선');
						getUpTrain();
						getDownTrain();
					})
				}
			})
		}
		
		
		//상행선 시간표.
		function getUpTrain(){
			var upUrl = 'http://openAPI.seoul.go.kr:8088/55686455676570643239595a596655/xml/SearchSTNTimeTableByIDService/1/300/'+stationCode+'/'+days+'/1/';
			
			$.ajax({
				url:upUrl,
				error:function(){
					alert('upUrl : '+upUrl);
				},
				success:function(data){
					$('.dirUp').html('');
					$(data).find('SearchSTNTimeTableByIDService').find('row').each(function(){
						if($(this).find('EXPRESS_YN').text()=='G'){//급행 아님.
							if(fast=='n'){
								var addUpTrain = '<h4 class="timeBoxH4">'+$(this).find('ARRIVETIME').text()+'</h4><h6 class="timeBoxH6">'+$(this).find('SUBWAYENAME').text()+'행</h6>';
								$('.dirUp').append(addUpTrain);
							}
						}else{//급행임.
							var addUpTrain = '<h4 class="timeBoxH4">'+$(this).find('ARRIVETIME').text()+'</h4><h6 class="timeBoxH6">(급)'+$(this).find('SUBWAYENAME').text()+'행</h6>';
							$('.dirUp').append(addUpTrain);
						}
					})
					if($('.dirUp').html().length==0){
						$('.dirUp').html('<h3>요청하신 지하철 시간표가 <br>존재하지 않습니다.</h3>');
					}
				}
			})
		}
		//하행선 시간표.
		function getDownTrain(){
			var upUrl = 'http://openAPI.seoul.go.kr:8088/55686455676570643239595a596655/xml/SearchSTNTimeTableByIDService/1/300/'+stationCode+'/'+days+'/2/';
			
			$.ajax({
				url:upUrl,
				error:function(){
					alert('upUrl : '+upUrl);
				},
				success:function(data){
					$('.dirDown').html('');
					$(data).find('SearchSTNTimeTableByIDService').find('row').each(function(){
						
						if($(this).find('EXPRESS_YN').text()=='G'){
							if(fast=='n'){
								var addUpTrain = '<h4 class="timeBoxH4">'+$(this).find('ARRIVETIME').text()+'</h4><h6 class="timeBoxH6">'+$(this).find('SUBWAYENAME').text()+'행</h6>';
								$('.dirDown').append(addUpTrain);
							}
						}else{
							var addUpTrain = '<h4 class="timeBoxH4">'+$(this).find('ARRIVETIME').text()+'</h4><h6 class="timeBoxH6">(급)'+$(this).find('SUBWAYENAME').text()+'행</h6>';
							$('.dirDown').append(addUpTrain);
						}
					})
					if($('.dirDown').html().length==0){
						$('.dirDown').html('<h3>요청하신 지하철 시간표가 <br>존재하지 않습니다.</h3>');
					}
				}
			})
		}
		
		$('.upBtn').on('click',function(){
			if(mapSize<2000){
				mapSize+=100;
				$('.subwayMapImage').css('width',mapSize+'px');
			}else{
				alert('지하철 최대 사이즈 입니다')
			}
		})
		
		$('.downBtn').on('click',function(){
			if(mapSize>1000){
				mapSize-=100;
				$('.subwayMapImage').css('width',mapSize+'px');
			}else{
				alert('지하철 최소 사이즈 입니다')
			}
		})
		
		
		
		
		
		
		
	})
	
	

	
</script>
	
</head>
<body>
	<div class="commonBannerBox">
		<h3 class = rowdCommonBannerH3>지하철</h3>
	</div>
	
	<div class="upNdown">
		<button class="SubwaySize downBtn">-</button>
		<button class="SubwaySize upBtn">+</button>
	</div>
	<div class="subwayMapBox">
		<div class="SubwayMap">
			<img class="subwayMapImage" src="<%=request.getContextPath()%>/img/subwayMap-01.png">
		</div>
	</div>
	<div id="subwayBigBox">
	
		<button class="selectLine">호선 선택</button>
		<button class="selectStation">역 선택</button>
		
		<div id="subwayTimeBtn">
			<button class="viewSubwayTime">시간정보</button>
		</div>
	</div>
	<div id="selectBox">
	
	</div>
	
	<!-- 시간표 -->
	<div id="SubwayTimeBigBox">
		<div id="SubwayTimeMidBox">
			<div id="timeBoxLine">
				<h1 class="tBoxLineNum"></h1>
				<h3 class="timeClose">x</h3>
			</div>
			<div id="timeBoxOption">
					<input class="selectDays" type="radio" name="days" checked="checked" value="1">평일
					<input class="selectDays" type="radio" name="days" value="2">주말
					
					<input class="selectFast" type="checkbox" value="D">급행
			</div>
			<div class="timeBoxDir">
				<h4 class="timeBoxDirH4">상행선</h4>
				<div class="dirUp">
				
				</div>
			</div>
			<div class="timeBoxDir">
				<h4 class="timeBoxDirH4">하행선</h4>
				<div class="dirDown">
				
				</div>
			</div>
			
		</div>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</body>
</html>