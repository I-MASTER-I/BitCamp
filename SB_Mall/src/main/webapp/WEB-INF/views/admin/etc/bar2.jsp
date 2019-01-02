<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
    <meta http-equiv="content-type" content="charset=utf-8;"/>
	   	<!-- Basic style components -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui/dist/ui.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui/dist/ui-jennifer.min.css" />
	
	<!-- Grid style components -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui-grid/dist/grid.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui-grid/dist/grid-jennifer.min.css" />
	
	<!-- Required script files -->
	<script src="<%=request.getContextPath()%>/jui/jui/lib/jquery-1.8.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/jui/jui-core/dist/core.min.js"></script>
	
	<!-- Basic script components -->
	<script src="<%=request.getContextPath()%>/jui/jui/dist/ui.min.js"></script>
	
	<!-- Grid script components -->
	<script src="<%=request.getContextPath()%>/jui/jui-grid/dist/grid.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/jui/jui-core/dist/core.min.js"></script>
	<script src="<%=request.getContextPath()%>/jui/jui-chart/dist/chart.js"></script>
</head>
<body class="jui">


<div id="result" style="width: 300px; height: 300px;"></div>

<script>
var chart = jui.include("chart.builder");
var names = {
    ie: "IE",
    ff: "Fire Fox",
    chrome: "Chrome",
    safari: "Safari",
    other: "Others"
};

chart("#result", {
    padding : 150,
    axis : {
        data : [
            { ie : 70, ff : 11, chrome : 9, safari : 6, other : 4 }
        ]
    },
    brush : {
        type : "pie",
        showText : "inside",
        format : function(k, v) {
            return v + "%";
        }
    },
    widget : [{
        type : "title",
        text : "Pie Sample"
    }, {
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