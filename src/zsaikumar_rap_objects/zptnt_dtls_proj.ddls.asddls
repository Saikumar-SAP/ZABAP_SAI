@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Patient Details table'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZPTNT_DTLS_PROJ 
as projection on ZPTNT_DTLS_ROOT
{
    key PatientId,
    Name,
    Age,
    Gender,
    Phone,
    Status,
    Lastchangedat,
    /* Associations */
    _appointment : redirected to composition child ZPTNT_APNMT_PROJ_CHILD 
}
