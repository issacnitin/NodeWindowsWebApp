printenv
wget -q https://cloudnativetestingprpsa.blob.core.windows.net/test/202102191030128944_HighScaleSampleApp1_HighScaleSampleApp.jmx

if [ "$AZ_BATCH_IS_CURRENT_NODE_MASTER" != "true" ];
then
./jmeter/apache-jmeter-5.4.1/bin/jmeter-server -Jserver.rmi.ssl.disable=true &
fi

if [ "$1" == "run" ];
then
    echo "AZ_BATCH_NODE_LIST $AZ_BATCH_NODE_LIST"
    nodes_list=($(echo "$AZ_BATCH_NODE_LIST" | tr ';' ' '))
    echo "nodes_list ${nodes_list[0]} ${nodes_list[1]}"
    wget -q https://cloudnativetestingprpsa.blob.core.windows.net/test/202102191030128944_HighScaleSampleApp1_HighScaleSampleApp.jmx
    ./jmeter/apache-jmeter-5.4.1/bin/jmeter -n -t 202102191030128944_HighScaleSampleApp1_HighScaleSampleApp.jmx -Jserver.rmi.ssl.disable=true -R ${nodes_list[1]}
fi