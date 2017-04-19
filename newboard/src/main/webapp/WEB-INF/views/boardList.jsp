<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>BOARD LIST(spring mvc 방식)</title>
</head>
<body>
<div class="container">
<h1>BOARD LIST(spring mvc 방식)</h1>

    <div>전체행의 수 : ${boardCount}</div>
<div class="col-sm-12">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>boardTitle</th>
                <th>boardUser</th>
                <th>boardDate</th>
            </tr>
        </thead>
        <tbody>

	<c:forEach var="b" items="${list}">
                <tr>
                    <td class="danger"><a href="${pageContext.request.contextPath}/boardView?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
                    <td class="warning">${b.boardUser}</td>
                    <td class="success">${b.boardDate}</td>
                </tr>
 	</c:forEach>
        </tbody>
    </table>
    </div>
      
    <div>
        <a href="${pageContext.request.contextPath}/boardAdd">게시글 입력</a>
    </div>

    <div>
    <ul class="pager"> 

	<c:if test="${currentPage > 0}">
	
		<li><a href="${pageContext.request.contextPath}/boardList?currentPage=${previousPage}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
         <li> <a href="${pageContext.request.contextPath}/boardList?currentPage=${currentPage-1}">이전</a></li>
     </c:if>    

 
 <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1"> 
 	<c:choose>
 		<c:when test="${i == currentPage}">
 			<li class="disabled"><a href="#">${i}</a></li>
 		</c:when>
 		<c:otherwise>	
			<li><a href="${pageContext.request.contextPath}/boardList?currentPage=${i}">${i}</a></li>
		</c:otherwise>	
	</c:choose>
</c:forEach>
	
		<c:if test="${currentPage < lastPage}">
            <li><a href="${pageContext.request.contextPath}/boardList?currentPage=${currentPage+1}">다음</a></li>
            <li><a href="${pageContext.request.contextPath}/boardList?currentPage=${nextPage}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
            
		</c:if>
	</ul>
    </div>

</div>
</body>
</html>
