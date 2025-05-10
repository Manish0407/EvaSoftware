import React from 'react'
import DoorConfigurator from './SeactionEditor/DoorConfigurator'
import { Provider } from 'react-redux';
import store from './store.js';


const App = () => {
  return (
    <Provider store={store}>
      <DoorConfigurator/>
    </Provider>
  )
}

export default App