$("#celsius").change(function() {
  var c = parseFloat($(this).val());
  var f = c * 9.0 / 5.0 + 32.0;
  $("#celsius").val(c.toFixed(1));
  $("#fahrenheit").val(f.toFixed(1));
});

$("#fahrenheit").change(function() {
  var f = parseFloat($(this).val());
  var c = (f - 32.0) * 5.0 / 9.0;
  $("#celsius").val(c.toFixed(1));
  $("#fahrenheit").val(f.toFixed(1));
});

// Fill in the starting values.
$("#celsius").val("0.0");
$("#fahrenheit").val("32.0");
