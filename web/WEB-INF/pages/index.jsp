<%@ page import="java.util.LinkedList" %>
<%@ page import="ru.jolly.WEB2.ListMember" %>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
  <title>Камышников Владислав Р3201 Вариант 201010</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body onload="draw()">
<div class="header">P3201 Камышников Владислав Вариант 201090</div>
<div class="layout">
	<div class="col1"></div>
	<div class="col2">
		<div class="realBox" id="fdgvbnhjmk">
            <canvas id="canvas" width="350" height="350" onload="draw();">Тут мог бы быть канвас, но браузер ЛОХ!</canvas>
			<p><%
				String resultStatus = (String)session.getAttribute("last_result");
				LinkedList tabResult = (LinkedList)session.getAttribute("results");
				if (tabResult == null)
                    tabResult = new LinkedList();
				if (resultStatus!=null){
					out.print(resultStatus);
				}else{
					out.print(" ");
				}
			%><p><br>
            <p><input name="complexity" type="radio" value="normal" id="normal" checked> normal mode</p>
            <p><input name="complexity" type="radio" value="hard" id="hard"> hard mode</p><br>
            <p><input name="complexity" type="radio" value="ds" id="ds" hidden></p>
		</div>
		<div class="realBox" id="col2row2">
		<table width="100%" border= 1px; cellspacing=0px;>
		<tr>
			<td colspan=6>Прошлые результаты</td>
		</tr>
		<tr>
			<td width="5%">№</td>
			<td width="10%">X</td>
			<td width="15%">Y</td>
			<td width="10%">R</td>
			<td width="10%">Попадание</td>
			<td width="50%">Время</td>
		</tr>
			<%int i =1;
			for (int j = tabResult.size()-1;j>-1;j--){
			ListMember result = (ListMember)tabResult.get(j);%>
			<tr>
				<td><%= i++%></td>
				<td><%= result.getX() %></td>
				<td><%= result.getY() %></td>
				<td><%= result.getR() %></td>
				<td><%= result.getSuccess() %></td>
				<td><%= result.getNormalTime() %></td>
			</tr>
			<% } %>
		</table>
		</div>
	</div>
	<div class="col3">
	<div class="realBox">
		<form name="checkPoint" action="${pageContext.request.contextPath}/welcome" method="post" id="form">
		<div>
		<table width=290px id="fieldCheckX">
		<tr>
			<td colspan=10>X:</td>
		</tr>
		<tr>
			<td>-4</td>
			<td>-3</td>
			<td>-2</td>
			<td>-1</td>
			<td>0</td>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
		</tr>
		<tr>
			<td><input id="myCheckboxX-4" name="myCheckboxX[]" type="checkbox" value="-4"></td>
			<td><input id="myCheckboxX-3" name="myCheckboxX[]" type="checkbox" value="-3"></td>
			<td><input id="myCheckboxX-2" name="myCheckboxX[]" type="checkbox" value="-2"></td>
			<td><input id="myCheckboxX-1" name="myCheckboxX[]" type="checkbox" value="-1"></td>
			<td><input id="myCheckboxX0" name="myCheckboxX[]" type="checkbox" value="0"></td>
			<td><input id="myCheckboxX1" name="myCheckboxX[]" type="checkbox" value="1"></td>
			<td><input id="myCheckboxX2" name="myCheckboxX[]" type="checkbox" value="2"></td>
			<td><input id="myCheckboxX3" name="myCheckboxX[]" type="checkbox" value="3"></td>
			<td><input id="myCheckboxX4" name="myCheckboxX[]" type="checkbox" value="4"></td>
			<td><input id="myCheckboxX5" name="myCheckboxX[]" type="checkbox" value="5"></td>
		</tr>
		</table>
		</div>
		<div>
		<label>Параметр Y:</label>
		<input type="text" name="parameterY" value=" " onkeyup="proverka2(this);" id="usersY" size =10px/>
		</div>
		<div>
		<table width="50%" id="fieldCheckR">
		<tr>
			<td colspan=5>R:</td>
		</tr>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
		</tr>
		<tr>
			<td><input id="myCheckboxR1" name="myCheckboxR[]" type="checkbox" value="1" onchange="drawForClickR();"></td>
			<td><input id="myCheckboxR2" name="myCheckboxR[]" type="checkbox" value="2" onchange="drawForClickR();"></td>
			<td><input id="myCheckboxR3" name="myCheckboxR[]" type="checkbox" value="3" onchange="drawForClickR();"></td>
			<td><input id="myCheckboxR4" name="myCheckboxR[]" type="checkbox" value="4" onchange="drawForClickR();"></td>
			<td><input id="myCheckboxR5" name="myCheckboxR[]" type="checkbox" value="5" onchange="drawForClickR();"></td>
		</tr>
		</table>
		</div>
		<div>
		<div id="messegeAboutError"></div>
		<input type="submit" id="pushButton" name="send" value="Проверить" onclick="validate()" align="bottom" />
		<input type="submit" name="clear" value="Очистка" align="bottom" onclick="clearTable()"/>
		</div>
		</form>
	</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/drawing.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/pointer.js"></script>
</body>
</html>