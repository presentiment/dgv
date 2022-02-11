<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Movie Seat</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <link href="${pageContext.request.contextPath}/resources/css/user/button.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/admin/admin_seat_stages.css" rel="stylesheet" />
	
</head>
    <body class="sb-nav-fixed">
        <div id="layoutSidenav">
            <jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
			<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
	           <div id="layoutSidenav_content">
                <div class="container-fluid px-4">
                    <h1 class="mt-4">좌석관리</h1>
                <div class="card mb-4">
                </div>
                <div class="card mb-4">
                    <div class="card-header" >
                        <i class="fas fa-table me-1"></i>
                       좌석관리
                    </div>
	                    <div class="admin_seat_container">
	                        <div class="admin_seat_wrapper">
	                              <div class="button-container-stage">
	                       
	                   </div>
	                            <div class="admin_seat_wrap">
	                                <div class="admin_seat_title">
	                                    <span class="admin_seat_screen">SCREEN</span>
	                                     <button class="w-btn w-btn-gray" type="button" style="padding: 6px 11px;color: white;border: 2px solid;">상영관 생성</button>
	                                </div>
	                                <div class="admin_seat_view">
	                                    <div class="admin_seat_line">
	                                       
	                                        <form action="#" id="adminTheaterSeatResult">
	                                        <div class="adminSeatSite">
	                                    	<c:forEach begin="1" end="9" var="i">
	                                 					<c:if test="${i == 1}">
	                                 						<c:set value="A" var="seatStage"></c:set>
	                                    				</c:if>
	                                    				<c:if test="${i == 2}">
	                                 						<c:set value="B" var="seatStage"></c:set>
	                                    				</c:if>
	                                    				<c:if test="${i == 3}">
	                                 						<c:set value="C" var="seatStage"></c:set>
	                                    				</c:if>
	                                    				<c:if test="${i == 4}">
	                                 						<c:set value="D" var="seatStage"></c:set>
	                                    				</c:if>
	                                    				<c:if test="${i == 5}">
	                                 						<c:set value="E" var="seatStage"></c:set>
	                                    				</c:if>
	                                    				<c:if test="${i == 6}">
	                                 						<c:set value="F" var="seatStage"></c:set>
	                                    				</c:if>
	                                    				<c:if test="${i == 7}">
	                                 						<c:set value="G" var="seatStage"></c:set>
	                                    				</c:if>
	                                    				<c:if test="${i == 8}">
	                                 						<c:set value="H" var="seatStage"></c:set>
	                                    				</c:if>
	                                    				<c:if test="${i == 9}">
	                                 						<c:set value="I" var="seatStage"></c:set>
	                                    				</c:if>
	                                    			<c:forEach begin="1" end="15" var="j">
	                                    				
	                                    					<c:if test="${j == 1}">
	                                    						<br>
	                                    					</c:if>
	                                    					<button id="seatNumber" value="true">${seatStage}${j}</button>
	                                    			</c:forEach> <!-- j foreach close-->
	                                    	
	                                    	</c:forEach> <!-- i foreach close-->
	                                    	</div>
	                                    </form>
	                                    </div>
	                                </div>
	                            </div>
	                            <div>
	                                <div class="card-body">
	                                    <table id="datatablesSimple">
	                                        <thead>
	                                            <tr>
	                                                <th>번호</th>
	                                                <th>약관이름</th>
	                                                <th>>약관 등록일</th>
	                                                <th></th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>Tiger Nixon</td>
	                                                <td>System Architect</td>
	                                                <td>Edinburgh</td>   
	                                                <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                            </tr>
	                                            <tr>
	                                                <td>Tiger Nixon</td>
	                                                <td>System Architect</td>
	                                                <td>Edinburgh</td>   
	                                                <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                            </tr>
	                                            <tr>
	                                                <td>Tiger Nixon</td>
	                                                <td>System Architect</td>
	                                                <td>Edinburgh</td>   
	                                                <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                            </tr>
	                                            <tr>
	                                                <td>Tiger Nixon</td>
	                                                <td>System Architect</td>
	                                                <td>Edinburgh</td>   
	                                                <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                            </tr>
	                                            <tr>
	                                                <td>Tiger Nixon</td>
	                                                <td>System Architect</td>
	                                                <td>Edinburgh</td>   
	                                                <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                            </tr>
	                                            <tr>
	                                                <td>Tiger Nixon</td>
	                                                <td>System Architect</td>
	                                                <td>Edinburgh</td>   
	                                                <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                            </tr>
	                                            <tr>
	                                                <td>Tiger Nixon</td>
	                                                <td>System Architect</td>
	                                                <td>Edinburgh</td>   
	                                                <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                            </tr>
	                                            <tr>
	                                                <td>Tiger Nixon</td>
	                                                <td>System Architect</td>
	                                                <td>Edinburgh</td>   
	                                                <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                            </tr>
	                                            <tr>
	                                                <td>Tiger Nixon</td>
	                                                <td>System Architect</td>
	                                                <td>Edinburgh</td>   
	                                                <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                            </tr>
	                                            <tr>
	                                                <td>Tiger Nixon</td>
	                                                <td>System Architect</td>
	                                                <td>Edinburgh</td>   
	                                                <td><button id="delBT" ><i class="fas fa-times"></i></button></td>                                           
	                                            </tr>
	                                            
	                                          
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	               </div>
              <jsp:include page="../default/admin_footer.jsp" />
            </div>
        </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/admin/datatables-simple-demo.js"></script>
    </body>
</html>
