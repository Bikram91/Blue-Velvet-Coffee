import { Swiper, SwiperSlide } from 'swiper/react';
import { Link } from 'react-router-dom';
import { Navigation } from "swiper";
import 'swiper/css';
import 'swiper/css/navigation';
import './ProductListing.css';

const ProductListing = ({product}) => {
    const {id, name, category, imgUrls, productType} = product
    
    const images = product.imgUrls;
    const image = images[3];
    const image1 = images[1];
    // const rand = Math.floor(Math.random() * images.length);
    // const randImg = images[rand];
    

    return (
      <div className='product_listing_wrapper'>
        <Link to={`/products/${id}`}>
          {/* <div className="product_listing_detail"> */}
            {/* <div> */}
              <img className='img' src={image} alt="" />

            {/* </div> */}
          {/* </div> */}
        </Link>
        <p className='name'>{productType}</p>
        <p className='name'>{name}</p>
      </div>
    )
  }
  
  export default ProductListing;
















  
  {/* <Link to={`/products/${id}`}>
  <Swiper 
    navigation={true} 
    modules={[Navigation]}>
    <SwiperSlide className="swiper_listing">
      <picture>
        <img src={image} alt={`${name}`} />
      </picture>
    </SwiperSlide>
    <SwiperSlide>
      <picture>
        <img src={image1} alt={`${name}`} />
        <p>{name}</p>
      </picture>
    </SwiperSlide>
  </Swiper>
  </Link> */}