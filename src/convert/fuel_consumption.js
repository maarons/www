var gallon = 3.78541178; // Gallon to litres.
var gallonImp = 4.54609188; // Imperial gallon to litres.
var mile = 1.609344; // Mile to km.
var eps = 0.001;

function setValues(mpg, mpgimp, lhkm) {
  $("#mpg").val(mpg.toFixed(2));
  $("#mpgimp").val(mpgimp.toFixed(2));
  $("#lhkm").val(lhkm.toFixed(2));
}

$("#mpg").change(function() {
  var mpg = parseFloat($(this).val());
  var mpgimp = mpg * gallonImp / gallon;
  var lhkm = (mpg > eps) ? (100 * gallon) / (mpg * mile) : 0.0;
  setValues(mpg, mpgimp, lhkm);
});

$("#mpgimp").change(function() {
  var mpgimp = parseFloat($(this).val());
  var mpg = mpgimp * gallon / gallonImp;
  var lhkm = (mpgimp > eps) ? (100 * gallonImp) / (mpgimp * mile) : 0.0;
  setValues(mpg, mpgimp, lhkm);
});

$("#lhkm").change(function() {
  var lhkm = parseFloat($(this).val());
  var mpg = (lhkm > eps) ? (100 * gallon) / (mile * lhkm) : 0.0;
  var mpgimp = mpg * gallonImp / gallon;
  setValues(mpg, mpgimp, lhkm);
});

// Fill in the starting values.
setValues(0.0, 0.0, 0.0);
