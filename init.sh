if [ "$1" == "init"]
then
    ./jmeter/apache-jmeter-5.4.1/bin/jmeter-server -Jserver.rmi.ssl.disable=true &
else
    nodes_list = $(echo -e "$AZ_BATCH_NODE_LIST" | tr ';' ',')
    echo $nodes_list
    wget https://cloudnativetestingprpsa.blob.core.windows.net/test/SampleApp2.jmx
    ./jmeter/apache-jmeter-5.4.1/bin/jmeter -n -t SampleApp2.jmx -Jserver.rmi.ssl.disable=true -R $nodes_list
fi