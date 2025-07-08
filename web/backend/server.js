const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const path = require('path');
const app = express();
const PORT = 3000;

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Database setup
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'db'
});

// Serve static files (frontend)
const staticPath = path.join(__dirname, '../frontend/data');
app.use(express.static(staticPath));

// Trả về file index.html khi truy cập gốc
app.get('/', (req, res) => {
  const indexPath = path.resolve(__dirname, '../frontend/data/login_screen/index.html');
  res.sendFile(indexPath);
});

// API login
app.post('/api/login', (req, res) => {
  const { email, password } = req.body;
  // Chỉ cho phép admin đăng nhập
  if (email === 'admin@com' && password === '123') {
    res.json({ success: true, redirect: '/main_screen/main_screen.html', user: { name: 'Admin', position: 'Quản trị viên' } });
  } else {
    res.status(401).json({ message: 'Sai tài khoản hoặc mật khẩu' });
  }
});

// API lấy toàn bộ dữ liệu chấm công
app.get('/api/attendance', (req, res) => {
  connection.query('SELECT * FROM attendance', (err, results) => {
    if (err) return res.status(500).json({ message: 'Lỗi truy vấn database' });
    res.json(results);
  });
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});