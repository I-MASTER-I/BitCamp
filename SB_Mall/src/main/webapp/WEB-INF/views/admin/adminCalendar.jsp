<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>통합 관리자 : 일정 관리</title>
<!-- 헤더 삽입 -->
<%@ include file="/WEB-INF/views/admin/common/adminheader.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminMain.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminContent.css">
<link href='<%=request.getContextPath()%>/resources/fullcalendar/fullcalendar.min.css' rel='stylesheet'/>
<link href='<%=request.getContextPath()%>/resources/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print'/>
<script src='<%=request.getContextPath()%>/resources/fullcalendar/lib/moment.min.js'></script>
<script src='<%=request.getContextPath()%>/resources/fullcalendar/lib/jquery.min.js'></script>
<script src='<%=request.getContextPath()%>/resources/fullcalendar/fullcalendar.min.js'></script>
<script src='<%=request.getContextPath()%>/resources/fullcalendar/gcal.min.js'></script>
<script>
//브라우저 사이즈
popupX = (window.screen.width / 2) - (700 / 2)
popupY= (window.screen.height /2) - (600 / 2)

  $(document).ready(function() {

    $('#calendar').fullCalendar({

        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        navLinks: true,
        selectable: true,
        selectHelper: true,
        select: function(event) {
        	
        	thisDate =  event._d.format('yyyy/MM/dd');
        	var url = 'https://calendar.google.com/calendar/r/day/'+ thisDate +'?sf=true'
            window.open(url, 'gcalevent', 'width=700,height=600,left='+ popupX + ',top=' + (popupY - 150));
            return false;
        },
        displayEventTime: true, // don't show the time column in list view
        googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',
        eventSources : [
  	    	{
  	              googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
  	            , className : "koHolidays"
  	            , color : "#e66464" /* E67860 */
  	            , textColor : "#ffffff"
  	        },{
                 		 googleCalendarId : "cyworld183@gmail.com"
                      , className : "myCalendar"
                      , color : "#787878"
                      , textColor : "#ffffff"
  	        }

        ],
        editable: true,
        eventClick: function(event) {
          // opens events in a popup window
          window.open(event.url, 'gcalevent', 'width=700,height=600, left='+ popupX + ',top=' + (popupY - 150));
          return false;
        },

        loading: function(bool) {
          $('#loading').toggle(bool);
        }

      });

  });
 

</script>
<style>

/*   body { */
/*     margin: 40px 10px; */
/*     padding: 0; */
/*     font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif; */
/*     font-size: 14px; */
/*   } */

  #loading {
    display: none;
    position: absolute;
    top: 100px;
    right: 10px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  #calendar table td{
  	border : 1px solid #c8c8c8;
  }
  #calendar table .fc-content{
  	text-align: center;
/*   	background: none; */
	font-weight: bold;
  	
  }
  span.fc-title {
    font-size: 8pt !important;
 }
 .fc-event{
 	border-radius: 0;
 }

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/adminNavi.jsp"%>

<div id="adminWrapper">
		<div id="bottomContent">
			<!--상단메뉴의 끝 하단메뉴의 시작-->
			<!--좌측 메뉴-->
			<div id="leftContent">
				<div class="leftTitle">일정 관리</div>
				<div class="leftMenu link active">
					스케줄러
				</div>			
				<!--좌측메뉴의 끝, 우측메뉴 시작-->
			</div><div id="rightContent">
				<div id="mainContent">
					 <div id='loading'>loading...</div>
	  				 <div id='calendar'></div>
  				 </div>
			</div>

			<!--하단 메뉴의 끝-->
		</div>
<!--adminWrapper의 끝-->
</div>
</body>
<script>

$(document).ready(function(){
	
	
	//ajax로 뒤로가기 구현
	$(window).bind("popstate", function(event) {
		//히스토리에 저장된 데이터를 불러온다. 여기서는 url 
		var data = event.originalEvent.state;
		//저장된 url이 있으면 
		if(data){
			$.ajax({
					url : data,
					error : function(error) {
				        alert("Error!");
				    },
					success : function(data) {
						$('#rightContent').html(data);
					}
				})
			 } else {
			    // 히스토리에 정보가 없을경우 메인화면으로 보내준다.
			    var url = "<%=request.getContextPath()%>/admin/adminCalendar";    
			    $(location).attr('href',url);
			    }
	});

});

</script>
</html>