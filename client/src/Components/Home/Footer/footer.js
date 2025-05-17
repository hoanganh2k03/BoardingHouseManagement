import React from "react";
import "./footer.css"; // Import CSS file
import { Link } from "react-router-dom";


function Footer() {
  return (
    <footer className="footer">
      <div className="grid">
        <div className="grid__row">
          <div className="grid__column-3">
            <h3 className="footer__heading">Tin tức</h3>
            <ul className="footer__list">
              <li className="footer__item">
              <Link to="/introduce" className="footer__item__link">
                  Giới thiệu
                </Link>
              </li>
              <li className="footer__item">
                <a href="/" className="footer__item__link">
                  Bài viết
                </a>
              </li>
              <li className="footer__item">
              <Link to="/recruitment" className="footer__item__link">
                  Tuyển dụng
                </Link>
              </li>
            </ul>
          </div>
          <div className="grid__column-3">
            <h3 className="footer__heading">Chăm sóc khách hàng</h3>
            <ul className="footer__list">
              <li className="footer__item">
                <a
                 href="/"
                  className="footer__item__link"
                >
                  Chính sách bảo mật
                </a>
              </li>
              <li className="footer__item">
                <a href="/" className="footer__item__link">
                  Điều khoản sử dụng
                </a>
              </li>
              <li className="footer__item">
                <a
                  href="/"
                  className="footer__item__link"
                >
                  Quy định đăng tin
                </a>
              </li>
              <li className="footer__item">
              <Link to="/priceList" className="footer__item__link">
                  Bảng giá đăng tin
                </Link>
              </li>
            </ul>
          </div>
          <div className="grid__column-3">
            <h3 className="footer__heading">Liên hệ</h3>
            <ul className="footer__list">
            <li className="footer__item">
                <a
                  href="/"
                  className="footer__item__link"
                >
                  <ion-icon
                    className="footer__item__icon"
                    name="logo-email"
                  ></ion-icon>
                  abc@gmail.com
                </a>
              </li>
              <li className="footer__item">
                <a
                 href="/"
                  className="footer__item__link"
                >
                  <ion-icon
                    className="footer__item__icon"
                    name="logo-facebook"
                  ></ion-icon>
                  Facebook
                </a>
              </li>
              <li className="footer__item">
                <a
                  href="/"
                  className="footer__item__link"
                >
                  <ion-icon
                    className="footer__item__icon"
                    name="logo-instagram"
                  ></ion-icon>
                  Instagram
                </a>
              </li>
              <li className="footer__item">
                <a
                 href="/"
                  className="footer__item__link"
                >
                  <ion-icon
                    className="footer__item__icon"
                    name="logo-tiktok"
                  ></ion-icon>
                  Tiktok
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div className="footer__bottom">
        <div className="grid">
          <p>
            Nhóm 
          </p>
          <p>Đề tài: Phát triển hệ thống phần mềm đăng bài thuê phòng trọ</p>
        </div>
      </div>
    </footer>
  );
}

export default Footer;
