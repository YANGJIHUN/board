<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	//제이쿼리 사용
	//github test..
	$(document).ready(function(){
		//alert('jquery test');
		/* 입력폼 유효성 관련 요구사항
		1. 모든 폼은 공백 또는 "" 문자는 입력되면 안된다.
		2. 비밀번호는 4자이상 입력하여야 한다. */
		$('#addButton').click(function(){
			if($('#boardPw').val.length >3){
				alert('패스워드는 4자이상 이어야 합니다');
				$('#boardPW').focus();
			}else if($('#boardTitle').val()==''){
				alert('제목을 입력하세요');
				$('#boardTitle').focus();
			}else if($('#boardContent').val()==''){
				alert('내용을 입력하세요');
				$('#boardContent').focus();
			}else if($('boardUser').val()==''){
				alert('이름을 입력하세요');
				$('#boardUser').focus();
			}else{
				$('#addForm').submit();
			}	
		});
	});
</script>
<title>BOARD ADD spring mvc 방식</title>
</head>
<body>
<div class="container">
<div class="col-sm-12" style="height:90px;"></div>
	<div class="col-sm-3" style="background-color:#FFFFFF; height:600px;">
	</div>
	 
		<div class="col-sm-6">
			<h1 style="color:#1D8B15;">BOARD ADD (spring mvc 방식)</h1>
			<form id="addForm" class="form-horizontal" action="${pageContext.request.contextPath}/boardAdd" method="post">
			 
			    <div class="form-group has-success">
			  			<label class="control-label" for="formGroupInputLarge">boardPw</label>
			 		<div>
			 			<input class="form-control" type="password" name="boardPw" id="boardPw" placeholder="비밀번호를 입력해주세요">
					</div>
				</div>
				
				<div class="form-group has-success">
			  			<label class="control-label" for="formGroupInputLarge">boardTitle</label>
			  	 	<div>
			 			<input class="form-control" type="text" name="boardTitle" id="boardTitle" placeholder="제목을 입력해주세요">
					</div>
				</div>
				
			     <div class="form-group has-success">
			  			<label class="control-label" for="formGroupInputLarge">boardContent</label>
			  	 	<div>
			 			<textarea  class="form-control" name="boardContent" id="boardContent" rows="5" cols="50" placeholder="내용을 입력해주세요"></textarea>
					</div>
				</div> 
				
			    <div class="form-group has-success">
			  			<label class="control-label" for="formGroupInputLarge">boardName</label>
			  	 	<div>
			 			<input class="form-control" type="text" name="boardUser" id="boardUser" placeholder="이름을 입력해주세요">
					</div>
				</div> 
				
			    <div>
				    
				   	 <div style="float: right;">
				        <input id="addButton" type="button" class=" btn btn-success" value="글입력"/>
				        <input type="reset" class="btn btn-success" value="초기화"/>
				        <a class="btn btn-success" href="${pageContext.request.contextPath}/boardList">글목록</a>
				     </div>
				     
			    </div>   
			</form>
		</div>
		<div class="col-sm-3" style="background-color:#FFFFFF; height:600px;">
</div>
</div>
</body>
</html>

