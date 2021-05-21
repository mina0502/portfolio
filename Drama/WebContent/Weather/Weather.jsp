<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script> 
<script src="../resources/js/jquery-3.6.0.js"></script>

<script type="text/javascript">
   $(document).ready(function(){
	   	$('#mo').click(function(){
	   		$.ajax({
	 		   url: "../Weather/WeatherPro.jsp",
	 		   type:"post",
	 		   success:function(data){
	 			  if(!$('#TT tr:eq(0)').html())
	 				  {
	  				  	 var cnt=0;
		 	 			 var t=data.replace("[","").split("]");
		 	 			 var time=t[0].trim().split(",");
			 			 var city=t[1].replace("[","").split(",");
			 			 var wf=t[2].replace("[","").split(", ");
			 			 var tabl="";
			 			 tabl+="<tr>";
			 			 tabl+="<th>날씨</th>";
			 			 for(var i=0;i<time.length;i++)
			 				 {
			 				 	tabl+="<td>";
			 				 	tabl+=time[i];
			 				 	tabl+="</td>";
			 				 }
			 			 tabl+="</tr>";
			 			 for(var i=0;i<city.length;i++)
			 				 {
					 			 tabl+="<tr>";
					 			 tabl+="<th>";
					 			 tabl+=city[i];
					 			 tabl+="</th>";
					 			 var start= time.length*cnt;
					 			 var end = time.length*(cnt+1);
					 			 for(var j=start;j<end;j++)
					 				 {
					 				 	var img= "<img src=../Weather/img/";
					 				 	img+=wf[j].trim();
					 				 	img+=".png>";
						 				 tabl+="<td>";
						 				 tabl+=img;
							 			 tabl+="</td>";
					 				 }
					 			 tabl+="</tr>";
					 			 cnt++;
			 				 }
						$('#TT').append(tabl);
	 				  }

	 		   }
	 	   });
	   	})   
	   
   });
</script>
</head>
<body>
<button type="button" class="btn btn-dark navbar-brand" id="mo" data-toggle="modal"
		data-target="#Modal">전국날씨</button>
		<div class="modal fade" id="Modal" tabindex="-1" role="dialog"
			aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: auto; display: table">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="ModalLabel">날씨정보 
						(맑음:<img src="../Weather/img/맑음.png">&nbsp;구름많음:<img src="../Weather/img/구름많음.png">
						  비:<img src="../Weather/img/비.png">&nbsp;흐리고 비:<img src="../Weather/img/흐리고_비.png">
						 흐림:<img src="../Weather/img/흐림.png">)</h5>
					</div>
						<table id="TT" border="1">
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