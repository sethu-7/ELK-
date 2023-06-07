# ELK-
ELK Documentation

Install Elasticsearch logstatsh and kibana

add lines the following lines to elasticsearch.ylm in config folder of elasticsearch

#############################################################################################################################################################################
action.auto_create_index: .monitoring*,.watches,.triggered_watches,.watcher-history*,.ml*  // add this line in the begining before cluster

//add the following lines in discovery section
xpack.security.enabled: false

xpack.security.http.ssl.enabled: false


xpack.security.transport.ssl.enabled: false

http.host: 0.0.0.0
#############################################################################################################################################################################

and save the file

now open bin folder in elasticsearch folder and type cmd in the address bar to open the command prompt 

type : elasticsearch.bat

and see if running

then open browser and type: localhost:9200 and see if getting the following window

<img width="614" alt="image" src="https://github.com/sethu-7/ELK-/assets/121884112/6f336b98-56be-4e8f-a3dd-ef67096c4259">
#############################################################################################################################################################################
the following would be present

name	"LAPTOP-TBI3MA32"
cluster_name	"elasticsearch"
cluster_uuid	"_SvekDOlS9S02ySxajykZQ"
version	
number	"8.8.0"
build_flavor	"default"
build_type	"zip"
build_hash	"c01029875a091076ed42cdb3a41c10b1a9a5a20f"
build_date	"2023-05-23T17:16:07.179039820Z"
build_snapshot	false
lucene_version	"9.6.0"
minimum_wire_compatibility_version	"7.17.0"
minimum_index_compatibility_version	"7.0.0"
tagline	"You Know, for Search"

#############################################################################################################################################################################




then open kibana.yml file from cofig folder in kibana

then uncomment or add the following lines as needed
#############################################################################################################################################################################
server.port: 5601

server.host: "localhost"

elasticsearch.hosts: ["http://localhost:9200"]

elasticsearch.username: "kibana_system"
elasticsearch.password: "pass"

#############################################################################################################################################################################
Then making sure the elasticsearch.bat is already running in a cmd.....open command prompt from bin folder of kibana in the same way as mentioned above and run the command 
  kibana.bat
  
Then open browser and type localhost:5200

the elk server will start running


Now create a file called learn.conf (u can add any name you want but it should be a .conf file) and add the following content into it

#############################################################################################################################################################################

input {
    stdin{
        
    }
}

output {

    stdout {
        codec => rubydebug
    }

    elasticsearch {
        hosts => ["http://localhost:9200"]
        index =>"test.logstash"
        user => "elastic"
        password => ""
    }
}

#############################################################################################################################################################################

save this file in the config folder in logstash 

now open the bin folder of logstash in cmd as before and run the following command:

**logstash -f  .\config\learn.conf --config.reload.automatic**

now in the console in devtools section in elk add the command

#############################################################################################################################################################################
 PUT test.logstash
 
 GET test.logstash/_search
 ############################################################################################################################################################################
 
 now type anything on the cmd and run the GET command on elk and u will see taht the message got send
 
 NOTE:test.logstash is teh index name we gave in the learn.conf file and make sure this both shd be same
 












