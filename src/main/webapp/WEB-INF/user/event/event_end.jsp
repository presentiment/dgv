<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event End</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/user_event.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

</head>

<body class="block">
<jsp:include page="../default/user_header.jsp"></jsp:include>
  <!--본격 콘텐츠-->
  <div id="contaniner" class="" style="height: 1000px;">
    <!-- Contents Area -->
    <div class="event-board-wrap"> 
    <jsp:include page="../default/user_event_header.jsp"></jsp:include>
        <div class="cols-content" style="width: 980px;">
          <div class="col-detail event">
            <ul class="sect-evt-item-list " >

            	<c:forEach var="eventList" items="${eventList}" >
	              <li class="finishEvent">
	              	<input type="hidden" id="eventCode" value="${eventList.event_code }">
	                <a href="/eventDetail.do?event_code=${eventList.event_code}">
	                  <div class="thumb-image" >
                      	<img class="endEventImg" src="${eventList.event_img}" >
                      </div>
	                  <div class="event-desc">
	                    <p class="txt1">${eventList.event_title}</p>
	                    <p class="txt2">${eventList.start_date }~${eventList.end_date } <span class="dateFinish"> [기간종료]</span></p>
	                  </div>
	                </a>
	              </li>
              	</c:forEach>

            </ul>
          </div>
        </div>
      </div>
     </div>
 <jsp:include page="../default/user_footer.jsp"></jsp:include>

</body>
</html>