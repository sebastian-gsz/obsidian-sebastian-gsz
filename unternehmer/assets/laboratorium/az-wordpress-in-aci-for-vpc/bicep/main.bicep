@description('Nombre de la VNet')
param vnetName string = 'aci-vnet'

@description('Prefijo de dirección de la VNet')
param vnetAddressPrefix string = '10.0.0.0/16'

@description('Prefijo de la subred para ACI')
param subnet1AddressPrefix string = '10.0.0.0/24'

@description('Nombre de la subred para ACI')
param subnet1Name string = 'aci-subnet'

@description('Prefijo de la subred para el Application Gateway')
param subnet2AddressPrefix string = '10.0.1.0/24'

@description('Nombre de la subred para el Application Gateway')
param subnet2Name string = 'ag-subnet'

@secure()
@description('Contraseña para la base de datos MySQL')
param mysqlPassword string

@description('Ubicación para todos los recursos.')
param location string = resourceGroup().location

module storage './modules/storage.bicep' = {
  name: 'storageModule'
  params: {
    location: location
  }
}

module network './modules/network.bicep' = {
  name: 'networkModule'
  params: {
    location: location
    vnetName: vnetName
    vnetAddressPrefix: vnetAddressPrefix
    subnet1Name: subnet1Name
    subnet1AddressPrefix: subnet1AddressPrefix
    subnet2Name: subnet2Name
    subnet2AddressPrefix: subnet2AddressPrefix
  }
}

module containerInstances './modules/container-instances.bicep' = {
  name: 'containerInstancesModule'
  params: {
    location: location
    storageAccountName: storage.outputs.storageAccountName
    storageAccountKey: storage.outputs.storageAccountKey
    networkProfileId: network.outputs.networkProfileId
    mysqlPassword: mysqlPassword
  }
}

module applicationGateway './modules/application-gateway.bicep' = {
  name: 'applicationGatewayModule'
  params: {
    location: location
    subnet2Id: network.outputs.subnet2Id
    publicIPId: network.outputs.publicIPId
    wordpressIP: containerInstances.outputs.wordpressIP
  }
}

output SiteFQDN string = network.outputs.siteFQDN
