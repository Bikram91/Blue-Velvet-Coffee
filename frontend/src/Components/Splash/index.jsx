import './Splash.css'
import Footer from '../Footer';


const SplashPage = () => {
  return (
    <main>
      <section className="home-section">
        <div>
            <h1>Limited-Edition Winter Coffees and Coffee Sets Now 15% Off</h1>
        </div>
      </section>

      <section className='instant-coffee'>
        <div>
            <span>Cafe-Quality Lattes: Anywhere</span>
          <p>
              Hitting your stride in a brand new year has never been easier—or more delicious. 
              Keep Craft Instant Espresso on hand for smoother errands, adventures, and everything in between.
          </p>
        </div>
      </section>
      <Footer/>
    </main>
  );
};




export default SplashPage;
