function draw(){
    var can = document.getElementById('canvas');
    var ctx = can.getContext('2d');
    var color = "rgb(4,172,208)"
    ctx.clearRect(0, 0, 350, 350);
    ctx.lineWidth =2;
    ctx.fillStyle = color;
    ctx.strokeStyle = color;
    ctx.fillRect(25, 175, 150, 150);
    ctx.moveTo(175, 175);
    ctx.lineTo(325, 175);
    ctx.lineTo(175, 250);
    ctx.fill();
    ctx.beginPath();
    ctx.strokeStyle = color;
    ctx.arc(175, 175, 75, 0,  3*Math.PI/2, true);
    ctx.lineTo(175, 175);
    ctx.fill();

    ctx.beginPath();
    ctx.strokeStyle = "black";
    ctx.fillStyle = "red";
    ctx.moveTo(0, 175);
    ctx.lineTo(350, 175);
    ctx.lineTo(340, 185);
    ctx.lineTo(350, 175);
    ctx.lineTo(340, 165);
    ctx.lineTo(350, 175);
    ctx.stroke();
    ctx.stroke();
    ctx.beginPath();
    ctx.moveTo(175, 350);
    ctx.lineTo(175, 0);
    ctx.lineTo(185, 10);
    ctx.lineTo(175, 0);
    ctx.lineTo(165, 10);
    ctx.lineTo(175, 0);
    ctx.stroke();
    ctx.stroke();

    for(var i=0; i<5; i++){
        ctx.beginPath();
        ctx.moveTo(170, 25+75*i);
        ctx.lineTo(180, 25+75*i);
        ctx.stroke();
        ctx.stroke();
        ctx.beginPath();
        ctx.moveTo(25+75*i, 170);
        ctx.lineTo(25+75*i, 180);
        ctx.stroke();
        ctx.stroke();
    }

}

function drawForClickR() {
    draw();
    var can = document.getElementById('canvas');
    var ctx = can.getContext('2d');
    var R  = document.querySelectorAll('input[name="myCheckboxR[]"]:checked');
    var complexity = document.getElementById("ds");
    ctx.beginPath();
    if ((R.length == 1) && (!complexity.checked)){
        var IndexR = R[0].getAttribute("value");
        for(var i=0; i<IndexR*2+1; i++){
            ctx.strokeStyle = "rgb(122,122,122)";
            ctx.beginPath();
            ctx.lineWidth = 1;
            ctx.moveTo(25+i*150/IndexR, 0);
            ctx.lineTo(25+i*150/IndexR, 350);
            ctx.stroke();
            ctx.beginPath();
            ctx.lineWidth = 1;
            ctx.moveTo(0, 25+i*150/IndexR);
            ctx.lineTo(350, 25+i*150/IndexR);
            ctx.stroke();
            ctx.stroke();
        }
        ctx.beginPath();
        ctx.fillStyle = "red";
        ctx.font = "20pt Arial";
        ctx.fillText(IndexR, 180, 32);
        ctx.fillText(""+-IndexR, 180, 330);
        ctx.fillText(""+IndexR/2, 180, 107);
        ctx.fillText(""+-IndexR/2, 180, 255);
        ctx.fillText(IndexR, 315, 165);
        ctx.fillText(""+-IndexR, 11, 165);
        ctx.fillText(""+IndexR/2, 240, 165);
        ctx.fillText(""+-IndexR/2, 81, 165);
    }
}

function onLoadPoint(){
    if (sessionStorage['masPointer'] == undefined) {
        sessionStorage['masPointer'] = [0, 1, 2, 3, 4];
    }
    var masPointer = sessionStorage['masPointer'];
    masPointer.push([document.querySelectorAll('input[name="myCheckboxX[]"]:checked').getAttribute("value"), document.getElementById("usersY").value]);
    masPointer.splice(0, 1);
    sessionStorage['masPointer'] = masPointer;
    console.log(masPointer);
}