var can = document.getElementById('canvas');
var ctx = can.getContext('2d');
var warningR = document.getElementById("fieldCheckR");
var errorMessege =  document.getElementById('messegeAboutError');
var mode = document.getElementById("normal");
can.onmousedown = function (event) {
    var R  = document.querySelectorAll('input[name="myCheckboxR[]"]:checked');
    var x;
    var IndexR;
    if (R.length == 1){
        IndexR = R[0].getAttribute("value");
        drawForClickR();
        if (mode.checked) {
            ctx.fillRect(event.offsetX - 3, event.offsetY - 3, 5, 5);
        }else
        {
            ctx.fillRect(25+Math.round((event.offsetX-3)/(150/IndexR))*(150/IndexR), event.offsetY - 3, 5, 5);
        }
        document.getElementById("usersY").value = (-1)*(event.offsetY-178)/(150/IndexR);
        console.log(-(event.offsetY-178)/(150/IndexR));
        x = Math.round((event.offsetX-178)/(150/IndexR));
        var chechedX = document.querySelectorAll('input[name="myCheckboxX[]"]:checked');
        for(var i = 0; i<chechedX.length; i++){
            chechedX[0].checked = false;
        }
        if (x<6 && x>-5){
            document.getElementById("myCheckboxX"+x).checked = true;
        }
        warningR.style.backgroundColor = "transparent";
        errorMessege.innerHTML = "";
    }
    else
    {
        warningR.style.backgroundColor = "red";
        errorMessege.innerHTML = "Выберите одно R!";
    }
}
