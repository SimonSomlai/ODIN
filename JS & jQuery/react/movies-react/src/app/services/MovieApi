var $ = require("jquery");

let DinosaurAPI = {
  getAllDinosaurs: (success, error) => {
    console.log("getting all dinosaurs from api");
    $.ajax({url: 'https://dinosaur-api.herokuapp.com/dinosaurs', method: 'GET', cache: false, dataType: 'json'
    }).done(function(result) {
      success(result);
    }).fail(function() {
      error();
    });
  },
  getDinosaur: (id, success, error) => {
    console.log("getting dinosaur from api with id", id);
    $.ajax({
      url: 'https://dinosaur-api.herokuapp.com/dinosaurs/' + id,
      method: 'GET',
      cache: false,
      dataType: 'json'
    }).done(function(result) {
      success(result);
    }).fail(function() {
      error();
    });

  },
  addDinosaur: (dinosaur, success, error) => {
    console.log("creating new dinosaur through api call", dinosaur);
    var params = JSON.stringify({dinosaur: dinosaur})
    $.ajax({
      url: 'https://dinosaur-api.herokuapp.com/dinosaurs',
      method: 'POST',
      cache: false,
      dataType: 'json',
      contentType: 'application/json',
      data: params
    }).done(function(result) {
      success(result);
    }).fail(function() {
      error();
    });
  },
  updateDinosaur: (id, newDinosaur, success, error) => {
    console.log("updating dinosaur through api call with id", id);
    var params = JSON.stringify({dinosaur: newDinosaur})
    $.ajax({
      url: 'https://dinosaur-api.herokuapp.com/dinosaurs/' + id,
      method: 'PATCH',
      cache: false,
      dataType: 'json',
      contentType: 'application/json',
      data: params
    }).done(function(result) {
      success(result);
    }).fail(function() {
      error();
    });

  },
  deleteDinosaur: (id, success, error) => {
    console.log("deleting new dinosaur through api call with id", id);
    $.ajax({"async": true, "crossDomain": true, "url": "https://dinosaur-api.herokuapp.com/dinosaurs/" + id, "method": "DELETE"
  }).done(function(result) {
      success(result);
    }).fail(function() {
      error();
    });
  }
};

module.exports = DinosaurAPI;
