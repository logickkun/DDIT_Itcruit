<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div>
<br>
<br>

	<div class="tab-content" id="myTabContent">
	<h5 style="text-align: center;">개인정보 수정</h5>
		<br>
		<br>


		<!-- 개인회원 회원가입 -->
		<form action="/account/member/signup.do" method="post"
			id="memSignupForm">
			<!--Candidate Signup Content-->
			<div class="tab-pane fade show active" id="twm-candidate-Signup">
				<div class="row justify-content-center">

					<div class="col-md-10">
						<div class="form-group mb-3">
							<input name="accountNm" id="accountNm" type="text"
								class="form-control" placeholder="이름(실명)" value="${av.accountNm }">

						</div>
					</div>

					<div class="col-md-10">
						<div class="form-group mb-3">
							<input name="accountId" id="accountId" type="text"
								class="form-control" placeholder="아이디(영어대소문자+숫자 조합 최대20자리)" readonly="readonly" value="${av.accountId }">
							<p id="accountIdMessage"></p>
						</div>
					</div>

					<div class="col-md-10">
						<div class="form-group mb-3">
							<input name="accountPswd" id="accountPswd" type="password"
								class="form-control"
								placeholder="비밀번호(영어대소문자+숫자+특수문자 조합 10~20자리)" value="${fn:substring(av.accountPswd, 0 ,10) }" required>
						</div>
					</div>

					<div class="col-md-10">
						<div class="form-group mb-3">
							<input name="reaccountPswd" id="reaccountPswd" type="password"
								class="form-control"
								placeholder="비밀번호 확인(영어대소문자+숫자+특수문자 조합 10~20자리)" value="${fn:substring(av.accountPswd, 0 ,10) }">
						</div>
					</div>

					<div class="col-md-10">
						<div class="row align-items-center">
							<div class="col-md-6">
								<div class="form-group mb-3">
								<fmt:formatDate value="${av.birthYmd }" pattern="yyyy-MM-dd" var="birthYmd"/>
									<input name="birthYmd" id="birthYmd" type="text"
										class="form-control" placeholder="생년월일(ex:19940101)" value="${birthYmd }">
								</div>
							</div>
							
							<div class="col-md-6">
							    <div class="icheck-primary d-inline">
							        <input type="radio" id="memGenderM" name="gender" value="M"
							            <c:if test="${av.gender == 'M'}">checked="checked"</c:if>>
							        <label for="memGenderM">남자&nbsp;</label>
							    </div>
							    <div class="icheck-primary d-inline">
							        <input type="radio" id="memGenderF" name="gender" value="F"
							            <c:if test="${av.gender == 'F'}">checked="checked"</c:if>>
							        <label for="memGenderF">여자</label>
							    </div>
							</div>
						</div>
					</div>

					<div class="col-md-10">
						<div class="row align-items-center">
							<div class="col-md-6">
							    <div class="form-group mb-3">
							        <input name="accountMail" id="accountMail" type="text" class="form-control"
							               placeholder="이메일" style="display: none;">
							        <input name="email1" id="email1" type="text" class="form-control" placeholder="이메일"
							               value="${fn:split(av.accountMail, '@')[0]}">
							    </div>
							</div>
							
							<c:set var="emailDomain" value="${fn:split(av.accountMail, '@')[1]}" />
							<div class="col-md-6">
							    <div class="form-group mb-3">
							        <div class="input-group" id="emailBox">
							            <span class="input-group-text">@</span>
							            <select name="site" id="site" class="form-select">
							                <option value="none">선택</option>
							                <option value="naver.com" ${emailDomain == 'naver.com' ? 'selected' : ''}>naver.com</option>
							                <option value="hanmail.net" ${emailDomain == 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
							                <option value="daum.net" ${emailDomain == 'daum.net' ? 'selected' : ''}>daum.net</option>
							                <option value="nate.com" ${emailDomain == 'nate.com' ? 'selected' : ''}>nate.com</option>
							                <option value="gmail.com" ${emailDomain == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
							                <option value="hotmail.com" ${emailDomain == 'hotmail.com' ? 'selected' : ''}>hotmail.com</option>
							                <option value="self" ${emailDomain == 'self' ? 'selected' : ''}>직접입력</option>
							            </select>
							        </div>
							    </div>
							</div>
						</div>
					</div>

					<div class="col-md-10">
						<div class="form-group mb-3">
							<div class="input-group">
								<input name="accountTell" id="accountTell" type="text"
									class="form-control" placeholder="휴대폰번호 (-는 제외하고 숫자만 입력해주세요)" value="${av.accountTell }">
							</div>
						</div>
					</div>

					<div class="col-md-10">
						<div class="form-group mb-3">
							<div class="input-group">
								<input name="accountZip" id="accountZip" type="text"
									class="form-control" placeholder="" value="${av.accountZip }">
								<button type="button" onclick="DaumPostcode()"
									class="btn btn-primary">주소 찾기</button>
							</div>
						</div>
					</div>

					<div class="col-md-10">
						<div class="form-group mb-3">
							<input name="accountAddr1" id="accountAddr1" type="text"
								class="form-control" placeholder="주소" value="${av.accountAddr1 }">
						</div>
					</div>

					<div class="col-md-10">
						<div class="form-group mb-3">
							<input name="accountAddr2" id="accountAddr2" type="text"
								class="form-control" placeholder="상세주소" value="${av.accountAddr2 }">
						</div>
					</div>




					<div class="col-md-10" style="display: flex; justify-content: center; align-items: center; height: 100%;">
					    <div class="form-group" style="flex: 0;">
					        <button type="button" class="btn site-button" id="memSignupBtn" style="background-color: #DCD8FC;">수정</button>
					    </div>
					</div>

				</div>
			</div>
			<sec:csrfInput />
		</form>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//다음 주소 api 예제 가져옴
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('accountZip').value = data.zonecode;
            document.getElementById("accountAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("accountAddr2").focus();
            
        }
    }).open();
}
function DaumPostcode1() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('AccountZip').value = data.zonecode;
            document.getElementById("AccountAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("AccountAddr2").focus();
            
        }
    }).open();
}
</script>