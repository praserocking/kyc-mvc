<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<head>
<title>Rajasthan</title>
<meta name="description" content="Rajasthan - State of India. List of Chief Ministers, Political Parties and Politicians of Rajasthan."/>
<link rel="stylesheet" type="text/css" href="/Resources/CSS/reset.css">
<link rel="stylesheet" type="text/css" href="/Resources/CSS/state.css">
<link rel="stylesheet" type="text/css" href="/Resources/CSS/header3.css">
<link rel="stylesheet" type="text/css" href="/Resources/CSS/footer.css">
<script type="text/javascript" src="/Resources/Libraries/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="/Resources/scripts/signin.js"></script>
<script type="text/javascript" src="/Resources/scripts/analytics.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" />
<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization',
       'version':'1','packages':['timeline','corechart']}]}"></script>



<script type="text/javascript">
$(document).ready(function(){
	
	$('.mphoto,.photo').hover(function(){
		var ht = $(this).find('.mphotoDetails').height();
		ht = ht+10;
		var neg = -ht;
		neg = neg+'px';
		$(this).find('.mphotoDetails').css({"transform":"translate(0px,"+neg+")","-ms-transform":"translate(0px,"+neg+")","-webkit-transform":"translate(0px,"+neg+")"});
	},function(){
		var ht = $(this).find('.mphotoDetails').height();
		ht = ht+10;
		ht = ht+'px';
		$(this).find('.mphotoDetails').css({"transform":"translate(0px,0px)","-ms-transform":"translate(0px,0px)","-webkit-transform":"translate(0px,0px)"});
	});
	/*$('#chartContainer').highcharts({
            chart: {
                type: 'column',
                backgroundColor:"#f3f1f1",

            },
            title: {
                text: 'Past Assembly Elections',
                style:{"font":"14pt opensans","color":"#7c7878"}
            },
            xAxis: {
                categories: [
                    '2011',
                    '2006',
                    '2001',
                    '1996'
                ],
                labels:{
                	style:{"font":"8pt opensans","color":"#7c7878"}
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text:'Seats Won',
                    style:{"font":"12pt opensans","color":"#7c7878"}
                },
                labels:{
                	style:{"font":"8pt opensans","color":"#7c7878"}
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0;font:10pt opensans">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true,

            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: 'DMK Alliance',
                data: [31, 163,37,221]
    
            }, {
                name: 'AIADMK Alliance',
                data: [203,69,196,4]
    
            },{
                name:'Others',
                data:[0,2,1,9]
            }],
            credits:{
            	enabled:false,
            }
        });*/
		function drawChart()
		{

		var data1 = google.visualization.arrayToDataTable([
          ['Year', 'BJP', 'INC', 'Others'],
          ['2013',  163,      21, 16],
          ['2008',  78,      96, 26],
          ['2003',  120,       56, 24],
          ['1998',  33,      153, 14]
        ]);

        var options1 = {
          title: 'Past Legislative Assembly Elections',
          titleTextStyle:{color:'#7c7878',bold:false,fontName:'opensans',fontSize:'18'},
          hAxis:{textStyle:{color:'#7c7878',fontName:'opensans',fontSize:'12'}},
          vAxis: {textStyle:{color:'#7c7878',fontName:'opensans',fontSize:'12'},title: 'Seats won',  titleTextStyle: {color:'#7c7878',italic:false,fontName:'opensans',fontSize:'16'} ,baselineColor:'#CCC'},
          tooltip:{textStyle:{fontName:'opensans',fontSize:'14'}},
          backgroundColor:'#f3f1f1',
          legend:{textStyle:{color:'#7c7878',fontName:'opensans',fontSize:'12'}},
          focusTarget:'category'
    		
        };

        var chart1 = new google.visualization.ColumnChart(document.getElementById('chartContainer'));
        chart1.draw(data1, options1);

         var chart2 = new google.visualization.Timeline(document.getElementById('pastChiefMinisters'));
         var dataTable = new google.visualization.DataTable();
          dataTable.addColumn({ type: 'string', id: 'CM' });
          dataTable.addColumn({ type: 'string', id: 'Party' });
		  dataTable.addColumn({ type: 'date', id: 'Start' });
		  dataTable.addColumn({ type: 'date', id: 'End' });

		  dataTable.addRows([
			['Heera Lal Shastri','INC',new Date(1949,4,7),new Date(1951,1,5)],
			['C. S. Venkatachari','INC',new Date(1951,1,6),new Date(1951,4,25)],
			['Jai Narayan Vyas','INC',new Date(1951,4,26),new Date(1952,3,3)],
			['Tika Ram Paliwal','INC',new Date(1952,3,3),new Date(1952,10,31)],
			['Jai Narayan Vyas','INC',new Date(1952,11,1),new Date(1954,11,12)],
			['Mohan Lal Sukhadia','INC',new Date(1954,11,13),new Date(1967,3,13)],
			['President\'s rule','',new Date(1967,3,13),new Date(1967,4,26)],
			['Mohan Lal Sukhadia','INC',new Date(1967,4,26),new Date(1971,7,9)],
			['Barkatullah Khan','INC',new Date(1971,7,9),new Date(1973,8,11)],
			['Hari Dev Joshi','INC',new Date(1973,8,11),new Date(1977,4,29)],
			['President\'s rule','',new Date(1977,4,29),new Date(1977,6,22)],
			['Bhairon Singh Shekhawat','JP',new Date(1977,6,22),new Date(1980,2,16)],
			['President\'s rule','',new Date(1980,2,16),new Date(1980,6,6)],
			['Jagannath Pahadia','INC',new Date(1980,6,6),new Date(1981,7,13)],
			['Shiv Charan Mathur','INC',new Date(1981,7,14),new Date(1985,2,23)],
			['Hira Lal Devpura','INC',new Date(1985,2,23),new Date(1985,3,10)],
			['Hari Dev Joshi','INC',new Date(1985,3,10),new Date(1988,1,20)],
			['Shiv Charan Mathur','INC',new Date(1988,1,20),new Date(1989,12,4)],
			['Hari Dev Joshi','INC',new Date(1989,12,4),new Date(1990,3,4)],
			['Bhairon Singh Shekhawat','BJP',new Date(1990,3,4),new Date(1992,12,15)],
			['President\'s rule','',new Date(1992,12,15),new Date(1993,12,4)],
			['Bhairon Singh Shekhawat','BJP',new Date(1993,12,4),new Date(1998,11,29)],
			['Ashok Gehlot','INC',new Date(1998,12,1),new Date(2003,12,8)],
			['Vasundhara Raje','BJP',new Date(2003,12,8),new Date(2008,12,11)],
			['Ashok Gehlot','INC',new Date(2008,12,12),new Date(2013,12,13)],
			['Vasundhara Raje','BJP',new Date(2013,12,13),new Date()]
		    ]);
			var options2 = {
				timeline:{
					barLabelStyle:{color:'#7c7878',fontName:'opensans',fontSize:'12'},
					rowLabelStyle:{color:'#6d93ff',fontName:'opensans',fontSize:'14'}
				},
				backgroundColor:'#fff'
			};
		  chart2.draw(dataTable,options2);


         }
         google.setOnLoadCallback(drawChart);




		
});
</script>

<div id="wrapper">
	<div id="container">
		<div id="stateInfo">
			<div id="stateName">
			<h1>RAJASTHAN</h1>
			</div>
			<div id="dof">
				<span>Date of Formation - </span><span id="dofValue">1 November 1956</span>
			</div>
			<div id="totConst">
				<span>Number of Lok Sabha Seats - <span><span id="totConstValue"><a href="">25</a></span>
			</div>
		</div>
		<div id="personalities">
			<div id="leftPersonalities">
				<div  class="mainPersonalityBlock">
					<div class="mdesignation">
					Chief Minister
					</div>
					<div class="mphoto">
						<img src="/Resources/images/state/rajasthan/cm.png">
						<div class="mphotoDetails">
						<div class="mname"><a href="">Vasundhara Raje</a></div>
						<div class="mparty"><a href="">BJP</a></div>
						</div>
					</div>
					
				</div>
				<div class="mainPersonalityBlock">
					<div class="mdesignation">
					Governor
					</div>
					<div class="mphoto">
						<img src="/Resources/images/state/rajasthan/governor.png">
						<div class="mphotoDetails">
						<div class="mname">Margaret Alva</div>
						<div class="mparty"></div>
						<div class="mpost"></div>
						</div>
					</div>
					
				</div>
			</div>
			<div id="rightPersonalities">
				<div class="mdesignation">
				Other notable politicians
				</div>
				<div class="wrapperOthers">
					<div id="minister1" class="photo">
					<img src="/Resources/images/state/rajasthan/1.png">
						<div class="mphotoDetails">
						<div class="mname"><a href="">Jitendra Singh</a></div>
						<div class="mparty"><a href="">INC</a></div>
						<div class="mpost">Ministers Of State (Independent Charges) - Youth Affairs and Sports</div>
						</div>
					</div>
					<div id="minister2" class="photo">
					<img src="/Resources/images/state/rajasthan/2.png">
						<div class="mphotoDetails">
						<div class="mname"><a href="">Sachin Pilot</a></div>
						<div class="mparty"><a href="">INC</a></div>
						<div class="mpost">Ministers Of State (Independent Charges) - Corporate Affairs</div>
						</div>
					</div>
					<div id = "minister3" class="photo">
					<img src="/Resources/images/state/rajasthan/3.png">
						<div class="mphotoDetails">
						<div class="mname"><a href="">Ashok Gehlot</a></div>
						<div class="mparty"><a href="">INC</a></div>
						<div class="mpost">Former CM</div>
						</div>
					</div>
				</div>
			</div>
		</div><!--end of personalities -->
		<div id = "partiesInfo">
		<div id="partiesInfoHeading">List of Prominent Political Parties</div>
			<div id="partiesInfoCont">
			    <a href="" class="PartiesList">BJP</a>
			    <a href="" class="PartiesList">INC</a>
			    <a href="" class="PartiesList">IND</a>
			    <a href="" class="PartiesList">BSP</a>
			    <a href="" class="PartiesList">NPP</a>
			    

			</div>
		</div>
		<div id="chartContainer" style="width:500px;height:400px;display:inline-block;vertical-align:top;">

		</div>
		<div id="povertyStatus" style="display:inline-block;width:400px;height:400px;margin:0 auto;vertical-align:top; ">
		</div>
		<div id="chiefMinistersHeading">Chief Ministers of Rajasthan</div>
		<div id="pastChiefMinisters" style="width:100%;height:400px">
		</div>
		


	</div><!-- end of container -->
</div><!-- end of wrapper -->
<jsp:include page="../footer.jsp" />
</body>
</html>
