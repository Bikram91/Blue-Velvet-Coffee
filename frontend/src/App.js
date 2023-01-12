import React from "react";
import { Route, Switch } from "react-router-dom";
import Header from "./Components/Header";
import SplashPage from "./Components/Splash";
import ProductItem from "./Components/ProductItem";
import CoffeeCollection from "./Components/Collections/CoffeeCollection";
import Drinkware from "./Components/Collections/Drinkware";
import SearchResults from "./Components/Search/SearchResults";


function App() {
  return (
    <>
      <Header />
      <Switch>
        <Route exact path="/">
          <SplashPage />
        </Route>
        <Route exact path="/products/:productId">
          <ProductItem />
        </Route>
        <Route path="/collection/coffee">
          <CoffeeCollection />
          </Route>
          <Route path="/collection/drinkware">
          <Drinkware />
        </Route>
        <Route exact path="/search">
          <SearchResults />
        </Route>
      </Switch>
    </>
  );
}

export default App;
