sudo apt-get update
sudo apt-get install wget
sudo apt-get install default-jre
wget https://mirrors.estointernet.in/apache//jmeter/binaries/apache-jmeter-5.4.1.tgz
tar -xvf apache-jmeter-5.4.1.tgz
wget https://cloudnativetestingprpsa.blob.core.windows.net/test/SampleApp2.jmx

./apache-jmeter-5.4.1/bin/jmeter-server -Jserver.rmi.ssl.disable=true &

if [[ $1 == "run" ]]
then
    nodes_list = $(echo -e "$AZ_BATCH_NODE_LIST" | tr ';' ',')
    echo $nodes_list
    wget https://cloudnativetestingprpsa.blob.core.windows.net/test/SampleApp2.jmx
    ./apache-jmeter-5.4.1/bin/jmeter -n -t SampleApp2.jmx -R $nodes_list
fi