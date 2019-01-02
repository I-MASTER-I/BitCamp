<%@ page language="java" contentType="application/vnd.ms-excel; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String fileName = "Total Operation Report";
response.setHeader("Content-Disposition","attachment; filename="+new String((fileName).getBytes("KSC5601"),"8859_1")+".xls");
response.setHeader("Content-Description", "JSP Generated Data");
%>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
    <title></title>
    <style>
        * {
            box-sizing: border-box;
            font-weight: normal;
            border-collapse: collapse;
            border-spacing: 0;
            text-align: center;
        }
        #tab tr{
            border: none;
        }
        #tab td {
            border: thin solid #ACB9CA;
            width: 254px;
            height: 34px;
            mso-number-format:\#\,\#\#0\;
        }
         .per{ 
             mso-number-format:"0%"; 
      	 } 
        .title {
            height: 94px;
            background-color: white !important;
            border: none !important;
            text-align: center !important;
            font-size: 28px;
            font-weight: bold;
        }
        .subtitle{
        	text-align: center !important;
        }
        .header{
            height: 66px !important;
        }
        .header td{
            text-align: center !important;
        }
        .bol{
            font-weight: bold;
        }
        .el {
            background-color: white !important;
            border: none !important;
            height: 34px;
        }
        .em {
            background-color: white !important;
            border: none !important;
        }
        .bo {
            border: 1px solid #ACB9CA;
        }

        .C6E0B4 {
            background-color: #C6E0B4;
        }

        .FFF2CC {
            background-color: #FFF2CC;
        }

        .EDEDED {
            background-color: #EDEDED;
            text-align : center !important;
        }
        
        

    </style>
</head>

<body>
    <table id="tab">
        <tr style="height: 94px;">
            <td class="em"></td>
            <td class="title" colspan="4">Total Operation Report</td>
        </tr>
        <tr class="header">
            <td class="em"></td>
            <td class="C6E0B4">Year Budget</td>
            <td class="C6E0B4">Year Rate</td>
            <td class="FFF2CC">Month Budget</td>
            <td class="FFF2CC">Month Rate</td>
        </tr>
        <tr class="header">
            <td class="em"></td>
            <td class="bol">${totalReportVO.yearBudget}</td>
            <td class="bol" style="mso-number-format:'0%';">${totalReportVO.yearBudgetRate}%</td>
            <td class="bol">${totalReportVO.monthBudget}</td>
            <td class="bol" style="mso-number-format:'0%';">${totalReportVO.monthBudgetRate}%</td>
        </tr>
        <tr><td class="el"></td></tr>
        <tr>
            <td class="em"></td>
            <td class="EDEDED">연매출</td>
            <td>${totalReportVO.yearAmount}</td>
            <td class="em"></td>
            <td class="em"></td>
        </tr>
        <tr>
            <td class="em"></td>
            <td class="subtitle">이번달 매출</td>
            <td>${totalReportVO.monthAmount}</td>
            <td class="subtitle">오늘의 PPA</td>
            <td>${totalReportVO.ppa}</td>
        </tr>
        <tr>
            <td class="em"></td>
            <td class="subtitle">일평균 매출</td>
            <td>${totalReportVO.monthAvg}</td>
            <td class="subtitle">오늘의 방문수</td>
            <td>${totalReportVO.visitCount}</td>
        </tr>
        <tr>
            <td class="em"></td>
            <td class="subtitle">오늘의 매출</td>
            <td>${totalReportVO.dailySales}</td>
            <td class="subtitle">오늘의 신규</td>
            <td>${totalReportVO.newMember}</td>
        </tr>
        <tr><td class="el"></td></tr>
        <tr>
            <td class="em"></td>
            <td class="EDEDED">TCE</td>
            <td>${totalReportVO.tce}</td>
        </tr>
        <tr>
            <td class="em"></td>
            <td class="subtitle">Cost</td>
            <td style="mso-number-format:'0%';">${totalReportVO.monthCostRate}%</td>
            <td class="subtitle">유틸리티</td>
            <td style="mso-number-format:'0%';">${totalReportVO.utilityRate}%</td>
        </tr>
        <tr>
            <td class="em"></td>
            <td class="subtitle">인건비</td>
            <td style="mso-number-format:'0%';">${totalReportVO.laborCostRate}%</td>
            <td class="subtitle">소모품</td>
            <td style="mso-number-format:'0%';">${totalReportVO.supplieRate}%</td>
        </tr>
        <tr><td class="el"></td></tr>
        <tr>
            <td class="em"></td>
            <td class="EDEDED">TCI</td>
            <td style="mso-number-format:'0%';">${totalReportVO.tci}%</td>
        </tr>
        <tr><td class="el"></td></tr>
        <tr>
            <td class="em"></td>
            <td class="EDEDED">TNC</td>
            <td style="mso-number-format:'0%';">${totalReportVO.tnc}%</td>
        </tr>
        <tr>
            <td class="em"></td>
            <td class="subtitle">임대료</td>
            <td>${totalReportVO.rent}</td>
        </tr>
        <tr><td class="el"></td></tr>
        <tr>
            <td class="em"></td>
            <td class="EDEDED">Operating Cashflow</td>
            <td>${totalReportVO.operatingCashflow}</td>
        </tr>
    </table>

</body>

</html>