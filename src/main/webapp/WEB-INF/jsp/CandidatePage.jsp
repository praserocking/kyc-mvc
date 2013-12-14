<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/Resources/CSS/reset.css">
		<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/Resources/CSS/Map.css">
		<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}" />/Resources/CSS/header.css">
		<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}" />/Resources/CSS/CandidatePage.css">
		<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}" />/Resources/CSS/footer.css">
		<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}" />/Resources/CSS/SuggestionBox.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script src="<c:out value="${pageContext.request.contextPath}" />/Resources/Libraries/jquery-2.0.2.min.js" /></script>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
		<script src="<c:out value="${pageContext.request.contextPath}" />/Resources/scripts/mapPlugin.js"></script>
		<style>
		</style>
		<script>
		$(function()
		{
			var i=0;
			$('#constituency,#map').hover(function()
					{
							if(i==0)
							{
								i=1;
								initialize();
							}
							$("#map").css("left",$('#constituency').position().left-$('#map').width());
							$("#map").css("top",$('#constituency').top());
							$('#map').css('display','block');
							$('#map').css('position','relative');
							
					},function(){
						$('#map').css('display','none');
					});
		});
		</script>
		
	</head>
	<body>	
	<jsp:include page="header.jsp"></jsp:include>
<!--*********************************************************************candidate page ***********************************************************************-->
		<div id="wrapperCP">
			<div id="containerCP" class="Cont">
				<div id="innerContainerCP" >
					<div id="topCP">
						<section id="wcandidateImageCP" class="col">
							<img src="<c:out value="${pageContext.request.contextPath}"/>/Resources/images/ministers/<c:out value="${candidate.name}" />.jpg" id="candidateImageCP">
						</section>
						<section id="candidateDetailsCP" class="col">
							<p id="nameCP">  <span id="name"><c:out value="${candidate.name}" /></span>    
							<p id="partyNameCP"><span id="value"><c:out value="${candidate.partyName}" /></span></p>
							<p id="genderCP"><span id="gender"><c:out value="${candidate.gender}" /></span> </p>
						</section>
						<section id="wpartyImageCP" class="col"> 
							<img src="<c:out value="${pageContext.request.contextPath}"/>/Resources/images/party/<c:out value="${candidate.partyShortName}" />.png" alt="" id="partyImageCP">
						</section>
					
						
					</div>
					<hr id="topAndBottom" />
					<div id="bottomCP">
							
						  <div id="leftCP">
								<div id="firstBoxCP" class="BoxSettingCP">
									<table class="ContainerCP">
										<th class="FirstBoxTitle" >Date Of Birth</th>
										<th class="FirstBoxTitle" >Age</th>
										<th class="FirstBoxTitle" >Position</th>
										<tr>
											<td class="BoxContentCP" id="dob"><c:out value="${candidate.dob}" /></td>
											<td class="BoxContentCP" id="age"><c:out value="${candidate.age}" /></td>
											<td class="BoxContentCP" id="position">Minister , <span id="constituency"><c:out value="${candidate.constituency}" /><input type="hidden" id="ccode" value="<c:out value="${candidate.constituencyCode}" />" /></span></td>
											<div id="map"></div>
										</tr>
									</table>
								</div>
								<div id="secondBoxCP" class="BoxSettingCP">
								      <table class="ContainerCP">
								      	<th class="SecondBoxTitle">Education</th>
								      	<th class="SecondBoxTitle">Past Position</th>
								      	<th class="SecondBoxTitle">Contact</th>
								      		<tr>
								      			<td class="BoxContentCP" id="education"><c:out value="${candidate.education}" /></td>
								      			<td class="BoxContentCP" id="pastPositions"><c:out value="${candidate.previousPositions}" /></td>
								      			<td class="BoxContentCP" id="contact"><c:out value="${candidate.contact}" /></td>
								      		</tr>
								      </table>
								</div>
							</div>
					</div>
				</div>   
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	
	
</html>
