@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_View_sai as select from /DMO/I_Connection as Connection
                                 association[1..*] to /DMO/I_Carrier as _airline 
                                 on $projection.AirlineID = Connection.AirlineID
                                 
{
    key Connection.AirlineID,
    key Connection.ConnectionID,
        Connection.DepartureAirport,
        Connection.DestinationAirport,
        
        _airline
}
