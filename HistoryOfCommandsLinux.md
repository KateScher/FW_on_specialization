1. cat > Pets.txt
   cat > Pack_animals.txt ls -l
   cat Pets.txt Pack_animals.txt > Animals
   ls -l
   cat Animals mv Animals Human_Friends
   ls -l
2. mkdir About_animals
   mv Human_Friends ~/About_animals
   ls -l
   cd About_animals
   ls -l
3. cat /etc/issue
   wget https://dev.mysql.com/get/mysql-apt-config_0.8.26-1_all.deb
   sudo dpkg -i mysql-apt-config_0.8.26-1_all.deb
   sudo apt-get update
   sudo apt-get install mysql-server
4. cd /etc
   ls -l
   dpkg -l
   cd
   wget https://download.virtualbox.org/virtualbox/7.0.12/virtualbox-7.0_7.0.12-159484~Ubuntu~jammy_amd64.deb
   ls -l
   sudo dpkg -i virtualbox-7.0_7.0.12-159484~Ubuntu~jammy_amd64.deb
   sudo dpkg -r virtualbox-7.0
