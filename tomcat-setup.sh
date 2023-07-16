sudo apt update
sudo apt install openjdk-17-jdk

java -version

sudo useradd -m -d /opt/tomcat -U -s /bin/false tomcat

cd /tmp/
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz

tar xzf apache-tomcat-9.0.58.tar.gz
sudo mv apache-tomcat-9.0.58/* /opt/tomcat/

sudo chown -R tomcat:tomcat /opt/tomcat/
sudo vi /etc/systemd/system/tomcat.service


[Unit]
Description=Tomcat
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

[Install]
WantedBy=multi-user.target

sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
