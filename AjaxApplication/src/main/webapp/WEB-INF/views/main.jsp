<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#modal1 th {
		height: 40px;
		width: 150px;
	}
	
	#modal2 th {
		height: 30px;
		width: 100px;
	}
	
	#modal3 tbody th {
		height: 30px;
		width: 150px;
	}
	#areaList th {
		height: 30px;
		width: 300px;
	}
	
	#modal4 th {
		height: 40px;
		width: 150px;
	}
	
</style>

</head>
   <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/css/basic/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/css/custom.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/resources/css/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${pageContext.request.contextPath}/resources/css/animate/animate.css/animate.min.css" rel="stylesheet">    
    <!-- 체크박스 -->
    <link href="${pageContext.request.contextPath}/resources/css/iCheck/blue.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">  
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath}/resources/css/jqvmap/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- jQuery custom content scroller -->
    <link href="${pageContext.request.contextPath}/resources/css/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>
    
    <!-- 데이터테이블 -->
    <link href="${pageContext.request.contextPath}/resources/css/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/datatables/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/datatables/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/datatables/scroller.bootstrap.min.css" rel="stylesheet">
    
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body class="nav-md">
   

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                            <div class="card-box table-responsive">
                    <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                      <thead>
                        <tr>
                          <th>사용자ID</th>
                          <th>사용자 이름</th>
                          <th>전화번호</th>
                          <th>E-mail</th>
                          <th>권한</th>
                        </tr>
                      </thead>
						
                      <tbody id="userList">
						<c:forEach items="${ list }" var="l">                      
	                        <tr data-toggle="modal" data-target=".bs-example-modal-lg3">
	                          <td>${ l.userId }</td>
	                          <td>${ l.userName }</td>
	                          <td>${ l.phone }</td>
	                          <td>${ l.email }</td>
	                          <c:choose>
	                          	<c:when test="${ l.power == 0}">
	                          		<td>일반</td>
	                          	</c:when>
	                          	
	                          	<c:when test="${ l.power == 1 }">
	                          		<td>운영자</td>
	                          	</c:when>
	                          	
	                          	<c:otherwise>
	                          		<td>관리자</td>
	                          	</c:otherwise>
	                          </c:choose>
	                        </tr>
	                    </c:forEach>
                      </tbody>
                    </table>
					<br>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg1">사용자등록</button>

                    <div class="modal fade bs-example-modal-lg1" tabindex="-1" role="dialog" aria-hidden="true" id="modal1">
                      <div class="modal-dialog modal-lg">
                        <div class="modal-content">
  
                          <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">사용자등록</h4>
                            <button type="button" class="close" data-dismiss="modal" id="closeModal1"><span aria-hidden="true">×</span>
                            </button>
                          </div>
                         
                          <div class="modal-body">
                            <table>
                              <tr>
                                <th>사용자ID</th>
                                <td><input type="text" class="a2" name="userId" id="userId"></td>
                              </tr>
                              <tr>
                                <th>중복 확인</th>
                                <td><button id="idCheck">중복확인</button></td>
                              </tr>
                              <tr>
                                <th>사용자 이름</th>
                                <td><input type="text" class="a1 a2" id="userName" disabled></td>
                              </tr>
                              <tr>
                                <th>패스워드</th>
                                <td><input type="password" class="a1 a2" id="pwd" disabled></td>
                              </tr>
                              <tr>
                                <th>패스워드 확인</th>
                                <td><input type="password" class="a1 a2" id="passwordCheck" disabled></td>
                              </tr>
                              <tr>
                                <th>핸드폰</th>
                                <td><input type="tel" class="a1 a2" id="phone" disabled></td>
                              </tr>
                              <tr>
                                <th>E-mail</th>
                                <td><input type="email" class="a1 a2" id="email" disabled></td>
                              </tr>
                              <tr>
                                <th>권한</th>
                                <td>
                                  <select id="power" name="power" class="a1" disabled>
                                    <option id="default">권한선택</option>
                                    <option value="0">일반</option>
                                    <option value="1">운영자</option>
                                    <option value="2">관리자</option>
                                  </select>
                                </td>
                              </tr>

                            </table>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="insertUser">등록</button>
                          </div>         
                        </div>
                      </div>
                    </div>
                    
                    <script>
                    	$(function(){
                    		//modal close
                    		$("#closeModal1").click(function(){
                    			$("#userId").val("");
                    			$("#userName").val("");
                    			$("#phone").val("");
                    			$("#pwd").val("");
                    			$("#passwordCheck").val("");
                    			$("#email").val("");
                    			$("#default").attr("selected");
                    		});
                    		
                    		//modal close
                    		$("#closeModal3").click(function(){
                    			$("#newPwd").val("");
                    			$("#newPwdCheck").val("");
                    		});
							
                    		$("#insertUser").click(function(){
                    			
                    			if($("#userId").val() != ""){
                    			//입력한 비밀번호와 비밀번호재확인 비밀번호가 일치할 경우만 실행	
                    			if($("#pwd").val() == $("#passwordCheck").val()){
                    				
                    			// 새로운 유저 등록 Ajax Start
                    			$.ajax({
                    				url:"insertUser.us",
                    				data:{
                    						"userId":$("#userId").val(), 
                    						"userName":$("#userName").val(),
                    						"password":$("#pwd").val(),
                    						"phone":$("#phone").val(),
                    						"email":$("#email").val(),
                    						"power":$("#power").val()},
                    							
                    				type: "post",
                    				success: function(data){
                    					if(data == 1){
                    						alert("추가성공");
                    						location.reload();
                    						$(".a2").val("");
                    						$(".a1").attr("disabled",true);
                    						$("#power").prop("selectedIndex",0);
                    						$("#closeModal1").click();
                    						
                    					}else{
                    						alert("추가실패");
                    					}
                    				},
                    				error: function(){
                    					console.log("ajax 실패");
                    				}
                    			});
                    				
                    			}else{
                    				alert("비밀번호를 다시 확인해주세요.");
                    				$("#passwordCheck").val("").focus();
                    			}
                    				
                    			}else{
                    				alert("아이디를 입력해주세요.");
                    			}
                    			
                    				
                    		});  
                    		
                    		//중복확인 
                    		$("#idCheck").click(function(){
                    			
                    			if($("#userId").val() != ""){
	                    			$.ajax({
	                    				url:"idCheck.us",
	                    				data:{"userId":$("#userId").val()},
	                    				type:"post",
	                    				success: function(data){
	                    					if(data == 1){
	                    						alert("사용 가능한 아이디 입니다.");
	                    						$(".a1").attr("disabled",false);
	                    						
	                    					}else{
	                    						alert("사용 불가능한 아이디 입니다.");
	                    					}
	                    					
	                    				},
	                    				error: function(){
	                    					console.log("ajax 실패");
	                    				}           				
	                    			});
                    			
                    			}else{
                    				alert("아이디를 입력해주세요.");
                    			}
                    		});
                    		
                    		
                    		//목록에 있는 user 클릭시 모달에 해당유저 정보 출력
                    		$("#userList").on("click","tr",function(){
                    			
                    			var userId = $(this).children("td").eq(0).text();

                    			$.ajax({
                    				
                    				url:"selectUserInfo.us",
                    				data:{"userId":userId},
                    				type:"post",
                    				success: function(userInfo){
                    					$("#userId1").val(userInfo.userId);
                    					$("#userName1").val(userInfo.userName);
                    					$("#pwd1").val(userInfo.password);
                    					$("#phone1").val(userInfo.phone);
                    					$("#email1").val(userInfo.email);
                    					var power = userInfo.power;
                    					console.log(power);
                    					if(power == 0){
                    						$("#power1").prop("selectedIndex",1);
                    					}else if(power == 1){
                    						$("#power1").prop("selectedIndex",2);
                    					}else{
                    						$("#power1").prop("selectedIndex",3);
                    					}
                    				},
                    				error: function(){
                    					console.log("ajax 실패");
                    				}
                    				
                    			});
                    			
                    		});
                    		
                    		//정보 수정 Ajax Start
                    		$("#modifyBtn").click(function(){
                    			
                    			if($("#pwd1").val() == $("#pwdCheck1").val()){
                    				
                    			var result = confirm("수정하시겠습니까?");
                    			
                    			if(result){
                    				$.ajax({
                    					
                    					url:"modifyUserInfo.us",
                    					data:{
                    							"userId":$("#userId1").val(),
												"userName":$("#userName1").val(),
												"password":$("#pwd1").val(),
												"phone":$("#phone1").val(),
												"email":$("#email1").val(),
												"power":$("#power1").val()
                    					},
                    					type:"post",
                    					success: function(data){
                    						if(data == 1){
                    							alert("수정 완료");
                    							$("#closeModal2").click();
                    							location.reload();
                    						}else{
                    							alert("수정 실패");
                    						}
                    						
                    					},
                    					error: function(){
                    						console.log("ajax 실패");
                    					}
                    					
                    				});
                    			}
                    				
                    			}else{
                    				alert("비밀번호가 일치하지 않습니다.");
                    			}
                    			

                    		});
                    		
 
                    		//정보수정(비밀번호변경) 버튼 클릭시 Ajax
                    		$("#modifyPwdBtn").click(function(){
                    			
                    			if($("#newPwd").val() == $("#newPwdCheck").val()){
                    				$.ajax({
                    					url:"changePwd.us",
                    					data:{
                    						"userId": "${ loginUser.userId }",
                    						"password" : $("#newPwd").val()
                    						},
                    					type:"post",
                    					success: function(data){
                    						
                    						if(data == 1){
                    							alert("비밀번호 변경 완료");
                    							$("#closeModal3").click();
                    							
                    						}else{
                    							alert("비밀번호 변경 실패");
                    						}
                    						
                    					},
                    					error: function(){
                    						console.log("ajax 실패");
                    					}
                    				});
                    				
                    				
                    			}else{
                    				alert("비밀번호가 일치하지 않습니다.");
                    			}
                    			
                    		});
                    		
                       		
							//권한 등록 Ajax Start
							
							//DB에 있는 userList 갯수 만큼 option태그 반영
                    		$("#addPower").click(function(){
                    			
                    			$.ajax({
                    				
                    				url:"selectUserList.us",
                    				type:"post",
                    				success: function(list){
                    					
                    					var value="<option selected> == </option>";
                    						
                    					$.each(list,function(i,obj){
                    						value += "<option class='" + obj.power + "'>" + obj.userId + "</option>";
                    					});
                    					$("#selectUser").html(value);
                    				},
                    				error: function(){
                    					console.log("ajax 실패");
                    				}

                    			});
                    			
                    		});
                    		var data1 = "";
                    		var data2 = "";
                    		var data3 = "";
                    		var data4 = "";
                    		
                    		$("#selectUser").on("change",function(){
								data1 = $("#selectUser option:selected").text();
								data2 = $("#selectUser option:selected").attr("class");

								reloadAreaList();
								
								//DB에 있는 StateList 갯수 만큼 option태그 반영
                    			$.ajax({
                    				
                    				url :"selectArea.us",
                    				type: "post",
                    				success: function(list){
                    					
                    					var value = "<option selected> == </option>";
                    						
                    					
                    					$.each(list,function(i,obj){
                    						value += "<option class='" + obj.seq + "'>" + obj.name + "</option>";                    						
                    					});
                    					
                    					$("#selectArea").html(value);
                    					
                    					

                    				},
                    				error: function(){
                    					console.log("ajax 실패");
                    				}
                    			});
                    		});
                    		
                    		$("#selectArea").on("change",function(){
                    			data3 = $("#selectArea option:selected").text();
                    			data4 = $("#selectArea option:selected").attr("class");
                    		});
                    		
                    		//권한 등록 버튼 클릭시 등록 Ajax 실행
                    		$("#addUserPaBtn").click(function(){
                    			
                    			if(data1 != "" && data2 != "" && data3 != "" && data4 !=""){
                    				
                    			$.ajax({
                    				url: ("addUserPa.us"),
                    				data: {
                    					"userId": data1,
                    					"power": data2,
                    					"stateName": data3,
                    					"stateCode": data4
                    					},
                    				type:"post",
                    				success: function(data){
                    					
                    					if(data == 1){
                    						alert("등록 성공");
                    						reloadAreaList();
                    					}else{
                    						alert("해당 내용은 이미 등록되어있습니다.");
                    					}
                    					
                    				},
                    				error: function(){
                    					console.log("ajax 실패");
                    				}
                    				
                    			});
                    				
                    			}else{
                    				alert("먼저 항목을 선택해주세요.");
                    			}
                    			
                    		});
                    		
                    		//user별 등록된 State 삭제 
                    		$("#deleteUserPaBtn").click(function(){
                    			
                    			$.ajax({
                    				url:"deleteUserPa.us",
                    				data:{
                    					"userId": data1,
                    					"power": data2,
                    					"stateName": data3,
                    					"stateCode" : data4
                    					},
                    				type:"post",
                    				success: function(data){
                    					if(data == 1){
                    						alert("해당정보 삭제 완료");
                    						reloadAreaList();
                    					}else{
                    						alert("해당정보 삭제 실패")
                    					}
                    				},
                    				error: function(){
                    					console.log("ajax 실패");
                    				}
                    				
                    			});
                    		});
                    		
                    		//modal close
                    		$("#closeModal4").click(function(){
                    			$("#selectUser option").remove();
                    			$("#selectArea option").remove();
                    			$("#areaList tr").remove();
                    			data1 = "";
                    			data2 = "";
                    			data3 = "";
                    			data4 = "";
                    		});
                    		
                    		//user별 권한등록된 State 목록 실시간 재구성
                    		function reloadAreaList(){
                    			var areaList = "";
                    			$.ajax({
									url:"selectAreaList.us",
									data:{"userId": data1},
									type:"post",
									success: function(list){
										
										$.each(list,function(i,obj){
											areaList += "<tr>" + 
															"<th>" + obj.stateName + "</th>"
														"</tr>";
										});
										
										$("#areaList").html(areaList);

									},
									error: function(){
										console.log("ajax 실패");
									}

								});
                    		}
                    	});
  
                    </script>


                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg2" id="addPower">관할관리소 권한등록</button>

                    <div class="modal fade bs-example-modal-lg2" tabindex="-1" role="dialog" aria-hidden="true" id="modal2">
                      <div class="modal-dialog modal-lg">
                        
  
                          <div class="modal-content">
  
                            <div class="modal-header">
                              <h4 class="modal-title" id="myModalLabel">권한등록</h4>
                              <button type="button" class="close" data-dismiss="modal" id="closeModal4"><span aria-hidden="true">×</span>
                              </button>
                            </div>
                            <div class="modal-body">
                             <table>
                              <tr>
                                <th>사용자 ID</th>
                                <td>
                                  <select id="selectUser" style="width:200px">
                                  </select>
                                </td>
                                
                              </tr>
                              
                              <tr>
                                <th>관리소</th> 
                                <td>
                                  <select id="selectArea" style="width:200px">
                                  </select>
                                </td>
                              </tr>
                             </table>
                             <hr>
                             <table id="areaList">
                             	
                             </table>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" id="deleteUserPaBtn">삭제</button>
                              <button type="button" class="btn btn-primary" id="addUserPaBtn">추가</button>
                            </div>  
                        </div>
                      </div>
                    </div>

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg4">정보수정</button>

                    <div class="modal fade bs-example-modal-lg4" tabindex="-1" role="dialog" aria-hidden="true" id="modal3">
                      <div class="modal-dialog modal-lg">
                        <div class="modal-content">
  
                          <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">정보수정</h4>
                            <button type="button" class="close" data-dismiss="modal" id="closeModal3"><span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">
                           <table>
                            <tr>
                              <th>사용자 ID</th> <td><input type="text" value="${ loginUser.userId }" disabled></td>
                            </tr>
                            <tr>
                              <th>새 비밀번호</th> <td><input type="password" name="newPwd" id="newPwd"></td>
                            </tr>
                            <tr>
                              <th>새 비밀번호 확인</th> <td><input type="password" id="newPwdCheck"></td>
                            </tr>

                           </table>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="modifyPwdBtn">수정</button>
                          </div>
                        </div>
                      </div>
                    </div>

             

                    <div class="modal fade bs-example-modal-lg3" tabindex="-1" role="dialog" aria-hidden="true" id="modal4">
                      <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                          <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">사용자수정</h4>
                            <button type="button" class="close" data-dismiss="modal" id="closeModal2"><span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <table>
                              <tr>
                                <th>사용자ID</th><td><input type="text" id="userId1" disabled></td>
                              </tr>
                              <tr>
                                <th>사용자 이름</th><td><input type="text" id="userName1"></td>
                              </tr>
                              <tr>
                                <th>패스워드</th><td><input type="password" id="pwd1"></td>
                              </tr>
                              <tr>
                                <th>패스워드 확인</th><td><input type="password" id="pwdCheck1"></td>
                              </tr>
                              <tr>
                                <th>핸드폰</th><td><input type="tel" id="phone1"></td>
                              </tr>
                              <tr>
                                <th>E-mail</th><td><input type="email" id="email1"></td>
                              </tr>
                              <tr>
                                <th>권한</th>
                                <td>
                                  <select id="power1">
                                    <option id="default">권한선택</option>
                                    <option value="0">일반</option>
                                    <option value="1">운영자</option>
                                    <option value="2">관리자</option>
                                  </select>
                                </td>
                              </tr>

                            </table>

                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="modifyBtn">수정</button>
                          </div>
                        </div>
                      </div>
                  </div>

            </div>
                </div>
              </div>

		</div>

    	</div>
      </div>
    </div>
     <!-- 각종 JS들 -->
	<script src="${pageContext.request.contextPath}/resources/js/build/custom.min.js"></script>
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery/jquery.min.js"></script>    
    <!-- Bootstrap 용환-검색땜에 추가해야함 -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.bundle.min.js"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/resources/js/iCheck/icheck.min.js"></script>    
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/resources/js/etc/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/resources/js/etc/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="${pageContext.request.contextPath}/resources/js/chart/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="${pageContext.request.contextPath}/resources/js/etc/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- Skycons -->
    <script src="${pageContext.request.contextPath}/resources/js/etc/skycons.js"></script>
    <!-- Flot -->
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.pie.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.time.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.stack.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.orderBars.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.spline.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="${pageContext.request.contextPath}/resources/js/dateJS/date.js"></script>
    <!-- JQVMap -->
    <script src="${pageContext.request.contextPath}/resources/js/jqvmap/jquery.vmap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jqvmap/jquery.vmap.world.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jqvmap/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/resources/js/etc/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/etc/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- Datatables -->
    <script src="${pageContext.request.contextPath}/resources/js/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.flash.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.fixedHeader.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.keyTable.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/responsive.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.scroller.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/pdfmake.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/vfs_fonts.js"></script>
	<!-- jQuery custom content scroller -->
    <script src="${pageContext.request.contextPath}/resources/css/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    
    	<!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/js/basic/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>




  </body>
</html>