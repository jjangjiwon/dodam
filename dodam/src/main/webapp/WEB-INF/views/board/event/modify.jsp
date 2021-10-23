<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>게시물 작성</title>
<script>
	$(function() {
		$(".fileDrop").on("dropenter dragover", function(evt) {
			evt.preventDefault();
		});

		$(".fileDrop")
				.on(
						"drop",
						function(evt) {
							evt.preventDefault(); // 이벤트 전파를 막음(drop된 파일이 열리는 것을 방지)

							let files = evt.originalEvent.dataTransfer.files; // 드래그 된 파일을 얻어옴
							console.log(files);

							let formData = new FormData(); // form 객체 생성
							formData.append("upFile", files[0]); // form객체에 파일 첨부
							let url = '/board/uploadFile'
							$
									.ajax({
										url : url, // ajax와 통신 할 곳
										data : formData, // 서블릿에 보낼 데이터
										dataType : "text", // 수신될 데이터의 타입
										type : "post", // 통신 방식
										processData : false, // 전송하는 데이터를 쿼리 스트링 형태로 변환하는지를 결정
										contentType : false, // 기본값 (application/x-www-form-urlencoded)
										success : function(data) { // 통신 성공시 수행될 콜백 함수
											console.log(data);
											let ext = data.substr(
													data.lastIndexOf('.') + 1)
													.toLowerCase();
											console.log(ext);
											let output = '';
											let isImg = false;
											let imgAr = [ "jpg", "png", "jpeg",
													"gif" ];
											for (let i = 0; i < imgAr.length; i++) {
												if (ext == imgAr[i]) { // 이미지 파일이면
													output += "<img src='../resources/yjw/uploads" + data + "' />";

													isImg = true;
													$("#upfileNameThumb").val(
															data); // 썸네일 이미지 경로
													let origin1 = data
															.substring(
																	0,
																	data
																			.lastIndexOf("/") + 1);
													let origin2 = data
															.split("thumb_")[1];

													let origin = origin1
															+ origin2;
													$("#upfileNameOrigin").val(
															origin);
													break;
												}
											}
											if (!isImg) {
												// 이미지 파일이 아니면
												output += "<a href='../resources/uploads" + data + "'>"
														+ data + "</a>";
												$("#upfileName").val(data);
											}

											output += "<span id='"
													+ data
													+ "' onclick='delFile(this);'>"
													+ "<img src='../resources/images/close.png' width='40px' />"
													+ "</span>";
											$(".fDropList").html(output);

										},
										error : function() { // 통신 실패시 수행될 콜백 함수

										}

									});
						});

	});

	function delFile(obj) {
		let origin = $("#upfileNameOrigin").val();
		let thumb = $("#upfileNameThumb").val();
		let notImg = $("#upfileName").val();

		let url = '/board/delFile';
		$.ajax({
			url : url, // ajax와 통신 할 곳
			data : {
				origin : origin,
				thumb : thumb,
				notImg : notImg
			}, // 서블릿에 보낼 데이터
			dataType : "text", // 수신될 데이터의 타입
			type : "post", // 통신 방식

			success : function(data) { // 통신 성공시 수행될 콜백 함수
				$(".fDropList").empty(); // 파일 업로드 리스트 초기화
				// input type hidden 초기화
				$("#upfileNameOrigin").val('');
				$("#upfileNameThumb").val('');
				$("#upfileName").val('');

			},
			error : function() { // 통신 실패시 수행될 콜백 함수

			}

		});
	}

	function openArea() {
		$(".fileDrop").show();
	}
</script>
</head>
<style>
.fileDrop {
	width: 100%;
	height: 400px;
	border: 1px dotted blue;
	display: none;
}

.fileDrop .fileContent {
	padding: 20px;
	text-align: center;
	margin: 10px auto;
}
</style>
<body>
	<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
	%>

	<jsp:include page="../../template.jsp"></jsp:include>
	
	<div class="container">
		<h2>글 수정 페이지</h2>
	<form method="post">
			<div class="form-group">
					<label for="title">제목:</label> <input type="text"
					class="form-control" id="title" name="title" value="${view.title }"> <span
					id="titleError" class="error"></span>
			</div>
			<div class="form-group">
				<label for="writer">작성자 :</label> <input type="text"
					class="form-control" id="writer" name="writer"
					value="${view.admin }" readonly><span
					id="writerError" class="error"></span><br />
			</div>
		
			<div class="form-group">
				<label for="contents">내용 :</label>
				<textarea rows="20" cols="150" id="contents" name="contents">${view.contents }</textarea><br />
			</div>

			<div class="form-group">
				<button type="button" class="btn btn-default" onclick="openArea();">파일
					업로드</button>
				<div class="fileDrop">
					<div class="fileContent">이 영역에 업로드 할 파일을 드래그 드롭 해 주세요!</div>
				</div>
				<div class="fDropList"></div>
			</div>

			<input type="hidden" name="thumbimage" id="upfileNameThumb" /> <input
				type="hidden" name="image" id="upfileNameOrigin" /> <input
				type="hidden" name="notimage" id="upfileName" />


			<button type="submit" class="btn btn-success">저장</button>
			<a href="/board/event/modify?no=${view.no}" ><button type="reset" class="btn btn-warning">취소</button></a>
		</form>

	</div>

</body>
</html>