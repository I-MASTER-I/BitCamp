<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
    <meta http-equiv="content-type" content="charset=utf-8;"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/chart/dist/chart.js"></script>
    <style>
        div {
            display: inline-block;
        }
    </style>
    
    <script>
    var list = JSON.parse ( '${ba}' );
    </script> 
    
</head>
<body >


<div id="bar" ></div>
<div id="weather"></div>
<div id="map_korea" ></div>
<div id="radar"></div>
<div id="top" style="width: 100px; height: 100px;"></div>

<script>
	
    var ba = '${ba}'
    var bar = jui.include("chart.builder");
    
    bar("#bar", {
    width : 600,
    height : 600,
    theme : "gradient",
    axis : {
       y : {
            type : "range",
            domain : "sales" ,
            step : 20,
            line : true
        },
        x : {
            type : "block",
            domain : "quarter",
            line : true
        },
        data : list
    },
    brush : {
        type : "column",
        target : [ "sales", "sales2"],
        colors : [ 4, 0 ],
        outerPadding : 10
    },
    widget : [
        { type : "title", text : "Bar Sample" },
        { type : "tooltip", orient: "right" },
        { type : "legend" }
    ]
    });

    


var weather = jui.include("chart.builder");

var data = [{
    id: "서울",
    temperature: 25,
    weather: "rain",
    lat : 127,
    dx: 10
}, {
    id: "인천",
    temperature: 28,
    weather: "sunny",
    dx: -50,
    dy: -25
}, {
    id: "강원",
    temperature: 25,
    weather: "rain"
}, {
    id: "충북",
    temperature: 26,
    weather: "rain",
    dx: 15
}, {
    id: "충남",
    temperature: 22,
    weather: "sunny"
}, {
    id: "전북",
    temperature: 26,
    weather: "murky"
}, {
    id: "전남",
    temperature: 25,
    weather: "cloudy",
    dx: -20
}, {
    id: "경북",
    temperature: 25,
    weather: "sunny"
}, {
    id: "경남",
    temperature: 26,
    weather: "cloudy"
}, {
    id: "제주",
    temperature: 24,
    weather: "murky",
    dx: -30,
    dy: -30
}, {
    id: "울릉",
    temperature: 25,
    weather: "murky",
    dx: -40,
    dy: -20
}];

weather("#weather", {
    width : 600,
    height : 700,
    padding : 30,
    axis : [{
        map : {
            path : "<%=request.getContextPath()%>/chart/img/map/korea-500x650.svg",
            width : 500,
            height : 650
        },
        data : data
    }],
    brush : [{
        type : "map.weather",
        format : function(id) {
            if(id == "서울") {
                return "서울/경기";
            } else if(id == "인천") {
                return "서해5도";
            }
        }
    }],
    style : {
        mapPathBackgroundColor : "white",
        mapPathBorderColor : "#a9a9a9"
    }
});
    


/* 한국 지도  */
var map_korea = jui.include("chart.builder");

var d = [{
        id: "충북",
        value: 50
    }, {
        id: "서울",
        value: 500
    }, {
        id: "인천",
        value: 200
    }, {
        id: "대전",
        value: 150
    }, {
        id: "부산",
        value: 90
    }, {
        id: "대구",
        value: 250
    }];

    map_korea("#map_korea", {
            width : 500,
            height : 650,
            padding : 0,
            axis : [{
                map : {
                    path : "<%=request.getContextPath()%>/chart/img/map/korea-500x650.svg",
                    width : 500,
                    height : 650
                },
                data : d
            }],
            brush : [{
                type : "map.bubble",
                colors : function(d) {
                    if(d.value > 300) {
                        return "linear(top) #ff686c,0.9 #fa5559";
                    } else if(d.value > 100) {
                        return "linear(top) #ff9d46,0.9 #ff7800";
                    }

                    return "linear(top) #9694e0,0.9 #7977C2";
                }
            }, {
                type : "map.selector",
                activeEvent : "map.click"
            }]
        });

    
    

var radar = jui.include("chart.builder");
    
        radar("#radar", {
            width: 600,
            height : 800,
            theme : "jennifer",
            axis : {
                padding : {
                    top : 50,
                    left : 50
                },
                data : [
                    { key : 'yellow', 	name : 70, 	value : 85 },
                    { key : 'red',		name : 55, 	value : 6 },
                    { key : 'black',	name : 8, 	value : 30 },
                    { key : 'blue',		name : 18, 	value : 5 },
                    { key : 'green',	name : 18, 	value : 5 },
                    { key : 'blue2',	name : 8, 	value : 5 },
                    { key : 'blue3',	name : 50, 	value : 100 },
                    { key : 'blue4',	name : 18, 	value : 5 }
                ],
                c : {
                    type : 'radar',
                    //line : false,
                    //extra : true,
                    domain : 'key'
                }
            },
            brush : [
                { type : 'path', target : ['value', 'name'] }
            ]
        });
        
var pie = jui.include("chart.builder");

var names = {
            ie: "IE",
            ff: "Fire Fox",
            chrome: "Chrome",
            safari: "Safari",
            other: "Others"
        };

pie("#top", {
            padding : 150,
            axis : {
                data : [
                    { ie : 70, ff : 11, chrome : 9, safari : 6, other : 4 }
                ]
            },
            brush : {
                type : "pie",
                showText : "outer",
                active : "ie",
                activeEvent : "click",
                format : function(k, v) {
                    return names[k] + ": " + v;
                }
            },
            widget : [{
                type : "tooltip",
                orient : "left",
                format : function(data, k) {
                    return {
                        key: names[k],
                        value: data[k]
                    }
                }
            }, {
                type : "legend",
                format : function(k) {
                    return names[k];
                }
            }]
        });
    
</script>

</body>
</html>