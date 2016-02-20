var $System = {
    Current: {
        Page: {
            ID: null,
            Cart: {
                Items: []
            },
            Synchro_Login_methods: new Array(),
            PageNotExecuteFunction:{PageID:null},
            MemberInfo: null,
            Editorder: {
                isConfirmDelivery:true,
                deliveryId: null,
                freightValues: null,
                freightSiteAmout: new Hashtable(),
                delveryAreaID: null,
                siteCarriersIds: new Hashtable(),
                weight: null,
                freightSchememItemsIds: new Hashtable(),
                shipmentServiceOptions: new Hashtable(),
                carrierService: [{
                    freightSchemeId: null,
                    carrierSeviceOption: null
                }]
            },
            Temp: {},
            PayToOrder: {
                member_Ecion: null,
                orderTotal: null,
                member_Standard: null
            }
        },
        Authorization: {
            SSODomain: "http://www.1wandian.com/",
            SSOLoginUrl: null,
            SSOFastAuthUrl: null,
            SSOAuthSignText: null,
            SSOReAuthDoServiceUrl: "http://www.1wandian.com/Normal/Service.aspx?Module=Member&Action=ReAuthDo"
        }
    }
};