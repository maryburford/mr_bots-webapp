$(document).ready(function(){
  $(".btn").click(function(){
    $(this).find("i").addClass("fa-spin");
  });

  $('[data-toggle="tooltip"]').tooltip();
  $("#engagements_per_day_slider").slider({
      max: 30,
      min: 1,
      step: 1,
      value: $("input[name=engagements_per_day]").val(),
      slide: function(event, ui) {
	  $("input[name=engagements_per_day]").val(ui.value);
	  $("#engagements_per_day_preview").text(ui.value);
	  if(ui.value < 10)
	  $("#engagements_per_prey_slider").slider("option","max", ui.value);
	  updateSummary();
      }
  });
  $("#engagements_per_prey_slider").slider({
      max: 10,
      min: 1,
      step: 1,
      value: $("input[name=engagements_per_prey]").val(),
      slide: function(event, ui) {
	  $("input[name=engagements_per_prey]").val(ui.value);
	  $("#engagements_per_prey_preview").text(ui.value);
	  updateSummary();
      }
  });
  $("#engagements_per_day_preview").text($("input[name=engagements_per_day]").val());
  $("#engagements_per_prey_preview").text($("input[name=engagements_per_prey]").val());

  $("input[name=target]").change(updateSummary);

  function updateSummary(){
    var target = $("input[name=target]").val() ? $("input[name=target]").val()
    : "someone";
    var perPrey = $("input[name=engagements_per_prey]").val();
    var totalPrey = Math.floor($("input[name=engagements_per_day]").val()/perPrey);
    var summary = "<strong>Campaign Summary:</strong> ";
    summary += "Every day, MR_BOTS will randomly pick <b>" + totalPrey + "</b>";
    summary += " of <b>" + target + "</b>'s followers, ";
    summary += "and favorite <b>" + perPrey + "</b> of their tweets, ";
    summary += "for a total of <b>" + totalPrey*perPrey + "</b> engagements.";
    $("#campaign-summary").html(summary);
  }
});
