<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<title>Dodam Dodam</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.thumbnail {
	display: block;
	text-align: center;
}

.row {
	font-size: 22px;
	font-family: 'Nanum Pen Script', cursive;
}

.notice {
	border : 2px solid gray;
	padding : 10px;
}

/*
.photo {
	width : 45%;
	float: left;
}

.text {
	width : 45%;
	float: right;
	font-size: 15px;
} 
*/

</style>
<script>
	// CORS (Cross-Origin Resource Sharing) 문제 해결 : https://shinsunyoung.tistory.com/86 or https://ooz.co.kr/232
	// CORS (Cross-Origin Resource Sharing) 문제 해결2 : https://ooz.co.kr/232

	$(document).ready(function() {
		showPublicAdopt();
	});

	function showPublicAdopt() {

		$
				.ajax({
					url : "public.do", // 데이터가 송수신 될 서버의 주소
					type : "GET", // 통신 방식(get, post)
					dataType : "xml", // 수신받을 데이터의 타입
					success : function(data) { // 통신이 성공하면 수행될 문장들...
						console.log("ajax data 통신성공 : " + data);
						if (data != null) {
							console
									.log(data.getElementsByTagName("items")[0].children[0]);
							console.log(data.getElementsByTagName("items"));
							console.log(data);
							console
									.log(data
											.getElementsByTagName("totalCount"));
							console
									.log(data
											.getElementsByTagName("totalCount")[0].innerHTML);
							console
									.log(data.getElementsByTagName("items")[0].children[0].childNodes.length);

							var dataLength = data
									.getElementsByTagName("totalCount")[0].innerHTML;
							var output = '';
							output += "<div class='container row' >";

							for (i = 0; i < 100; i++) {
								if (data.getElementsByTagName("age")[i] != null) {
									var age = data.getElementsByTagName("age")[i].innerHTML;
								}
								if (data.getElementsByTagName("careAddr")[i] != null) {
									var careAddr = data
											.getElementsByTagName("careAddr")[i].innerHTML;
								}
								if (data.getElementsByTagName("careNm")[i] != null) {
									var careNm = data
											.getElementsByTagName("careNm")[i].innerHTML;
								}
								if (data.getElementsByTagName("careTel")[i] != null) {
									var careTel = data
											.getElementsByTagName("careTel")[i].innerHTML;
								}
								if (data.getElementsByTagName("chargeNm")[i] != null) {
									var chargeNm = data
											.getElementsByTagName("chargeNm")[i].innerHTML;
								}
								if (data.getElementsByTagName("colorCd")[i] != null) {
									var colorCd = data
											.getElementsByTagName("colorCd")[i].innerHTML;
								}
								if (data.getElementsByTagName("desertionNo")[i] != null) {
									var desertionNo = data
											.getElementsByTagName("desertionNo")[i].innerHTML;
								}
								if (data.getElementsByTagName("filename")[i] != null) {
									var filename = data
											.getElementsByTagName("filename")[i].innerHTML;
								}
								if (data.getElementsByTagName("happenDt")[i] != null) {
									var happenDt = data
											.getElementsByTagName("happenDt")[i].innerHTML;
								}
								if (data.getElementsByTagName("happenPlace")[i] != null) {
									var happenPlace = data
											.getElementsByTagName("happenPlace")[i].innerHTML;
								}
								if (data.getElementsByTagName("kindCd")[i] != null) {
									var kindCd = data
											.getElementsByTagName("kindCd")[i].innerHTML;
								}
								if (data.getElementsByTagName("neuterYn")[i] != null) {
									var neuterYn = data
											.getElementsByTagName("neuterYn")[i].innerHTML;
								}
								if (data.getElementsByTagName("noticeEdt")[i] != null) {
									var noticeEdt = data
											.getElementsByTagName("noticeEdt")[i].innerHTML;
								}
								if (data.getElementsByTagName("noticeNo")[i] != null) {
									var noticeNo = data
											.getElementsByTagName("noticeNo")[i].innerHTML;
								}
								if (data.getElementsByTagName("noticeSdt")[i] != null) {
									var noticeSdt = data
											.getElementsByTagName("noticeSdt")[i].innerHTML;
								}
								if (data.getElementsByTagName("officetel")[i] != null) {
									var officetel = data
											.getElementsByTagName("officetel")[i].innerHTML;
								}
								if (data.getElementsByTagName("orgNm")[i] != null) {
									var orgNm = data
											.getElementsByTagName("orgNm")[i].innerHTML;
								}
								if (data.getElementsByTagName("popfile")[i] != null) {
									var popfile = data
											.getElementsByTagName("popfile")[i].innerHTML;
								}
								if (data.getElementsByTagName("processState")[i] != null) {
									var processState = data
											.getElementsByTagName("processState")[i].innerHTML;
								}
								if (data.getElementsByTagName("sexCd")[i] != null) {
									var sexCd = data
											.getElementsByTagName("sexCd")[i].innerHTML;
								}
								if (data.getElementsByTagName("specialMark")[i] != null) {
									var specialMark = data
											.getElementsByTagName("specialMark")[i].innerHTML;
								}
								if (data.getElementsByTagName("weight")[i] != null) {
									var weight = data
											.getElementsByTagName("weight")[i].innerHTML;
								}

							output += "<div class='col-md-4'>";
								output += " <div class='thumbnail'>";
									output += "<b>" + processState + "</b>";
									output += "<div> 공고번호 : " + noticeNo + "</div>";
									output += "<div class='photo'><img src='" + popfile + "' class='img-rounded' width= '300px' height= '300px' /></div>";
									output += "<div class='text'>";
										output += "<div> 품종: " + kindCd + "</div>";
										output += "<div> 발견지역: " + orgNm + "</div>";
										output += "<div> 나이: " + age + ", 성별 : " + sexCd + "</div>";
										output += "<div> 특징: " + specialMark + "</div>";
										output += "<div> 접수일자: " + happenDt + "</div>";
										output += "<div> 담당자: " + chargeNm + "(" + officetel + ")</div>";
									output += "</div>";
								output += "</div>";
							output += "</div>";
								// 		        			console.log(output);

							} //for문 끝

							output += "</div>";
							$("#publicList").html(output);

						} // if(data != null) 끝
						// 		        		$("#publicList").html() = output;
					} // success function 끝 
				});

	}
</script>
<body>
	<jsp:include page="../../template.jsp"></jsp:include>
	<br />
	<div class="row" style='text-align: center;'>
		<div><b>유기동물 보호관리 시스템 공고</b></div> 
		<a href="https://www.animal.go.kr/front/awtis/public/publicList.do">(https://www.animal.go.kr/front/awtis/public/publicList.do)</a>
	</div>
	<br />

	<div class="notice" style='text-align: center;'>
		<p>
			「동물보호법」 제17조, 시행령7조 및 동법 시행규칙 제20조에 따라 유기·유실동물을 보호하고 있는 경우에는 소유자 등이<br />
			보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.<br /> 공고 중인 동물 소유자는 해당 시군구 및
			동물보호센터에 문의하시어 동물을 찾아가시기 바랍니다.<br /> 다만, 「동물보호법」 제19조 및 동법 시행규칙 제21조에
			따라 소유자에게 보호비용이 청구될 수 있습니다.<br /> 또한 「동물보호법」 제17조에 따른 공고가 있는 날부터 10일이
			경과하여도 소유자 등을 알 수 없는 경우에는 <br /> 「유실물법」 제12조 및 「민법」 제253조의 규정에도 불구하고
			해당 시·도지사 또는 시장·군수·구청장이 그 동물의 소유권을 취득하게 됩니다.
		</p>
		<div>
			<p>시·도지사, 시장·군수·구청장(직인 생략)</p>
		</div>
		
		 <!-- 유의사항 -->
                <div style="font-weight: bold; border: 1px solid blue; width: 50%; margin:0 auto;">
                    <div>
                        <div> ※ 검색시 유의사항 : 품종오류가 발생할 수 있으니 축종을 전체로 설정 후 한번 더 검색하시기 바랍니다.</div>
                        <div>
                            <span style="color:red;" >※ 공고중인 동물 소유자는 "자세히 보기"를 참고하시어 해당 </span><span style="color:blue;">시군구</span><span style="color:#8c0000;"> 및 </span>
                            <span style="color:blue;">동물보호센터</span><span style="color:#8c0000;"> 또는 <br/></span>
                            <span style="color:blue;">※ 동물보호상담센터 <a href='tel:1577-0954'>1577-0954</a></span>로 문의하시기 바랍니다.
                        </div>
                        <div>
                                ※ 동물보호센터 및 동물병원 <span style="color:red;">근무시간은 09:00 ~ 18:00이므로 문의전화는 근무시간에만 가능</span>합니다.
                        </div>
                   </div>
                </div>
                
	</div>
	<br />

	<div id='publicList' class="container"></div>


	<!-- 	공고 게시판 리스트 뷰 참고 adoptboardmini.jsp -->
	<!-- 	 <div class=' grid-container'> -->
	<%-- 							<div onclick="readBoard(${board.no});"> --%>
	<!-- 								<div><img src= ../../resources/${board.image} width= '200px' height= '200px' /></div> -->
	<%-- 								<div>${board.title }</div> --%>
	<%-- 								<div>${board.regdate }</div> --%>
	<!-- 							</div> -->
	<!-- 	</div>  -->

</body>
</html>