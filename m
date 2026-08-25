Received: from esa.hc514-86.ap.iphmx.com (esa.hc514-86.ap.iphmx.com [207.54.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BD43D6662;
	Tue, 25 Aug 2026 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=207.54.83.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651894; cv=fail; b=XRFEJgIatg9dFyo458HAC6CqFIyKXT+g7G0Erl8hes/QWk0VikMrRuM2IjsjokGFENDo6kg+4ZfcMevMUjXB+FR2UYW0aFdOTcfPlhK6HQPGd3WslQzz8AHSM3OgaOr2aB4pbb8ruuFzMKdbyxTDpiSr3/8TS3RAWE0G+dRUMzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651894; c=relaxed/simple;
	bh=Es6YdiCcuV05io5fZ0rSMt4fxC+kpfJdnTNRWnCdaEs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WjrnQ8cTJ8iEtunefcZYRu2Q0ZhprM87xuMGEnk/Y4O1RhuaDmPrSTcNOVK1YmWPeo3C+BHtRVGIOsjGFiDiq+2IdlKpCRarQZUubqGRbGDAdJegOoDpwChUkBwhlOSk0ddGhajyezugyZ1c7t5eIyZl90Nk1QFSVKc3ElvInRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hitachi.com; spf=pass smtp.mailfrom=hitachi.com; dkim=pass (1024-bit key) header.d=hitachi.com header.i=@hitachi.com header.b=udRQbPyf; arc=fail smtp.client-ip=207.54.83.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hitachi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hitachi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hitachi.com header.i=@hitachi.com header.b="udRQbPyf"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=hitachi.com; i=@hitachi.com; q=dns/txt;
  s=hitachi-com-20240118; t=1787651892;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Es6YdiCcuV05io5fZ0rSMt4fxC+kpfJdnTNRWnCdaEs=;
  b=udRQbPyf2qaPxBJ2u++T8HlYPbJr6JONgzwfgq33PKsfFfiVbgyVly4j
   ETTtU7hN8+m+MilUBQ7DwWVUpWatImITB4uIHzhKi0ACXJu9/NuN7dt9W
   5b7KEbIBYzMLhAlcINGI1GnDKEamQzxqaTNrfElOJv+SdFhs8+WHp6do4
   4=;
X-CSE-ConnectionGUID: fblKrMO9R16aiLJ3jH3sVA==
X-CSE-MsgGUID: suWY0jzhSW6+G/jxaH8jTQ==
X-IronPort-AV: E=Sophos;i="6.25,242,1779148800"; 
   d="scan'208";a="509724162"
Received: from unknown (HELO mlsv3.hitachi.co.jp) ([20.18.96.98])
  by ob1.hc514-86.ap.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 09:56:58 +0000
Received: from mfgw13.hitachi.co.jp (unknown [10.178.97.250])
	by mlsv3.hitachi.co.jp (Postfix) with ESMTP id 76D11405F61;
	Tue, 25 Aug 2026 18:56:57 +0900 (JST)
Received: from mrelays03.hybrid.go365.ext.hitachi.co.jp ([133.144.234.40])
	by mfgw13.hitachi.co.jp with ESMTP
	id yntpwF7vcCSkFyntpwY73F; Tue, 25 Aug 2026 18:56:57 +0900
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	by mrelays03.hybrid.go365.ext.hitachi.co.jp (Postfix) with ESMTPS id 65C96113F3D0;
	Tue, 25 Aug 2026 18:56:57 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gizSZvxfv7GrVwsCMYg0hEjC1ri9dVWfJOwc8TdpAs64/KUEenIO+K2dL+UON1EjK5hKQLSBThZ9G5Xx/bnGDA8X8IdFUlxkMszHU3kQCugRzDwnYRwcA7X5qKLP3aqZ+H8jH1M6yXIiKQSEuDT+5AR8cIiuI6rZc/qcx3jZXz31ji+inbiVczHaEEz/zX3mDg7MjcO9ValwSsLgxN4tote6PuJYzegiHK8hINsNK1Jqt4IdATSo9MslQACeju2KyHpoBCtY+1hw8WcDjFWhLcOa4EzFgPAvpAcPAxGeM78ageRFkOFJKhFvpKPwAWuPHxybRLC8tAAt+VrQl/m3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Es6YdiCcuV05io5fZ0rSMt4fxC+kpfJdnTNRWnCdaEs=;
 b=qYYoetzH4IosJiyKecqZaO4Mjf1fuUokoxhpERWgXrqDOvSQsvsVJODaRTmM+0wwL4fJdW1ZuTPBSz1mWH/0iAUuenPTnyxy7AH0TKYgy5iDA85xq1NU3CIMHsRZzWtrXGuR7bL+l0aWsPeJlS957FUR+MWjyk4CzqWRBRDwigqKl8jfGEZPTswfyFwckPFXCmlmkFCKbjS0wkfiSzAh+COR+LZSI9uE2F4Pbl3iHMPPO+efh2syfuLW82A8PXE1pUJHU8CXx+ZALm5HtYhJ1B2eEkPLat0DKxaaQOjltidL4c+jg0b+smWCmkLqPFSZU6VaDRjlF9miv4VzbxKPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachi.com; dmarc=pass action=none header.from=hitachi.com;
 dkim=pass header.d=hitachi.com; arc=none
Received: from TYTPR01MB11045.jpnprd01.prod.outlook.com
 (2603:1096:400:39e::11) by TY4PR01MB17459.jpnprd01.prod.outlook.com
 (2603:1096:405:350::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 09:56:56 +0000
Received: from TYTPR01MB11045.jpnprd01.prod.outlook.com
 ([fe80::b94b:9fae:6de6:d9d2]) by TYTPR01MB11045.jpnprd01.prod.outlook.com
 ([fe80::b94b:9fae:6de6:d9d2%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 09:56:55 +0000
From: =?iso-2022-jp?B?GyRCQWoxOj40GyhCIC8gQUlVUkEbJEIhJBsoQkFLSVJB?=
	<akira.aiura.bj@hitachi.com>
To: Julia Lawall <julia.lawall@inria.fr>
CC: "corbet@lwn.net" <corbet@lwn.net>, "maennich@google.com"
	<maennich@google.com>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "workflows@vger.kernel.org"
	<workflows@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "cocci@inria.fr" <cocci@inria.fr>,
	=?iso-2022-jp?B?GyRCRXswZk0mMnAbKEIgLyBUU1VUU1VJGyRCISQbKEJZVVNVS0U=?=
	<yusuke.tsutsui.gt@hitachi.com>,
	=?iso-2022-jp?B?GyRCMCQ4fUA/O0obKEIgLyBBR1VDSEkbJEIhJBsoQlNFSUpJ?=
	<seiji.aguchi.tr@hitachi.com>,
	=?iso-2022-jp?B?GyRCTFpCPD4tNHUbKEIgLyBLSU1VUkEbJEIhJBsoQk1BU0FLSQ==?=
	<masaki.kimura.kz@hitachi.com>,
	=?iso-2022-jp?B?GyRCQEZGIzJtT0IbKEIgLyBTQUlUT1UbJEIhJBsoQk1BU0FLQVpV?=
	<masakazu.saito.jn@hitachi.com>,
	=?iso-2022-jp?B?GyRCOzNGYkJnT0IbKEIgLyBZQU1BVUNISRskQiEkGyhCSElST0tBWlU=?=
	<hirokazu.yamauchi.hk@hitachi.com>
Subject: RE: Re: [PATCH] coccinelle: update Coccinelle website URL
Thread-Topic: [!]Re: [PATCH] coccinelle: update Coccinelle website URL
Thread-Index: Ad0fy7BG9rkZXOC8T/as5IN/IogPpgAHGdUABR4WFHA=
Date: Tue, 25 Aug 2026 09:56:55 +0000
Message-ID:
 <TYTPR01MB11045DA2A325E2C3C7A27F1E4D5AF2@TYTPR01MB11045.jpnprd01.prod.outlook.com>
References:
 <TYTPR01MB1104567F06F7DA6B366C264A9D5C92@TYTPR01MB11045.jpnprd01.prod.outlook.com>
 <c511e35e-ded-839c-c2e9-6774e2e5ac0@inria.fr>
In-Reply-To: <c511e35e-ded-839c-c2e9-6774e2e5ac0@inria.fr>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYTPR01MB11045:EE_|TY4PR01MB17459:EE_
x-ms-office365-filtering-correlation-id: 3ac5aa64-69ca-4cdc-6a6e-08df028f320e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 7XF7GvmTUiv7n4qFqzGRtFJZ4zKbu1ha0FFSHL65DFzbzQnEVZa6KBxC9bNyc4QuImYQGPkC0ARdEwAVG8VKw9l5aL5Br0UthiQuxhkVzO08ag04Fe5wWRxP0tDGBvCi2A8ktLgt71Cjg1FOViGzYUVAoIazlgZ5+Qy/DoS3WLw4hHXXbz3+gIBmeL9754nKjr1PcPqjCotm6acLKh8Zz+YtPzmoGs/iOUyZGt/M2v5KhLaxtAT4Fg8HGvUAsGUvW1IeJVH0zDbrWxNJ9ZbAZQgMUD2jpplvkZHeniX9Vpds22UA3ZWy9y/nRDwgxY2IfmnU1PIM5Vr+IPH6Y6jbP1SXnliMYjYoLx5nE/coIR1k1LYgGplnHs+60RaRcT4ajDk/8L3yas7b3DEO0PgRF+7mMBqxatAaZA47IkG+O43881wLAXbvui3Rc7XWbQdx6RtEjbix2lPEGmhu//TIdQmaldmph/H7CMS7jbhAOIKP7Orkt3rdjalWlmbTtqlbylAADkuUCPdmBrdYjZeIktDy8zo/z5ahZ9a0mJEIi6vETOHfCTsO+GhjqHi1nATAIWu0p8jB59ypE4gwuwxvv0BXsLFrkUzQmsqSVj099x+ZwhCpyeAOu+BeCoPuJdDKTuqsMhApf96yXRhWJdDMNq2kvaskglDy5Dwh0wQptKQwyiU41aGqsWR3R+pcVGyoriV7Nkuc5QwZv1Y+FnEB/kMeArWvUo45RTcUVfuwKok=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYTPR01MB11045.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?dVhERlBkK1RhTXVJMmRMKzh2UGR2U1k5MjZvcnI4TkVKUW5icENWWFNE?=
 =?iso-2022-jp?B?QWphRE81c1lJSUZnSlB6bUIyRmlDRjMwN1JRTzlqY3QzSWxXNXBPYndP?=
 =?iso-2022-jp?B?Q3B3WjFEa001enVWdi9vQ1hjbDJRUEpoL05kWDVnK1lwQS9NeWVtUURl?=
 =?iso-2022-jp?B?bVVyZC9yYzV2NWhFeTlIbEtoU3VkQ3dyeVpMd0Q5N2c3Q2lDaEhxak1n?=
 =?iso-2022-jp?B?Qk0wbVBtU1FjUExxMnE2SVVHMHB5aWRUUTMyTjVTNjVaNEZtaHh5cXlv?=
 =?iso-2022-jp?B?WVNUYkd2M1ZCSk9BTnh5WGF0Mk5OVmt4OW53NGxBWTROdTRhV3NnMnQx?=
 =?iso-2022-jp?B?Yk80R3p6bEtzbmc5VmNHZTVhTURSNStabTZWUUhrMkdna3VPQk9mMDlM?=
 =?iso-2022-jp?B?ZVRSL2FKcE1XTkVzTnNnL2k1bkYyME55aDRJZFd5djZEelBvUkIzcURy?=
 =?iso-2022-jp?B?cXJpcU00enZiSzNpVUJVRlBKZkJMVjIxMlYrVEtLYkJ0V1MzVCtROHp4?=
 =?iso-2022-jp?B?QkdzRm9YZUREaHRvUXdJUW5lcXY5VWs5bTBNaVAxLzlvOUdxbEE0a2ZU?=
 =?iso-2022-jp?B?MGdidHUva1o4WFRlL1FNQ0tLL3hOYUx4cFFndmhlSHhpR0dONy9YMDZX?=
 =?iso-2022-jp?B?d2FGMC9RYmJ5bVFURUhxV0M2WTF2cUcvTFlMSmhQUXY0SlRzTXV3L3ll?=
 =?iso-2022-jp?B?UGN1eTEzSi9QWTNtWGZWTTIvdUNkNWordFRYWC9zWnJmc1hHa0xxUDJV?=
 =?iso-2022-jp?B?QXJyNndEWHRWWEc1eHlpM1hkYlhJRWdpSy91NzJGcU1IalRlZStkOFRV?=
 =?iso-2022-jp?B?UWpFYmhlRVJIaFBsWGphU0c1Mk9vSGNLNDd0a2hMeDJ0UWFNcUhLTjhB?=
 =?iso-2022-jp?B?d3VBWjR2VlQxZzRpQzVVOTlCWit6cXRIRHorcW5Ma3AxMGFXWHJ2MW9X?=
 =?iso-2022-jp?B?bFFySDNsQUw5SWtYdjFjbVJ6VnpEbWV1My9WdS9vOG5NT2xTZ3MxYSsx?=
 =?iso-2022-jp?B?N3Fuc0VqWUx4aitZNU1VSmNOeVF5cFNtRGhBMmlBYktXRXVLMElIekNE?=
 =?iso-2022-jp?B?azZIaXgvZlhLSzQwUi9vYjdjcWZFbWpQTFA2dWZrK3UwN0hMNWNYOVAr?=
 =?iso-2022-jp?B?d05Zd2dGY1lqeUkyb0llSnh4ZTQyVkZLZFBnT3FJbGRaK09mUXFiQzRP?=
 =?iso-2022-jp?B?eUFJd1NpTXY1VnAyN0praURjRk9TNEp4M0hHSXc3ZS82VVpCbFZFRDFO?=
 =?iso-2022-jp?B?SVVVQWV4MjVhK0xzSjdSQU8zOVc0aHB0a2pLWVVwKzBnWUVOeFR3Qkoz?=
 =?iso-2022-jp?B?WGdaY2RpWlpCbUtFb2FIZHY1MWdVRXkvT2lBbXZCdVNtL1dEQW1IcENh?=
 =?iso-2022-jp?B?ditnOTdDUVBOMkhnclRpWUV0c2ZmdWtaWnQ4SzgvTVBHNCt6YzlmNS9G?=
 =?iso-2022-jp?B?UExuSWsybEF2Tkdkd0xzWWkxQnl2cFN3NTJpdGtsRlJ5Tm1oZ2orb0hr?=
 =?iso-2022-jp?B?ZmwvSWZ2djVzamZOcEZlQjg0Z1QxSXVwWnFDRGNRRDU4ZE5YWXl2bmtH?=
 =?iso-2022-jp?B?L3lzWUlKdFJQNmVMeW9UNDEyQjRLdTlOWjQwaHZvdVV4NGxsNDNmc3RH?=
 =?iso-2022-jp?B?eDdqNkZ5WmNtMUdvL1NUQ0d1RkV6MUdpZU45V2hubjEyNzFOTTIxR0Yy?=
 =?iso-2022-jp?B?d1EyN1pTVXJublpvWWRuVTdYbWx3R3ZRWkRJdWtmSHhsWGJ6ZkcxNTFo?=
 =?iso-2022-jp?B?QmcweTh3VmgrOEJKai9DaU1lcVNrYVVqUGEySnF5Z09OTlNEN1UrZlY4?=
 =?iso-2022-jp?B?eDQxSnZvdnYzcWNlNU1NaWNPT3Rxc3M0c2lHcG91RXk4M0I2bytzQlhj?=
 =?iso-2022-jp?B?QmNYb04yL0dKV3UvajVNVjhNVkNJNDV5SHRLQWFLYjZBUWlaQllNUGY0?=
 =?iso-2022-jp?B?TVdOYVlVZkFVa3MzN29CbHRrcXV0dFdOQmNLR0c2VFd5L2pjT2djaTV4?=
 =?iso-2022-jp?B?Q210WVdJR2o5Qkt2dVFTeENmRGU3R05qWWJiejVpYUdBbEdOVmhZdDBP?=
 =?iso-2022-jp?B?SWQ2Y3FJenhYNXk2SkgrMjI4NGZLaVduTGxwek95bXVMWjBtYUFWMksx?=
 =?iso-2022-jp?B?TU14bGpiZ1ZEMVcxdXkvTW5sSFptZktDNDZIbGVnMUpZa2pab25GNGc5?=
 =?iso-2022-jp?B?TmNTMW54QlN4eUM1MkR5dVV6bnJtd1c0dlorQ1ErZDFnQ2pLdy83N2w3?=
 =?iso-2022-jp?B?K1cxVGcxbGdiZmN1S1ZxOUlHR3pEOVB6RkZjNlBKejdpQndhazJ5SWg1?=
 =?iso-2022-jp?B?dG53TVpqTkdFOS9raDg2eVphZ3dPRzlnbkxXUFFZcFVGYzlXRFRhNmhV?=
 =?iso-2022-jp?B?YWpWQWV3bEJ0MDFKS1o1K3pOcE95MVd2S1BZNXlXTWdmSFAxQXVsLzNZ?=
 =?iso-2022-jp?B?SEdXRjdCRGVoVjJJQ1FCMEtjYVkvRE01b2Y4MkpTNWlQSDF6WmNGWUFq?=
 =?iso-2022-jp?B?WitndzIvL0dubmFlNlhxV0l6WGdlUzRyN3VzQT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	fgtGgog6fFD0r0qfCxrp9YF9ky9lOhflQMJLyHRB/FjhV3if0HoWsmSAynIBTWpdYxnnBbkzBMsuweb+4UueK0OtV2WTyFNZ6a5RzCapob0btk2TajlwTP/2f/V1Q67UNoZhUfOaRQT6B6P9oOuknI1FWUGxze/QEUQBfl7YNPCo6W8lKUPyV/OVj07dGG6WHp574tyTdF8MqEJeJBRESR4QLpFa/waezXXuRmTPnLATrqnrPlVkatrc/RvRTVHXPGDsErJm0ZoOyONRX8bh+J3EyQ+Fz3aPUFMVKW8vWSwgKiSGKRyfl23P2PIgjW8UqV/zl9iBx3UVpM4ZyIj+4w==
X-OriginatorOrg: hitachi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYTPR01MB11045.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac5aa64-69ca-4cdc-6a6e-08df028f320e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 09:56:55.2697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f54277c9-dafe-44aa-85a4-73d5c7c52450
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /JuCiG/ltvjM7SKWmxI1B+7MdIy207PnmXw6i12FFxap15zS9ULtuE1hEsC1oCJSq1ztA9oBIEYVYnPUrDYVXKZzy2+iwL/Q4uXrUQ/c2A0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17459

Thank you for confirming.

I will close this case.

