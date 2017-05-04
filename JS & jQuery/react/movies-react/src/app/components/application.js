import React from 'react';
import Home from './pages/home';
import Template from './application-template';
import {Router, Route, IndexRoute, browserHistory} from 'react-router';

export default () => {
  return (
      <Router history={browserHistory}>
        <Route path="/" component={Template}>
          <IndexRoute component={Home}/>
          <Route path="page2"  />
        </Route>
      </Router>
  )
}
