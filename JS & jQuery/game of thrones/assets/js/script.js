var images = ["cersei-lannister", "daenarys-targaryen", "maester-varys", "margarey-tyrell", "petyr-baelish", "samwell-tarly", "sansa-stark"]

function toTitleCase(str) {
  return str.replace(/\w\S*/g, function(txt) {
    return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
  });
}

function appendItems() {
  for (var i = 0; i < images.length; i++) {
    var name = toTitleCase(images[i].replace("-", " "));
    var html = '<li data-title=' + images[i] + ' class="' + images[i] + '"><figure>' +
    '<img src="assets/images/' + images[i] + '-1920.jpg" alt="' + name + '" title="' + name + '"/>' +
    '<figcaption>'+ name +'</figcaption>' +
    '</figure></li>'
    var html2 = '<li><a class="index" data-title= ' + images[i] + ' href="#">' + parseInt(i + 1) + '</a></li>'
    $(".sequence").append(html2)
    $(".carousel").append(html);
    $(".carousel li:nth-child(1)").addClass("active");
    $(".sequence li:nth-child(3) a").addClass("active");
  }
  var html3 = '<li><a class="pull-right score-calculator" href="#">Get the score!</a></li>'
  $(".sequence").append(html3)
}

function updateIndex(slide){
  $(".sequence li a.active").removeClass("active")
  $('div[data-name="place"]')
  $(".sequence li a[data-title=" + slide + "]").addClass("active")
}

function controlSlider(){
  $(".previous, .next").on("click", function(e) {
    e.preventDefault();
    var action = $(this).text();
    var total = $(".carousel li").length;
    var current = ($(".carousel li.active").index() + 1);
    $(".carousel li:nth-child(" + current + ")").removeClass("active");
    var next = action == "next" ? ((current + 1 > total) ? 1 : current + 1) : (current - 1 <= 0) ? 7 : current - 1
    var slide = $(".carousel li:nth-child(" + next + ")").addClass("active").attr("data-title")
    updateIndex(slide)
  })
}

function goToIndex(){
  $(".sequence li a.index").on("click", function(e){
    e.preventDefault();
    var slide = $(this).attr("data-title")
    $(".carousel li.active").removeClass("active")
    $(".carousel li."+ slide +"").addClass("active")
    updateIndex(slide)
  })
}

function addScore(){
  $("figure img").on("click", function(){
    var name = $(this).attr("title");
    var lowerName = name.toLowerCase().replace(" ","-");
    var listItem = $(".score li." + lowerName +"").length;
    if(listItem > 0){ // Update Score
      var element = $(".score li." + lowerName +" span");
      score = parseInt(element.text());
      score++;
      element.css("padding-right", score*4 + "px")
      element.text(score);
    } else { // Add Element
      var html = "<li class='" + lowerName + "'>" + name + " <span style='padding-right: 5px;'>1</span></li>"
      $(".score").append(html);
    }
  })
}

function findWinners(scores, winnerScore){
  winners = []
  for(var key in scores) {
    if(parseInt(scores[key]) === winnerScore) {
      winners.push(key)
    }
  }
  return winners
}

function calculateScore(){
  $(".score-calculator").on('click', function(e){
    e.preventDefault();
    var scores = {}, totals = [];
    $(".score li").each(function(){
      var score = $(this).find("span").text()
      var name = $(this).text().replace(score,"")
      scores[name] = score
      for (var key in score) {
        totals.push(parseInt(score[key]))
      }
      winnerScore = Math.max(...totals)
    })
    var winners = findWinners(scores, winnerScore)
    alert(winners.join("and ") + " won!")
  })
}

$(document).ready(function() {
  appendItems()
  controlSlider()
  addScore()
  goToIndex()
  calculateScore()
})
