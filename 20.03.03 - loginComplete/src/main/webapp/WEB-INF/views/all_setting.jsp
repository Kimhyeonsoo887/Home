<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 태그 라이브러리 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>  


<!-- 프로젝트의 패키지 경로, 경로 설정시 /{path}/resources/+ 방식으로 이뤄진다. -->
<c:set var = "path" value = "${pageContext.request.contextPath}" />
<c:set var = "resources" value = "${path}/resources" />

<c:set var = "javascripts" value = "${resources}/javascripts" />
<c:set var = "styles" value = "${resources}/styles" />
<c:set var = "images" value = "${resources}/images" />
<c:set var = "allImage" value = "${resources}/images/allpage" />

<!-- 반응형 웹 -->
<meta charset="utf-8" name = "viewport" content = "width=device-width, initial-scale = 1">


<%-- <c:set var = "project" value = "/pj_test/resources/" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="${project}js/jquery.number.min.js"></script>
<script type = "text/javascript" src = "${project}script.js"></script>
<link type = "text/css" rel = "stylesheet" href = "${project}style.css"> --%>
