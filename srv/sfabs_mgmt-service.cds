using fluidra.cap.sfmgmt as sfmgmt from '../db/schema-model';

service sfabs_mgmt {

    @odata.draft.enabled
    
    entity registry as projection on sfmgmt.registry {
    
        ID,
        @Common.Label: 'Email'
        email,
        @Common.Label: 'Company Code'
        companyid,
        @Common.Label: 'Month'
        month,
        @Common.Label: 'Year'
        year,
        hours.absMen as absMen,
        hours.absWomen as absWomen,
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy,
        cast ( email || '-' || month || '/' || year || '-' || companyid as String ) as HeaderTitle
    };

    @odata.draft.enabled
    entity RegistryView as projection on registry;

    entity hours as select from sfmgmt.hours;
    
    // annotate sfabs_mgmt.registry with @(
    //     UI: {
    //         SelectionFields  : [
    //             email,
    //             companyid             
    //         ],

    //         LineItem  : [
    //             {
    //                 $Type: 'UI.DataField',
    //                 Value: email
    //             },
    //             {
    //                 $Type: 'UI.DataField',
    //                 Label: 'Company Code',
    //                 Value: companyid
    //             },
    //             {
    //                 $Type: 'UI.DataField',
    //                 Label: 'Month',
    //                 Value: month
    //             },
    //             {
    //                 $Type: 'UI.DataField',
    //                 Label: 'Year',
    //                 Value: year
    //             },
    //             {
    //                 $Type: 'UI.DataField',
    //                 Label: 'Absent Work Hours Men',
    //                 Value: hours.absMen
    //             },
    //             {
    //                 $Type: 'UI.DataField',
    //                 Label: 'Absent Work Hours Women',
    //                 Value: hours.absWomen
    //             },
    //             {
    //                 $Type: 'UI.DataField',
    //                 Label: 'Created At',
    //                 Value: createdAt
    //             },
    //             {
    //                 $Type: 'UI.DataField',
    //                 Label: 'Created By',
    //                 Value: createdBy
    //             }
                
    //         ],
    //         HeaderInfo  : {
    //             $Type : 'UI.HeaderInfoType',
    //             Title: 'New Entry',
    //             TypeName : 'registry',
    //             TypeNamePlural : 'registries',
    //         },

    //         Facets  : [
    //             {
    //                $Type  : 'UI.ReferenceFacet',
    //                Target : '@UI.FieldGroup#Default',
    //                ID : 'Default',
    //                Label : 'Registry Entry' 
    //             } ,
    //             {
    //                  $Type: 'UI.ReferenceFacet',
    //                  Target: '@UI.FieldGroup#WorkHours',  // Reference to associated hours
    //                  ID: 'hours',
    //                  Label: 'Work Hours'  // Label for the associated hours
    //             },
    //             {
    //                  $Type: 'UI.ReferenceFacet',
    //                  Target: '@UI.FieldGroup#Admin',  // Reference to associated hours
    //                  ID: 'Admin',
    //                  Label: 'Administrative'  // Label for the associated hours
    //             }

    //         ],
    //         FieldGroup #Default  : {
    //             $Type : 'UI.FieldGroupType',
    //             Data: [
    //                 {
    //                 $Type: 'UI.DataField',
    //                 Value: email
    //             },
    //             {
    //                 $Type: 'UI.DataField',                    
    //                 Value: companyid             
    //             },
    //             {
    //                 $Type: 'UI.DataField',                    
    //                 Value: month
    //             },
    //             {
    //                 $Type: 'UI.DataField',                    
    //                 Value: year
    //             }
    //             ]
    //         },
    //         FieldGroup #WorkHours : {
    //             $Type : 'UI.FieldGroupType',
    //             Data:[
    //                 {
    //                 $Type: 'UI.DataField',   
    //                 Label: 'Absent Work Hours Men',                 
    //                 Value: hours.absMen
    //             },
    //             {
    //                 $Type: 'UI.DataField',
    //                 Label: 'Absent Work Hours Women',
    //                 Value: hours.absWomen
    //             }
    //             ]
    //         },
    //         FieldGroup #Admin : {
    //             $Type : 'UI.FieldGroupType',
    //             Data:[
    //                 {
    //                 $Type: 'UI.DataField',   
    //                 Label: 'Created By',                 
    //                 Value: createdBy
    //             },
    //             {
    //                 $Type: 'UI.DataField',
    //                 Label: 'Created At',
    //                 Value: createdAt
    //             },
    //             {
    //                 $Type: 'UI.DataField',
    //                 Label: 'Modified By',
    //                 Value: modifiedBy
    //             }
    //             ]
    //         },
    //     }
        
    // ) {
    //         email  @title : 'Email';
    //         month  @title : 'Month';
    //         year   @title : 'Year';
    //         companyid @title : 'Company Code';
    //         createdAt @title : 'Created At';
    //         createdBy @title : 'Created By';

    //     }
    
}