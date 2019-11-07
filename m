Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C465C5DF60
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 08:48:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5AF52053B
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 08:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Sony.onmicrosoft.com header.i=@Sony.onmicrosoft.com header.b="uG95R45Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733238AbfKGIsm (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 03:48:42 -0500
Received: from mail-eopbgr720137.outbound.protection.outlook.com ([40.107.72.137]:16290
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727408AbfKGIsm (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 7 Nov 2019 03:48:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARxQgZON0iQLcy6G4I1VSKGB6pwfCSWigdZNhCVx2jkMk8DNYAJPrfBTmhRG+HDhfPSaB+f1Z/LDEIgb4c3+iRa6zNN3yZP/90ltB5pyJLeQc4gGTHQ2BFNWIdOS5zkVzLYJjg4NDMinP+9IKS638KTv8azug/+3iL6QFDQnNMfgM63h85xTmiDoKxa73bpzf9jGJxrG/3C5zkijb5bzmKu+xLehdsTT+7xrhQ6ZKaWch+g+R+2Pw0Q8rCRY9trU48LxT0INOuM8bZrnUGLpYjKDOB0pDZp2NugqU6wYn5IMYlQsvnKTbOep+NzSlnz+sMlr8G9mKkVq7N1aS8gmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JO2AvQCtC6WF/OjjlHHumxbiNP4jYZo8DyU1z8sq1O4=;
 b=YzbdVV6En3/oP0tEmzdJbFRkYaKO8o+MMBWpxiPvY2drXn9Z6N/DN8gA4FYASduUQseXBitNqJ9e8WMe0WZG95iXREcVjXyv86M+s1UNCLarOn8GODGJN4gtGSqQljdsQ+NBXU4wm/lJgg1tvprOpyjxeS2iBJeeb+/RUh0obVNbjdFDgf+pedKVrfB/s82rLI04RCOUMzwf63szs+SWL8/aoXi1wMd6FQy+Ks5vhU48U/0rPfcUe2zpGysOp+5N3jrSE7ysYHHs3htGGger1fhLBKa4K+BwOdkcKd/8t039/FN9/g0wc3Ak+oisTtTl50KA6H5ZrqgJnxZRziQH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 160.33.194.228) smtp.rcpttodomain=google.com smtp.mailfrom=sony.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=sony.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Sony.onmicrosoft.com;
 s=selector2-Sony-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JO2AvQCtC6WF/OjjlHHumxbiNP4jYZo8DyU1z8sq1O4=;
 b=uG95R45Z3qU78FkF86ySoyNJHrFmeDczd9TF3C3mzrUi87fH5LXFz3HqBz3KaTh3MFOE1QESEbQ54ZYx6OIT4iU1Yvxri+WajP//5TYaoEwRpj0/Ye2DnSVqDZE781uNVRqoyYyQ8YVlfeCYlsb9Y5VhgkNqHn9AEWpDB7sZ3F8=
Received: from BN6PR13CA0069.namprd13.prod.outlook.com (2603:10b6:404:11::31)
 by BYAPR13MB2230.namprd13.prod.outlook.com (2603:10b6:a02:c9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.16; Thu, 7 Nov
 2019 08:48:39 +0000
Received: from CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by BN6PR13CA0069.outlook.office365.com
 (2603:10b6:404:11::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.16 via Frontend
 Transport; Thu, 7 Nov 2019 08:48:38 +0000
Authentication-Results: spf=pass (sender IP is 160.33.194.228)
 smtp.mailfrom=sony.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=pass action=none header.from=sony.com;
Received-SPF: Pass (protection.outlook.com: domain of sony.com designates
 160.33.194.228 as permitted sender) receiver=protection.outlook.com;
 client-ip=160.33.194.228; helo=usculsndmail01v.am.sony.com;
Received: from usculsndmail01v.am.sony.com (160.33.194.228) by
 CY1NAM02FT008.mail.protection.outlook.com (10.152.75.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 08:48:38 +0000
Received: from usculsndmail12v.am.sony.com (usculsndmail12v.am.sony.com [146.215.230.103])
        by usculsndmail01v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id xA78mbUq019206;
        Thu, 7 Nov 2019 08:48:37 GMT
Received: from USCULXHUB04V.am.sony.com (hub.cul.am.sony.com [146.215.231.18])
        by usculsndmail12v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id xA78mbp5008967;
        Thu, 7 Nov 2019 08:48:37 GMT
Received: from USCULXMSG01.am.sony.com ([fe80::b09d:6cb6:665e:d1b5]) by
 USCULXHUB04V.am.sony.com ([146.215.231.18]) with mapi id 14.03.0439.000; Thu,
 7 Nov 2019 03:48:36 -0500
From:   <Tim.Bird@sony.com>
To:     <dvyukov@google.com>, <workflows@vger.kernel.org>,
        <automated-testing@yoctoproject.org>
CC:     <hanwen@google.com>, <konstantin@linuxfoundation.org>
Subject: RE: [Automated-testing] Structured feeds
Thread-Topic: [Automated-testing] Structured feeds
Thread-Index: AQHVk8BHm8GKSkb1KkSer1ZYO8jMsqd/aEmw
Date:   Thu, 7 Nov 2019 08:48:19 +0000
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF977D94C0@USCULXMSG01.am.sony.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
In-Reply-To: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [146.215.231.6]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:160.33.194.228;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10019020)(136003)(39860400002)(346002)(376002)(396003)(13464003)(199004)(189003)(54906003)(7736002)(8936002)(8746002)(6666004)(966005)(76176011)(102836004)(356004)(305945005)(8676002)(66066001)(23726003)(47776003)(33656002)(46406003)(478600001)(3846002)(6116002)(37786003)(246002)(2876002)(186003)(2906002)(97756001)(6306002)(476003)(55016002)(2201001)(229853002)(126002)(7696005)(70586007)(486006)(106002)(426003)(55846006)(446003)(5660300002)(336012)(11346002)(86362001)(26005)(4326008)(110136005)(316002)(70206006)(6246003)(50466002)(5001870100001);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR13MB2230;H:usculsndmail01v.am.sony.com;FPR:;SPF:Pass;LANG:en;PTR:mail.sonyusa.com,mail01.sonyusa.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f83d8754-0b52-4b76-c3bb-08d7635f4893
X-MS-TrafficTypeDiagnostic: BYAPR13MB2230:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BYAPR13MB2230A716C68E9997B9073302FD780@BYAPR13MB2230.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DHmrmsNqXiwdrvQUz+lqmLnfG7QZCRoQq9eVzRL8aAj5bgWvj55zZ5qqg+YWIgA9jaKPj16QQridcnSO86cq9z827V6DQntjnDB4mxDUVUZZe0ILjs+RyclR/4SOYYzrTFRIWYrWGWyk3VDEbJS+uGaHDoeBacmPBaS18qLtGgDuGdUY1BlkW3/568v95U5Pa7ppxeyrCzwnv0TUEFzvSGHSexKQACm3nNwt2y18pwPHGEzk58VvLwNutOUUqR1sTN0Q4+6dVXHDIW6xXkde8A6ZqbaaR92OpUBSM343xICXeReys7ldKSMq+Mva0vpUrqijfyeBQczUbosU2Mx8qCIkEPYvBy1Bk2r+VBUzInBxLeh0sdaUMNt77nrwdpLuATGMJInFp+CmD+mEdqPID7YuksaOXGAVV5A6BYZZeVEPNnS/A0bsP0JiVkOr+zr97+V/kH/MKTN6dzrfAuUBs02ILuDSx3htD/nilPvhcxA=
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 08:48:38.5309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f83d8754-0b52-4b76-c3bb-08d7635f4893
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=66c65d8a-9158-4521-a2d8-664963db48e4;Ip=[160.33.194.228];Helo=[usculsndmail01v.am.sony.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2230
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



> -----Original Message-----
> From: Dmitry Vyukov
>=20
> This is another follow up after Lyon meetings. The main discussion was
> mainly around email process (attestation, archival, etc):
> https://lore.kernel.org/workflows/20191030032141.6f06c00e@lwn.net/T/#t
>=20
> I think providing info in a structured form is the key for allowing
> building more tooling and automation at a reasonable price. So I
> discussed with CI/Gerrit people and Konstantin how the structured
> information can fit into the current "feeds model" and what would be
> the next steps for bringing it to life.
>=20
> Here is the outline of the idea.
> The current public inbox format is a git repo with refs/heads/master
> that contains a single file "m" in RFC822 format. We add
> refs/heads/json with a single file "j" that contains structured data
> in JSON format. 2 separate branches b/c some clients may want to fetch
> just one of them.

Can you provide some idea (maybe a few examples) of the types of
structured data that would  be in the json branch?
 -- Tim

