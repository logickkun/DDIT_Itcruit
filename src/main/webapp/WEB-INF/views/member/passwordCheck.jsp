<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <div class="container">
        <div class="row justify-content-center align-items-center" style="min-height: 70vh;">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">비밀번호 확인</h5>
                    </div>
                    <div class="card-body">
                        <input type="password" class="form-control" id="pswd" placeholder="비밀번호 입력">
                    </div>
                    <div class="card-footer text-end">
                        <button type="button" class="btn" id="autoComplete" style="background-color: black; color: white;">자동완성</button>
                        <button type="button" class="btn" id="btn" style="background-color: black; color: white;">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
<script type="text/javascript">

$(function(){
	
	$('#autoComplete').on('click', function(){
		$("#pswd").val('123qwe!@#QWE');
	});
	
	$("#btn").on("click",function(){
		
		var pswd = $("#pswd").val();
		
		console.log("버튼클릭" + pswd);
		
		$.ajax({
			url : "/myPage/member/passCheck",
			type : "post",
			data : {
				pswd : pswd
			},
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success : function(res){
            	
            	if(res == 'SUCCESS'){
            		location.href="/myPage/member/signUpUpdateForm.do";
            	}else{
            		
            		Swal.fire({
            			icon : "warning",
            			title : "비밀번호가 일치하지 않습니다"
            		})
            	}
            	
            }
			
			
		});
		
	});
	
	
	
});





</script>    