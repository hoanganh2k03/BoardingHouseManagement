import React, { useState, useEffect, useMemo } from "react";
import "../Main_posts/main_posts.css";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowAltCircleUp } from "@fortawesome/free-solid-svg-icons";
import axios from "axios";
import Search from "../../Search/search";
import { format, parseISO } from "date-fns";
import moment from "moment";

const ImageDes = () => {
  const [data, setData] = useState({ results: [], total: 0 });
  const [sortBy, setSortBy] = useState("default");
  const [selectedDistrict, setSelectedDistrict] = useState("");
  const [selectedPrice, setSelectedPrice] = useState("");
  const [selectedAcreage, setSelectedAcreage] = useState("");
  const [showScrollButton, setShowScrollButton] = useState(false);
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 5;

  useEffect(() => {
    fetchData();
  }, [sortBy, selectedDistrict, selectedPrice, selectedAcreage]);

  useEffect(() => {
    const handleScroll = () => setShowScrollButton(window.scrollY > 200);
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  const shuffleArray = (array) => {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
  };

  const fetchData = async () => {
    try {
      let url = "http://localhost:3000/api/get-posts";
      const params = {
        district:
          selectedDistrict && selectedDistrict !== "all" ? selectedDistrict : undefined,
        price: selectedPrice && selectedPrice !== "all" ? selectedPrice : undefined,
        acreage:
          selectedAcreage && selectedAcreage !== "all" ? selectedAcreage : undefined,
      };
      
//      console.log(params.district);
//      console.log(params.price);
//      console.log(params.acreage);
      // Construct URL based on selected filters
      if (params.district || params.price || params.acreage) {
        url = `http://localhost:3000/api/search-posts?district=${params.district}&price=${params.price}&acreage=${params.acreage}`;
      }
//      console.log(url)
      const response = await axios.get(url);
      let posts = response.data.results;
      // Update post state if TIMEEND > current time
      const currentTime = moment();
      for (let post of posts) {
        if (moment(post.TIMEEND).isBefore(currentTime) && post.STATE !== "Hết hạn") {
          await axios.get(`http://localhost:3000/api/newState-Post/${post.NEWSID}`);
        }
      }
  
      // Re-fetch posts after updating states
      const updatedResponse = await axios.get(url);
      let filteredData = updatedResponse.data.results.filter(
        (post) => post.STATE === "Hoạt động"
      );
  
      shuffleArray(filteredData); // Shuffle posts to show different posts on page load
  
      if (sortBy === "newest") {
        filteredData.sort((a, b) => new Date(b.TIMESTART) - new Date(a.TIMESTART));
        filteredData = filteredData.slice(0, 10);
      }
  
      setData({ results: filteredData, total: filteredData.length });
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };

  const handleSortByChange = (type) => {
    setSortBy(type);
    if (type === "default") {
      setSelectedDistrict("all"); // Clear selected district
      setSelectedPrice("all"); // Clear selected price
      setSelectedAcreage("all"); // Clear selected acreage
      window.location.href = "/"; // Fetch data with default parameters
    } else if (type === "newest") {
      setSortBy(type);
      setSelectedDistrict("all"); // Clear selected district
      setSelectedPrice("all"); // Clear selected price
      setSelectedAcreage("all"); // Clear selected acreage
      //fetchLatestPosts(); // Fetch latest posts
    }
  };

  const handleSearch = ({ district, price, acreage}) => {
    setSelectedDistrict(district);
    setSelectedPrice(price);
    setSelectedAcreage(acreage);
  };

  const handlePriceFilterChange = (price) => {
    setSelectedPrice(price);
  };

  const handleAreaFilterChange = (acreage) => {
    setSelectedAcreage(acreage);
  };

  const formatDate = (dateString) =>
    dateString ? format(parseISO(dateString), "yyyy/MM/dd") : "null";

  const formatMoney = (amount) => {
    if (amount < 1000000) return (amount / 1000).toFixed(0) + " ngàn";
    if (amount >= 1000000000) return (amount / 1000000000).toFixed(1) + " tỷ";
    return (amount / 1000000).toFixed(1) + " triệu";
  };

  const handleScrollTop = () => {
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  const memoizedData = useMemo(
    () =>
      data.results.map((item) => ({
        ...item,
        formattedDate: formatDate(item.TIMESTART),
        formattedPrice: formatMoney(item.PRICE),
      })),
    [data.results]
  );

  const handlePageClick = (page) => {
    if (page === "previous" && currentPage > 1) {
      setCurrentPage(currentPage - 1);
    } else if (page === "next" && currentPage < Math.ceil(data.total / itemsPerPage)) {
      setCurrentPage(currentPage + 1);
    } else if (typeof page === "number") {
      setCurrentPage(page);
    }
  };

  const indexOfLastItem = currentPage * itemsPerPage;
  const indexOfFirstItem = indexOfLastItem - itemsPerPage;
  const currentItems = memoizedData.slice(indexOfFirstItem, indexOfLastItem);

  return (
    <div className="container_form" style={{ height: "100%" }}>
      <Search onSearch={handleSearch} />
      <div className="sort" style={{ fontSize: "25px" }}>
        <p style={{ fontSize: "22px", padding: "10px" }}>Sắp xếp : </p>
        <span
          className={sortBy === "default" ? "active" : ""}
          onClick={() => handleSortByChange("default")}
          style={{ fontSize: "22px", fontWeight: "bold" }}
        >
          Tất cả
        </span>
        <span
          className={sortBy === "newest" ? "active" : ""}
          onClick={() => handleSortByChange("newest")}
          style={{ fontSize: "22px", fontWeight: "bold" }}
        >
          Mới nhất
        </span>
      </div>
      <span
        className="total_result"
        style={{ fontSize: "30px", fontWeight: 700, marginLeft: "18px" }}
      >
        Tổng kết quả:
        <h5
          style={{
            color: "red",
            fontSize: "35px",
            marginLeft: "5px",
            textAlign: "center",
            alignItems: "center",
          }}
        >
          {data.total}
        </h5>
      </span>

      {currentItems.map((item) => (
        <Link
          key={item.NEWSID}
          style={{ textDecoration: "none", color: "black" }}
          to={`/detail/${item.NEWSID}`}
        >
          <div
            className="container-posts"
            style={{
              border: "5px solid #ccc",
              margin: "30px 0",
              border: "none",
            }}
          >
            <div
              className="left-part"
              style={{
                flex: 2,
                width: "100%",
                justifyContent: "center",
                alignItems: "center",
              }}
            >
              <img
                src={`http://localhost:3000/uploads/${item.image}`}
                style={{
                  width: "600px",
                  justifyContent: "center",
                  alignItems: "center",
                  height: "450px",
                  borderRadius: "5px",
                }}
                alt={item.TITLE}
              />
            </div>
            <div
              className="right-part"
              style={{
                textAlign: "left",
                flex: 3,
                left: "0",
              }}
            >
              <div style={{ padding: "5px", margin: "5px" }}>
                <p style={{ color: "#E13427", fontSize: "28px" }}>
                  {item.TITLE}
                </p>
                <div
                  className="item-separator"
                  style={{
                    display: "flex",
                    justifyContent: "space-evenly",
                    fontSize: "23px",
                    fontWeight: "700",
                    listStyle: "none",
                  }}
                >
                  <li className="price" style={{ color: "#16c784" }}>
                    {item.formattedPrice} đồng/tháng
                  </li>
                  <li className="acreage">{item.ACREAGE} m2</li>
                  <li className="district">{item.district}</li>
                </div>
                <div
                  className="img-name"
                  style={{
                    marginTop: "30px",
                    alignContent: "center",
                    alignItems: "center",
                    display: "flex",
                    marginLeft: "50px",
                  }}
                >
                  <img
                    src="https://t4.ftcdn.net/jpg/03/49/49/79/360_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg"
                    style={{
                      borderRadius: "50%",
                      width: "100px",
                      marginRight: "10px",
                      height: "100px",
                      marginLeft: "-30px",
                    }}
                    alt={item.NAME}
                  />
                  <span
                    style={{
                      fontSize: "25px",
                      fontWeight: "900",
                      color: "#f83859",
                    }}
                  >
                    {item.NAME}
                  </span>
                  <span
                    style={{
                      fontSize: "25px",
                      fontWeight: "900",
                      color: "rgb(22, 199, 132)",
                      marginLeft: "50px",
                    }}
                  >
                    {item.formattedDate}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </Link>
      ))}

      <div className="pagination" style={{ textAlign: "center", marginTop: "20px" }}>
        <ul style={{ display: "flex", justifyContent: "center", padding: 0, listStyle: "none" }}>
          <li
            style={{
              fontSize: "21px",
              cursor: "pointer",
              color: currentPage === 1 ? "grey" : "black",
              margin: "0 10px",
            }}
            onClick={() => handlePageClick("previous")}
          >
            Trang trước
          </li>
          {[...Array(Math.ceil(data.total / itemsPerPage)).keys()].map((page) => (
            <li
              key={page + 1}
              style={{
                fontSize: "21px",
                cursor: "pointer",
                color: currentPage === page + 1 ? "white" : "black",
                backgroundColor: currentPage === page + 1 ? "#e13427" : "",
                margin: "0 10px",
                padding: "5px 10px",
              }}
              onClick={() => handlePageClick(page + 1)}
            >
              {page + 1}
            </li>
          ))}
          <li
            style={{
              fontSize: "21px",
              cursor: "pointer",
              color: currentPage === Math.ceil(data.total / itemsPerPage) ? "grey" : "black",
              margin: "0 10px",
            }}
            onClick={() => handlePageClick("next")}
          >
            Trang sau
          </li>
        </ul>
      </div>

      {showScrollButton && (
        <button id="scroll-top-btn" onClick={handleScrollTop} style={{ position: "fixed", bottom: "20px", right: "20px" }}>
          <FontAwesomeIcon icon={faArrowAltCircleUp} />
        </button>
      )}
    </div>
  );
};

export default ImageDes;
