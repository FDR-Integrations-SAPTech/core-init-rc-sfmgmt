using sfabs_mgmt as service from '../../srv/sfabs_mgmt-service';
annotate service.RegistryView with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : companyid,
            Label : 'Company Code',
        },
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : 'Email',
        },
        {
            $Type : 'UI.DataField',
            Value : month,
            Label : 'Month',
        },
        {
            $Type : 'UI.DataField',
            Value : year,
            Label : 'Year',
        },
        {
            $Type : 'UI.DataField',
            Value : absWomen,
            Label : 'Absent Work Hours Women',
        },
        {
            $Type : 'UI.DataField',
            Value : absMen,
            Label : 'Absent Work Hours Men',
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Registry Entry',
            ID : 'RegistryEntry',
            Target : '@UI.FieldGroup#RegistryEntry',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Hours Entry',
            ID : 'hoursEntry',
            Target : '@UI.FieldGroup#hoursEntry',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Administrative Data',
            ID : 'AdministrativeData',
            Target : '@UI.FieldGroup#AdministrativeData',
        },
    ],
    UI.FieldGroup #RegistryEntry : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : email,
                Label : 'Email',
            },
            {
                $Type : 'UI.DataField',
                Value : companyid,
                Label : 'Company Code',
            },
            {
                $Type : 'UI.DataField',
                Value : month,
                Label : 'Month',
            },
            {
                $Type : 'UI.DataField',
                Value : year,
                Label : 'Year',
            },
        ],
    },
    UI.FieldGroup #hoursEntry : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : absMen,
                Label : 'Absent Work Hours Men',
            },
            {
                $Type : 'UI.DataField',
                Value : absWomen,
                Label : 'Absent Work Hours Women',
            },
        ],
    },
    UI.FieldGroup #AdministrativeData : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName : '',
        Title:{
            $Type: 'UI.DataField',
            Value : HeaderTitle
        },
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : ID,
        },
    },
);

