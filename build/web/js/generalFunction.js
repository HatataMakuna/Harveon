function closeBox(className) {
    document.getElementsByClassName(className)[0].classList.add('hide')
  }
  
  function openBox(className) {
    document.getElementsByClassName(className)[0].classList.remove('hide')
  }

function switchBox(open, close) {
    openBox(open)
    closeBox(close)
}

/*Expand Minimize*/
function moreOrLess(elem) {
  var value = elem.value;
  let targetButton = document.getElementsByClassName('description-box');
  if (value == "more") {
    targetButton[0].classList.remove('clamp-mobile')
    elem.value = "less"
    elem.innerHTML = 'See Less  <i class="tf-ion-chevron-up"></i>';
  }
  else if (value == 'less') {
    targetButton[0].classList.add('clamp-mobile')
    elem.value = "more"
    elem.innerHTML ='See More  <i class="tf-ion-chevron-down"></i>';
  }

}

/*Change var*/
function changeVar(src, className, activeName) {

  var varTarget = document.getElementsByClassName(className)
  var varActive = document.getElementsByClassName(activeName)

  if (varActive.length > 0) {
    varActive[0].classList.remove(activeName)
  }

  src.classList.add(activeName)     
}


jQuery(document).ready(function($) {
  $(".clickable").click(function() {
      window.location = $(this).data("href");
  });
});


/*change min max*/
function changeMinMax(min,max) {
  document.getElementById('min-price-range').value = min;
  document.getElementById('max-price-range').value = max;
}

/*reset*/
function reset() {
  let totalReset = document.querySelectorAll('.filter-value.active');
  let totalLimitedReset = document.querySelectorAll('.price-range-value.active');
  let inputRange = document.getElementsByClassName('input-range')
  for (var i = 0; i < totalReset.length; i++){
    totalReset[i].classList.remove('active')
  }

  for (var i = 0; i < totalLimitedReset.length; i++){
    totalLimitedReset[i].classList.remove('active')
  }

  for (var i = 0; i < inputRange.length; i++){
    inputRange[i].value = '';
  }
}