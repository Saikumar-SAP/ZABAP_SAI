@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Child view for patient appointment details'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPTNT_APNMT_CHILD 
as select from ZPTNT_APNMT_TAB
association to parent ZPTNT_DTLS_ROOT as _details
on $projection.PatientId = _details.PatientId
{
    key patient_id as PatientId,
    key appointment_id as AppointmentId,
    doctorid as Doctorid,
    apptdate as Apptdate,
    appttime as Appttime,
    status as Status,
    lastchangedat as Lastchangedat,
    _details
}
