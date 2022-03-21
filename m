Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9E5C433EF
	for <workflows@archiver.kernel.org>; Mon, 21 Mar 2022 01:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244577AbiCUB4F (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 20 Mar 2022 21:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242733AbiCUB4E (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 20 Mar 2022 21:56:04 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2103.outbound.protection.outlook.com [40.92.99.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8040013DB56
        for <workflows@vger.kernel.org>; Sun, 20 Mar 2022 18:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkP2E0l/SzApR4ENFqVrp27VGbQY+VjC1Oiqf1q7zI4rsBwzDAS+aREmpdnb6/SM/MBWDrtWNPZA66zpgkoXxblQojjgGXEyjU7r2w6WyjPNyxTkGJ+JMtaZj0AU1g1iTrpeEKQaYu/sY8yqtFyZiPTTrZSrCwu11Fs0o4/oLmg49uS4h4EBwZTLOOGzDs0HofSC3Lm6t63a2rH3hB445YtuDgk+bUkaP2+sl+N6/9FiQ71brFrw1zKffUb37lNAN5J2GWGy6G+fcurvE10ClEh8/HUANWtA/xJHnRAv81P32AI1Gn+dbXAwdhSrAuPSDbrqW6c0BW+CqpTEpTZ+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEvUR0dlUblZP/PrwqcUs1eXEI0KOc4s9QY1RvQu+qk=;
 b=HPMbBOzHytIJxUDoTQsMmkgFiqZb7SfCyQ/7EAOtG9ox6JHIcn3ow//ul9LRPlws32XTbYEriCMeRgkCgj/k1Z7glqU/6fhYi5Hf4+TNvkf6uGoHoUVpiwVr/m7EfeBTz+RUalpd7mWCPEikw2twQ0p/Ht/3fINmCd4RlCWd+D/s+TstFC8vHzEkcrZSjVu6q5eTFy338QgyGsuURCmRKTZ/T7mRuCnMaiAN0rVdD0BtNgV8N9GjjjtaIXqfN+pmusSFuATwIw806qkV779p+yd0ScMecgVaF1qUvoA/oH2jkTty89FUT4bOoQAp9Lr62G7+bM26zw0RXG/3vvKjbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEvUR0dlUblZP/PrwqcUs1eXEI0KOc4s9QY1RvQu+qk=;
 b=hUyFBYJsVl64b/qV/8h5tvY6sgtI9BSqQSohhe3d7JIsS4GxITw8i5bViNUw1RVHbzQhGVR110pxUMK01aF+VArHGhAgzS5hkQFW4FQC2J5iCoz5MpEfzc8h65bJizFMfuFYyb1aeqOt27se0F4keGc5bpOQu2evgzs8xcywDQO8e8LWSoACykrGHWr1xn+FQ+0oUHd9ZcpEtF1R57+YOzqjUMBwTi3ZahXQ2ooH2xJFj/Tt19lDw3ETKUiCgsxaZwN/Z75h+h2o0EQPsqyrkXEgOj43Zzwdgv/wm0XgmGE2BTEJvRxGQuii01+h3phb3KDiM5fqDban4OwakU5big==
Received: from OSZP286MB2078.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:16f::10)
 by OS3P286MB1240.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 01:54:37 +0000
Received: from OSZP286MB2078.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e505:230d:4122:cd2a]) by OSZP286MB2078.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e505:230d:4122:cd2a%7]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 01:54:37 +0000
From:   Cui Alan <AlanCui4080@outlook.com>
CC:     "workflows@vger.kernel.org" <workflows@vger.kernel.org>
Subject: How can I post my patch to others
Thread-Topic: How can I post my patch to others
Thread-Index: Adg8xc2yo2qyw3S0QiGoGk45zWdxVw==
Date:   Mon, 21 Mar 2022 01:54:37 +0000
Message-ID: <OSZP286MB2078DB6CFC4744170871B3A9AD169@OSZP286MB2078.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn:  [hl5qGvWUU6vZZ7TQWaOhGXnf0In3w/GAqF69FgQFX4RuuxJHaQEZclYzEb65O0uJW+HEIKRog7c=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 099abc81-d5c1-400a-58ab-08da0addc196
x-ms-traffictypediagnostic: OS3P286MB1240:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IMwyKac8egDg5YTvoHULqdqlQ0sKrnjQU+0kBehFcwNRdv4zzWeTEiZqx2Uk13SNp9EyiKNwq6VGDLagaozXZEK4d+bM1mNFBRs3lEnUrW++MTe4D7Qp/qXUT52dQfiZVu042gLqQ0ZP3SH4tlkrqhLmQl6Y/AuhPdjTn5Zx+9aWVzDRr0Kq6K6ZpvKjlSuRco1/IvcwPv9c1gEQxbWcCkVPIIC84Z5ZadiNrrR/rPSoS06tNDi135KiGfVDvYo6hUx52bMRBiqorVmuMiRt8Sj6WB5gGVZA2L/fx5sws40Sp97rblKfW89yQlRpDetI+xFxr1ZrVtYyIp9u07ny3xa2O0xmaqxNlNZOw/WJydLckKRQUHYsqEVhD5BbkJW+ReFMwt1dYnWqxeTyUqRIUqs7GPsq9UjEZyqbOs4LAhg5n+pya7nsMqXhLvh90m90H+hN9L1wGm8CyxXw/LgYEgORr3hGC8eJgbTvCpV/m6I3mn5bik/NlhXsaNMkTTNMjJ0fvmtq6o1/17HdENjOWBogvlmAY7p2sJIJnIFdiwwR1wvBcAhDHmSqGBJmyDmLYnW/MPg48C+iCSaGfSVs1w==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VN+YdZ0psxHadZDFcFTTyxsK9l2pdPkRQnQVHFud/m22UiAIhf/3bTw2d3IO?=
 =?us-ascii?Q?sPqH8BN8ct3lZp/4aU4ADyBEfWWPKvdWUpnb9uXuLhx9bDgL5Dg+Q5GfMHze?=
 =?us-ascii?Q?Ts48vlOujIPJJl6t8iolsxKyVOyQ+gYDCW03ExuPyfYZ7lmkQtVdpc+4rblS?=
 =?us-ascii?Q?P9ftWoaVJUhNArOqf2qvu2uZ3U8BC7zOv/qS+mteP57oDfNwtZRfOutt6ava?=
 =?us-ascii?Q?cYh+f6boCGAgqNxTRbA3f7vMyMi0wFj8O2LpETtQtwdvJxgmvt3i89D6k73k?=
 =?us-ascii?Q?qVSXGpNEa3f+nuH8TI2E3yeUr+UD34jvsKT+yOCx4iHicAK0sEmKbxwMVgt+?=
 =?us-ascii?Q?WuXxFo3IzrhqSjLnqw2TOMZEh6WWl8iLoU/bXn4dfLd89A5rR4y4WaK8oavV?=
 =?us-ascii?Q?23A+GQfawP9/alB0nW1mUsXibCtnUnyN0ajcN73yx+/F4FPV09wY7hEtH7hD?=
 =?us-ascii?Q?Q5OQ92EURNh5T5II3ZS9gxw10GDTW6oODdKnsdb7wcKhSigAwAH2taD46pnj?=
 =?us-ascii?Q?7o2XOaEMVKvGZy3QN3Zrg6fqXTTHx02c7yk5YyI/BqMkWJJXxsLkzzdYBGJd?=
 =?us-ascii?Q?tQO39RvuilWRoSFUPn/tVaqrP7zUDdIFFaDz2MlDt0ThPsSIDhdt272vThLc?=
 =?us-ascii?Q?K8nTd0NX0fXxtZP0kdEhnhELtvC5lbuo1FWU1IQ8SuZzdmWy8XDqgh7g80gH?=
 =?us-ascii?Q?DdZnUAXC2AtdiUM1mWHnjwF/22XX0+bHla0OQDRwHjt7VpVpHQONZJxV4MY/?=
 =?us-ascii?Q?EInzgbGH59pS5Hnk9HIQgyqRDNFwwzDA/Rh184UOKIPqwPWQn27iFFPcYvfQ?=
 =?us-ascii?Q?C6LDI0/NF/30YIjqbGLencQ2orexSW8BdDv4LqICntlvzDMW3Ua6f0omzoFA?=
 =?us-ascii?Q?4xCbqpvDXY5hGQSBhfZimNXkBmPu++9o0jeZ16Jj8cevRHOX7Iupok3FAL0e?=
 =?us-ascii?Q?D0QOE5Bike4sFPQJazQYAhdg+NOlGvosOulLmiiKwHdk0WYlMXjhav/DVLSU?=
 =?us-ascii?Q?2Ai+bUNFFFjE03/GnbhW2o+3AlxMZaaKElP1Npfq3s8kgSQqN1t85DEm66NC?=
 =?us-ascii?Q?auTWV59Zs+cCmqF2QyuHB1X3+oTDlkuXOGbv4leAIzC4l3Hs3bduohzoN915?=
 =?us-ascii?Q?eE/L3uggjSJ4+uxCNtFDQK5t5FkdLaoc9LcZMF7tQLXN+tOUwXGLm2wM1jri?=
 =?us-ascii?Q?T4xqn9mZ4/djF8O6pp3tquim0xIggzfuM13ePA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB2078.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 099abc81-d5c1-400a-58ab-08da0addc196
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 01:54:37.7471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1240
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Collaborators:

I'm going to post a patch, but I still don't know whatever can I simply pos=
t the PATCH to
others in the "linux-kernel" mailing list. It's said that I can do that to =
make PATCH examined by
others. I don't want to pollute the main list.

Sincerely,
a.
