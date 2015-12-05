echo "Select the proxy: "
echo "1. 102.14"
echo "2. 100.26"
echo "3. 102.29"
echo "4. 103.29"
echo "5. 100.30"
echo "6. 100.14"

read num

case $num in

1*) x=172.31.102.14
;;
2*) x=172.31.100.26
;;
3*) x=172.31.102.29
;;
4*) x=172.31.103.29
;;
5*) x=172.31.100.30
;;
6*) x=172.31.100.14
;;
*) echo "Wrong option"
exit
;;
esac

echo Proxy has been changed to $x

gsettings set org.gnome.system.proxy.http host $x
gsettings set org.gnome.system.proxy.http port 3128
gsettings set org.gnome.system.proxy mode 'manual'

gsettings set org.gnome.system.proxy.https host $x
gsettings set org.gnome.system.proxy.https port 3128
gsettings set org.gnome.system.proxy mode 'manual'

gsettings set org.gnome.system.proxy.ftp host $x
gsettings set org.gnome.system.proxy.ftp port 3128
gsettings set org.gnome.system.proxy mode 'manual'

gsettings set org.gnome.system.proxy.socks host $x
gsettings set org.gnome.system.proxy.socks port 3128
gsettings set org.gnome.system.proxy mode 'manual'

arr[0]='http'
arr[1]='https'
arr[2]='ftp'
arr[3]='socks'

rm /etc/apt/apt.conf
touch /etc/apt/apt.conf

for i in {0..3}
do
echo -n Acquire::${arr[i]}::proxy \"${arr[i]}://edcguest:edcguest@ >> /etc/apt/apt.conf
echo -n $x  >> /etc/apt/apt.conf
echo -n ":3128/\";" >> /etc/apt/apt.conf
echo >> /etc/apt/apt.conf
done
