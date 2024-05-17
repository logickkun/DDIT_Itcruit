<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<body>
<div class="payment">
	<button onclick="requestPay()">결제하기</button>
</div>

</body>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script type="text/javascript">
function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    const settings = {
	  async: true,
	  crossDomain: true,
	  url: 'https://api.portone.io/login/api-secret',
	  method: 'post',
	  headers: {
	    'Content-Type': 'application/json'
	  },
	  processData: false,
	  data: '{"apiSecret":"PYxr3MVG2rV1t624b5NYArecF73eDUUXkr1qVx5zO5z879fGOKtvWPZdMZ4JrjoAsW3neVWRj1XOeiF1"}'
	};
	
	$.ajax(settings).done(function (response) {
	  console.log(response);
	});

	// 이전 주문번호의 숫자를 기억할 변수
	let previousOrderNumber = 0;

	// 주문번호 만들기
	function createOrderNum() {
	    const date = new Date();
	    const year = date.getFullYear();
	    const month = String(date.getMonth() + 1).padStart(2, "0");
	    const day = String(date.getDate()).padStart(2, "0");
	    
	    // 이전 주문번호의 숫자 증가
	    previousOrderNumber++;

	    // 주문번호 생성
	    let orderNum = year + month + day + "_" + previousOrderNumber;
	    return orderNum;
	}
	
    IMP.init('imp24033840');
    IMP.request_pay({ // param
        pg: 'kakaopay',
        pay_method: "card",
        merchant_uid: createOrderNum(), //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: "기업 프로세스이용금액", //결제창에 노출될 상품명
        amount: 10000, //금액
        buyer_email : "samsung@ss.com", 
        buyer_name : "삼성_인사과",
        buyer_tel : "010-4444-8888",  // -있어야한다 
        buyer_addr: "서울특별시 강남구 삼성동",
        buyer_postcode: "123-456"
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		        	
            // 데이터를 json으로 보내기 위해 바꿔준다.
            data = {
                "orderNum" :  rsp.merchant_uid,
                "productNum" : detailNum.textContent, //상품번호
                "num" : userNum.value, // 회원번호
                "productName" : rsp.name,
                "orderDate" : new Date().getTime(),
                "totalPrice" : rsp.paid_amount,
                "imp_uid" : rsp.imp_uid,
                "reserNum" :  reserNum.textContent // 예약정보를 담고있는번호
            };

    		// 정보를 디비에 저장
            jQuery.ajax({
                url: "/order/complete", 
                type: "POST",
                dataType: 'json',
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);
                },
                contentType: 'application/json',
                data : JSON.stringify(data),
                success : function(res){
                	if (res > 0) {
                        swal('주문정보 저장 성공')
                        createPayInfo(uid);
                    }
                    else {
                        swal('주문정보 저장 실패');
                    }
                }
                    
            })
           
    	}
            
    });
}
</script>
