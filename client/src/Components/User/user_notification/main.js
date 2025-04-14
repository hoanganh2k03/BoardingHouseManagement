import React, { useState, useEffect } from "react";
import axios from "axios";
import "./info.css";
import { Link } from "react-router-dom";
import { format, parseISO } from "date-fns";

function Main() {
  const [notifications, setNotifications] = useState([]);
  const [sortedNotifications, setSortedNotifications] = useState([]);

  useEffect(() => {
    const user = JSON.parse(localStorage.getItem("user"));
    if (user && user.EMAIL) {
      axios
        .get(`http://localhost:3000/api/get-userid-byEmail/${user.EMAIL}`)
        .then((response) => {
          const userId = response.data.USERID;
          fetchNotifications(userId);
        })
        .catch((error) => {
          console.error("Error fetching user ID:", error);
        });
    }
  }, []);

  useEffect(() => {
    // Sort notifications by TIME in descending order and limit to 15
    const sorted = [...notifications]
      .sort((a, b) => parseISO(b.TIME) - parseISO(a.TIME))
      .slice(0, 15);
    setSortedNotifications(sorted);
  }, [notifications]);

  const fetchNotifications = (userId) => {
    axios
      .get(`http://localhost:3000/api/get-notification-byUserID/${userId}`)
      .then((response) => {
        setNotifications(response.data);
      })
      .catch((error) => {
        console.error("Error fetching notifications:", error);
      });
  };

  const getLink = (category, newsId) => {
    switch (category) {
      case "Thanh toán":
        return "payment";
      case "Bài viết":
        return `post`;
      default:
        return "";
    }
  };

  const formatDateTime = (dateTimeString) => {
    return dateTimeString ? format(parseISO(dateTimeString), "yyyy/MM/dd HH:mm:ss") : "null";
  };

  const handleNotificationClick = (notificationId) => {
    axios
      .put(`http://localhost:3000/api/update-notificationSeen/${notificationId}`)
      .then((response) => {
        // Update the SEEN status locally
        const updatedNotifications = notifications.map((notification) => {
          if (notification.ID === notificationId) {
            return { ...notification, SEEN: 1 };
          } else {
            return notification;
          }
        });
        setNotifications(updatedNotifications);
      })
      .catch((error) => {
        console.error("Error updating notification seen status:", error);
      });
  };

  return (
    <div className="Main">
      {sortedNotifications.map((notification) => {
        const url = getLink(notification.CATEGORY, notification.NEWSID);

        return (
          <div
            key={notification.NOTIFICATIONID}
            className="post"
            style={{
              backgroundColor: notification.SEEN === 0 ? "#e0f2f1" : "white",
            }}
          >
            <Link
              to={`/user/${url}`}
              style={{ fontSize: "20px", fontWeight: "800" }}
              className="update-button"
              onClick={() => handleNotificationClick(notification.ID)}
            >
              {notification.CATEGORY}
            </Link>
            <span
              style={{ marginRight: "10px", fontWeight: "600", fontSize: "18px" }}
            >
              {formatDateTime(notification.TIME)}
            </span>
            <p>Nội dung: {notification.CONTENT}</p>
            {notification.REASON && (
              <p style={{ color: "red" }}>Lý do: {notification.REASON}</p>
            )}
          </div>
        );
      })}
    </div>
  );
}

export default Main;
