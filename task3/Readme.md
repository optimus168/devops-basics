# Task 3 - Nginx Web Server Deployment

## Objective

Install and configure an Nginx web server on Linux and host a static website.

## Tasks Completed

- Installed Nginx on Linux
- Configured Nginx web server
- Created and hosted a static HTML website
- Configured a virtual host
- Created a custom 404 error page
- Tested server accessibility
- Tested basic server performance using `curl`

## Project Structure

```text
task3/
├── index.html
├── 404.html
├── nginx.conf
└── README.md
```

## 1. Install Nginx

Update the package list and install Nginx:

```bash
sudo apt update
sudo apt install nginx -y
```

Check the installed version:

```bash
nginx -v
```

Check the Nginx service:

```bash
sudo systemctl status nginx
```

Nginx should show:

```text
active (running)
```

## 2. Create Static Website

Create a directory for the website:

```bash
sudo mkdir -p /var/www/task3
```

Create the main HTML page:

```bash
sudo nano /var/www/task3/index.html
```

Example:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Nginx Web Server</title>
</head>
<body>
    <h1>Hello from Nginx!</h1>
    <p>Task 3 - Nginx Web Server Deployment</p>
</body>
</html>
```

## 3. Create Custom Error Page

Create the 404 page:

```bash
sudo nano /var/www/task3/404.html
```

Example:

```html
<!DOCTYPE html>
<html>
<head>
    <title>404 - Page Not Found</title>
</head>
<body>
    <h1>404 - Page Not Found</h1>
    <p>The requested page does not exist.</p>
</body>
</html>
```

## 4. Configure Virtual Host

Create a virtual host configuration:

```bash
sudo nano /etc/nginx/sites-available/task3
```

Configuration:

```nginx
server {
    listen 80;
    server_name task3.local;

    root /var/www/task3;
    index index.html;

    error_page 404 /404.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Enable the virtual host:

```bash
sudo ln -s /etc/nginx/sites-available/task3 /etc/nginx/sites-enabled/
```

Remove the default configuration:

```bash
sudo rm /etc/nginx/sites-enabled/default
```

Test the configuration:

```bash
sudo nginx -t
```

Expected result:

```text
syntax is ok
test is successful
```

Restart Nginx:

```bash
sudo systemctl restart nginx
```

## 5. Test Website

Find the server IP:

```bash
hostname -I
```

Open the IP address in a browser:

```text
http://YOUR_SERVER_IP
```

The website should display:

```text
Hello from Nginx!
Task 3 - Nginx Web Server Deployment
```

## 6. Test Custom Error Page

Open a non-existent URL:

```text
http://YOUR_SERVER_IP/random
```

The custom:

```text
404 - Page Not Found
```

page should be displayed.

## 7. Test Server Performance

Check the HTTP response:

```bash
curl -I http://localhost
```

Measure response time:

```bash
curl -o /dev/null -s -w "Time: %{time_total}s\n" http://localhost
```

## Useful Commands

Check Nginx status:

```bash
sudo systemctl status nginx
```

Start Nginx:

```bash
sudo systemctl start nginx
```

Stop Nginx:

```bash
sudo systemctl stop nginx
```

Restart Nginx:

```bash
sudo systemctl restart nginx
```

Test configuration:

```bash
sudo nginx -t
```

View Nginx version:

```bash
nginx -v
```

## Bonus - HTTPS

HTTPS can be enabled using an SSL certificate from Let's Encrypt.

For a production server with a domain name, Certbot can be used to obtain and configure an SSL certificate.

Example:

```bash
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx
```

## Result

The Nginx web server was successfully installed and configured on Linux. A static website was hosted using Nginx, a virtual host and custom 404 error page were configured, and server accessibility and performance were tested successfully.