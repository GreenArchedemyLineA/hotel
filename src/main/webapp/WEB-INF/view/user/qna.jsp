<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<form action="/qnaProc" method="post" enctype="Multipart/form-data">
		<select name="category">
			<option value="문의">
				문의
			</option>
			<option value="건의">
				건의
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