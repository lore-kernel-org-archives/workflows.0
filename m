Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA85CFA372C
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 09:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE5A121D6C
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 09:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Sony.onmicrosoft.com header.i=@Sony.onmicrosoft.com header.b="WIQTsjCA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfKGJUq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 04:20:46 -0500
Received: from mail-eopbgr820134.outbound.protection.outlook.com ([40.107.82.134]:6326
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387702AbfKGJUq (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 7 Nov 2019 04:20:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAfpZeuSfYGzOhe3BKj8netFl+e3K6bSKZ1WKRJxQsyVn/WFTJAbQ+6GF3xqM1LjGV4lQ86ygab4rQqALqFa6NihqkNQJDO514bGbNfDYuCw1yKdCgrvn4iHmCtU6H0ldsFP6jwgSOcJnnT+WZ/hAxW0U6jXJr+M4g/7oSHX2TASfbyEYubFX4Bjx3xYmWsEXAGLw6MYZ1J2wcetReXHLYk0ufY9zGUxbkA13iBQxNZXG+2/ObcEQPjIQdIPgQ7/E3a+/6w7zI4LLSaMmnRVsasH/zCFZcn8o3nAxfvEotWV0Hns/4MGjSDmTXyMzC7QUPjfZoND9nvVmlxIDK9Huw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGSzA6ViE4IWiKFwKFr0ooOm75C7pbFhJR/G7LcVGs0=;
 b=X6e08wlkWRSHFV5xMwn+BkKda3INaXseNHyihhkXSehS+khlBBNzt2p4ePkeVMp7677nASifdqof+y+TfuClArNyO6mjmlMpzYWmGy3B6fPkRlOcc7eBVpvXWzkuL7izGX3nT/TW4mn7flPIyRIhymBxG9sk5vjPZws71g/6SHhpsRmyB2RwkWtnVxkx1N8KGG0673jBcxZ0yPf+3sMCYaszsYFZXWXgT3SD4Zj8CKqiDgHswO1HWaTwaqxrBTPIjXNypxkp76MP9f5Mh6Om0pUzx/DleZWP18YMQJ4UL83yreqxsbb/tkdwE6e6vY0204WrrQsJDepnNEFk+oh47A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 160.33.194.229) smtp.rcpttodomain=google.com smtp.mailfrom=sony.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=sony.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Sony.onmicrosoft.com;
 s=selector2-Sony-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGSzA6ViE4IWiKFwKFr0ooOm75C7pbFhJR/G7LcVGs0=;
 b=WIQTsjCAaSQm4u//UBWRHSh2Cm5CnxCvTS0TO8RT4KDXPXF31238YIAR8tjD+3caddeRdEU82TkTHiLaxTP0WqwstOAIM4V9G3CZEfDpqjwUaRjPCtH5GthYQajvTg6YVxfzLQRxOdq5i2u3BZ0/oAGhkP7aO7rs3OFjXGZDHqc=
Received: from BN6PR13CA0058.namprd13.prod.outlook.com (2603:10b6:404:11::20)
 by MN2PR13MB3021.namprd13.prod.outlook.com (2603:10b6:208:13f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.16; Thu, 7 Nov
 2019 09:20:43 +0000
Received: from SN1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by BN6PR13CA0058.outlook.office365.com
 (2603:10b6:404:11::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.16 via Frontend
 Transport; Thu, 7 Nov 2019 09:20:42 +0000
Authentication-Results: spf=pass (sender IP is 160.33.194.229)
 smtp.mailfrom=sony.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=pass action=none header.from=sony.com;
Received-SPF: Pass (protection.outlook.com: domain of sony.com designates
 160.33.194.229 as permitted sender) receiver=protection.outlook.com;
 client-ip=160.33.194.229; helo=usculsndmail02v.am.sony.com;
Received: from usculsndmail02v.am.sony.com (160.33.194.229) by
 SN1NAM02FT042.mail.protection.outlook.com (10.152.73.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 09:20:42 +0000
Received: from usculsndmail12v.am.sony.com (usculsndmail12v.am.sony.com [146.215.230.103])
        by usculsndmail02v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id xA79KfUo012766;
        Thu, 7 Nov 2019 09:20:41 GMT
Received: from USCULXHUB08V.am.sony.com (hub.bc.in.sel.sony.com [146.215.231.169])
        by usculsndmail12v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id xA79KeAE000816;
        Thu, 7 Nov 2019 09:20:41 GMT
Received: from USCULXMSG01.am.sony.com ([fe80::b09d:6cb6:665e:d1b5]) by
 USCULXHUB08V.am.sony.com ([146.215.231.169]) with mapi id 14.03.0439.000;
 Thu, 7 Nov 2019 04:20:41 -0500
From:   <Tim.Bird@sony.com>
To:     <dvyukov@google.com>
CC:     <workflows@vger.kernel.org>, <automated-testing@yoctoproject.org>,
        <hanwen@google.com>, <konstantin@linuxfoundation.org>
Subject: RE: [Automated-testing] Structured feeds
Thread-Topic: [Automated-testing] Structured feeds
Thread-Index: AQHVk8BHm8GKSkb1KkSer1ZYO8jMsqd/aEmwgABbYgD//61XAA==
Date:   Thu, 7 Nov 2019 09:20:24 +0000
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF977D9506@USCULXMSG01.am.sony.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF977D94C0@USCULXMSG01.am.sony.com>
 <CACT4Y+bMxZ1b_83t_UbWC9VoH388jwWZDBUD3avE9mTc9z7dQw@mail.gmail.com>
In-Reply-To: <CACT4Y+bMxZ1b_83t_UbWC9VoH388jwWZDBUD3avE9mTc9z7dQw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [146.215.231.6]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:160.33.194.229;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10001)(10019020)(396003)(39860400002)(376002)(136003)(346002)(51914003)(189003)(13464003)(199004)(446003)(966005)(37786003)(6116002)(70586007)(3846002)(23676004)(26005)(316002)(2351001)(70206006)(126002)(426003)(436003)(336012)(11346002)(6916009)(54906003)(2906002)(2876002)(76176011)(33656002)(55016002)(86362001)(478600001)(6306002)(8676002)(106002)(66066001)(55846006)(14444005)(305945005)(7696005)(102836004)(50466002)(229853002)(47776003)(53546011)(7736002)(186003)(246002)(6246003)(5660300002)(356004)(561944003)(6666004)(8936002)(486006)(476003)(2486003)(4326008)(5001870100001);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR13MB3021;H:usculsndmail02v.am.sony.com;FPR:;SPF:Pass;LANG:en;PTR:mail.sonyusa.com,mail02.sonyusa.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dab9dbf-7298-4f45-099e-08d76363c378
X-MS-TrafficTypeDiagnostic: MN2PR13MB3021:
X-MS-Exchange-PUrlCount: 4
X-Microsoft-Antispam-PRVS: <MN2PR13MB3021995A25D7ADA70F3DCBB2FD780@MN2PR13MB3021.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8GZ4EDTe66qhFhnToP7mIfRqqxdkdfXXVl8KsMJeo+5VPifKpe8Nozwyks25/xLgtwy7oYP+cA3z4rwooKaBZAIVxETrJ8SmAl47KcQUp+78LCNJKDhVqJjNKVJuizOePuph8Cx0RB8vg2NNjiZlCG/kL4WMPrCkhvlUhPxSjyV3Gn5yjMJnyjx23rg2ZGvbB0lmE6B3pvGOHwvFFBsyMivuBPmSLcSYnMjv6KJi29dPQfwFDp+e9Z7vFHyCkV9fxUAYgtTLjCVMc9AJga13en5MXb1K0LIb778xZsILR/DP5Dx+sTijnijIxWHfMC+/QhtjKQXUFpc/V2Uyj6WnsX0uHW5rOfhkdZ8nMBSg/QK82WtZnVONj9W8cffHzLqIMK7Pcc8pxmwgOTAx9dyijwB01HVKY3BKHDRxdvnMxTJMloLo5Wv1/wxPKYuGYqbo0JrJ0nUF9wProQgEv7wM94L2/aL18JnHlZKQCJWfoQwz4RIYsHQHBTfE07m1biar5+KdF4cZDy5/VEupzQz3ze0AAWfhWf8Z26eve1RZi9ts5Ou8ttob98lleZNj//Q
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 09:20:42.7239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dab9dbf-7298-4f45-099e-08d76363c378
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=66c65d8a-9158-4521-a2d8-664963db48e4;Ip=[160.33.194.229];Helo=[usculsndmail02v.am.sony.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3021
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IFZ5dWtvdiAN
Cj4gDQo+IE9uIFRodSwgTm92IDcsIDIwMTkgYXQgOTo0OCBBTSA8VGltLkJpcmRAc29ueS5jb20+
IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IERt
aXRyeSBWeXVrb3YNCj4gPiA+DQo+ID4gPiBUaGlzIGlzIGFub3RoZXIgZm9sbG93IHVwIGFmdGVy
IEx5b24gbWVldGluZ3MuIFRoZSBtYWluIGRpc2N1c3Npb24gd2FzDQo+ID4gPiBtYWlubHkgYXJv
dW5kIGVtYWlsIHByb2Nlc3MgKGF0dGVzdGF0aW9uLCBhcmNoaXZhbCwgZXRjKToNCj4gPiA+DQo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3dvcmtmbG93cy8yMDE5MTAzMDAzMjE0MS42ZjA2YzAw
ZUBsd24ubmV0L1QvI3QNCj4gPiA+DQo+ID4gPiBJIHRoaW5rIHByb3ZpZGluZyBpbmZvIGluIGEg
c3RydWN0dXJlZCBmb3JtIGlzIHRoZSBrZXkgZm9yIGFsbG93aW5nDQo+ID4gPiBidWlsZGluZyBt
b3JlIHRvb2xpbmcgYW5kIGF1dG9tYXRpb24gYXQgYSByZWFzb25hYmxlIHByaWNlLiBTbyBJDQo+
ID4gPiBkaXNjdXNzZWQgd2l0aCBDSS9HZXJyaXQgcGVvcGxlIGFuZCBLb25zdGFudGluIGhvdyB0
aGUgc3RydWN0dXJlZA0KPiA+ID4gaW5mb3JtYXRpb24gY2FuIGZpdCBpbnRvIHRoZSBjdXJyZW50
ICJmZWVkcyBtb2RlbCIgYW5kIHdoYXQgd291bGQgYmUNCj4gPiA+IHRoZSBuZXh0IHN0ZXBzIGZv
ciBicmluZ2luZyBpdCB0byBsaWZlLg0KPiA+ID4NCj4gPiA+IEhlcmUgaXMgdGhlIG91dGxpbmUg
b2YgdGhlIGlkZWEuDQo+ID4gPiBUaGUgY3VycmVudCBwdWJsaWMgaW5ib3ggZm9ybWF0IGlzIGEg
Z2l0IHJlcG8gd2l0aCByZWZzL2hlYWRzL21hc3Rlcg0KPiA+ID4gdGhhdCBjb250YWlucyBhIHNp
bmdsZSBmaWxlICJtIiBpbiBSRkM4MjIgZm9ybWF0LiBXZSBhZGQNCj4gPiA+IHJlZnMvaGVhZHMv
anNvbiB3aXRoIGEgc2luZ2xlIGZpbGUgImoiIHRoYXQgY29udGFpbnMgc3RydWN0dXJlZCBkYXRh
DQo+ID4gPiBpbiBKU09OIGZvcm1hdC4gMiBzZXBhcmF0ZSBicmFuY2hlcyBiL2Mgc29tZSBjbGll
bnRzIG1heSB3YW50IHRvIGZldGNoDQo+ID4gPiBqdXN0IG9uZSBvZiB0aGVtLg0KPiA+DQo+ID4g
Q2FuIHlvdSBwcm92aWRlIHNvbWUgaWRlYSAobWF5YmUgYSBmZXcgZXhhbXBsZXMpIG9mIHRoZSB0
eXBlcyBvZg0KPiA+IHN0cnVjdHVyZWQgZGF0YSB0aGF0IHdvdWxkICBiZSBpbiB0aGUganNvbiBi
cmFuY2g/DQo+IA0KPiBIaSBUaW0sDQo+IA0KPiBOb2JvZHkgeWV0IHRyaWVkIHRvIGRlZmluZSBl
eGFjdCBmb3JtYXRzLiBHZW5lcmF0ZWxseSBpdCBzaG91bGQgZXhwb3NlDQo+IGluZm8gYWJvdXQg
cGF0Y2hlcywgY29tbWVudHMsIHRlc3QgcmVzdWx0cyBpbiBhbiBlYXN5IHRvIGNvbnN1bWUgZm9y
bS4NCj4gSGVyZSBhcmUgZXhhbXBsZXMgZm9yIHBhdGNod29yaywgZ2l0LWFwcHJhaXNlIGFuZCBn
ZXJyaXQ6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvYXBpL3BhdGNoZXMvP29yZGVy
PS1pZA0KPiBodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL2dpdC1hcHByYWlzZS90cmVlL21hc3Rl
ci9zY2hlbWENCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvd29ya2Zsb3dzLzg3c2duMHpyMDku
ZnNmQGlyaXMuc2lsZW50ZmxhbWUuY29tL1QvIw0KPiBtM2RiODdiNDNjZjVlNTgxYmE0ZDNhN2Zk
NWYxZmJmZjVhZWEzNTQ2YQ0KPiBJIHdvdWxkIGV4cGVjdCB0aGF0IHRoZSBmb3JtYXQgd291bGQg
cmVzZW1ibGUgdGhlc2UgZm9ybWF0cyB0bw0KPiBzaWduaWZpY2FudCBkZWdyZWUuIEJ1dCBJIGd1
ZXNzIHdlIG5lZWQgdG8gY29tZSB1cCB3aXRoIHNvbWV0aGluZywgdHJ5DQo+IHRvIHVzZSwgc2Vl
IHdoYXQncyBtaXNzaW5nL25lZWRzIHRvIGJlIGltcHJvdmVkIGFuZCBpdGVyYXRlLg0KPiBEbyB5
b3UgaGF2ZSBhbnkgc3BlY2lmaWMgcmVjb21tZW5kYXRpb25zIG9yIHdheXMgaW4gd2hpY2ggeW91
IHNlZSBpdA0KPiB3aWxsIGJlIGNvbnN1bWVkPw0KDQpJIGhhdmUgbm8gcmVjb21tZW5kYXRpb25z
LiAgKHlldC4pICA6LSkNCkknbSBqdXN0IHRyeWluZyB0byBmaWd1cmUgb3V0IHdoYXQgdGhlIHBy
b3Bvc2FsIGlzIGFib3V0LCBhbmQgaXQncyBzY29wZS4NClRoYW5rcyBmb3IgdGhlIGxpbmtzLg0K
IC0tIFRpbQ0KDQo=
