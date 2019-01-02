<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<!-- 주문 상태 -->
	<div id="orderStatus"></div>
	<!-- 인기상품 Top5 -->
	<div id="top5"></div>
	<!-- 버젯 달성율 -->
	<div id="budgetSales"></div>
</div>
<!-- 이번년도 월별 매출 평균매출 그래프-->
<div id="this-year-average"></div>

<!-- 주문 상태 -->
<script type="text/javascript">
var orderStatus = JSON.parse ('${orderStatus}');
var chart = jui.include("chart.builder");

chart("#orderStatus", {
  padding : {
	  right : 10
  },
  style :{
	  titleFontWeight : 700
  },
  theme : "gradient",
  width: 330,
  height: 250,
    axis : [{
        x : {
            type : "log",
		    domain : function(data) {
                return Math.max(data.count);
            } ,
            step : 10,
    		hide:true
        },
        y : {
            type : "block",
            domain : "status",
            line : true
        },
        data : orderStatus
    }],
    brush : [{
        type : "bar",
        target : "count",
        activeEvent : "mouseover",
        format : function(data) {
            //값 표시 방법
            return data + "건";
        },
        active : 1,
        //숫자 표시
//         display : "max",
        colors : [7]
    }],
    widget : [{
        type : "title",
        text : "주문 건수",
        size : 11
    },
      {
        type : "tooltip"
    }]
});

</script>

<!-- 인기상품 Top5 차트-->
<script type="text/javascript">
var dataTop5 = JSON.parse ('${dataTop5}');
var chart = jui.include("chart.builder");
//최고 인기상품을 조각에서 빼준다.
var max = 0;
var secon = 0;
var maxName = '';
var seconName = '';
//맵 객체의 모든 키와 값 쌍을 읽어서 키 이름과 값을 저장하여 최대치를 구한다.
for(var i of Object.keys(dataTop5)){
 if(dataTop5[i] > max){
     seconName = maxName;
	 maxName = i;
	 secon = max;
	 max = dataTop5[i]; //최대치에 해당하는 키 이름을 저장
  }
};
// console.log(maxName + ':' +max);
// console.log(seconName + ':' + secon);


jui.ready([ "chart.builder" ], function(chart) {
	
    var c = chart("#top5", {
        padding: {
        	top : 40,
        	left : 80,
        	right : 80,
        	bottom: 50
        },
        width: 330,
        height : 258,
        theme : "gradient",
        axis : {
            data : [dataTop5]
        },
        style: {
//             axisBorderColor : "#dcdcdc",
//             axisBorderWidth : 1,
//             axisBorderRadius : 2,
            titleFontSize : 11,
            titleFontWeight : 700,
            pieOuterFontSize: 11,
            pieOuterFontColor: '#505050',
            pieInnerFontSize: 11,
            pieInnerFontColor: '#505050',
            gridXfontSize: 11,
            gridYfontSize: 11,
            legendFontSize: 11
        },
        brush : [{
            type : "pie",
            //표시될 값을 밖에 할지 안에 할지 설정
            showText : "inside",
            format : function(k, v, max) {
                //값 표시 방법
                return ((v/max)*100).toFixed(0) + "%";
            },
            active : [ maxName, seconName], //최대치와 두번째 최대치의 키 이름
            activeEvent : "click",
            //브러시에 사용할 컬러 목록
            colors : [ 7,1,6,8,9 ]
        }],
        widget : [ 
        { type : "title", orient : "top", text : "인기상품 Top5"},
        { type : "tooltip" },
        { type : "legend",  orient : "bottom"}]
    });
})

</script>
<!-- 이번년도 월별 매출 평균매출 그래프-->
<script type="text/javascript">
var salesYear = JSON.parse ('${salesYear}');
var chart = jui.include("chart.builder");
var data = salesYear;
var month = new Date().getMonth();

chart("#this-year-average", {
	//차트 전체 설정
    padding : {
       right : -10
    },
    theme : "gradient",
    width: 1000,
    
    style : {
       	//제목 사이즈
       	titleFontWeight : 700,
        titleFontSize: 11,
        legendFontSize:11,
        gridXFontSize:11,
        gridYFontSize:11
    },
    //축 그리기 설정
    axis : [{
    	//X축 설정
        x : {
            domain : "month",
            line : true
        },
        //Y축 설정
        y : {
            type : "range",
            //축의 값 - [0, 100] 이런식으로 하면 최대값이 100까지 표시된다.
            domain: function(data) {
                return Math.max(data.매출) + 500000000;
            } ,
            format : function(k, v, max) {
                //값 표시 방법
             return (k/100000000).toFixed(0) + "억";
            },
            step : 10,
            color : "#555555",
        },
        data : data
    }, {
        extend : 0
    }],
    //브러시 (막대 또는 꺾은선 등등 값을 표시하는 )
    brush : [
    	{ type : "column", target : "매출", colors : [17] , activeEvent : "click", animate:true, /* outerPadding : 30, */ /* display : "max" , */ size: 30 },
    	// 가로선, display : "max"는 최고값을 표시하는것
    	{ type : "line", target : "평균", axis :1,  colors : [ "#ffc828" ]/* , display : "max" */ },
    	{type: "focus",  start : month, end : month }
    		
    ],
    widget : [
    	//제목
    	{ type : "title", text : "월 매출" },
    	//하단 목차
    	{ type : "legend",  orient : "bottom", brush : [ 0, 1]/* 하단목차 색깔 */},
     	//툴팁
    	{type:"tooltip"}
    ]

});
</script>

<!-- 버젯 달성율 -->
<script type="text/javascript">
var budgetSales = JSON.parse ('${budgetSales}');
var chart = jui.include("chart.builder");

chart("#budgetSales", {
  theme : "gradient",
  padding: 10,
   width: 200,
     height : 250,
    axis : [{
    	c : {
    		type : "panel",
		},
        data : [budgetSales]
    }],
    brush : [{
        type : "fullgauge",
        size : 14,
        titleY : 30,
        colors : ["#ffc828"],
        showText : true,
        format : function(v) {
            return (v / budgetSales.max * 100 ).toFixed(1)  + "%";
        }
    }],widget : [ 
        { type : "title", orient : "top", text : "월 목표 달성율"}
        ],
	style : {
    	//게이지 폰트 사이즈
		gaugeFontSize : 30,
        titleFontSize : 11,
      titleFontWeight : 700
	}
});

</script>