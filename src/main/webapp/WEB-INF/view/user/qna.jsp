<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<h2>문의하기</h2>
	<form action="/question/qnaProc" method="post" enctype="Multipart/form-data">
		<select name="category">
			<option value="호텔건의">
				호텔건의
			</option>
			<option value="예약문의">
				예약문의
			</option>
			<option value="부대시설문의">
				부대시설문의
			</option>
			<option value="회원문의">
				회원문의
			</option>
		</select>
		<input type="file" name="file">
		<input type="text" name="title">
		<textarea class="form-control summernote" rows="5" id="content" name="content"></textarea>
		<input type="submit" value="질문등록">
	</form>
	<script>
		$('.summernote').summernote(
				{
					tabsize : 2,
					width: 1100,
					height : 500,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ], [ 'insert', [] ], ]
				});
		$(document).ready(function() {
			$('#summernote').summernote();
		});
	</script>
</body>
</html>