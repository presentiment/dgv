<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Movie List</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script>
           function adminTerms(){
                 var popupX =(window.screen.width/2)-(300/2);
                 var popupY =(window.screen.height/2)-(300/2);                            
                 window.open('/movieRegister.mdo','','width=1200,height=700,left='+popupX+',top='+popupY+'screenX='+popupX+'.screenY='+popupY);
            }
    </script>
<style>
#delBT {
	border: none;
	background-color: rgb(255, 255, 255);
	color: red;
	font-weight: bolder;
}
#userLankAdd {
  	width: 11%;
    margin-left: 68%;
    background: linear-gradient(Red -32%, Orange 79%);
    border-radius: 5px;
    color: white;
    font-weight: bold;
    border-color: burlywood;
    height: 42px;
    margin-top: 19px;
    font-size: 23px;
}
}
</style>


</head>

<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
	
	<!--여기서 부터 수정가능!!-->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">영화관리</h1>

				<div class="card mb-4"></div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 영화등록
					</div>
					<div style="display: inline;">
						<span style="font-size: 24px; font-weight: 800; margin-left: 2%;"><i class="fas fa-table me-1"></i>Movie List</span>
							<button id="userLankAdd" onclick='adminTerms()'>Register</button>
						
					
						
						
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>번호</th>
									<th>장르</th>
									<th>>영화제목</th>
									<th>개봉일</th>
									<th>영화 상영 활성화여부</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
								<tr>
									<td>Tiger Nixon</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td></td>
									<td></td>
									<td><button id="delBT">
											<i class="fas fa-times"></i>
										</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="../default/admin_footer.jsp" />
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>

</body>

</html>
