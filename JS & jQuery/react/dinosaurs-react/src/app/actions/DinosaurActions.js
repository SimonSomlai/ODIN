const AppDispatcher = require('../dispatcher/AppDispatcher'),
    AppConstants = require('../constants/AppConstants');
import DinosaurApi from "../services/DinosaurApi"

// Define action methods
let DinosaurActions = {
  getDinosaur: (id) => {
    console.log("trigger get action in DinosaurActions");
    DinosaurApi.getDinosaur(id, function(result){
      console.log("api call succesfull!");
      AppDispatcher.handleAction({actionType: AppConstants.GET_DINOSAUR, data: result });
    }, function(err){
      console.log(err);
    });
  },
  getDinosaurData: () => {
    console.log("trigger get all action in DinosaurActions");
    DinosaurApi.getAllDinosaurs(function(result){
      console.log("api call succesfull!");
      AppDispatcher.handleAction({actionType: AppConstants.GET_DINOSAURS,data: result });
    }, function(err){
      console.log(err);
    });
  },
  addDinosaur: (dinosaur) => {
    console.log("trigger create action in DinosaurActions");
    DinosaurApi.addDinosaur(dinosaur, function(result){
      console.log("api call succesfull!");
      AppDispatcher.handleAction({actionType: AppConstants.CREATE_DINOSAUR, data: result });
    }, function(err){
      console.log(err);
    });
  },
  updateDinosaur: (id, newDinosaur) => {
    console.log("trigger update action in DinosaurActions");
    DinosaurApi.updateDinosaur(id, newDinosaur, function(result){
      console.log("api call succesfull!");
      AppDispatcher.handleAction({actionType: AppConstants.UPDATE_DINOSAUR, data: result});
    }, function(err){
      console.log(err);
    });
  },
  deleteDinosaur: (id) => {
    console.log("trigger delete action in DinosaurActions");
    DinosaurApi.deleteDinosaur(id, function(result){
      console.log("api call succesfull!");
      AppDispatcher.handleAction({actionType: AppConstants.DELETE_DINOSAUR, data: {id: id}});
    }, function(err){
      console.log(err);
    });
  }
};

module.exports = DinosaurActions;
