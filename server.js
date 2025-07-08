const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');
const path = require('path');
const app = express();
const PORT = 3000;

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Database setup
const db = new sqlite3.Database('users.db');
db.serialize(() => {
  db.run(`CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE,
    password TEXT
  )`);
  // Thêm tài khoản mẫu nếu chưa có
  db.run(`INSERT OR IGNORE INTO users (email, password) VALUES ('test@example.com', '123456')`);
});

// API login
app.post('/api/login', (req, res) => {
  const { email, password } = req.body;
  db.get('SELECT * FROM users WHERE email = ? AND password = ?', [email, password], (err, user) => {
    if (err) return res.status(500).json({ message: 'Lỗi server' });
    if (!user) return res.status(401).json({ message: 'Sai tài khoản hoặc mật khẩu' });
    res.json({ success: true });
  });
});

// Serve static files (frontend)
app.use(express.static(path.join(__dirname, 'web/frontend/data')));

// Đảm bảo truy cập gốc sẽ mở trang login
app.get('/', (req, res) => {
  res.sendFile(path.resolve(__dirname, 'web/frontend/data/login_screen/index.html'));
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
