echo "===============================================================";
echo "====================== REMOVING CONTAINER =====================";
echo "======================    PLEASE WAIT.    =====================";
echo "===============================================================";

cd /var/www/web-template.u4rdsystem.com
docker-compose -f docker-compose.yml down

echo "===============================================================";
echo "====================== BUILDING CONTAINER =====================";
echo "======================    PLEASE WAIT.    =====================";
echo "===============================================================";

cd /var/www/web-template.u4rdsystem.com
docker-compose -f docker-compose.yml up -d --build

