const mysql = require('mysql2');

// Thông tin kết nối MySQL (thay đổi theo cấu hình của bạn)
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'db'
});

// Dữ liệu mẫu cần thêm
const attendanceData = {
  user_id: 6,
  name: 'Nhâm Thị F',
  department: 'Quản lý',
  checkin: '08:10',
  checkout: '17:00',
  date: '2025-07-04'
};

// Thêm dữ liệu vào bảng attendance
const sql = `INSERT INTO attendance (user_id, name, department, checkin, checkout, date) VALUES (?, ?, ?, ?, ?, ?)`;
const values = [
  attendanceData.user_id,
  attendanceData.name,
  attendanceData.department,
  attendanceData.checkin,
  attendanceData.checkout,
  attendanceData.date
];

connection.query(sql, values, (err, results) => {
  if (err) {
    return console.error('Lỗi khi thêm dữ liệu:', err.message);
  }
  console.log(`Đã thêm dữ liệu với ID: ${results.insertId}`);
  connection.end();
});