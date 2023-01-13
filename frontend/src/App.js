import React from "react";
import { Route, Switch } from "react-router-dom";
import Header from "./Components/Header";
import SplashPage from "./Components/Splash";
import ProductItem from "./Components/ProductItem";
import CoffeeCollection from "./Components/Collections/CoffeeCollection";
import Drinkware from "./Components/Collections/Drinkware";
import SearchResults from "./Components/Search/SearchResults";
import Brewtools from "./Components/Collections/Brewtools";
import Instant from "./Components/Collections/Instant";
import SingleOrigin from "./Components/Collections/SingleOrigin";


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
        <Route exact path="/collection/coffee">
          <CoffeeCollection />
          </Route>
          <Route exact path="/collection/drinkware">
          <Drinkware />
        </Route>
        <Route exact path="/collection/brewtools">
          <Brewtools />
        </Route>
        <Route exact path="/collection/instant">
          <Instant />
        </Route>
        <Route exact path="/collection/singleorigin">
          <SingleOrigin />
        </Route>
        <Route exact path="/search">
          <SearchResults />
        </Route>
      </Switch>
    </>
  );
}

export default App;
