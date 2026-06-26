param location string
param vnetName string
param vnetAddressPrefix string
param subnet1Name string
param subnet1AddressPrefix string
param subnet2Name string
param subnet2AddressPrefix string

var dnsLabel = substring('acisite${uniqueString(resourceGroup().id)}', 0, 20)

resource publicIP 'Microsoft.Network/publicIPAddresses@2020-05-01' = {
  name: 'publicIp1'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    dnsSettings: {
      domainNameLabel: dnsLabel
    }
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2020-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1AddressPrefix
          serviceEndpoints: [
            {
              service: 'Microsoft.Storage'
              locations: [
                location
              ]
            }
          ]
          delegations: [
            {
              name: 'DelegationService'
              properties: {
                serviceName: 'Microsoft.ContainerInstance/containerGroups'
              }
            }
          ]
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2AddressPrefix
        }
      }
    ]
  }
}

resource networkProfile 'Microsoft.Network/networkProfiles@2020-05-01' = {
  name: 'aci-networkProfile'
  location: location
  properties: {
    containerNetworkInterfaceConfigurations: [
      {
        name: 'eth0'
        properties: {
          ipConfigurations: [
            {
              name: 'ipconfigprofile1'
              properties: {
                subnet: {
                  id: vnet.properties.subnets[0].id
                }
              }
            }
          ]
        }
      }
    ]
  }
}

output publicIPId string = publicIP.id
output vnetId string = vnet.id
output subnet1Id string = vnet.properties.subnets[0].id
output subnet2Id string = vnet.properties.subnets[1].id
output networkProfileId string = networkProfile.id
output siteFQDN string = publicIP.properties.dnsSettings.fqdn
