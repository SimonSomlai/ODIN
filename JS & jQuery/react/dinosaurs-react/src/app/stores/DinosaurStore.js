const AppDispatcher = require('../dispatcher/AppDispatcher'),
  AppConstants = require('../constants/AppConstants');
import _ from "underscore";
import EventEmitter from "events";

let CHANGE_EVENT = "CHANGE";

var DinosaurStore = _.extend({}, EventEmitter.prototype, {
  dinosaurs: [],
  findDinosaur: function(id){
    return this.dinosaurs.find((dinosaur) => {
      return dinosaur.id === parseInt(id)
    })
  },
  updateDinosaur: function(newDinosaur){
    console.log("updating dinosaur with id " + newDinosaur.id);
    var oldDinosaur = this.findDinosaur(newDinosaur.id)
    var index = this.dinosaurs.findIndex((dinosaur) => dinosaur === oldDinosaur)
    var dinosaur = this.dinosaurs[index]
    for(var property in newDinosaur){
      console.log("changing " + property + " from " + this.dinosaurs[index][property] + " into " + newDinosaur[property]);
      this.dinosaurs[index][property] = newDinosaur[property]
    }
    console.log(this.getDinosaurData());
  },
  deleteDinosaur: function(id){
    console.log("deleting dinosaur from store with id " + id);
    var oldDinosaur = this.findDinosaur(id)
    var index = this.dinosaurs.findIndex((dinosaur) => dinosaur === oldDinosaur)
    this.dinosaurs.splice(index,1)
    console.log(this.getDinosaurData());
  },
  setDinosaur: function(data) {
    this.dinosaurs = data;
    console.log(this.getDinosaurData());
  },
  getDinosaurData: function() {
    return this.dinosaurs;
  },
  addDinosaur: function(dinosaur) {
    console.log("Adding new dinosaur to the store!", dinosaur);
    this.dinosaurs.push(dinosaur)
  },
  addChangeListener: function(callback) {
    this.on(CHANGE_EVENT, callback)
  },
  removeChangeListener: function(callback) {
    this.removeListener(CHANGE_EVENT, callback)
  },
  emitChange: function() {
    this.emit(CHANGE_EVENT);
  }
})

AppDispatcher.register(function(data) {
  console.log("hitting store with ", data.action.actionType, " and params are ", data.action.data);
  switch (data.action.actionType) {
    case AppConstants.GET_DINOSAUR:
    console.log("Setting dinosaur in the store!");
      DinosaurStore.setDinosaur([data.action.data]);
      DinosaurStore.emitChange();
      break;
    case AppConstants.GET_DINOSAURS:
    console.log("Setting all dinosaurs in the store!");
      DinosaurStore.setDinosaur(data.action.data);
      DinosaurStore.emitChange();
      break;
    case AppConstants.CREATE_DINOSAUR:
    console.log("adding dinosaur to store!");
      DinosaurStore.addDinosaur(data.action.data);
      DinosaurStore.emitChange();
      break;
    case AppConstants.UPDATE_DINOSAUR:
    console.log("updating dinosaur in the store!");
      DinosaurStore.updateDinosaur(data.action.data);
      DinosaurStore.emitChange();
      break;
    case AppConstants.DELETE_DINOSAUR:
    console.log("deleting dinosaur in the store!");
      DinosaurStore.deleteDinosaur(data.action.data.id);
      DinosaurStore.emitChange();
      break;
    default:
  }
  return true;
})

module.exports = DinosaurStore;
