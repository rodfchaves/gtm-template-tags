___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Allowed Domains\u0027 List",
  "description": "Use this variable to compare the hostname from your website with a list of one or more hostnames. If your hostname is in the list, returns true.\nMore:",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "PARAM_TABLE",
    "name": "listDomains",
    "displayName": "Allowed Domains",
    "paramTableColumns": [
      {
        "param": {
          "type": "TEXT",
          "name": "Domain",
          "displayName": "Domain",
          "simpleValueType": true
        },
        "isUnique": true
      }
    ],
    "newRowButtonText": "New Domain",
    "newRowTitle": "New Domain",
    "alwaysInSummary": false,
    "clearOnCopy": false,
    "defaultValue": "yourdomain.com",
    "help": "Enter the domains and/or subdomains that should be allowed to send events."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const logToConsole = require('logToConsole');
const parseUrl = require('parseUrl');
const getUrl = require('getUrl');
const makeTableMap = require('makeTableMap');
const Object = require('Object');

const domains = data.listDomains && data.listDomains.length ? data.listDomains : [];
const arrayDomains = domains.map(item => item.Domain);

let theUrl = getUrl();
let parsedURL = parseUrl(theUrl);
let hostname = parsedURL.hostname;

return arrayDomains.indexOf(hostname) == -1 ? false : true;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Untitled test 1
  code: |-
    const mockData = {
      // Mocked field values
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo(undefined);


___NOTES___

Created on 6/13/2023, 4:48:08 PM

