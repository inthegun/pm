<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<style>
.right-button {
	float: right;
	display: block;
}

.align-center {
	text-align: center;
}
</style>
<head>
<meta charset="UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">

<%@include file="../../includes/header.jsp"%>
</head>

<body>

	<script language="javascript">
		function searchcheck() {

			var keyword = document.getElementById("keyword");

			if ($("#type").val() == "") {
				alert('검색 항목을 선택 해주세요');
				return false;
			}

			if (keyword.value == "") {
				alert("키워드를 입력해주세요");
				keyword.focus();
				return false;
			}

		}
	</script>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">돌봄</h6>
			<button id='regBtn' type="button" class="btn btn-xs pull-right" onclick="location.href='../sitter_community/list'">펫시터</button>
		</div>

		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover"
					width="100%" cellspacing="0">



					<c:out value="${frre_list.post_no }" />

					<thead style="text-align: center">
						<!-- 1.목록이름 -->
						<tr>
							<th>사진</th>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<!-- 테이블내용 -->
					<c:forEach items="${sitter_list }" var="list">
						<tr style="text-align: center; width: 100%;">
							<td><img src="${list.gdsThumbImg}"
								style="width: 100px; height: 100px;"></td>
							<td style="width: 10%; font-size: 1.2em"><c:out
									value="${list.post_no }" /></td>
							<td style="width: 50%"><a
								href="/community/sitter_community/view?post_no=${list.post_no }">${list.post_title }</a></td>
							<td style="width: 15%"><c:out value="${list.user_id }" /></td>
							<td style="width: 15%"><fmt:formatDate
									pattern="yyyy-MM-dd HH:mm" value="${list.post_date }" /></td>
							<td style="width: 10%"><c:out value="${list.hit}" /></td>
						</tr>
					</c:forEach>
				</table>

				<!-- 3.페이징처리 -->
				<!-- 이전 -->

				<c:if test="${pageMaker.cri.keyword ==null }">
					<c:if test="${pageMaker.prev }">
						<a
							href="/community/sitter_community/list?pageNum=${pageMaker.startPage -1}&amount=${pageMaker.cri.amount}">Previous</a>
					</c:if>

					<!-- 번호 -->
					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<a
							href="/community/sitter_community/list?pageNum=${num }&amount=${pageMaker.cri.amount}">
							${num }</a>

					</c:forEach>

					<!-- 다음 -->
					<c:if test="${pageMaker.next }">

						<a
							href="/community/sitter_community/list?pageNum=${pageMaker.endPage+1 }&amount=${pageMaker.cri.amount}">Next</a>

					</c:if>
				</c:if>

				<!-- 이전 -->

				<c:if test="${pageMaker.cri.keyword !=null }">
					<c:if test="${pageMaker.prev }">
						<a
							href="/community/sitter_community/list?type=${pageMaker.cri.type }&keyword=${pageMaker.cri.keyword }&pageNum=${pageMaker.startPage -1}&amount=${pageMaker.cri.amount}">Previous</a>
					</c:if>

					<!-- 번호 -->
					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<a
							href="/community/sitter_community/list?type=${pageMaker.cri.type }&keyword=${pageMaker.cri.keyword }&pageNum=${num }&amount=${pageMaker.cri.amount}">
							${num }</a>

					</c:forEach>

					<!-- 다음 -->
					<c:if test="${pageMaker.next }">

						<a
							href="/community/sitter_community/list?type=${pageMaker.cri.type }&keyword=${pageMaker.cri.keyword }&pageNum=${pageMaker.endPage+1 }&amount=${pageMaker.cri.amount}">Next</a>

					</c:if>
				</c:if>



				<br>
				<!-- 4.검색 -->
				<form class="form-inline" name="searchForm" role="searchForm"
					onsubmit="return searchcheck();"
					action="/community/sitter_community/list" method="get">
					<div class="input-group mb-2">
						<select class="custom-select" id="type" name="type">
							<option value="">----</option>
							<option value="T">제목</option>
							<option value="C">내용</option>
							<option value="W">작성자</option>
						</select> <input class="form-control" style="width: 200px" type="text"
							id="keyword" name="keyword"
							value='<c:out value="${pageMaker.cri.keyword }"/>' /> <input
							type='hidden' name='pageNum' value=1 /> <input type='hidden'
							name='amount' value='<c:out value="${pageMaker.cri.amount }"/>' />
						<button type="submit" class="btn btn-info btn-md">Search</button>
					</div>
				</form>
				<div class="right-button">
					<c:if test="${member ne null }">
						<button type="button" class="btn btn-info btn-md"
							onclick="location.href='/community/sitter_community/insert'"
							style="float: right;">글쓰기</button>
					</c:if>

				</div>
			</div>
		</div>
	</div>


	<!-- /.container-fluid -->


	<!-- End of Main Content -->
</body>


<%@include file="../../includes/footer.jsp"%>
</html>