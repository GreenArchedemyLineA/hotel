<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<h1>NICEPAY TEST</h1>
<button onclick="serverAuth()">serverAuth 결제하기</button>

<script src="https://pay.nicepay.co.kr/v1/js/"></script>

<script>
    function serverAuth() {
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
</script>

</body>
</html>