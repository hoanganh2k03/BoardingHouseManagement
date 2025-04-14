import React, { useState, useEffect } from "react";
import axios from "axios";
import { format, parseISO } from "date-fns";
import "./info.css";

function Main() {
  const [userData, setUserData] = useState([]);
  const [editingUser, setEditingUser] = useState(null);
  const [adminInfo, setAdminInfo] = useState(null);

  useEffect(() => {
    const storedUserInfo = localStorage.getItem("user");
    if (storedUserInfo) {
      const parsedUserInfo = JSON.parse(storedUserInfo);
      setAdminInfo(parsedUserInfo);
      fetchAdminData(parsedUserInfo.EMAIL);
    }
  }, []);

  const fetchAdminData = (email) => {
    axios
      .get(`http://localhost:3000/api/admin-info/${email}`)
      .then((response) => {
        setUserData(response.data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  };

  const handleEdit = (user) => {
    setEditingUser(user);
  };

  const cancelEdit = () => {
    setEditingUser(null);
  };

  const saveEdit = () => {
    alert(
      "Nhân viên không có quyền chỉnh sửa thông tin. Vui lòng liên hệ với chủ sở hũu!"
    );
    // axios
    //   .put(`http://localhost:3000/api/admin-info/${editingUser.ADMINID}`, editingUser)
    //   .then(() => {
    //     fetchAdminData(adminInfo.email);
    //     cancelEdit();
    //   })
    //   .catch((error) => {
    //     console.error("Error updating user:", error);
    //   });
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setEditingUser({ ...editingUser, [name]: value });
  };

  const formatDate = (dateString) => {
    return dateString ? format(parseISO(dateString), "yyyy/MM/dd") : "null";
  };

  return (
    <div className="Main">
      <h1>Xin chào Admin</h1>

      <div className="table-container">
        <table className="table">
          <thead>
            <tr>
              <th style={{textAlign:"center"}}>Mã ID</th>
              <th style={{textAlign:"center"}}>Họ và Tên</th>
              <th style={{textAlign:"center"}}>Giới Tính</th>
              <th style={{textAlign:"center"}}>Ngày Sinh</th>
              <th style={{textAlign:"center"}}>Số Điện Thoại</th>
              <th style={{textAlign:"center"}}>Email</th>
              <th style={{textAlign:"center"}}>Địa Chỉ</th>
              <th className="function-cell" style={{textAlign:"center"}}>Chức năng</th>
            </tr>
          </thead>
          <tbody>
            {userData.map((user) => (
              <tr key={user.ADMINID}>
                <td style={{textAlign:"center"}}>{user.ADMINID}</td>
                <td style={{textAlign:"center"}}>{user.NAME}</td>
                <td style={{textAlign:"center"}}>{user.SEX}</td>
                <td style={{textAlign:"center"}}>{formatDate(user.DOB)}</td>
                <td style={{textAlign:"center"}}>{user.PHONE}</td>
                <td style={{textAlign:"center"}}>{user.EMAIL}</td>
                <td style={{textAlign:"center"}}>{user.ADDRESS}</td>
                <td style={{textAlign:"center"}}> 
                  <button
                    className="detail-link update-button"
                    onClick={() => handleEdit(user)}
                  >
                    Xem thông tin
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {editingUser && (
          <div className="edit-form">
            <h2>Thông tin quản trị viên</h2>
            <input
              type="text"
              name="NAME"
              value={editingUser.NAME}
              onChange={handleChange}
            />
            <input
              type="text"
              name="DOB"
              value={editingUser.DOB ? formatDate(editingUser.DOB) : "null"}
              onChange={handleChange}
            />
            <input
              type="text"
              name="SEX"
              value={editingUser.SEX}
              onChange={handleChange}
            />
            <input
              type="text"
              name="PHONE"
              value={editingUser.PHONE}
              onChange={handleChange}
            />
            <input
              type="text"
              name="EMAIL"
              value={editingUser.EMAIL}
              onChange={handleChange}
            />
            <input
              type="text"
              name="ADDRESS"
              value={editingUser.ADDRESS}
              onChange={handleChange}
            />
            <button onClick={saveEdit}>Sửa thông tin</button>
            <button onClick={cancelEdit}>Đóng</button>
          </div>
        )}
      </div>
    </div>
  );
}

export default Main;
