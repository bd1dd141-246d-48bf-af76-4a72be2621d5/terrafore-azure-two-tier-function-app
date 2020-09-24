resource "azurerm_cosmosdb_account" "db" {
  name                = "cosmos-${random_id.name.hex}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = false

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }
  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
}
/*
resource "azurerm_cosmosdb_sql_database" "db_db" {
  name                = "VirtualCourtLogicApps-DB"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  throughput          = 400
}


resource "azurerm_cosmosdb_sql_container" "calendars" {
  name                = "Calendars"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
resource "azurerm_cosmosdb_sql_container" "channelIndex" {
  name                = "ChannelIndex"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
resource "azurerm_cosmosdb_sql_container" "events" {
  name                = "Events"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
resource "azurerm_cosmosdb_sql_container" "facilities" {
  name                = "Facilities"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
resource "azurerm_cosmosdb_sql_container" "latestestMessegeId" {
  name                = "LatestestMessegeId"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
resource "azurerm_cosmosdb_sql_container" "operationStatus" {
  name                = "OperationStatus"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
resource "azurerm_cosmosdb_sql_container" "recorders" {
  name                = "Recorders"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
resource "azurerm_cosmosdb_sql_container" "recordingFlags" {
  name                = "RecordingFlags"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
resource "azurerm_cosmosdb_sql_container" "recordingFlagsv2" {
  name                = "RecordingFlagsV2"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
resource "azurerm_cosmosdb_sql_container" "settings" {
  name                = "Settings"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
resource "azurerm_cosmosdb_sql_container" "users" {
  name                = "Users"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.db_db.name
  partition_key_path  = "/definition/id"
  throughput          = 400
}
*/