import React from 'react';

class ProductList extends React.Component {
    constructor(props) {
        super(props);
        this.state = {products: []};
    }

    componentDidMount() {
        this.getProductList();
    }

    getProductList() { 
        fetch('http://localhost:3000/products')
          .then(results => {
              return results.json();
          }).then(data => {
              this.setState({products: JSON.parse(data.data)});
          });
    }

    render() {
        const products = this.state.products.map((product, i) => {
        let formattedProductName = product.product_name.toLowerCase().replace(/\b[a-z]/g, function(letter) {
                return letter.toUpperCase();
        });
        let inventories = product.productInventories.map((inv, i) => {
            return (
                <div className="row" key={inv.id}>
                      <div className="col-sm-2 borders">{inv.waist}</div>
                      <div className="col-sm-2 borders">{inv.length}</div>
                      <div className="col-sm-5 borders">{inv.style}</div>
                      <div className="col-sm-3 borders">{inv.count}</div>
                </div>
            );
        });

        return (          
            <div key={product.product_id} className="row borders">
              <div className="col-sm-4">
                  <h2>{ formattedProductName }</h2>
                  <span>{product.product_description }</span>
              </div>
              <div className="col-sm-3">
                <img src={product.product_image} alt="Product Image" className="img-responsive"/>
              </div>
              <div className="col-sm-5">                  
                    <div className="row inventoryHeader">
                        <div className="col-sm-2">Waist</div>
                        <div className="col-sm-2">Length</div>
                        <div className="col-sm-5">Style</div>
                        <div className="col-sm-2">Count</div>
                    </div>
                    <div className="inventoryContent">
                        {inventories}
                    </div>
              </div>
            </div>
          );
        });
        return (
        <div>
            { products }
        </div>
        );
    }
}

export default ProductList;