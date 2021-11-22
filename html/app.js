

window.addEventListener("message", function(event) {
    var item = event.data.item
    let action = event.data.action
    var config = event.data.config
 
    if (action == "show") {
        $('#mensanje').text(config.message)
        if (item.label != 'Lose') {
            $('#ganaste').text(config.win + item.amount + ' ' + item.label)
    
            $('.container').show();
        } else {
            $('#ganaste').text(config.lose)
            $('.container').show();
        }
    }  else if (action == "close") {
       
        $('.container').hide();
    }

        $(".button").click(() => {
          
            $.post('https://Roda_Christmas/giveitem', JSON.stringify({
                    itemtogive : item.name,
                    itemlabel : item.label,
                    itemamout : item.amount
                })
            );
            return;
        });
});




$(document).keyup((e) => {
    if (e.key === "Escape") {
        $(".container").fadeOut(1000);
        setTimeout(() => {
            $.post('https://Roda_Christmas/closeCard', JSON.stringify({}));
        }, 300);
    }
});




function flip(event) {
	var element = event.currentTarget;
	if (element.className === "card") {
    if(element.style.transform == "rotateX(180deg)") {
        element.style.transform = "rotateX(0deg)";

        setTimeout(function() { 
            $('.button').hide();
            $('.card-back').hide();
            $('.card-front').show();

        }, 300);
    }
    else {
        element.style.transform = "rotateX(180deg)";
        setTimeout(function() { 
             $('.button').show();
            $('.card-front').hide();
            $('.card-back').show();

        }, 300);
    }
  }
};
