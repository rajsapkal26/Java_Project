
const hidden_arrow  = document.getElementById("hidden_arrow");
const hidden_arrow2  = document.getElementById("hidden_arrow2");
const hidden_arrow3 = document.getElementById("hidden_arrow3");
const hidden_arrow4  = document.getElementById("hidden_arrow4");
const hidden_arrow5  = document.getElementById("hidden_arrow5");
const hidden_arrow6 = document.getElementById("hidden_arrow6");

function HandleOver(){

    hidden_arrow.classList.remove("hidden");
    hidden_arrow.classList.add("arrow");
  
}

function HandleLeave(){
 
  hidden_arrow.classList.add("hidden");
  hidden_arrow.classList.remove("arrow");

}


function HandleOver2(){

  hidden_arrow2.classList.remove("hidden");
  hidden_arrow2.classList.add("arrow");

}

function HandleLeave2(){

hidden_arrow2.classList.add("hidden");
hidden_arrow2.classList.remove("arrow");

}

function HandleOver3(){

  hidden_arrow3.classList.remove("hidden");
  hidden_arrow3.classList.add("arrow");

}

function HandleLeave3(){

hidden_arrow3.classList.add("hidden");
hidden_arrow3.classList.remove("arrow");

}

function HandleOver4(){

  hidden_arrow4.classList.remove("hidden");
  hidden_arrow4.classList.add("arrow");

}

function HandleLeave4(){

hidden_arrow4.classList.add("hidden");
hidden_arrow4.classList.remove("arrow");

}

function HandleOver5(){

  hidden_arrow5.classList.remove("hidden");
  hidden_arrow5.classList.add("arrow");

}

function HandleLeave5(){

hidden_arrow5.classList.add("hidden");
hidden_arrow5.classList.remove("arrow");

}

function HandleOver6(){

  hidden_arrow6.classList.remove("hidden");
  hidden_arrow6.classList.add("arrow");

}

function HandleLeave6(){

hidden_arrow6.classList.add("hidden");
hidden_arrow6.classList.remove("arrow");

}


// carousel script

$('.owl-carousel').owlCarousel({
  loop:true,
  margin:50,
  autoplay:true,
  autoplayTimeout:4000,
  // stagePadding:50,
  nav:false,
  responsive:{
      0:{
          items:1
      },
      600:{
          items:1
      },
      1000:{
          items:2
      }
      
  }
})