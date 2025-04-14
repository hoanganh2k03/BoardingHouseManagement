import React, { useState, useEffect } from "react";
import "../body.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faSearch } from "@fortawesome/free-solid-svg-icons";
function Search({ onSearch }) {
  const [selectedDistrict, setSelectedDistrict] = useState("");
  const [districts, setDistricts] = useState([]);
  const [selectedPrice, setSelectedPrice] = useState("");
  const [selectedDientich, setSelectedDientich] = useState("");

  useEffect(() => {
    // Fetch data from the API
    const fetchDistricts = async () => {
      try {
        const response = await fetch("http://localhost:3000/api/hcmdistrict");
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();

        // Sort districts by 'IDDISTRICT' before setting state
        const sortedDistricts = data.sort(
          (a, b) => a.IDDISTRICT - b.IDDISTRICT
        );
        setDistricts(sortedDistricts);
      } catch (error) {
        console.error("Error fetching districts:", error);
      }
    };

    fetchDistricts();
  }, []);

  const handleDistrictChange = (event) => {
    console.log("Selected district:", event.target.value); // Log gtri quan duoc chon
    setSelectedDistrict(event.target.value);
  };

  const handlePriceChange = (event) => {
    console.log("Selected price:", event.target.value); // Log gia duoc chon
    setSelectedPrice(event.target.value);
  };

  const handleDienTichChange = (event) => {
    console.log("Selected area:", event.target.value); // Log gtri dien tich duoc chon
    setSelectedDientich(event.target.value);
  };

  const handleSearchButtonClick = () => {
    if (selectedDistrict || selectedPrice || selectedDientich) {
      onSearch({
        district: selectedDistrict,
        price: selectedPrice,
        acreage: selectedDientich,
      });
      // console.log(selectedDistrict)
      // console.log(selectedPrice)
      // console.log(selectedDientich)
    } else {
      alert("Vui lòng chọn ít nhất một tiêu chí để tìm kiếm!");
    }
  };

  return (
    <div className="search-container">
      <select
        className="select"
        value={selectedDistrict}
        onChange={handleDistrictChange}
      >
        <option value="all">
          Quận
        </option>
        {districts.map((district) => (
          <option key={district.IDDISTRICT} value={district.DISTRICT}>
            {district.DISTRICT}
          </option>
        ))}
      </select>
      <select
        className="select"
        value={selectedPrice}
        onChange={handlePriceChange}
      >
        <option value="all">
          Giá
        </option>
        <option value={"1"}>Dưới 1 triệu</option>
        <option value={"2"}>Từ 1 - 2 triệu</option>
        <option value={"3"}>Từ 2 - 3 triệu</option>
        <option value={"4"}>Từ 3 - 5 triệu</option>
        <option value={"5"}>Từ 5 - 7 triệu</option>
        <option value={"6"}>Từ 7 - 10 triệu</option>
        <option value={"7"}>Từ 10 đến 15 triệu</option>
        <option value={"8"}>Trên 15 triệu</option>
      </select>
      <select
        className="select"
        value={selectedDientich}
        onChange={handleDienTichChange}
      >
        <option value="all">
          Diện Tích
        </option>
        <option value={"1"}>Dưới 20 m2</option>
        <option value={"2"}>Từ 20 - 30 m2</option>
        <option value={"3"}>Từ 30 - 50 m2</option>
        <option value={"4"}>Từ 50 - 70 m2</option>
        <option value={"5"}>Từ 70 - 90 m2</option>
        <option value={"6"}>Trên 90 m2</option>
      </select>
      <button
        style={{ alignItems: "center", textAlign: "center" }}
        className="search-button"
        onClick={handleSearchButtonClick}
      >
        <FontAwesomeIcon
          style={{ marginRight: "5px" }}
          icon={faSearch}
        ></FontAwesomeIcon>
        Tìm kiếm
      </button>
    </div>
  );
}

export default Search;
