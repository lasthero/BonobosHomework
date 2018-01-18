import React from 'react';
import ProductList from './ProductList';

class App extends React.Component {
    render(){
        return (
            <div className="container">                
                <h1>Product Inventories</h1>                
                <ProductList />                
            </div>
        );
    }
}

export default App;