<%@ page import="co.kr.khaki.car.CarDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="dto" items="${carList}">
${dto.car_num},${dto.zone_num}★
</c:forEach>