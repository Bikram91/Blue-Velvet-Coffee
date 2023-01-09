import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { loadProducts, fetchProduct } from "../../store/product";
import { Modal } from "../../context/Modal";
import LoginFormModal from "../account_forms/LoginModal";
import "./ProductItem.css";
import Footer from "../Footer";

import { Swiper, SwiperSlide } from 'swiper/react';

const ProductItem = () => {
  const dispatch = useDispatch();
  const productId = Number(useParams().productId);
  const user = useSelector((state) => state.session.user);
  const products = useSelector(loadProducts);
  useEffect(() => {
    dispatch(fetchProduct(productId));
  }, [dispatch, productId]);

  let product = products.find((product) => product.id === productId);
  console.log(product)
  if (!product) return null;

  return (
    <div>
      <h1>{product?.name}</h1>
      <p>{product?.description}</p>
      <Footer/>
    </div>
  );
};

export default ProductItem;
