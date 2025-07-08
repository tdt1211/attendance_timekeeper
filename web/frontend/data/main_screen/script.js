// Hiển thị ngày giờ hiện tại lên dòng trên bảng
function updateDateTime() {
    const now = new Date();
    const options = {
        weekday: 'long', year: 'numeric', month: '2-digit', day: '2-digit',
        hour: '2-digit', minute: '2-digit', second: '2-digit',
        hour12: false
    };
    const formatted = now.toLocaleString('vi-VN', options);
    document.getElementById('current-datetime').textContent = formatted;
}

updateDateTime();
setInterval(updateDateTime, 1000);
