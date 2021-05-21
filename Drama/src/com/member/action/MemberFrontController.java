package com.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MemberFrontController extends HttpServlet {
	

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		System.out.println("MemberFrontController doProcess()");
		// 주소에 따른 페이지 처리
		
		/************************************1. 페이지 주소 파싱**********************************************/
			// 가상주소 가져오기
		String requestURI = request.getRequestURI();
		//System.out.println("RequestURI: "+requestURI);
			// 프로젝트명
		String contextPath = request.getContextPath();
		//System.out.println("contextPath: "+contextPath);
			// 프로젝트명을 제외한 가상주소
		String command = requestURI.substring(contextPath.length());
		//System.out.println(command);
		
		/************************************1. 페이지 주소 파싱**********************************************/
		
		/************************************2. 페이지 주소 매핑(연결)**********************************************/
		
		// DB 사용여부에 따라서 페이지 구성 Model2 --> forward
		ActionForward forward = null;
		
		if(command.equals("/members/Login.do")){
			// 회원가입 페이지 -> View 페이지
			// 1. response 이동 (주소 변경, 페이지 변경)
			// response.sendRedirect("주소");
			
			// 2. forward 이동 (주소 변경없음, 페이지 변경)
			/* RequestDispatcher dis = request.getRequestDispatcher("주소");
			   dis.forward(request,response);
			*/
			System.out.println(command+" 주소 출력 ");
			
			forward= new ActionForward();
			forward.setPath("./loginMember.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/members/LoginPro.do")){
			forward=new ActionForward();
			forward.setPath("./processLoginMember.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/members/MemberResult.do")){
			forward=new ActionForward();
			forward.setPath("./resultMember.jsp");
		}
		else if(command.equals("/members/MemberAdd.do")){
			
			forward = new ActionForward();
			forward.setPath("./addMember.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/members/MemberAddPro.do")){
			
			forward = new ActionForward();
			forward.setPath("./processAddMember.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/members/MemberAddPro.do")){
			
			forward = new ActionForward();
			forward.setPath("./processAddMember.jsp");
			forward.setRedirect(false);
		}
		
		
		/************************************2. 페이지 주소 매핑(연결)**********************************************/
	
		/************************************3. 페이지 주소 이동**********************************************/
		
		if(forward!=null){
			//forward 객체 있음 => 페이지 이동 정보가 있음
			if(forward.isRedirect()){ //true
				
				response.sendRedirect(forward.getPath());
			}else{// false

				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		
		/************************************3. 페이지 주소 이동**********************************************/
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	System.out.println("MemberFrontController doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
	//	System.out.println("MemberFrontController doPost()");
		doProcess(request, response);
	}
	
}