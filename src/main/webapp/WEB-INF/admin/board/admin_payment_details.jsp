<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin payment details</title>
	<link href="${pageContext.request.contextPath }/resources/css/admin/styles.css" rel="stylesheet" />
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script> --%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script><!-- jQuery CDN --->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"	crossorigin="anonymous"></script>
	<script type="text/javascript">
		function cancelAction(reserveCode, reserveImpUid, reserveMerchantUid, reservePrice){
			
			var msg = confirm("정말로 삭제하시겠습니까?")
			
			if(msg){
			  $.ajax({
			      url: "/adminpaymentCancel.mdo", // 예: http://www.myservice.com/payments/cancel
			      type: "POST",
			      contentType: "application/json",
			      dataType: "json",
			      data: JSON.stringify({
			    	"reserve_imp_uid":reserveImpUid,
			        "reserve_merchant_uid": reserveMerchantUid, // 예: ORD20180131-0000011
			        "reserve_price": reservePrice // 환불금액
			      //  "reason": "테스트 결제 환불" // 환불사유
			      })		     	
			    }).done(function(result){
			    	alert("환불 성공")
			    }).fail(function(error){
			    	alert("환불 실패")
			    }) //close ajax
			}
		}
	</script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/admin_top_menu.jsp"></jsp:include>
		<jsp:include page="../default/admin_side_menu.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">결제내역 관리</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 결제목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple" name="paymentDetails">
								<thead>
									<tr>
										<th>번호</th>
										<th>회원</th>
										<th>결제고유ID</th>
										<th>예매번호</th>
										<th>영화제목</th>
										<th>결제금액</th>
										<th>결제수단</th>
										<th>카드승인번호</th>
										<th>결제일</th>
										<th>결제취소여부</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="paymentList" items="${paymentList}" varStatus="status">
									<tr id="trWrap">
										<td>${status.index+1}</td>
										<td>${paymentList.user_id}</td>
										<td>${paymentList.reserve_imp_uid}</td>
										<td>${paymentList.reserve_merchant_uid}</td>
										<td>${paymentList.movie_title}</td>
										<td>${paymentList.fomatter_price}</td>
										<td>${paymentList.reserve_method}</td>
										<td>${paymentList.reserve_apply_num}</td>
										<td>${paymentList.reserve_date}</td>
										<td style="text-align: center;"><button id="delBt"  onclick="cancelAction('${paymentList.reserve_code}','${paymentList.reserve_imp_uid}','${paymentList.reserve_merchant_uid}','${paymentList.reserve_price}')"><i class="fas fa-trash-alt"></i></button></td>
									</tr>		
								</c:forEach>						
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="../default/admin_footer.jsp" />
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/admin/datatables-simple-demo.js"></script>
</body>
</html>
