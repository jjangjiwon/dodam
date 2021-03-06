<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>	
	let uploadImgAr = [];
	$(function() {
		$("#no").val("${MissingBoard.no }");
		$("#title").val("${MissingBoard.title }");
		$("#writer").val("${MissingBoard.writer }");
		$("#animal").val("${MissingBoard.animal }");
		$("#breed").val("${MissingBoard.breed }");
		$("#gender").val("${MissingBoard.gender }");
		$("#name").val("${MissingBoard.name }");
		$("#age").val("${MissingBoard.age }");
		$("#location").val("${MissingBoard.location }");
		$("#dlocation").val("${MissingBoard.dlocation}");
		$("#missingdate").val("${MissingBoard.missingdate }".split(" ")[0]);
		$("#contact").val("${MissingBoard.contact }");
		

		let output = '';
		if ("${MissingBoard.dpchknum}" == "") {
			let thumbAr = "${MissingBoard.thumbimg }".split(", ");
			console.log(thumbAr);
			
			for(let i in thumbAr) {
				if (thumbAr[i] != '') {
					i = parseInt(i);
					$(".fileContent").show();
					console.log(i+1);
					output += '<span id="imgPreview' + (i+1) + '" style="margin-right: 50px;"><img src="../../resources/uploads/kmj/missing' + thumbAr[i] + '" style="margin-right: 5px;" />' +
						'<img src="../../resources/images/kmj/missing/cancel.png" style="width: 20px;" onclick="delImg(this);" /></span>';
						
					// 썸네일과 원래이미지를 input hidden에 저장
					$("#upImgNameThumb" + (i+1)).val(thumbAr[i]);
					let splitName = thumbAr[i].split("thumb_");
					let origin = splitName[0] + splitName[1];
					
					$("#upImgNameOrigin" + (i+1)).val(origin);

				}
			}
		} else {
			let imgAr = "${MissingBoard.img }".split(", ");
			console.log(imgAr);
			for (let i in imgAr) {
				i = parseInt(i);
				if (imgAr[i] != '') {
					$(".fileContent").show();
					output += '<span id="imgPreview' + (i+1) + '" style="margin-right: 50px;"><img src="' + imgAr[i] + '" style="margin-right: 5px;" />' +
					'<img src="../../resources/images/kmj/missing/cancel.png" style="width: 20px;" onclick="delUrlImg(this);" /></span>';
					
					$("#upImgNameOrigin" + (i+1)).val(imgAr[i]);
				}
			}
		}
		
	
		// 미리보기 div에 썸네일 사진 띄우기
		$(".fDropList").html(output);
		
		$(".fileDrop").on("dropenter dragover", function(e) {
			e.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(e) {
			e.preventDefault(); // drop된 파일이 chrome브라우저에서 열리는 이벤트 전파를 막음
			
			
			// ### 고칠점 : 새로 드래그 앤 드롭하면 원래 업로드 된 파일을 삭제하고 새로 업로드 해야함!! ###
			// insert구현하기
			$("#uploadError").empty();			
			let files = e.originalEvent.dataTransfer.files; // 드래그 된 파일을 얻어옴
			console.log(files);
			for(let i in files) {
				uploadImgAr[i] = files[i];
			}
			console.log(uploadImgAr);
			
			if (uploadImgAr.length > 3) {
				$("#uploadError").append("사진은 3개까지만 업로드 가능합니다!");
			} else if (notImgCheck(uploadImgAr)) {
				$("#uploadError").append("이미지 파일만 업로드 가능합니다!");
			} else {
				// 게시글 등록 전 이미지 파일 먼저 업로드
				let formData = new FormData(); // form 객체 생성
				for(let i = 0; i < uploadImgAr.length; i++) { // form 객체에 파일 첨부
					formData.append("uploadImg", uploadImgAr[i]);
				}
				
				let url = '/missing/uploadImgs';
				$.ajax({
					url : url, // ajax와 통신 할 곳
					data : formData, // 서블릿에 보낼 데이터
					dataType : "text", // 수신될 데이터의 타입
					type : "post", // 통신 방식
					processData : false, // 전송하는 데이터를 쿼리 스트링 형태로 반환하는지를 결정(파일은 길이가 길기 때문에 url길이 초과됨)
					contentType : false, // encType의 기본값 (application/x-www-form-urlencoded) multipart/form-data 쓸거니까 false
					success : function(data) { // 통신 성공시 수행될 콜백 함수
						let thumbImgs = data.split(", ");
						console.log(thumbImgs);
						let output = "";
						for(let i = 0; i < thumbImgs.length-1; i++) {
							output += '<span id="imgPreview' + (i+1) + '" style="margin-right: 50px;"><img src="../resources/uploads/kmj/missing' + thumbImgs[i] + '" style="margin-right: 5px;" />' +
							'<img src="../../resources/images/kmj/missing/cancel.png" style="width: 20px;" onclick="delImg(this);" /></span>';
							
							// 썸네일과 원래이미지를 input hidden에 저장
							$("#upImgNameThumb" + (i+1)).val(thumbImgs[i]);
							let splitName = thumbImgs[i].split("thumb_");
							let origin = splitName[0] + splitName[1];
							
							$("#upImgNameOrigin" + (i+1)).val(origin);
							
							// 미리보기 div에 썸네일 사진 띄우기
							$(".fDropList").html(output);
						}
					}
				});	
			}
		});
		
		$("#cancelBtn").click(function() {
			location.href='/missing/detail?no=${MissingBoard.no}';
		});
	});
	
	function delImg(obj) {
		let id = obj.parentElement.getAttribute("id");
		let num = Number(id.substring(id.length-1));
		console.log(id);
		
		let thumb = $("#upImgNameThumb" + num).val();
		let origin = $("#upImgNameOrigin" + num).val();
		
		console.log(thumb, origin);
		
		let url = '/missing/delImg';
		$.ajax({
			url : url, // ajax와 통신 할 곳
			data : {origin : origin, thumb : thumb}, // 서블릿에 보낼 데이터
			dataType : "text", // 수신될 데이터의 타입
			type : "POST", // 통신 방식
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				console.log(data);
				if (data == "success") {
					$("#"+id).remove();
					if(num != "3") {
						for(let i=num; i<3; i++) {
							console.log(i+1);
							console.log($("#upImgNameThumb"+(i+1)).val());
							$("#upImgNameThumb" + i).val($("#upImgNameThumb"+(i+1)).val());
							$("#upImgNameOrigin" + i).val($("#upImgNameOrigin"+(i+1)).val());
							$("#imgPreview"+(i+1)).attr("id", "imgPreview"+i);
						}
					}
					$("#upImgNameThumb3").val("");
					$("#upImgNameOrigin3").val("");
				}
			}
		});
	}
	
	function delUrlImg(obj) {
		let id = $(obj.parentElement).attr("id");
		let num = Number(id.substring(id.length-1));
		
		$(obj.parentElement).remove();
		
		if(num != "3") {
			for(let i=num; i<3; i++) {
				$("#upImgNameOrigin" + i).val($("#upImgNameOrigin"+(i+1)).val());
				$("#imgPreview"+(i+1)).attr("id", "imgPreview"+i);
			}
		}
		$("#upImgNameThumb3").val("");
		$("#upImgNameOrigin3").val("");
	}
	
	// 이미지 파일이 아닌 파일이 있으면 true, 모두 이미지 파일이면 false
	function notImgCheck(uploadImgAr) {
		let extAr = ["jpg", "png", "gif", "jpeg"];
		let flag = false;
		for(let i=0; i<uploadImgAr.length; i++) {
			let ext = uploadImgAr[i].name.substring(uploadImgAr[i].name.lastIndexOf('.')+1);
			if(!extAr.includes(ext)) {
				flag = true;	
			}
		}
		console.log(flag);
		return flag;
	}
	
	function showDropDiv() {
		$(".fileContent").show();
	}
</script>
<style>
	.fileContent {
		border : 1px dashed #3C6E9F;
		background-color:#ededed;
		border-radius: 4px;
		height : 150px;	
		display : none;	
	}
	
	select {
		width: 200px;
		padding: .5em .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('../resources/images/missing/arrow.jpg') no-repeat 100% 50%;
		border-radius: 4px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}

	select::-ms-expand {
	    display: none;
	}

	.form-container {
		padding: 0 50px;
	}
	
	.col-sm-offset-2 {
		text-align: center;
	}
	
	#phone_notice {
		font-size: 14px;
		color: #808080;
	}
	
	#phone_error {
		font-size: 14px;
		color: #ff7f00;
	}
</style>
</head>
<body>
	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
		  <h1>글 수정</h1>
		  <div class="form-container">
			  <form class="form-horizontal" action="/missing/update" method="POST">
			  	<input type="hidden" name="no" id="no" />
			    <div class="form-group">
			    	<label class="control-label col-sm-2" for="title">제목</label>
			      	<div class="col-sm-10">
			        	<input type="text" class="form-control" id="title" name="title">
			      	</div>
			    </div>
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="writer">작성자</label>
			      <div class="col-sm-10">          
			        <input type="text" class="form-control" id="writer" name="writer" readonly>
			      </div>
			    </div>
			    <fieldset>
			    	<legend style="color: #3C6E9F;">동물 정보</legend>
				    <div class="form-group">
				    	<label class="control-label col-sm-2" for="animal">동물</label>
				      	<div class="col-sm-2">
				        	<select id="animal" name="animal">
				        		<option value="dog">강아지</option>
				        		<option value="cat">고양이</option>
				        		<option value="other">다른 동물</option>
				        	</select>
				      	</div>
				      	<label class="control-label col-sm-2" for="breed">품종</label>
				      	<div class="col-sm-2">
				        	<input type="text" class="form-control" id="breed" name="breed">
				     	</div>
				    	<label class="control-label col-sm-1" for="gender">성별</label>
				      	<div class="col-sm-3">
				        	<select id="gender" name="gender">
				        		<option value="F">암컷</option>
				        		<option value="M">수컷</option>
				        		<option value="N">성별모름</option>
				        	</select>
				      	</div>
				    </div>
				    <div class="form-group">
				      	<label class="control-label col-sm-2" for="name">이름</label>
				      	<div class="col-sm-5">          
				        	<input type="text" class="form-control" id="name" name="name">
				      	</div>
				      	<label class="control-label col-sm-2" for="age">나이</label>
				      	<div class="col-sm-3">          
				        	 <select id="age" name="age">
				        		<option value="1살미만">1살미만</option>
				        		<c:forEach var="i" begin="1" end="29" step="1">
				        			<option value="${i }살">${i }살</option>
				        		</c:forEach>
				        		<option value="30살이상">30살이상</option>
				        	</select>
				      	</div>
				    </div>
				
				    <div class="form-group">
				   		<label class="control-label col-sm-2" for="location">실종 지역</label>
				      	<div class="col-sm-3">          
				      		<select id="location" name="location">
				        		<option value="서울특별시">서울특별시</option>
				        		<option value="경기도">경기도</option>
				        		<option value="인천광역시">인천광역시</option>
				        		<option value="강원도">강원도</option>
				        		<option value="충청남도">충청남도</option>
					        	<option value="대전광역시">대전광역시</option>
				    	    	<option value="충청북도">충청북도</option>
				        		<option value="세종특별자치시">세종시</option>
				        		<option value="부산광역시">부산광역시</option>
					        	<option value="울산광역시">울산광역시</option>
				    	    	<option value="대구광역시">대구광역시</option>
				        		<option value="경상북도">경상북도</option>
				        		<option value="경상남도">경상남도</option>
					        	<option value="전라남도">전라남도</option>
				    	    	<option value="광주광역시">광주광역시</option>
				        		<option value="전라북도">전라북도</option>
				        		<option value="제주특별자치도">제주도</option>
				        	</select>
				      	</div>
				      	<label class="control-label col-sm-2" for="dlocation">상세 장소</label>
				      	<div class="col-sm-5">          
				        	<input type="text" class="form-control" id="dlocation" name="dlocation">
				      	</div>
				    </div>
				        <div class="form-group">
				      	<label class="control-label col-sm-2" for="missingdate">실종일자</label>
				      	<div class="col-sm-3">          
				        	<input type="date" class="form-control" id="missingdate" name="missingdate">
				      	</div>
				      	<label class="control-label col-sm-2" for="contact">연락처</label>
				      	<div class="col-sm-5">          
				        	<input type="text" class="form-control" id="contact" name="contact">
				        	<div id="phone_notice">※ 010-0000-0000의 형식으로 입력해주세요</div>
				        	<div id="phone_error"></div>
				      	</div>
				    </div>
				    <div class="form-group">
				      	<label class="control-label col-sm-2" for="contents">특이사항</label>
				      	<div class="col-sm-10">          
				        	<textarea class="form-control" id="contents" name="contents" rows="15">${MissingBoard.contents }</textarea>
				      	</div>
				    </div>
				    <div class="form-group">
				    	<label class="control-label col-sm-2" for="contents">사진</label>
				    	<div class="col-sm-10">  
					    	<button type="button" class="btn btn-default" onclick="showDropDiv();">파일 업로드</button>
							<div class="fileDrop">
								<div class="fileContent">
									<div>이 영역에 업로드 할 파일을 드래그 드롭 해주세요!</div>
									<div style="font-size:13px; color: gray;">※첨부사진은 최대 3개까지 등록이 가능합니다.</div>
								</div>
								<div id="uploadError" style="color: red; font-weight: bold;"></div>
							</div>
							<div class="fDropList"></div>
						</div>
				        <input type="hidden" name="thumbimage" id="upImgNameThumb1" />
				        <input type="hidden" name="image" id="upImgNameOrigin1" />
				        
				        <input type="hidden" name="thumbimage" id="upImgNameThumb2" />
				        <input type="hidden" name="image" id="upImgNameOrigin2" />
				        
				        <input type="hidden" name="thumbimage" id="upImgNameThumb3" />
				        <input type="hidden" name="image" id="upImgNameOrigin3" />
				    </div>
			    </fieldset>
			    <div class="form-group">        
			      <div class="col-sm-offset-2 col-sm-10">
			        <button type="submit" class="btn btn-primary">수정</button>
			        <button type="button" class="btn btn-default" id="cancelBtn">취소</button>
			      </div>
			    </div>
		 </form>
		 </div>
	</div>
</body>
</html>