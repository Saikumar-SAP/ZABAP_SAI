@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Patient Root Details'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPTNT_DTLS_ROOT 
as select from ZPTNT_DTLS_TAB
composition [0..*] of ZPTNT_APNMT_CHILD  as _appointment
{
    key patient_id as PatientId,
    name as Name,
    age as Age,
    gender as Gender,
    phone as Phone,
    status as Status,
    lastchangedat as Lastchangedat,
    _appointment
}
