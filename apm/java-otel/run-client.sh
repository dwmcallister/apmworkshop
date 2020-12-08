sudo curl -L https://github.com/signalfx/splunk-otel-java/releases/latest/download/splunk-otel-javaagent-all.jar \
    -o /opt/splunk-otel-javaagent.jar
sudo chmod 755 /opt/splunk-otel-javaagent.jar
export SIGNALFX_SERVICE_NAME='java-otel-reqs-client'
export SIGNALFX_ENDPOINT_URL='http://localhost:9080/v1/trace'
mvn compile exec:exec \
  -Dexec.executable="java" \
  -Dexec.args="-javaagent:/opt/splunk-otel-javaagent.jar -cp %classpath sf.main.GetExample"