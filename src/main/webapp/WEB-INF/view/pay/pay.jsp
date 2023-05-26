<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<h1>NICEPAY TEST</h1>
<style>
    .pay{
        width: 200px;
        height: 100px;
    }
</style>

<button class="pay" onclick="nicePay()">Nicepay 결제하기</button>
<img class="pay" src="/images/tosspay_icon.png" onclick="tossPay()">
<img class="pay" src="/images/kakaopay_icon_small.png" onclick="kakaoPay()">

<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<script src="https://pay.nicepay.co.kr/v1/js/"></script>




<script>
	// clientId, orderId, goodsName 
    function nicePay() {
        AUTHNICE.requestPay({
            clientId: '${clientId}',
            method: 'card',
            orderId: '${orderId}',
            amount: 1000,
            goodsName: '나이스페이-상품',
            returnUrl: 'http://localhost:8080/pay/payments',
            fnError: function (result) {
                alert('개발자확인용 : ' + result.errorMsg + '')
            }
        });
    }

    const clientKey = 'test_ck_P24xLea5zVAN5EQM26mrQAMYNwW6' // 테스트용 클라이언트 키
    const customerKey = 'lDbYSlFCj9PZh5k9iOPWV' // 고객을 식별할 수 있는 키

    // 2. 결제위젯 SDK 초기화
    const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS);
    const paymentMethods = paymentWidget.renderPaymentMethods('#payment-method', 1000);
    function uuidv4() {
        return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
            (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
        );
    }
	// Toss결제시 orderName에 상품이름 추가
    function tossPay(){
        paymentWidget.requestPayment({
            orderId: uuidv4(),
            orderName: '토스 티셔츠 외 2건',
            successUrl: 'http://localhost:8080/pay/toss/success',
            failUrl: 'http://localhost:8080/pay/fail',
            customerEmail: 'customer123@gmail.com',
            customerName: '김토스'
        })
    }
    function kakaoPay(){
        location.href = "/pay/kakaopay";
    }
</script>

</body>
</html>