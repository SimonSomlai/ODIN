import React from 'react';
import Home from './pages/home';
import Template from './application-template';
import {Router, Route, IndexRoute, browserHistory} from 'react-router';
import MovieDetail from './movies/movie_detail.js'
export default () => {
  return (
    <Router history={browserHistory}>
      <Route path="/" component={Template}>
        <IndexRoute component={Home}/>
        <Route path="/movies/:id" component={MovieDetail}></Route>
      </Route>
    </Router>
  )
}
