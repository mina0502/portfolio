<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
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
	arrAllList(arrWf,wf.text().replace("리고 비","리고_비").replace(" ","/").split("/"));

	int cnt=0;
%>
<%=arrTime%>
<%=arrCity%>
<%=arrWf%>