import { configureStore } from '@reduxjs/toolkit';
import windowReducer from './features/windowSlice';

export default configureStore({
  reducer: {
    window: windowReducer,
  },
});