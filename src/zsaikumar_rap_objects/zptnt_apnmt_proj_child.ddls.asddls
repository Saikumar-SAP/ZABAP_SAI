@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Patient Appointment table'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZPTNT_APNMT_PROJ_CHILD 
as projection on ZPTNT_APNMT_CHILD
{
    key PatientId,
    key AppointmentId,
    Doctorid,
    Apptdate,
    Appttime,
    Status,
    Lastchangedat,
    /* Associations */
    _details : redirected to parent ZPTNT_DTLS_PROJ 
}
