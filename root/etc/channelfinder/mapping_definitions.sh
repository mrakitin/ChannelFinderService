#!/bin/bash

###
# #%L
# ChannelFinder Directory Service
# %%
# Copyright (C) 2010 - 2016 Helmholtz-Zentrum Berlin für Materialien und Energie GmbH
# %%
# Copyright (C) 2010 - 2012 Brookhaven National Laboratory
# All rights reserved. Use is subject to license terms.
# #L%
###

# The mapping definition for the Indexes associated with the channelfinder v2


#Create the Index
curl -XPUT 'http://localhost:9200/tags'
#Set the mapping
curl -XPUT 'http://localhost:9200/tags/_mapping/tag' -d'
{
  "tag" : {
    "properties" : {
      "name" : {
        "type" : "text",
        "fields": {
            "keyword": { 
              "type": "keyword"
            }
        }
      },
      "owner" : {
        "type" : "text"
      }
    }
  }
}'

curl -XPUT 'http://localhost:9200/properties'
curl -XPUT 'http://localhost:9200/properties/_mapping/property' -d'
{
  "property" : {
    "properties" : {
      "name" : {
        "type" : "text",
        "fields": {
            "keyword": { 
              "type": "keyword"
            }
        }
      },
      "owner" : {
        "type" : "text"
      }
    }
  }
}'

curl -XPUT 'http://localhost:9200/channelfinder'
curl -XPUT 'http://localhost:9200/channelfinder/_mapping/channel' -d'
{
  "channel" : {
    "properties" : {
      "name" : {
        "type" : "text",
        "fields": {
            "keyword": { 
              "type": "keyword"
            }
        },
        "analyzer" : "whitespace"
      },
      "owner" : {
        "type" : "text",
        "analyzer" : "whitespace"
      },
      "script" : {
        "type" : "text"
      },
      "properties" : {
        "type" : "nested",
        "include_in_parent" : true,
        "properties" : {
          "name" : {
            "type" : "text",
            "fields": {
                "keyword": { 
                  "type": "keyword"
                }
            },
            "analyzer" : "whitespace"
          },
          "owner" : {
            "type" : "text"
          },
          "value" : {
            "type" : "text",
            "analyzer" : "whitespace"
          }
        }
      },
      "tags" : {
        "type" : "nested",
        "include_in_parent" : true,
        "properties" : {
          "name" : {
            "type" : "text",
            "fields": {
                "keyword": { 
                  "type": "keyword"
                }
            },
            "analyzer" : "whitespace"
          },
          "owner" : {
            "type" : "text",
            "analyzer" : "whitespace"
          }
        }
      }
    }
  }
}'