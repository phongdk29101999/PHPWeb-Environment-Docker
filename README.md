#  Cài đặt môi trường centos trên Docker bằng cách sử dụng Dockerfile cho cakephp 
----
## Trong hướng dẫn sử dụng: Docker version 19.03.5, build 633a0ea
## Cài đặt:
- Dowload và giải nén `Dockerfile` từ [releases page](https://github.com/Veigarcat/Cakephp-setup/releases)
- Cài đặt Docker
- Tạo images từ dockerfile. Mở terminal trong thư mục vừa giải nén rồi nhập:

    `docker build　-t centos:6.6 .` 

    *Lưu ý có dấu `.` ở cuối câu lệnh*
- Lệnh để chạy container từ images là:

    `docker run -it --name name_container -p localhost_port:container_post -v pc_path:container_path image_name:tag bash`

  - `name_container`: tên của container
  - `localhost_port`: cổng của localhost trên pc. Ở đây tôi sử dụng port 80, một số ứng dụng như skype,... khi cài đặt cũng sử dụng cổng 80 nên có thể dùng cổng khác tuỳ thích hoặc đổi cổng của app
  - `container_port`: cổng trên container. Ở đây tôi cũng sử dụng port 80.
  - `pc_path`: đường dẫn để code cakephp thường là `.../www`. Ở đây tôi sử dụng `/Users/kimphong/Documents/cakephp/www`
  - `container_path`: đường dẫn tương ứng trên máy ảo centos `/var/www/html`
  - `image_name`, `tag`: tên và tag của image. Vì chúng ta dùng centos 6.6 nên chỗ này sẽ là `centos:6.6`

- Ví dụ câu lệnh sử dụng trên máy tôi là:
    
    `docker run -it --name centos -p 80:80 -v /Users/kimphong/Documents/cakephp/www:/var/www/html centos:6.6 bash`

## Thay đổi mật khẩu cho mysql
- Mở terminal và start container:
    
    `docker start centos`

- Chạy vào container:

    `docker exec -it centos bash`
    
- Khởi động service mysql:

    `service mysqld start`
    
- Lần lượt chạy những câu lệnh sau:

    `mysql -u root`
    
    `use mysql;`
    
    `update user SET PASSWORD=PASSWORD("your-password") WHERE USER='root';`
    
    `flush privileges;`
    
    `exit`
 
    *Lưu ý thay `your-password` thành password của bạn muốn*
    
- Khởi động lại service mysql:

    `service mysqld restart`
    
## Sử dụng:

Mỗi lần sử dụng chỉ cần khởi động container vào máy ảo khởi động các service là được :))

- Mở terminal và start container:
    
    `docker start centos`

- Chạy vào container:

    `docker run exec -it centos bash`

- Khởi động service apache:

    `service httpd start`
    
- Khởi động service mysql:

    `service mysqld start`
## Tổng kết 

Bài viết trên tôi tổng hợp lại những kiến thức thu được khi học cách tạo môi trường trên máy ảo để lập trình php với cakephp, hi vọng nó giúp các bạn một phần nào đó.

Chắc chắn bài viết còn có nhiều thiếu sót, mong các bạn thông cảm và gửi feedback cho tôi để hoàn thiện thêm.

Liên lạc của tôi:

- Email: phong.dk176843@sis.hust.edu.vn

- Facebook: https://www.facebook.com/phongdk29101999/

Xin chân thành cảm ơn!
