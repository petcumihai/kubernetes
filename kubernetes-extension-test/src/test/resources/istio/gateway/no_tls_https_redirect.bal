// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerinax/kubernetes;

@kubernetes:IstioGateway {
    name: "my-gateway",
    selector: {
        app: "my-gateway-controller"
    },
    servers: [
        {
            port: {
                number: 80,
                name: "http",
                protocol: "HTTP"
            },
            hosts: [
                "uk.bookinfo.com",
                "eu.bookinfo.com"
            ]
        }
    ]
}
@kubernetes:Deployment {
    name: "no_tls_https_redirect",
    image: "pizza-shop:latest"
}
@kubernetes:Service {name: "hello"}
endpoint http:Listener helloEP {
    port: 9090
};

@http:ServiceConfig {
    basePath: "/helloWorld"
}
service<http:Service> helloWorld bind helloEP {
    sayHello(endpoint outboundEP, http:Request request) {
        http:Response response = new;
        response.setTextPayload("Hello, World from service helloWorld ! \n");
        _ = outboundEP->respond(response);
    }
}
