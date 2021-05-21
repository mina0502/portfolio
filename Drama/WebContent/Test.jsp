<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script> 
<script src="../resources/js/jquery-3.6.0.js"></script>

</head>
<body>
<jsp:include page="../main/menu.jsp" flush="false"/>
		<div class="modal fade" id="Modal" tabindex="-1" role="dialog"
			aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: auto; display: table">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="ModalLabel">날씨정보 
						(맑음:<img src="../Weather/img/맑음.png">&nbsp;구름많음:<img src="../Weather/img/구름많음.png">
						  비:<img src="../Weather/img/비.png">&nbsp;흐리고 비:<img src="../Weather/img/흐리고 비.png">
						 흐림:<img src="../Weather/img/흐림.png">)</h5>
					</div>
					<%!
						public void arrList(ArrayList arrList,String[] arg){
						for(String item: arg){
							if(!arrList.contains(item))
								arrList.add(item);
						}
					}
					
					public void arrAllList(ArrayList arrList,String[] arg){
						for(String item: arg){
								arrList.add(item);
						}
					}
					%>
					
<%

 	Document doc2 = Jsoup.connect("http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108").get();
	Elements local = doc2.select("location");
	Elements time = local.select("tmEf");
	Elements city = local.select("city");
	Elements wf = local.select("wf");
	
	ArrayList<String> arrTime = new ArrayList<>();
	ArrayList<String> arrCity = new ArrayList<>();
	ArrayList<String> arrWf = new ArrayList<>();
	
	arrList(arrTime,time.text().replace(":00 ", ":00/").split("/"));
	arrList(arrCity,city.text().split(" "));
	arrAllList(arrWf,wf.text().replace("리고 비","리고_비").replace(" ","/").replace("_"," ").split("/"));

	int cnt=0;
%>
						<table border="1">
							<tr>
								<th class="col-sm 2">날짜</th>
								<%for(int i=0;i<arrTime.size();i++){ %>
								<td><%=arrTime.get(i)%></td>
								<%} %>
							</tr>
							<tr>
							<%for(int i=0;i<arrCity.size();i++){ %>
								<th class="col-sm 2"><%=arrCity.get(i)%></th>
								<%for(int j=arrTime.size()*cnt;j<arrTime.size()*(cnt+1);j++){ %>
								<%-- <td><%=arrWf.get(j) %></td> --%>
								<td><img src="../Weather/img/<%=arrWf.get(j)%>.png"></td>
							<%}%>
							</tr>
							<%cnt++;} %>
							
							
						</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>