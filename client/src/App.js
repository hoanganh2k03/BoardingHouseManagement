import "./App.css";
import Home from "../src/Components/Home/home";
import Detail from "./Components/DetailPost/Detail";
import { Route, Routes } from "react-router-dom";
import MainLogin from "./Components/Home/Head/Login/main";
import MainSignup from "./Components/Home/Head/Signup/main";
import MainForgot from "./Components/Home/Head/Forgot/main";
import CreatePost from "./Components/Home/Head/CreatePost/main";
import Report from "./Components/Home/Head/Report/main";

import Admin from "./Components/Admin/admin";
import User from "./Components/User/user";
import DetailPostUser from "./Components/User/user_post/detailPost";
import DetailPostAdmin from "./Components/Admin/admin_post/detailPost";
import Footer from "./Components/Home/Footer/footer";
import Recruitment from "./Components/Home/Footer/recruitment";
import Introduce from "./Components/Home/Footer/introduce";
import PriceList from "./Components/Home/Footer/priceList";
import ChangePassWord from "./Components/Home/Head/ChangePass/main";
import StatisticsTable from "./Components/Admin/admin_payment/StatisticsTable";

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/detail" element={<DetailPostUser />} />
        <Route path="/changepassword" element={<ChangePassWord />} />
        <Route path="/admin" element={<Admin />} />
        <Route path="/user" element={<User />} />
        <Route path="/admin/info" element={<Admin />} />
        <Route path="/admin/user" element={<Admin />} />
        <Route path="/admin/post" element={<Admin />} />
        <Route path="/admin/payment" element={<Admin />} />
        <Route path="/admin/report" element={<Admin />} />
        <Route path="/user/info" element={<User />} />
        <Route path="/user/user" element={<User />} />
        <Route path="/user/post" element={<User />} />
        <Route path="/user/notification" element={<User />} />
        <Route path="/user/payment" element={<User />} />
        <Route path="/detail/:id" element={<Detail />} />
        <Route path="/detail/admin/:id" element={<DetailPostAdmin />} />
        <Route path="/createpost" element={<CreatePost />} />
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<MainLogin />} />
        <Route path="/report" element={<Report />} />
        <Route path="/signup" element={<MainSignup />} />
        <Route path="/forgot" element={<MainForgot />} />
        <Route path="/recruitment" element={<Recruitment />} />
        <Route path="/introduce" element={<Introduce />} />
        <Route path="/priceList" element={<PriceList />} />
        <Route path="/statistics" element={<StatisticsTable />} />
      </Routes>
      <Footer />
    </div>
  );
}

export default App;
