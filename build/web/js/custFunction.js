
/*Checkbox all*/
/*Select All */
function toggle(source) {
  checkboxes = document.getElementsByName('cart-check');
  for(var i=0, n=checkboxes.length;i<n;i++) {
      checkboxes[i].checked = source.checked;
      if($(checkboxes[i]).is(":checked")) {
          $(checkboxes[i]).addClass("selected-item");
      } else {
          $(checkboxes[i]).removeClass("selected-item");
      }
  }

  document.getElementsByClassName('select-all')[0].checked = source.checked;
  document.getElementsByClassName('select-all')[1].checked = source.checked;
  calculateSelected();
}

/*Select One*/ 
$('.select-item').change(function(){
  if($(this).is(":checked")) {
      $(this).addClass("selected-item");
  } else {
      $(this).removeClass("selected-item");
   }
   calculateSelected();
});

function calculateSelected() {
  var itemSelectedTotal;
  itemSelectedTotal = document.getElementsByClassName('selected-item').length;
  $("#cart-select-total").html(itemSelectedTotal);

}


/*Counter*/
$(".counter-btn").on("click", function (ev) {
  var parent = $(this).parents('tr');
  var currentQty = $('input[name="quantity"]',parent).val();
  var qtyDirection = $(this).data("direction");
  var newQty = 0;

  if (qtyDirection == "1") {
    newQty = parseInt(currentQty) + 1;
  }
  else if (qtyDirection == "-1") {
    newQty = parseInt(currentQty) - 1;
  }

  // make decrement disabled at 1
  if (newQty == 1) {
    $(".decrement-quantity",parent).attr("disabled", "disabled");
  }
  
  // remove disabled attribute on subtract
  if (newQty > 1) {
    $(".decrement-quantity",parent).removeAttr("disabled");
  }
  
  if (newQty > 0) {
    newQty = newQty.toString();
    $('input[name="quantity"]', parent).val(newQty);
    
  }
  else {
    $('input[name="quantity"]',parent).val("1");
  }

  var parent = $(this).parents('tr');
  var price = $('.unit-price', parent);
  var checker = $('.select-item', parent)


  var value = (parseInt($('.qty', parent).val()) * parseFloat(price.get(0).innerHTML)).toFixed(2);
  $('.total-price', parent).text(value);

  if (checker.is(":checked") && qtyDirection == "-1") {
    calTotal(parseFloat(price.get(0).innerHTML).toFixed(2),"-1");
  }

  if (checker.is(":checked") && qtyDirection == "1") {
    calTotal(parseFloat(price.get(0).innerHTML).toFixed(2),"1");
  }
});

var total = 0
var currentQuantity;
/*When user enter quantity from input */
$('.qty').keydown(function () {
  var parent = $(this).parents('tr');
  var qty = $('.qty', parent);

  if (!isNaN(parseFloat(qty.val()))){
    currentQuantity = qty.val()
  }
} )

$('.qty').keyup(function () {
  var parent = $(this).parents('tr');
  var price = $('.unit-price', parent);
  var qty = $('.qty', parent);

  if (!isNaN(parseFloat(qty.val()))) {
    $('.total-price', parent).text((parseInt(qty.val()) * parseFloat(price.get(0).innerHTML)).toFixed(2));

    if ($('.select-item', parent).is(":checked")) {
      if (currentQuantity > qty.val()) {
        calTotal(price.get(0).innerHTML * (currentQuantity - qty.val()), "-1")      
      }
      else if (currentQuantity < qty.val()) {
        calTotal(price.get(0).innerHTML * (qty.val() - currentQuantity), "1")
      }
    }
  }  
})

/*Function to add or decrease total */
function calTotal(amount, direction) {
  if (direction == "1") {
    total += parseFloat(amount);
  }
  if (direction == "-1") {
    total -= parseFloat(amount);
  }
$('.total-cart-price').text(parseFloat(total).toFixed(2));
}

/*add total when select item */
$(".select-item").click(function () {
  var parent = $(this).parents('tr');
  var sum = parseFloat($('.total-price', parent).get(0).innerHTML);
  if ($(this).is(':checked')) {
    calTotal(sum,"1")
  }

  if (!$(this).is(':checked')) {
    calTotal(sum,"-1")
  }
  
});

/*Recalculate the total cart price when press select all*/
$(".select-all").click(function () {
  total = 0;  
  if ($(this).is(':checked')) {
    let totalSelected = document.querySelectorAll('.selected-item')

    for (var i = 0; i < totalSelected.length; i++){
      var parent = $(totalSelected[i]).parents('tr');
      calTotal(parseFloat($('.total-price', parent).get(0).innerHTML),"1")
    }
  }
    $('.total-cart-price').text(parseFloat(total).toFixed(2));
})

/*Count total price of very time when load*/
  let totalRows = document.querySelectorAll('.qty')
  for (var i = 0; i < totalRows.length; i++) {
    var parent = $(totalRows[i]).parents('tr');
    var qty = $('.qty', parent); 

    var value = (parseInt(qty.val()) * parseFloat( $('.unit-price', parent).get(0).innerHTML)).toFixed(2);
    $('.total-price', parent).text(value);

    if (qty.val() == 1) {
      $('.decrement-quantity', parent).prop("disabled",true);
    }
  }








 



    
    
	
	




