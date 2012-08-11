var gallon = 3.78541178; // Gallon to litres.
var gallonImp = 4.54609188; // Imperial gallon to litres.
var mil = 10.0; // Scandinavian mile to km.
var mile = 1.609344; // Mile to km.
var eps = 1e-10;

function recalculate(mpg) {
  var mpgimp = (mpg * gallonImp) / gallon;
  var kml = (mpg * mile) / gallon;
  var lhkm = (kml < eps) ? 0 : 100.0 / kml;
  var lmil = (kml < eps) ? 0 : mil / kml;
  $("#mpg").val(mpg.toFixed(2));
  $("#mpgimp").val(mpgimp.toFixed(2));
  $("#kml").val(kml.toFixed(2));
  $("#lhkm").val(lhkm.toFixed(2));
  $("#lmil").val(lmil.toFixed(2));
}

$("#mpg").change(function() {
  recalculate(parseFloat($(this).val()));
});

$("#mpgimp").change(function() {
  var mpg = parseFloat($(this).val()) * gallon / gallonImp;
  recalculate(parseFloat(mpg));
});

$("#kml").change(function() {
  var mpg = parseFloat($(this).val()) * gallon / mile;
  recalculate(parseFloat(mpg));
});

$("#lhkm").change(function() {
  var mpg = (100.0 * gallon) / (mile * parseFloat($(this).val()));
  recalculate(parseFloat(mpg));
});

$("#lmil").change(function() {
  var mpg = (mil * gallon) / (mile * parseFloat($(this).val()));
  recalculate(parseFloat(mpg));
});

// Fill in the starting values.
recalculate(0.0);
