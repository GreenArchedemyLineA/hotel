<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%--<h1>NICEPAY TEST</h1>--%>
<style>
</style>
<div style="display: none">
    <img class="pay" src="/images/tosspay_icon.png" onclick="tossPay()" id="payment-method">
</div>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>

<script>
	// clientId, orderId, goodsName 


    const clientKey = 'test_ck_P24xLea5zVAN5EQM26mrQAMYNwW6' // 테스트용 클라이언트 키
    const customerKey = 'lDbYSlFCj9PZh5k9iOPWV' // 고객을 식별할 수 있는 키

    // 2. 결제위젯 SDK 초기화
    const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS);
    const paymentMethods = paymentWidget.renderPaymentMethods('#payment-method', ${totalAmount});
    function tossPay(){
        paymentWidget.requestPayment({
            orderId: '${orderId}',
            orderName: '${orderId}',
            successUrl: 'http://localhost:8080/pay/toss/success',
            failUrl: 'http://localhost:8080/pay/fail'
        }).catch((error)=>{
            window.close();
        })
    }
    <c:if test="${option eq 'toss'}">
        tossPay();
    </c:if>

</script>

</body>
</html>