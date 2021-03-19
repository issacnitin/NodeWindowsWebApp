printenv
sudo apt-get -qq update
sudo apt-get -qq install -y default-jre wget
wget -q https://mirrors.estointernet.in/apache//jmeter/binaries/apache-jmeter-5.4.1.tgz
tar -xf apache-jmeter-5.4.1.tgz
wget -q https://cloudnativetestingprpsa.blob.core.windows.net/test/SampleApp2.jmx

if [ "$AZ_BATCH_IS_CURRENT_NODE_MASTER" != "true" ];
then
./apache-jmeter-5.4.1/bin/jmeter-server -Jserver.rmi.ssl.disable=true &
fi

if [ "$1" == "run" ];
then
    echo "AZ_BATCH_NODE_LIST $AZ_BATCH_NODE_LIST"
    nodes_list=$(echo -e "$AZ_BATCH_NODE_LIST" | tr ';' ',')
    echo "nodes_list $nodes_list"
    wget https://cloudnativetestingprpsa.blob.core.windows.net/test/SampleApp2.jmx
    ./apache-jmeter-5.4.1/bin/jmeter -n -t SampleApp2.jmx -Jserver.rmi.ssl.disable=true -R 172.18.0.4
fi