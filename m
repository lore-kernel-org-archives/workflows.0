Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903E38B7B4;
	Mon, 20 Jul 2026 20:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579716; cv=fail; b=lEnTRxKeIdFM+x9Y6ioQkLhB0WShELRo6BGTgTsBvqWVXo4Lre3DU+lyyQ9oXuSe0vcycUPiFYCNS6SGXeNHUj3AihZDLsVuBl5OL49smrBe5eplpm8ZYxmoJTmhDSuq8Z3d4LZU5KJPBpunMOBk0704WPBWcDLqYKMBsIihJGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579716; c=relaxed/simple;
	bh=o9TfIuDS64pYJGYnYXotDenwsMFeZzihvrURWcWt1jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JWXYlnJePOHM5o3skijF+GtptZBauc/00b0hCcQ9w2kyQVD7qVJJH8fyLfhse6+pPf3TyxwKe8ltZuFhV4IrDuQLFEbLSt4zcHo9zn3WNi4tHVYnTh7Z73NYkrhe9qON8bLDk7xxdYQ4Ij+pgg0j5sEf6XppsVbFystSoNHmbrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XemNNSuP; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XemNNSuP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMjLIcpJEq1Nomt5h0UgjbYQB9io6Hn3SPXzBLpNOYQfOzUkkokI6uhDZBMAgBvPwIyy21tThLlPxyhOmjVTjqfsx28X+OEHH6Z3GzUSxyCqEgQanz0uOfkfMmJ9UUqJ7hZwpXvlNhGvMLBKp9XPFJ4pZH74Kz79fJK5V+3oKwcHgqtq9w3O7u49rIDrTsFISl1Jd3n2sn01FAk7cLWP5HHcNBHxljbclUiTeWoW0U0Rb1JDJ7Ucj5FUcdqvfQHzHoFJtcK4qxNGBheVXNP1KKP5LbXNnkRT0YoAiBZcMjldEA5R5YCuKWoksho12k+iNpT1+GmJd8LNE/PcAaDDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qGgdFchJwTMApCE6hZLTrzpSFCNvEhZRXX736of/Zk=;
 b=MwD9AOQ7KMuKTVRnsDSTnZWxPrwzH6Kqm39PtCqftAGzFFX/lif8Yl74dAiOmQOtUn11k3zeEsM/ek59wIU17ofaqy/RfTKRDPJ3CLgT0W8QABlgVaevCLgMIiUCov1g1lWaT0fGIQK9M0A9VS8zlpXObWCmL+sFdbpB2kV31pI6/qNIjWa5BDCQjNn83g7fUyKP8JbP59sbhzowYaKnEUpYy66x6tUkBFjInlmwV+cEdH7ri2R/Tfho8Xv6JlUYjt/056VQTowS0PoUM8JiHqB8o1KBezVU1qu0HTwWLJC5q3iZlodTnv0UhinryB4QAnTVTWFPCiEjxm/smSbJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qGgdFchJwTMApCE6hZLTrzpSFCNvEhZRXX736of/Zk=;
 b=XemNNSuPuCfcUUO40OFyKKvrze97+VCnE0rmiNhT+TNWuQDg6xxlSoSXmuz7yuDrlIo5S7rRUuye146PxBZdanA6/KDKX6aumwlG6WkCtm79m3RikzxK4uFyUVOKoJwcxZBmD4sllreILWwQHlTgoqGd9Gr/RJ1uAgnjxzxUG3UhNayha6BLS8w6vOGZfSa87hrr8gJ3GKJ8TLVStiFzd3PdIcj0HHU/bj8ssb/eMEO1x0XReCgPk/xdT3CT/1jtnie7qS+hLf68x+yvc68CmLBvgpRYGIp3NSUcyogpOYI68UgJiuX+2i0tamjw48IX48SSqef8oDcjgDaunGAfKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10153.eurprd04.prod.outlook.com (2603:10a6:150:1a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 20:35:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 20:35:08 +0000
Date: Mon, 20 Jul 2026 16:34:59 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>
Subject: Re: [PATCH v3] docs: dt: maintainer: Add Devicetree and OF
 maintainer profile document
Message-ID: <al6Gc8b2j-I6g3sP@lizhi-Precision-Tower-5810>
References: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAL_JsqKkxVTVE=o-uar=JEVvqw9NhBAQcBrJ0ukf+RBXCwFZJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKkxVTVE=o-uar=JEVvqw9NhBAQcBrJ0ukf+RBXCwFZJA@mail.gmail.com>
X-ClientProxiedBy: PH7PR17CA0053.namprd17.prod.outlook.com
 (2603:10b6:510:325::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10153:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb27e21-44d2-4dd9-5bff-08dee69e636b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|7416014|366016|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xdjv9j+tRIsP92izJuiYZvinGXzbbITI+RirmSbdv/GfMwhJ4VppI5vi9WZFzrdfKcbJ3hReL9m+BIKsqsKpQVCYZnT9/kG/QsNYMOqxzCpNBsMDG1wazP78oEMAANoS6RPP0rsVPXf/htweYqQ0HJsB8UvMcLY2UBrPnBy4hkpvZF0g4d9OgLDEQ744AceTfLJmGbn2qN5JpDcnRTXeLvxbtMDgrVlukEM+XGHdjT01dnH6wamGirHBIPDIjKzau3RsoQ6QrN4MZ8pDnQYLYF6+9OoG9bU2wsZiDyHZgIUw8+D/jkfoSjlDd7ktc98AaJPwUDa5V+u4CcNvDelZdaMdlYH1ApdOIwQ8EgnnPUTeAw9BlsSwFFz6wbnpIyHlWkkWB9F6T3xBFtplU0DH3ODewTCgVgz7GaoLsE+5Un4PS7xN37E5wdTgy8LuBiEgPEy+hYNM+t6+H24ZxjyTUYB3qJ2X6sCu1eeMR6rws4hFR8ATU1rJ/iJeKe/0w310Ytaw873PxS8r5KSbJlwwUoTDBkCjeIJxhG9UyFkquWtjG9c6k9UnmdW1WnRrjfDUeczkMfP+TKaVWQefgiPIAB6BBaMay3U8SFexoso11wLgxnx+T/Vya0M6BuKlfRviCOfMFCWYZb7na2ug6FiHwgisl27bTyBo6J3oegL03Ds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(7416014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGxPSUlld0pCL01mZFJiaFJnK0lFVjVpTnlEa3ZranRSUGpMMEtTWkgwTDdT?=
 =?utf-8?B?YnVFelFrNmlDTFNTYzN1QXB6ZGlQcWczY1d3dUdCQ09IMUcwMUQrN25WOWFs?=
 =?utf-8?B?OTd2UkVsYXFwOVNVbHFiWUk5Yk9RRHQ0VnZXWGNGQm1OVUNkRUdCN00rZmRz?=
 =?utf-8?B?RjRRK2JYTjdMQjJtQzZLTUwxZ3hmNVJOa2pIVWVUbHRpRDc2OGZzN3JZeVhI?=
 =?utf-8?B?T2hiQnNZb29Zalp1YkRMMjZQUFM4VDZNSEJkbnhMbTYrdzYrTjhTN041WGhq?=
 =?utf-8?B?N2ZCdWNlOGoraldUeWJkb1pqczl4VEdGTHB1VEkxSDViUllPK3FBOXlacFNX?=
 =?utf-8?B?SnhWbUo2bld1SFVMbWhScHk5dllnZGxlRDRYVnZxU21nNXAyMVk0VG5BTHd2?=
 =?utf-8?B?MVIxSTBrclBJSTRybVBnM0tvQ3d2bEt5bk4yZHprWHVXNU1nL0pHMTJWN25s?=
 =?utf-8?B?cnp0RFYwYUFneE55dGdDVFhKWlY2SnZ4MjhYUkRSLzZGMlh5aFo1cUUxeFp1?=
 =?utf-8?B?bXhkR1VtUW5TRDRsZWxLZ1BqRlAyVHNDaWFrVkhETHNvOUUvRVB1VStSSGVX?=
 =?utf-8?B?TEhkUHBVUERVbXdwUkFBSGdDR0FXWjU4L3JtRjJrYWVnR1h6UXFhNjZYSitE?=
 =?utf-8?B?TmJXbFdsMi9TV3BuVWl1SGlxcVBHWXBRbTQ1QjU3K0VzZ1FmMGFPUzIrTVln?=
 =?utf-8?B?Mm8zQUovemsvYktzMDZGSDhyR1M2amd5L0c5T3lPcGtqQnpWQ3BDZGdpSkJV?=
 =?utf-8?B?TzRtRnVENml2aFI0YkR5SXFYVFFyTUM3RStiRGQyMTMxN2hLSFV1T014a3l4?=
 =?utf-8?B?YUtYd0poakFIYXZxNDBiU0o0NzR6Ui9XU3Z6WGFVWHVpdFhNb21RZkFoZW4y?=
 =?utf-8?B?bFArc0Naa3VCd1Z0K0N3K2JDYjZ0Wm1vMG90Q0VvYURONU5XZ2lNRnlqV3M2?=
 =?utf-8?B?NmluOGNOYnZUdkRzOFJiNjJiRXQvYStFMVRubmpLQ2gyNy9mYmhBZkhIRkI2?=
 =?utf-8?B?d25VN0Z3VkdwYUlQZm5OblV2ZWt2R3R4NllsNmwwdTBpN1JFUW5SdjYveVRI?=
 =?utf-8?B?UFNjdUM2WTRjcW5qMzJEd1grWHZPeWtYa21nV2ZjKzZvQ2h0ZWZaK2lIZVpZ?=
 =?utf-8?B?Q0xXMTg5VzFHdGsvZUVxZDRwN2pZaTA0dy8yY04zRmxLVXpWd3hmb0l6YXBO?=
 =?utf-8?B?R2s2TGdDcjR1THpyWHowR0RYNHZRZnNDdUM4UHJOVGVPOW5UcmhFR0c0VThK?=
 =?utf-8?B?VmQ3Q3FEcUh5QUNuOGhvaXVvQXVrcGNYbXl0QnFXcGhnaUQvSG5RQTU2dVRX?=
 =?utf-8?B?bURPQk1OWmQvMzNkUXBWSTlCZ3JVSmxXNlU1VHhCZlVHbGtra2l4ZDFzZ1Bo?=
 =?utf-8?B?M0xoZFNMUEgxVWJrdG1Ha1JqNHBtbmx1Wnhta01TUEZmRGcyTkgrMWdqV3Fh?=
 =?utf-8?B?S3h1WCtSeGdWZXNJZlRBbVY3cnJYRDhISlEwcEZieGtTZHh0WFk0WmxYNzVu?=
 =?utf-8?B?V3ByL29ZVDRqWk1sMHZuOFZySEpZeEdQazJPeERUZk9MSXhzSStNdzdCQUht?=
 =?utf-8?B?cENqWjZjMDI4ZjY2R2xOMUFnKzdQU3VKWXpGOXlsQlRHMmgwZnA5S2U3MW40?=
 =?utf-8?B?eno1WnB4REYxKzgzVm1CMEI5NkRRbFdrU05na1FXTDBrY0ZvMVA0WmNXTXFl?=
 =?utf-8?B?QkN4ZW5zQm51Q1FRSjl4QTRVU3EwT0s2dUh2V0sxTHFERTBtY1J1QkFGT3FN?=
 =?utf-8?B?MG5VQldMYUtsV3BIZlRRdGgvdTJndWV0NVpLR3FRcFpIQ1lzQjJSZG5sQzFj?=
 =?utf-8?B?ZlpVdXl0TTk5dys4MVQ1MmpYZWdjWTRIcWN1ZmwxY1lyMnpUNDJXdk1WcVA3?=
 =?utf-8?B?ZEE3aDQ0bENLdG9jbjE1U09ReDRTWlJzWllzZUFCeWJYdWEwdFVWdlJVc3dR?=
 =?utf-8?B?NmtaY09McVJQWFNxbjU2TTBQelBFUUNZTXBpN0V2cDNnWVZIVzJMYUh2UlhT?=
 =?utf-8?B?dXlsQ0ZtTGxtb05JN0RUb01ySS91ZXp2a2YzQVVMcEJYcnZkQmZMbi9LaDFS?=
 =?utf-8?B?NjdWdFh1cmEzTkc3SVYzbTVDNlp3M3p1a2hyNmtKREJWaFRvY0ltb2lvdC9j?=
 =?utf-8?B?eWNQYkJXb210cVVER3lFUFNSa0g3YXJQM0IwbGt1OEtIb0FrdWZUcFViWFBU?=
 =?utf-8?B?U1lMenp3Y2lKd2M0YlVqeGxlREhQTVR2amNqM2w1c2NyYVBkTndodGhZVXRK?=
 =?utf-8?B?b0wzb0UyUzRUQU1BazRPemVybklvK1NKQUxLcGR6U2VYU21kRGRGYWR4OHp0?=
 =?utf-8?B?a1pSR2hnNzJhQVVacGhOOGIzTnBPZCtnK1RSdEE1SWQycFhpdW1vR2RzWGpr?=
 =?utf-8?Q?7MoTy9XSCcjKuQLijDU3gFFLql8byRelfFD84?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb27e21-44d2-4dd9-5bff-08dee69e636b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 20:35:08.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksavMhpnZKowQkeDKFRGo3LRncvuZ/4idsUtrh49fgcs6tRQHQwd7kWr4FEqgcUMJJaPaVmrxWGZBSvnsEbOZgQLfeJkfc38ol4iAznLXSqqGA02Od2fpfE92SDqB0Jp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10153

On Mon, Jul 20, 2026 at 03:12:17PM -0500, Rob Herring wrote:
> On Mon, Jul 20, 2026 at 1:40 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >
> > Document how Devicetree and Open Firmware maintainers handle their
> > subsystem, especially focusing on two caveats:
> >
> > Devicetree subsystem handles patches with a minor difference comparing
> > to other subsystems: while DT maintainers pick up OF code, they only
> > provide review of DT bindings without applying these.
> >
> > All three DT bindings maintainers rely currently on Patchwork and due to
> > enormous amount of emails per day, regardless how much DT maintainers
> > try, they cannot read all the emails.
> >
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Saravana Kannan <saravanak@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >
> > ---
> >
> > I expect patch to be picked up by Rob, after review.
> >
> > Changes in v3:
> > 1. Add also F: entry
> >
> > Changes in v2:
> > 1. Correct typos and trailing white spaces.
> > 2. Fix order of P: after C: in maintainers.
> > ---
> >  .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
> >  MAINTAINERS                                   |  3 +
> >  2 files changed, 73 insertions(+)
> >  create mode 100644 Documentation/process/maintainer-devicetree.rst
> >
> > diff --git a/Documentation/process/maintainer-devicetree.rst b/Documentation/process/maintainer-devicetree.rst
> > new file mode 100644
> > index 000000000000..d8ffe752bf5d
> > --- /dev/null
> > +++ b/Documentation/process/maintainer-devicetree.rst
> > @@ -0,0 +1,70 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +======================================
> > +Devicetree and Open Firmware Subsystem
> > +======================================
> > +
> > +Other Process Documents
> > +-----------------------
> > +
> > +Please see the documents in Documentation/devicetree/bindings/ for information
> > +on how to write proper Devicetree bindings and how to submit patches.
> > +
> > +Patch Review and Handling
> > +-------------------------
> > +
> > +Patches handled by Devicetree maintainers are processed differently depending
> > +on the patch type:
> > +
> > +1. Core OF driver code, e.g. drivers/of/:
> > +   patches are reviewed and applied by DT maintainers.
> > +
> > +2. Devicetree bindings:
> > +   patches are reviewed by DT maintainers but, except in certain cases, should
> > +   be applied by subsystem maintainers.  See also *For kernel maintainers* in
> > +   Documentation/devicetree/bindings/submitting-patches.rst.
>
> I would reword:
>
> patches are reviewed by DT maintainers, but should be applied by
> subsystem maintainers except in certain cases.

It would be wonderful if provide a few sample *certain* cases.

Anyways, nice document.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> > +
> > +3. DTS and drivers:
> > +   DT maintainers might provide comments, but review is generally not expected.
>
> For DTS, we expect to pass schema checks or at least not add new warnings.
>
> I can address these 2 when applying.
>
> Rob
