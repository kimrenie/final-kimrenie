USER = krr74113
NAME = "Kimberly Rebamonte"
GITHUB = https://github.com/CIT384

echo "Content-type: text/html"
echo "x-final.cit384:" $GITHUB
echo "X-cit-384-student:" $USER
echo ""

cat /home/usercat/public_html/index.html