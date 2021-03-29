<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %>
<%!
	public Integer toInt(String x){
		int a = 0;
		try{
			a = Integer.parseInt(x);
		}catch(Exception e){}
		return a;
	}
%>
<%
	int pageno = toInt(request.getParameter("pageno"));
	if(pageno<1){
		pageno = 1;
	}
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	String sql= "select count(*) from jpdrama";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int total_record;
	if(rs.next())
	{
		total_record=rs.getInt(1);
	}
	else
	{
		total_record=0;
	}


	int page_per_record_cnt = 9;  
	int group_per_page_cnt =10;    										

	int record_end_no = pageno*page_per_record_cnt;				
	int record_start_no = record_end_no-(page_per_record_cnt-1);
	if(record_end_no>total_record){
		record_end_no = total_record;
	}
										   
										   
	int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
	if(pageno>total_page){
		pageno = total_page;
	}

	int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);			  
	
	int page_eno = group_no*group_per_page_cnt;
	int page_sno = page_eno-(group_per_page_cnt-1);
	
	if(page_eno>total_page){	
		page_eno=total_page;
	}
	
	int prev_pageno = page_sno-group_per_page_cnt; 
	int next_pageno = page_sno+group_per_page_cnt;
	if(prev_pageno<1){		
		prev_pageno=1;
	}
	if(next_pageno>total_page){	
		next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
	
	}

%>



<a class="btn btn-secondary" href="../products/products.jsp?pageno=1">&laquo;</a>
<a  class="btn btn-primary" href="../products/products.jsp?pageno=<%=prev_pageno%>">[이전]</a> 
<%for(int i =page_sno;i<=page_eno;i++){%>
	<a class="btn btn-success" href="../products/products.jsp?pageno=<%=i %>">
		<%if(pageno == i){ %>
			『<%=i %>』
		<%}else{ %>
			<%=i %>
		<%} %>
	</a> 
<%} %>
 
<a class="btn btn-primary" href="../products/products.jsp?pageno=<%=next_pageno%>" >[다음]</a>
<a class="btn btn-secondary" href="../products/products.jsp?pageno=<%=total_page %>">&raquo;</a>


