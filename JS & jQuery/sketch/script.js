// Global Variables //
var mouseDown = false;
var colsel = "white";

// ----------- Grid Function ------ //

$(document).ready(function(){
var fillgrid = function(){	
var squares = prompt("How many squares per side? (10-48)")
squares
for(var i = 1; i <= (squares*squares); i++){
	$('#container').append('<div class="blocks"></div>');
}

 // Define Square Size //

var width = $('#container').width()/squares
$(".blocks").css("width", width);
var height = $('#container').height()/squares
$(".blocks").css("height", height);
};

// --------------- Draw --------------//

$(document).mousedown(function() {
		mouseDown = true;
		$(".blocks").addClass("down")
	});
	
$(document).mouseup(function() {
		mouseDown = false;
		$(".blocks").removeClass("down")
	});		   

// --------- Buttons --------------- //

//  Change Color //

$("button.sub").click(function(){
colsel = this.id
});

//  Reset //
$("#trash").click(function(){
$(".blocks").css("background-color", "black")
});

// Effects //

$("button").click(function() {
      switch(this.id) {

// DEFAULT //
        case 'default': $("button.sub").show()
        				$('#container').empty()
        				fillgrid()
        				$('.blocks').hover(function() {
				        if (mouseDown) {
			            $(this).css("background-color", colsel);    
					    };
					    }); 
        break;

// TRAIL //
        case 'trail': 	$("button.sub").hide()
        				$('#container').empty()
        				fillgrid()
        				$(".blocks").hover(function(){
        				$(this).fadeTo(150, 0)
        				$(this).mouseleave(function(){
						$(this).fadeTo(200,1);
        			});
					});
        break;
//  GRADIENT //
    case 'gradient':
       					$("button.sub").hide()
       					$('#container').empty()
        				fillgrid()
        				$(".blocks").hover(function(){
    					if (mouseDown) {
						$(this).animate({opacity: '-=0.1'}, 0)
					};
				});
        			
        break;
// RANDOM COLOR //
        case 'random':  $("button.sub").hide()
        				$('#container').empty()
        				fillgrid()
        				$("button.sub").hide()
        				function random(){
						var color = '#' + (Math.random() * 0xFFFFFF << 0).toString(16); 
						return color;
						};
        				$(".blocks").hover(function(){
    					if (mouseDown) {
        				$(this).css("background-color", random())
        			};
        				});
				
        break;
};
});
});

 // -------------- Info Slider ------------------//
$("img").click(function(){
$("#info").slideToggle(100)
})



