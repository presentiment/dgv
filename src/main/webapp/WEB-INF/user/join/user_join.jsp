<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath }/resources/images/banana_real.png">
<title>영화 그 이상적인 감동을</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/style.css">
   <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/button.css">
   <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/user-main-style.css">
   <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/swiper-bundle.min.css">
   <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
   <script   src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
   <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js" ></script>
   
   <style type="text/css">
   .issetUser {
      box-shadow: 0px 0px 20px 4px tomato;
      background-color: #ffdae0;
   }
   
   .nonesetUser {
      box-shadow: 0px 0px 20px 11px #7fffd482;
   	  background-color: rgb(199 234 220);
   }
   </style>
   
   <script type="text/javascript">
      var getIdCheck = new RegExp(/^[a-zA-Z0-9]{4,14}$/);
      var getPwCheck= new RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
      var getName= new RegExp(/^[가-힣]+$/);
      var getPhone= new RegExp(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/);
      var getEmail= new RegExp(/^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/);
      var getBirth= new RegExp(/^(19[0-9][0-9]|20\d{2})$/);


      //가입중재 참거짓판별을 위한 논리변수 
      var chk1 =false, chk2 = false, ch3 = false, chk4 = false, chk5 =false, chk6 =false, chk7 =false;
      
   $(function(){
      //회원가입 유효성 검사
      //keyup -> 마우스 눌렀다가 떼면 이벤트 발생
      
      $("#id").on('keyup', function(){
         $("#id").removeClass("issetUser");
         $("#id").removeClass("nonesetUser");
         $("#idCK").html('');
         
         console.log($("#id").val())
         if($("#id").val() == ""){ //빈칸 막기
            $("#id").addClass("issetUser");
            $("#idCK").html('<b style="color:orangered; font-size: smaller;">[ 아이디는 필수 입력값입니다! ]');
            chk1 =false;
         }else if(!getIdCheck.test($("#id").val())){
           $("#id").addClass("issetUser");
            $("#id").removeClass("nonesetUser");
            $("#idCK").html('<b style="color:orangered; font-size: smaller;;">[ 영문/숫자 최대 15자입니다! ]');
            chk1=false;
         } else {
             $("#id").removeClass("issetUser");
             $("#id").addClass("nonesetUser");
             $("#idCK").html('<b style="color:aquamarine; font-size: smaller;">[ 사용가능한 아이디입니다. ]');
             chk1 = true;
          }
         
         
         //아이디 중복검사 
         let userId = $('#id').val(); //input에 사용자가 입력한값 받아오고 
      
         
         console.log("userId : " + userId)
      
         
         if($("#id").val() != ""){
            $.ajax({
               method:"POST", //서버전송
               url:"/join.do", //controller쪽 url
               contentType: "application/json", // 서버에 보내는 데이터 형식
               dataType:"json", //서버응답!
               data: JSON.stringify({"user_id":userId}),
               success:function(result){
            	   console.log("result.msg"+result.msg)
                  if(result.msg == "FAIL"){                   
                        $("#id").removeClass("nonesetUser");
                        $("#id").addClass("issetUser");
                        $("#idCK").html('<b style="color:orangered; font-size: smaller;">[ 이미 사용중인 아이디입니다. ]');
                        chk1=false;
                  } else {
                        $("#id").removeClass("issetUser");
                        $("#id").addClass("nonesetUser");
                        $("#idCK").html('<b style="color:aquamarine; font-size: smaller;">[ 사용가능한 아이디입니다. ]');
                        chk1 = true;
                     }

                  
               },//success function
               error:function(){
                  console.log("통신실패");
               }
            });//ajax
         }
         
      }); //id 검증 메서드 끝
      
      
      //pw 검증 메서드
      $('#password').on('keyup',function(){    
    	  console.log("호순이가 입력한 값 : "+$(this).val())
         if($(this).val() ==""){
            $("#password").removeClass("issetUser");
             $("#password").removeClass("nonesetUser");
             $("#password").addClass("issetUser");
             $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호를 입력해주세요. ]');    
             console.log("첫번째 ")
              chk2 = false;
             
          }else if(!getPwCheck.test($("#password").val())){
        	  $("#password").removeClass("nonesetUser");
              $("#password").addClass("issetUser"); 
              $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호는 문자, 숫자, 특수문자의 조합으로<br> 8~16자리로 입력해주세요! ]');    
              console.log("두번째 ")
              chk2 = false;
          }else{
             $("#password").removeClass("issetUser");
             $("#password").addClass("nonesetUser");
             $("#psCK").html('<b style="color:aquamarine; font-size: smaller;">[ 사용가능한 비밀번호입니다. ]');    
             chk2 = true;
          }                  
       }); //pw 검증 메서드 끝
       
       
      //pw 확인 메서드
      $('#passwordRepeat').on('keyup' ,function(){
         if($(this).val() ==""){
            $("#passwordRepeat").removeClass("issetUser");
             $("#passwordRepeat").removeClass("nonesetUser");
             $("#passwordRepeat").addClass("issetUser");
             $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호를 확인해주세요. ]');    
              chk3 = false;
         }else if(!getPwCheck.test($("#passwordRepeat").val())){
       	  $("#passwordRepeat").removeClass("nonesetUser");
             $("#passwordRepeat").addClass("issetUser"); 
             $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호는 문자, 숫자, 특수문자의 조합으로<br> 8~16자리로 입력해주세요! ]');    
             chk3 = false;
         }else if($(this).val() != $("#password").val()){
        	 $("#passwordRepeat").removeClass("nonesetUser");
            $("#passwordRepeat").addClass("issetUser");
             $("#psCK").html('<b style="color:orangered; font-size: smaller;">[ 비밀번호가 다릅니다. 다시 확인해 주세요. ]');    
              chk3 = false;
         }else{
            $("#passwordRepeat").removeClass("issetUser");
             $("#passwordRepeat").addClass("nonesetUser");
             $("#psCK").html('<b style="color:aquamarine; font-size: smaller;">[ 비밀번호 확인이 완료되었습니다. ]');    
             chk3 = true;
         }
      });//pw 확인 메서드 끝 
      
      
      //이름 확인 메서드
      $('#name').on('keyup',function(){    
          if($(this).val() ==""){
             $("#name").removeClass("issetUser");
             $("#name").removeClass("nonesetUser");
             $("#name").addClass("issetUser");
             $("#nameCK").html('<b style="color:orangered; font-size: smaller;">[ 이름을 입력해주세요. ]');    
             chk4 = false;
              
           }else if(!getName.test($("#name").val())){            
              $("#name").addClass("issetUser"); 
              $("#nameCK").html('<b style="color:orangered; font-size: smaller;">[ 이름 형식이 맞지 않습니다! ]');    
              chk4 = false;
           }else{
              $("#name").removeClass("issetUser");
              $("#name").addClass("nonesetUser");
              $("#nameCK").html('<b style="color:aquamarine; font-size: smaller;">[ 확인되었습니다. ]');    
              chk4 = true;
           }                  
       });//이름 확인 메서드 끝
       
       
       //휴대폰번호 확인 메서드
       $('#phone').on('keyup',function(){    
          if($(this).val() ==""){
             $("#phone").removeClass("issetUser");
              $("#phone").removeClass("nonesetUser");
              $("#phone").addClass("issetUser");
              $("#phoneCK").html('<b style="color:orangered; font-size: smaller;">[ 휴대폰번호를 입력해주세요.(-포함) ]');    
               chk5 = false;
           }else if(!getPhone.test($("#phone").val())){            
               $("#phone").addClass("issetUser"); 
               $("#phoneCK").html('<b style="color:orangered; font-size: smaller;">[ 휴대폰번호를 확인해 주세요.(-포함) ]');    
               chk5 = false;
           }else{
              $("#phone").removeClass("issetUser");
              $("#phone").addClass("nonesetUser");
              $("#phoneCK").html('<b style="color:aquamarine; font-size: smaller;">[ 확인되었습니다. ]');    
              chk5 = true;
           }                 
       });//휴대폰번호 확인 메서드 끝
       
       
       //이메일 확인 메서드
       $('#email').on('keyup',function(){    
          if($(this).val() ==""){
             $("#email").removeClass("issetUser");
              $("#email").removeClass("nonesetUser");
              $("#email").addClass("issetUser");
              $("#emailCK").html('<b style="color:orangered; font-size: smaller;">[ 이메일을 입력해주세요. ]');    
               chk6 = false;
           }else if(!getEmail.test($("#email").val())){  
        	   $("#email").removeClass("nonesetUser");
               $("#email").addClass("issetUser"); 
               $("#emailCK").html('<b style="color:orangered; font-size: smaller;">[ 이메일 형식이 맞지 않습니다. ]');    
               chk6 = false;
           }else{
        	   //이메일 중복검사 
               let userEmail = $('#email').val(); //input에 사용자가 입력한값 받아오고 
                    
               console.log("userEmail : " + userEmail)     
               
               if($("#email").val() != ""){
                  $.ajax({
                     method:"POST", //서버전송
                     url:"/join_email.do", //controller쪽 url
                     contentType: "application/json", // 서버에 보내는 데이터 형식
                     dataType:"json", //서버응답!
                     data: JSON.stringify({"user_email":userEmail}),
                     success:function(result){
                  	   console.log("result.msg"+result.msg)
                        if(result.msg == "FAIL"){                   
                              $("#email").removeClass("nonesetUser");
                              $("#email").addClass("issetUser");
                              $("#emailCK").html('<b style="color:orangered; font-size: smaller;">[ 이미 사용중인 이메일입니다. ]');
                              chk6=false;
                        } else {
                              $("#email").removeClass("issetUser");
                              $("#email").addClass("nonesetUser");
                              $("#emailCK").html('<b style="color:aquamarine; font-size: smaller;">[ 사용가능한 이메일입니다. ]');
                              chk6 = true;
                        }
                        
                     },//success function
                     error:function(){
                        console.log("통신실패");
                     }
                  });
               }// 이메일 중복검사 끝
           }     
     
       });//이메일 확인 메서드 끝
       

       
     //생년월일중 "년" 확인 메서드
       $('#userYY').on('keyup', function(){
          if($(this).val() ==""){
               $("#userYY").removeClass("issetUser");
                $("#userYY").removeClass("nonesetUser");
                $("#userYY").addClass("issetUser");
                $("#birthCK").html('<b style="color:orangered; font-size: smaller;">[ 출생년도를 입력해주세요. ]');    
                 chk7 = false;
             }else if(!getBirth.test($("#userYY").val())){            
                 $("#userYY").addClass("issetUser"); 
                 $("#birthCK").html('<b style="color:orangered; font-size: smaller;">[ 출생년도를 다시 확인해주세요.(숫자만) ]');    
                 chk7 = false;
             }else{
                $("#userYY").removeClass("issetUser");
                $("#userYY").addClass("nonesetUser");
                $("#birthCK").html('<b style="color:aquamarine; font-size: smaller;">[ 확인되었습니다. ]');    
                chk7 = true;
             }                 
         });//생년월일 "년" 확인 메서드 끝  
         
         
         $("#term-CK").on('click', function(){
        	 
        		console.log("dddsss : " +	$("#userRealCheck").val())
        	  	if($("#userRealCheck").val() === 'true'){
        	  		$('input:checkbox[id="userTerm"]').removeAttr('disabled')
        	  		$('input:checkbox[id="userTerm"]').prop("checked",true)
        	  	}
         })
      
	  	$("#termCheckInfo").on('click',function(){
	  		window.name ="parentForm"
	  		window.open('termPage.do','childForm','width=800 height=800')
	  	})


	  	////회원가입 이미지 슬라이드
	  	
	  	var now =0;
        var img = 4;
        
        $(".slideShow > img").eq(0).siblings().hide()
        
        function slide(){
        	if(now == img){
        		$(".slideShow > img ").eq(now).fadeOut(1000)
        		$(".slideShow > img ").eq(0).fadeIn(1000)
        		
        		now =0;
        		
        	}else{
        		$(".slideShow > img ").eq(now).fadeOut(1000)
        		$(".slideShow > img ").eq(now+1).fadeIn(1000)
        		
        		now++;
        	}
        }
        setInterval(slide,3000)
	  	
   });
   
   // 회원가입 최종조건 검증
   // 약관동의 체크 여부
	
   function checkAll(){

      const termCheck = $('input:checkbox[id="userTerm"]').is(":checked") ==true;
      console.log("동의 :? " +termCheck)
      
      if(termCheck != true ){
         alert('약관확인을 클릭해주세요')
         
         
      }else{
        if(chk1 && chk2 && chk3 && chk4 && chk5 && chk6 && chk7 &&termCheck){
          alert("회원가입 성공!!")
          console.log("성공")
          document.joinForm.submit();
        }else{
        	console.log("chk1 : "+chk1+"chk2 : "+chk2+"chk3 : "+chk3+"chk4 : "+chk4+"chk5 : "+chk5+"chk6 : "+chk6 +"chk7 : "+chk7)
           alert("빈칸이나 유효하지 않는 값이 있습니다. 다시 확인해주세요!!")
           console.log("실패")
           return false;
        }
      }
    }

         
  
</script>
<style>

.spidy-wrapper {
    width: 26rem;
    height: 286px;
    display: flex;
    flex-wrap: wrap;
    place-content: center;
    padding-top: 3rem;
}

.spidy__frame {
    position: relative;
    width: 335px;
    height: 400px;
    box-shadow: 4px 8px 16px 0 rgba(0, 0, 0, 0.1);
    background: #181041;
    box-shadow: 10px 5px 20px #5d0c0f;
    cursor: pointer;
}

.spidy__frame > img {
    width: 115%;
    bottom: -5rem;
    left: -1.8rem;
    position: absolute;
}

.center {
    height: 100%;
    position: relative;
}

.center__element {
    width: 200px;
    margin: auto;
    margin-top: -2rem;
    position: relative;
    transition: all 0.5s cubic-bezier(0.52, 0.11, 0.07, 0.62);
}

.spidy__frame:hover .center__element {
    margin-top: 7rem;
}

.center__element img {
    width: 100%;
    filter: drop-shadow(0px 40px 10px #0e072c);
}

.element__tooltip {
    background: #ffffff1a;
    padding: 0.5rem 1rem;
    text-align: center;
    width: 150%;
    border-radius: 5px;
    position: absolute;
    top: -6rem;
    left: -3.5rem;
    z-index: 2;
    opacity: 0;
    transition: all .5s;
    color: #d6d2e8;
    letter-spacing: 2px;
    box-shadow: 0px 5px 10px #100932;
}

.element__tooltip:before {
    content: '';
    width: 1px;
    height: 120%;
    position: absolute;
    top: 100%;
    left: 4.5rem;
    border-radius: 40%;
    transform: rotate(20deg);
    background-image: repeating-linear-gradient(50deg, #ffffff, #ffffff 3px, #000000 3px, #000000 5px);
}

.element__tooltip:after {
    content: '';
    width: 1px;
    height: 100%;
    position: absolute;
    top: 100%;
    border-radius: 40%;
    right: 3.8rem;
    transform: rotate(-25deg);
    background-image: repeating-linear-gradient(50deg, #ffffff, #ffffff 3px, #000000 3px, #000000 4px);
}

.spidy__frame:hover .element__tooltip {
    opacity: 1;
    transition: all 2s;
}
.moon_area {
  display: grid;
  align-items: center;
  justify-items: center;
  margin: 0;
  height: 163px;
  width: 169px;
}

div.moon {
     width: 68px;
    height: 62px;
    border-radius: 50%;
    box-shadow: 0 0 20px #ffb10e, 
    		-20px 0 80px #ff9700, 
    		 20px 0 80px #fff700, 
    		 inset 0 0 50px #fff, 
    		 inset 50px 0 80px #fbe207, 
    		 inset -50px 0 80px #ffa100, 
    		 inset 50px 0 300px #fb831b, 
    		 inset -50px 0 300px #f00;
    animation: pulsate 6s linear infinite;
}

@keyframes pulsate {
  50% {
         box-shadow: 0 0 20px #ffb10e, 
         -20px 0 80px #ff9700, 
         20px 0 80px #ff6100, 
         inset 0 0 50px #fad2a1, 
         inset 50px 0 80px #fb6e07, 
         inset -50px 0 80px #ff6100, 
         inset 50px 0 300px #f05e04, 
         inset -50px 0 300px #f00;
  }
}

</style>
</head>

<body class="block" style="">
<jsp:include page="../default/user_header.jsp"></jsp:include>
   <div class="wrapper sign-up-background">
      <div class="inner">
         <div class="spidy-wrapper">
	         <div class="moon_area">
		     	<div class="moon"></div>
		     </div>
  <div class="spidy__frame">
  	<div class="slideShow">
  		<img style="position: absolute; height:100%" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/yyyyyyyyy.jpg" >
  		<img style="position: absolute; height:100%" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/xxxxxxxx.jpg" >
  		<img style="position: absolute; height:100%" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/zzzzzzzzzzzzzzz.jpg" >
  		<img style="position: absolute; height:100%" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/ccccccccc.jpg" >
  		<img style="position: absolute; height:100%" src="https://dgvworld.s3.ap-northeast-2.amazonaws.com/ddd.jpg" >
  	</div>
      <div class="center">
      <div class="center__element">
        <img class="element__spidy" style="position: relative;" src="https://vignette.wikia.nocookie.net/marveldatabase/images/9/92/Peter_Parker_%28Earth-30847%29_from_Marvel_vs._Capcom_Infinite_0001.png/revision/latest?cb=20170922195944%22" alt="Spiderman, credit:wikia">
        <div class="element__tooltip"> 영화 그 이상의 감동을 DGV</div>
      </div>
    </div>
    <img src="" >
</div>
</div>
      <form action="/register.do" method="post" name="joinForm" >
          <div class="register-wrapping">
            <p class="register-title">
               <img src="${pageContext.request.contextPath }/resources/images/dgvMainLogo.png">
               <span class="sign-up">Sign Up</span>
            </p>
            <div class="form-wrapper form-wrapper-id">
               <div class="form-wrapper">
                  <input id="id" name="user_id" type="text" placeholder="아이디" class="form-control" maxlength="15" style="height: 35px;">
                     <div style="text-align: center;"><span id="idCK"></span></div>
               </div>
            </div>

            <div class="form-wrapper">
               <input type="password" name="user_pw" placeholder="비밀번호" id="password" class="form-control" maxlength="16" min="8"style="height: 35px;"> 
                  <i class="zmdi zmdi-lock"></i>
                     
            </div>
            <div class="form-wrapper">
               <input type="password" placeholder="비밀번호 확인" class="form-control" id="passwordRepeat"> 
                  <i class="zmdi zmdi-lock"></i>
                     <div style="text-align: center;"><span id="psCK"></span></div>
            </div>

            <div class="form-wrapper">
               <input name="user_name" type="text" placeholder="이름" id="name" class="form-control"> 
                  <i class="zmdi zmdi-account-box"></i>
                     <div style="text-align: center;"><span id="nameCK"></span></div>
            </div>
            
            
            <!-- BIRTH -->
            <div class="form-wrapper">
               <!-- BIRTH_YY -->
               <div class="user-birth"> 
                  <input id="userYY" name="user_year" class="userYear"  placeholder="년(4자)" maxlength="4">
                  
                  <!-- BIRTH_MM -->
                  <select class="userMonth" id="userMM" name="user_month">   
                     <option class="optionMonth" name="month">월</option>
                     <c:forEach var="i" begin="1" end="12" >
                     <c:choose>
                        <c:when test="${i <10 }">
                           <option value="0${i}">0${i}월</option>
                        </c:when>
                        <c:otherwise>
                           <option value="${i}">${i}월</option>
                        </c:otherwise>
                     </c:choose>
                     </c:forEach>
                  </select>
                  
                  <!-- BIRTH_DD -->
                  <!-- 사용자가 선택시 택(1) -->
                  <select class="userDay" id="userDD" name="user_day" >   
                     <option class="optionDay" name="day">일</option>
                     <c:forEach var="i" begin="1" end="31" >
                     <c:choose>
                        <c:when test="${i <10 }">
                           <option value="0${i}">0${i}일</option>
                        </c:when>
                        <c:otherwise>
                           <option value="${i}">${i}일</option>
                        </c:otherwise>
                     </c:choose>
                     </c:forEach>
                  </select>
                  <!-- 사용자가 입력시 (택2) -->
                 <!--  <input class="userDay" id="userDD" name="user_day" placeholder="일">
                  <div style="text-align: center;"><span id="birthCK"></span></div> -->
               </div>
               <div style="text-align: center;"><span id="birthCK"></span></div>
            </div>
            
            
            <div class="form-wrapper">
               <input type="text" id="phone" name="user_phone" placeholder="휴대폰번호" class="form-control"> 
                  <i class="zmdi zmdi-phone"></i>
                     <div style="text-align: center;"><span id="phoneCK"></span></div>
            </div>

            <div class="form-wrapper">
               <input type="email" id="email" name="user_email" placeholder="이메일" class="form-control"> 
                  <i class="zmdi zmdi-email"></i>
                     <div style="text-align: center;"><span id="emailCK"></span></div>
            </div>
            <div style=" text-align: center;">
            	<input type="hidden" id="userRealCheck"  >
                <input type="checkbox" id="userTerm" disabled="disabled" name="user_term" value="OK">
                <span style="color: orange;">약관동의여부</span>
                <span id="termCheckInfo" style="color: orange;cursor: pointer;" >[약관확인]</span>
                <div>
            		<span id="term-CK" style="color: orange;cursor: pointer;" >약관확인 후 클릭해주세요</span>
            	</div>
            </div>
            <input class="w-btn w-btn-gra3 w-btn-gra-anim sign-up-font"  id="joinBtn" onclick="checkAll()" value="Register" >            
                </div>
                </form>
                </div>
      </div>  

   <jsp:include page="../default/user_footer.jsp"></jsp:include>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>