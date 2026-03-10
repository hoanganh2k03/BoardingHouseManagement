import Head from "../Home/Head/head";
import Body from "../Home/Body/body";
import { Link } from "react-router-dom";
function Home() {
  return (
    <div className="Home">
      {/* Avoid wrapping Head and Body in a link to prevent nested <a> elements */}
      <Head />
      <Body />
    </div>
  );
}
export default Home;
