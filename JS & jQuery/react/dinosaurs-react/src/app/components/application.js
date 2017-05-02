import React from 'react';
import DinosaurList from './dinosaurs/dinosaur_list';
import DinosaurDetail from './dinosaurs/dinosaur_detail';
import Template from './application-template';
import {Router, Route, IndexRoute, browserHistory} from 'react-router';

export default() => {
  return (
    <Router history={browserHistory}>
      <Route path="/" component={Template}>
        <IndexRoute component={Template}/>
        <Route path="/dinosaurs" component={DinosaurList}></Route>
        <Route path="/dinosaurs/:id" component={DinosaurDetail}></Route>
      </Route>
    </Router>
  )
}
