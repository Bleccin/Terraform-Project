#!/bin/bash
# Update the package manager
yum update -y

# Install httpd
yum install -y httpd

# Change httpd to listen on port 8080
sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf

# Create a simple static HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to My Web App</title>
</head>
<body>
    <h1>Hello from Amazon Linux!</h1>
    <p>This is a static page served by httpd on port 8080, provisioned via Terraform.</p>
</body>
</html>
EOF

# Start and enable httpd service
systemctl start httpd
systemctl enable httpd