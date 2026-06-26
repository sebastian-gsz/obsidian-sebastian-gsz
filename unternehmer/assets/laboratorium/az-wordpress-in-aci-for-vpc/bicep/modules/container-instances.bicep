@secure()
param mysqlPassword string

param location string
param storageAccountName string
@secure()
param storageAccountKey string
param networkProfileId string

var image = 'mcr.microsoft.com/azure-cli'
var wordpressShareName = 'wordpress-share'
var mysqlShareName = 'mysql-share'
var cpuCores = '1.0'
var memoryInGB = '1.5'

resource shareContainerGroup 'Microsoft.ContainerInstance/containerGroups@2019-12-01' = {
  name: 'createshare-containerinstance'
  location: location
  properties: {
    containers: [
      {
        name: wordpressShareName
        properties: {
          image: image
          command: [
            'az'
            'storage'
            'share'
            'create'
            '--name'
            wordpressShareName
          ]
          environmentVariables: [
            {
              name: 'AZURE_STORAGE_KEY'
              value: storageAccountKey
            }
            {
              name: 'AZURE_STORAGE_ACCOUNT'
              value: storageAccountName
            }
          ]
          resources: {
            requests: {
              cpu: cpuCores
              memoryInGB: memoryInGB
            }
          }
        }
      }
      {
        name: mysqlShareName
        properties: {
          image: image
          command: [
            'az'
            'storage'
            'share'
            'create'
            '--name'
            mysqlShareName
          ]
          environmentVariables: [
            {
              name: 'AZURE_STORAGE_KEY'
              value: storageAccountKey
            }
            {
              name: 'AZURE_STORAGE_ACCOUNT'
              value: storageAccountName
            }
          ]
          resources: {
            requests: {
              cpu: cpuCores
              memoryInGB: memoryInGB
            }
          }
        }
      }
    ]
    restartPolicy: 'OnFailure'
    osType: 'Linux'
  }
}

resource mysqlContainerGroup 'Microsoft.ContainerInstance/containerGroups@2019-12-01' = {
  name: 'mysql-containerinstance'
  location: location
  dependsOn: [
    shareContainerGroup
  ]
  properties: {
    containers: [
      {
        name: 'mysql'
        properties: {
          image: 'mysql:5.6'
          ports: [
            {
              protocol: 'TCP'
              port: 3306
            }
          ]
          environmentVariables: [
            {
              name: 'MYSQL_ROOT_PASSWORD'
              value: mysqlPassword
            }
          ]
          volumeMounts: [
            {
              mountPath: '/var/lib/mysql'
              name: 'mysqlfile'
            }
          ]
          resources: {
            requests: {
              cpu: cpuCores
              memoryInGB: memoryInGB
            }
          }
        }
      }
    ]
    volumes: [
      {
        azureFile: {
          shareName: mysqlShareName
          storageAccountKey: storageAccountKey
          storageAccountName: storageAccountName
        }
        name: 'mysqlfile'
      }
    ]
    networkProfile: {
      id: networkProfileId
    }
    osType: 'Linux'
  }
}

resource wordpressContainerGroup 'Microsoft.ContainerInstance/containerGroups@2019-12-01' = {
  name: 'wordpress-containerinstance'
  location: location
  dependsOn: [
    shareContainerGroup
  ]
  properties: {
    containers: [
      {
        name: 'wordpress'
        properties: {
          image: 'wordpress:4.9-apache'
          ports: [
            {
              protocol: 'TCP'
              port: 80
            }
          ]
          environmentVariables: [
            {
              name: 'WORDPRESS_DB_HOST'
              value: '${mysqlContainerGroup.properties.ipAddress.ip}:3306'
            }
            {
              name: 'WORDPRESS_DB_PASSWORD'
              value: mysqlPassword
            }
          ]
          volumeMounts: [
            {
              mountPath: '/var/www/html'
              name: 'wordpressfile'
            }
          ]
          resources: {
            requests: {
              cpu: cpuCores
              memoryInGB: memoryInGB
            }
          }
        }
      }
    ]
    volumes: [
      {
        azureFile: {
          shareName: wordpressShareName
          storageAccountKey: storageAccountKey
          storageAccountName: storageAccountName
        }
        name: 'wordpressfile'
      }
    ]
    networkProfile: {
      id: networkProfileId
    }
    osType: 'Linux'
  }
}

output wordpressIP string = wordpressContainerGroup.properties.ipAddress.ip
output mysqlIP string = mysqlContainerGroup.properties.ipAddress.ip
