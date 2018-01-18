import 'babel-polyfill';
import React from 'react';
import { render } from 'react-dom';
import App from './components/App'
import './index.css';
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';

render (
   
    <App />    ,
    document.getElementById('app')
);