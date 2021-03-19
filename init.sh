apt-get update
apt-get install wget
wget https://mirrors.estointernet.in/apache//jmeter/binaries/apache-jmeter-5.4.1.tgz
tar -xvf apache-jmeter-5.4.1.tgz
./apache-jmeter-5.4.1/bin/jmeter-server -Jserver.rmi.ssl.disable=true &
if [ -z ${AZ_BATCH_IS_CURRENT_NODE_MASTER}]
then 
else
    nodes_list = $(echo -e "$AZ_BATCH_NODE_LIST" | tr ';' ',')
    echo $nodes_list
    wget https://cloudnativetestingprpsa.blob.core.windows.net/test/SampleApp2.jmx
    ./apache-jmeter-5.4.1/bin/jmeter -n -t SampleApp2.jmx -R $nodes_list