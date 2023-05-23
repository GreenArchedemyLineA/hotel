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
    function nicePay() {
        AUTHNICE.requestPay({
            clientId: '${clientId}',
            method: 'card',
            orderId: '${orderId}',
            amount: 1000,
            goodsName: '나이스페이-상품',
            returnUrl: 'http://localhost:8080/nicepay/payments',
            fnError: function (result) {
                alert('개발자확인용 : ' + result.errorMsg + '')
            }
        });
    }

    const clientKey = 'test_ck_P24xLea5zVAN5EQM26mrQAMYNwW6' // 테스트용 클라이언트 키
    const customerKey = 'q7UMSZKxl-nn7tCSSmUr0' // 고객을 식별할 수 있는 키

    // 2. 결제위젯 SDK 초기화
    const paymentWidget = PaymentWidget(clientKey, customerKey);
    const paymentMethods = paymentWidget.renderPaymentMethods('#payment-method', 1000, { variantKey: "widgetA" });
    function tossPay(){
        paymentWidget.requestPayment({
            orderId: 'AD8aZDpbzXs4EQa-UkIX6',
            orderName: '토스 티셔츠 외 2건',
            successUrl: 'http://localhost:8080/success',
            failUrl: 'http://localhost:8080/fail',
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