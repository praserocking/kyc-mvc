<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<head>
<title>Puducherry</title>
<meta name="description" content="Puducherry - Union Territory of India. List of Chief Ministers, Political Parties and Politicians of Puducherry."/>
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
	$('.mdesignation').css({"font":"12pt opensans"});
	
	$('.mphoto,.photo').hover(function(){
		var ht = $(this).find('.mphotoDetails').height();
		ht = ht+10;
		var neg = -ht;
		neg = neg+'px';
		if($(this).find('.mphotoDetails').height() == 134)
		{
			$(this).find('.mname').css({"font":"12pt opensans"});
		}
		$(this).find('.mphotoDetails').css({"transform":"translate(0px,"+neg+")","-ms-transform":"translate(0px,"+neg+")","-webkit-transform":"translate(0px,"+neg+")"});
		
	},function(){
		
		$(this).find('.mphotoDetails').css({"transform":"translate(0px,0px)","-ms-transform":"translate(0px,0px)","-webkit-transform":"translate(0px,0px)"});
	});
		
	
		function drawChart()
		{

		var data1 = google.visualization.arrayToDataTable([
          ['Year',  'AINRC','AIADMK','DMK','INC','Others'],
          ['2011', 15,5,2,7,1  ],
          ['2006', 0,3,7,10,10  ],
          ['2001', 0,3,7,11,9 ],
	  ['1996', 0,3,7,9,11 ]
          
         
        ]);
/*total assembly const - 70 + 1 elected anglo indian member*/
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
			  ['Edouard Goubert','INC',new Date(1963, 7, 1), new Date(1964, 8, 24) ],
			  [ 'V. Venkatasubha Reddiar', 'INC',  new Date(1964, 9, 11),  new Date(1967,4,9) ],
		  	  [ 'M. O. H. Farook', 'INC',  new Date(1967,4,9),  new Date(1968,3,6) ],
		  	  [ 'V. Venkatasubha Reddiar', 'INC',  new Date(1968,3,6),  new Date(1968,9,18) ],
		  	  [ 'President rule', '',new Date(1968,9,18),  new Date(1969,3,17)],
		  	  [ 'M. O. H. Farook', 'DMK',  new Date(1969,3,17),  new Date(1974,1,3) ],
		  	  [ 'President rule', '',  new Date(1974,1,3),  new Date(1974,3,6) ],
		  	  [ 'Subramanyan ramaswamy', 'AIADMK',  new Date(1974,3,6),  new Date(1974,3,24) ],
		  	  [ 'President rule', '',  new Date(1974,3,24),  new Date(1977,7,2) ],
		  	  [ 'Subramanyan ramaswamy', 'AIADMK',  new Date(1977,7,2),  new Date(1978,11,12) ],
		  	  [ 'President rule', '',  new Date(1978,11,12),  new Date(1980,1,16) ],
		  	  [ 'M. D. R. Ramachandran', 'DMK',  new Date(1980,1,16),  new Date(1983,6,24) ],
		  	  [ 'President rule', '',  new Date(1983,6,24),  new Date(1985,3,16) ],
		  	  [ 'M. O. H. Farook', 'INC',  new Date(1985,3,16),  new Date(1990,3,4) ],
		  	  [ 'M. D. R. Ramachandran', 'DMK',  new Date(1990,3,4),  new Date(1991,3,3) ],
		  	  [ 'President rule', '',  new Date(1991,3,3),  new Date(1991,7,4) ],
		  	  [ 'V. Vaithilingam', 'INC',  new Date(1991,7,4),  new Date(1996,5,13) ],
		  	  [ 'R. V. Janakiraman', 'DMK',  new Date(1996,5,13),  new Date(2000,3,21) ],
	  	      [ 'P. Shanmugam', 'INC',  new Date(2000,3,21),  new Date(2001,5,15) ],
	  	   	  [ 'P. Shanmugam', 'INC',  new Date(2001,5,15),  new Date(2001,8,26) ],
	  	      [ 'N. Rangaswamy', 'INC',  new Date(2001,8,26),  new Date(2006,5,12) ],
	  	      [ 'N. Rangaswamy', 'INC',  new Date(2006,5,12),  new Date(2008,9,4) ],
	  	      [ 'V. Vaithilingam', 'INC',  new Date(2008,9,4),  new Date(2011,5,14) ],
	  	      [ 'N. Rangaswamy', 'INC',  new Date(2011,5,14),  new Date() ]
		    
		    


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
			<h1>PUDUCHERRY</h1>
			</div>
			<div id="dof">
				<span>Date of Formation - </span><span id="dofValue">1 July 1963</span>
			</div>
			<div id="totConst">
				<span>Number of Lok Sabha Seats - <span><span id="totConstValue"><a href="">1</a></span>
			</div>
		</div>
		<div id="personalities">
			<div id="leftPersonalities">
				<div  class="mainPersonalityBlock">
					<div class="mdesignation">
					Chief Minister
					</div>
					<div class="mphoto">
						<img src="/Resources/images/state/Puducherry/cm.jpg">
						<div class="mphotoDetails">
						<div class="mname"><a href="">N.Rangaswamy</a></div>
						<div class="mparty"><a href="">AINRC</a></div>
						</div>
					</div>
					
				</div>
				<div class="mainPersonalityBlock">
					<div class="mdesignation">
					Lieutenant-Governor
					</div>
					<div class="mphoto">
						<img src="/Resources/images/state/Puducherry/governor.jpg">
						<div class="mphotoDetails">
						<div class="mname">Virendra Kataria</div>
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
					<img src="/Resources/images/state/Puducherry/1.jpg">
						<div class="mphotoDetails">
						<div class="mname"><a href="">V.Narayanasamy</a></div>
						<div class="mparty"><a href="">INC</a></div>
						<div class="mpost">Minister of State - Personnel, Public Grievances and Pensions and Prime Minister Office</div>
						</div>
					</div>
					<div id="minister2" class="photo">
						<img src="/Resources/images/state/Puducherry/2.jpg">
						<div class="mphotoDetails">
						<div class="mname"><a href="">V.Vaithilingam</a></div>
						<div class="mparty"><a href="">INC</a></div>
						<div class="mpost">Former CM</div>
						</div>
					</div>
					<div id = "minister3" class="photo">
						<img src="/Resources/images/state/Puducherry/3.jpg">
						<div class="mphotoDetails">
						<div class="mname"><a href="">P.Kannan</a></div>
						<div class="mparty"><a href="">INC</a></div>
						<div class="mpost">MP - RajyaSabha</div>
						</div>
					</div>
				</div>
			</div>
		</div><!--end of personalities -->
		<div id = "partiesInfo">
		<div id="partiesInfoHeading">List of Prominent Political Parties</div>
			<div id="partiesInfoCont">
			
				
			    <a href="" class="PartiesList">AIADMK</a>
			    <a href="" class="PartiesList">AINRC</a>
			    <a href="" class="PartiesList">DMK</a>
			   <a href="" class="PartiesList">INC</a>
			   
			    
			   

			</div>
		</div>
		<div id="chartContainer">

		</div>
		<div id="povertyStatus" style=" ">
		</div>
		<div id="chiefMinistersHeading">Chief Ministers of Puducherry</div>
		<div id="pastChiefMinisters" >
		</div>
		


	</div><!-- end of container -->
</div><!-- end of wrapper -->
<jsp:include page="../footer.jsp" />
</body>
</html>
