sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"rc/com/fluidra/sfabsmgmt/test/integration/pages/RegistryViewList",
	"rc/com/fluidra/sfabsmgmt/test/integration/pages/RegistryViewObjectPage"
], function (JourneyRunner, RegistryViewList, RegistryViewObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('rc/com/fluidra/sfabsmgmt') + '/test/flp.html#app-preview',
        pages: {
			onTheRegistryViewList: RegistryViewList,
			onTheRegistryViewObjectPage: RegistryViewObjectPage
        },
        async: true
    });

    return runner;
});

