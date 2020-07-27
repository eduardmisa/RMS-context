# MUST HAVE FILES in $BUILD_DUMP_PATH:
#
# BUILD.tar.gz.
#

# VARAIBLES
BUILD_DUMP_PATH="/home/centos/deployments/rms-context.emisa.dev"
DEPLOYMENT_PATH="/var/www/rms-context.emisa.dev"


echo "=============================================================";
echo "======================== RMS CONTEXT ========================";
echo "=============================================================";

echo "01 - CLEARING CURRENT DUMP FOLDER"
sudo mv $BUILD_DUMP_PATH/BUILD.tar.gz /BUILD.tar.gz
sudo rm -rf $BUILD_DUMP_PATH
sudo mkdir $BUILD_DUMP_PATH
sudo mv /BUILD.tar.gz $BUILD_DUMP_PATH/BUILD.tar.gz
echo "DONE"

echo "02 - EXTRACTING BUILD FILE"
sudo tar -xzf $BUILD_DUMP_PATH/BUILD.tar.gz --directory $BUILD_DUMP_PATH
echo "DONE"

echo "03 - TRANSFORMING ENV TEMPLATE TO ENV FILE"
sudo cp $BUILD_DUMP_PATH/env.ini.template $BUILD_DUMP_PATH/env.ini
echo "DONE"

echo "04 - DELETE UPLOADED ZIP FILE"
sudo rm -rf $BUILD_DUMP_PATH/BUILD.tar.gz
echo "DONE"

echo "05 - CLEARING CURRENT DEPLOYMENT PATH"
sudo rm -rf $DEPLOYMENT_PATH
sudo mkdir $DEPLOYMENT_PATH
echo "DONE"

echo "06 - MOVING DEPLOYMENT DUMP FILES TO DEPLOYMENT PATH"
sudo mv -f $BUILD_DUMP_PATH/* $DEPLOYMENT_PATH
sudo mv -f $BUILD_DUMP_PATH/.[!.]* $DEPLOYMENT_PATH
echo "DONE"

echo "07 - SETTING PERMISSION TO BUILD_DUMP_PATH FOR NEXT DEPLOYMENT"
sudo chmod -R 777 $BUILD_DUMP_PATH
echo "DONE"


# echo "===============================================================";
# echo "====================== BUILDING CONTAINER =====================";
# echo "======================    PLEASE WAIT.    =====================";
# echo "===============================================================";

# echo "01 - REMOVING EXISTING CONTAINER SERVICES"
# sudo docker-compose -f $DEPLOYMENT_PATH/docker-compose.yml down
# echo "DONE"

# echo "02 - CREATING NEW CONTAINER SERVICES"
# sudo docker-compose -f $DEPLOYMENT_PATH/docker-compose.yml up -d --build
# echo "DONE"