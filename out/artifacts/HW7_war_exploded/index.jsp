<%--
  Created by IntelliJ IDEA.
  User: nicholasmoore
  Date: 4/30/20
  Time: 7:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" type="text/css" href="../../src/index.css">
  <style>
    #container{
      background-color: green;
      width: 500px;
      height: 400px;
      display: inline-block;
      margin-left: 150px;
      margin-top: 70px;
    }
    #txtOutput{
      margin-top: 50px;
      margin-left: 300px;
      height: 280px;
      display: inline-block;
      position: absolute;

    }
    #itemsDiv{
      margin-top: 100px;
      margin-left: 100px;
      background-color: purple;
      width: 140px;
      display: block;
      position: absolute;
    }
    .items{
      display: inline-block;
      margin-top: 20px;
      margin-bottom: 20px;
      font-size: 5em;
    }
    #btnDiv{
      display: inline-block;
      margin: 10px auto 0 300px;
    }
    .btn{
      font-size: 15px;
      border-radius: 30px;
    }
    #reset{
      font-size: 15px;
      border-radius: 30px;
    }
  </style>
</head>
<body style="background-color: lightcyan">
<form action="myRestaurant" method="GET">
<div>
  <!--Webpage Title-->
  <div id="headerDiv">
    <h1 align="center" style="color: goldenrod; border: 1px solid; font-size: 5em">Seafood Mansion Online Ordering</h1>
  </div>
  <!--Main Div-->
  <div id="bodyDiv" style="background-color: lemonchiffon; width: 800px;height: 550px;margin: 0 auto;margin-top: 50px;">
    <!--Holds Items & TextArea-->
    <div id="container">
      <!--Holds Selection Output-->
      <div id="txtOutput" style="background-color: lemonchiffon; width: 150px">
        <!--                    <textarea  id="output" style="height: 100px; margin: 10px;margin-top: 80px"></textarea>-->
        <ul id="myList" style="visibility: hidden">
          <li id="li1"></li>
          <br>
          <li id="li2"></li>
          <br>
          <li id="li3"></li>
          <br>
          <li id="li4"></li>
        </ul>
      </div>
      <!--Holds Items For Sale-->
      <div id="itemsDiv">
        <!--LobsterSoup Selection-->
        <select id="LobsterSoup" name="LobsterSoup" size="1" onchange="calcLobsterSoup()"> Pepperoni LobsterSoup
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select> <label for="LobsterSoup">LobsterSoup</label>
        <br><br><br>
        <!--Grits Selection-->
        <select id="Grits" name="Grits" size="1" onchange="calcGrits()">Grits
          <option  value="0">0</option>
          <option id="one" value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select><label for="Grits">Grits</label>
          <br><br><br>
        <!--Salmon Selection-->
        <select id="Salmon" name="Salmon" size="1" onchange="calcSalmon()">Salmon
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select><label for="Salmon">Salmon</label>
          <br><br><br>
        <!--Oyster Selection-->
        <select id="Oyster" name="Oyster" size="1" onchange="calcOyster()">Oyster Deluxe
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select><label for="Oyster">Oyster Deluxe</label>
      </div>

    </div>
    <!--End of Container Div-->
    <!--Javascript Functions-->
    <script>
      var counter = 0;
      var mylist = ['li1', 'li2', 'li3', 'li4'];

      //Resets Selected Values
      function Reset() { //Works
        var resetLobsterSoup = document.getElementById("LobsterSoup");
        var resetGrits = document.getElementById("Grits");
        var resetSalmon = document.getElementById("Salmon");
        var resetOyster = document.getElementById("Oyster");
        resetLobsterSoup.selectedIndex = 0;
        resetGrits.selectedIndex = 0;
        resetSalmon.selectedIndex = 0;
        resetOyster.selectedIndex = 0;
        for (var a = 0; a <= 3; a++){
          document.getElementById(mylist[a]).style.visibility = "hidden";
        }
        document.getElementById('li1').innerHTML = "";
        document.getElementById('li2').innerText = "";
        document.getElementById('li3').innerHTML = "";
        document.getElementById('li4').innerHTML = "";
        counter = 0;
      }

      //Method #2
      function calcLobsterSoup() {
        //document.getElementById('myList').style.visibility = "visible";
        var resetLobsterSoup = document.getElementById("LobsterSoup");
        var value = resetLobsterSoup.options[resetLobsterSoup.selectedIndex].text;
        document.getElementById(mylist[counter]).style.visibility = "visible";
        document.getElementById(mylist[counter]).innerHTML = value + "x LobsterSoup(s) ";
        counter = counter + 1;
        //document.getElementById('output').value = value + "x LobsterSoup ";
        //document.getElementById("output").value = "Fifth Avenue, New York City";
      }

      //Method #3
      function calcGrits() {
        var resetGrits = document.getElementById("Grits");
        var value = resetGrits.options[resetGrits.selectedIndex].text;
        document.getElementById(mylist[counter]).style.visibility = "visible";
        document.getElementById(mylist[counter]).innerHTML = value + "x Grits(s)";
        counter = counter + 1;
        //document.getElementById('output').value = value + "x Grits(s)";
        //document.getElementById("output").value = "Fifth Avenue, New York City";
      }

      //Method #4
      function calcSalmon() {
        var resetSalmon = document.getElementById("Salmon");
        var value = resetSalmon.options[resetSalmon.selectedIndex].text;
        document.getElementById(mylist[counter]).style.visibility = "visible";
        document.getElementById(mylist[counter]).innerHTML = value + "x Salmon(s) ";
        counter = counter + 1;
        //document.getElementById('output').value = value + "x Salmon(s)";
        //document.getElementById("output").value = "Fifth Avenue, New York City";
      }

      //Method #5
      function calcOyster() {
        var resetOyster = document.getElementById("Oyster");
        var value = resetOyster.options[resetOyster.selectedIndex].text;
        document.getElementById(mylist[counter]).style.visibility = "visible";
        document.getElementById(mylist[counter]).innerHTML = value + "x Oysters(s) ";
        counter = counter + 1;
        //document.getElementById('output').value = value + "x Oysters(s)";
        //document.getElementById("output").value = "Fifth Avenue, New York City";
      }
    </script>
    <!--End of Javascript-->
    <!--Button Div-->
    <div id="btnDiv">
      <input class="btn" type="submit" value="Submit Order" > <button type="reset" id="reset" onclick="Reset()">Reset Order</button>
    </div>
  </div>
  <!--End of Body Div-->
</div>
</form>
</body>
</html>
