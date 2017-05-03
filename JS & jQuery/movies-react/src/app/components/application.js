import React from 'react';
import Introduction from './introduction/Introduction';
import Template from './application-template';
import {Router, Route, IndexRoute, browserHistory} from 'react-router';

export default () => {
  return (
      <Router history={browserHistory}>
        <Route path="/" component={Template}>
          <IndexRoute component={Introduction}/>
          <Route path="page2"  />
        </Route>
      </Router>
  )
}
