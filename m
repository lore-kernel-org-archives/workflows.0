Received: from esa.hc514-86.ap.iphmx.com (esa.hc514-86.ap.iphmx.com [139.138.45.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D81129A9C3;
	Thu, 30 Jul 2026 02:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.138.45.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379196; cv=fail; b=iz6qRIuyrcTLOgZFlZSBPyj0xK5KKxjX0DztfZa7FLygF2Bj2e9RjEVElcgavIGxYR6cgQ0oAttC4AtOA8VEblrak4KtjWhMuAM8mDk6vrR/OhAknKGC85ORTWuxD1Gy7oQw7vw8h+XF/XJvYxmFLPnRc4VqFc9GEXx1qKCfgDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379196; c=relaxed/simple;
	bh=byokkB8cs3SjKI9g0sRw+98hvr6jaVj9zqUain5zAns=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FsLxc0lw+wxaUURdN4YXmgor4G8E6H0hQZTTLcoS5VU+MROYd5Yg9/V4BH6fzeyEMnUXWXiI1i7pWCuxHk7HhVayU/EbobLWNUoHN5Gmne9tKkirEk+0dGSqh3YIQ/JF6FteegflepzpeyWzZSRxWTECpM6Tnik57vmfamzETC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hitachi.com; spf=pass smtp.mailfrom=hitachi.com; dkim=pass (1024-bit key) header.d=hitachi.com header.i=@hitachi.com header.b=jVG2PWh0; arc=fail smtp.client-ip=139.138.45.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hitachi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hitachi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hitachi.com header.i=@hitachi.com header.b="jVG2PWh0"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=hitachi.com; i=@hitachi.com; q=dns/txt;
  s=hitachi-com-20240118; t=1785379194;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=byokkB8cs3SjKI9g0sRw+98hvr6jaVj9zqUain5zAns=;
  b=jVG2PWh0IK7sb3L/Szs0FfoqNleqDJdjihbGZtLLv1pzrabFvIkP+fVR
   NLXfW1qGDE7Wn8mfJL0/v2IPkp633nTsEe4/wwmmeqTbP1F9b+FZVcLfK
   hZpoAZ4IaLKbqtkGkt7tIhp3TSM3781fUUYN2VXY8MhMx9XajifU2lRBE
   8=;
X-CSE-ConnectionGUID: nFyvmP0LTL6HyW8EyhwNjA==
X-CSE-MsgGUID: mCNtM39nR+q4uekC6jIHgw==
X-IronPort-AV: E=Sophos;i="6.25,193,1779148800"; 
   d="scan'208";a="510895461"
Received: from unknown (HELO mlsv2.hitachi.co.jp) ([20.18.96.99])
  by ob1.hc514-86.ap.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 02:38:42 +0000
Received: from mfgw13.hitachi.co.jp (unknown [10.178.97.250])
	by mlsv2.hitachi.co.jp (Postfix) with ESMTP id D6AA44056D5;
	Thu, 30 Jul 2026 11:38:41 +0900 (JST)
Received: from mrelays02.hybrid.go365.ext.hitachi.co.jp ([133.144.234.40])
	by mfgw13.hitachi.co.jp with ESMTP
	id pGfRwTgj9CSkFpGfRw6w3a; Thu, 30 Jul 2026 11:38:41 +0900
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	by mrelays02.hybrid.go365.ext.hitachi.co.jp (Postfix) with ESMTPS id CA923113EFB7;
	Thu, 30 Jul 2026 11:38:41 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoTZcg3gzjYfi0r2IyrgC/JTElru6Gqbu6SOhUmvfcAFEPGML4GmqJIEgqHjSNcgRGMNxF+k4fmNBCfLpmE5OYemn4MMJKMIRCY4nI93VsTrFkPukYh40ZaqbUne8Yhhmu4fF8Ahu5ehbjnM4bUq6eGxan+m8wIejvWgsQXS75rIuxZ5s6Aoy6DPgnnneIBhlGdSXoU6Wug4XIVA5JtBBmmFwwRqKImtL7JjH7rpu85Jxq+V8+zO/CImBHsrX7l8cr5lTbVf7PmMosB2WxPVWRHH5enG0VbXF4E5W2A/1otOos+tG6fMfyG/3ApDdeGuiXcjen50nJwAZLuW9SS+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JptirdMqlbdDJ7rgFiYoYIZy+neMG45zkKTv34eVFW0=;
 b=pIneunH68FWRsDVEtTBWwt/Wpzyppu6cbbVvI3u5wtxXL6gkxOuraYGkfc0xC0fQ0xANJKR7l8ZMquk20vsvVd1PfMNAx1vOeBwouMwg6/ImNEfefc7VFbQlVflg2snfgvmC/LeGYCIEEsCiVsYr4Cs7jCesmYPYteBXjuOiblUl6wAFQa6j+4qugKwG0Rr+ZgmgbyqYtfHpEURGWaysu06qrtipIuSu9xty7NMcf01+Xe9+0p1Uh9YUIHRzbC+korNBzMjMWrK1dV3HoabvFxVC6e48D3sRKspQmC0g2l/W3g4ppsm+H5mmrzCAFVA9NxgSJevGxnkn87bDxTWeuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachi.com; dmarc=pass action=none header.from=hitachi.com;
 dkim=pass header.d=hitachi.com; arc=none
Received: from TYTPR01MB11045.jpnprd01.prod.outlook.com
 (2603:1096:400:39e::11) by TYCPR01MB7137.jpnprd01.prod.outlook.com
 (2603:1096:400:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 02:38:40 +0000
Received: from TYTPR01MB11045.jpnprd01.prod.outlook.com
 ([fe80::b94b:9fae:6de6:d9d2]) by TYTPR01MB11045.jpnprd01.prod.outlook.com
 ([fe80::b94b:9fae:6de6:d9d2%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 02:38:40 +0000
From: =?iso-2022-jp?B?GyRCQWoxOj40GyhCIC8gQUlVUkEbJEIhJBsoQkFLSVJB?=
	<akira.aiura.bj@hitachi.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "Julia.Lawall@inria.fr"
	<Julia.Lawall@inria.fr>, "nicolas.palix@imag.fr" <nicolas.palix@imag.fr>,
	"maennich@google.com" <maennich@google.com>
CC: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"workflows@vger.kernel.org" <workflows@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cocci@inria.fr" <cocci@inria.fr>,
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
Subject: [PATCH] coccinelle: update Coccinelle website URL
Thread-Topic: [PATCH] coccinelle: update Coccinelle website URL
Thread-Index: Ad0fy7BG9rkZXOC8T/as5IN/IogPpg==
Date: Thu, 30 Jul 2026 02:38:40 +0000
Message-ID:
 <TYTPR01MB1104567F06F7DA6B366C264A9D5C92@TYTPR01MB11045.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYTPR01MB11045:EE_|TYCPR01MB7137:EE_
x-ms-office365-filtering-correlation-id: 8af882eb-3dab-4dc2-086f-08deede3aa39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|6133799003|56012099006|18002099003|38070700021|13003099007;
x-microsoft-antispam-message-info:
 1VkoaSTHKnrTrPcFPBnI8+fwNz5afkaUsACuIoKUVDeAH07nA1saV4zGUVpbpTo2MWE2MJn1NhG3YilQDUsE73edBtkmeiL5iEHbWFdsTBfk1MxFzoM5bz33OdWTR80mOEN5z8an6Bx+VgnGB9Bf+fufpU4rUnUe5xAcJtHHjUxgfvGg+Ml5Epir9MoicCnn2ACZWuh8NB+13aPKvmkl5eFo22PKawd6NioGA34cVwFX3m1T89eDgfyx1Cu1FTT5VhmC9F+2BYBeSzNJRYr2H2cc3NZkzgjNhkhcMEXi+ApiXLMOYh/SRytct0Jf0bjVVREE5QIO5zSht3xWzOXBC919xRH4B1w9Gs+k/1odvJ5lf7sfSdJUnkGCTqMkb3c+ixUqt8q5Zsx/q1TZhqgk1hm46Mi+Ja+W2EJNgH2ainFcMJrRYKj2wFThwJpXcpp4VCEnAW+kpy8cW4kzgjwG+YS2WWY0/ijud29Ry08WZvsA/bgDnGoXuTfmoCZ8DlMN9dgjLINOU1kFnNTRHLwcTPZHwyh6WD85bGAmxgYuGsUDnHRjwTmI9x7u9xY6+biHQZ2bp37R6TegTDs/tZ+AtM2yl8lfV0Mni4QcHxML/cOuLhcMJO4JlrZYWMHWkFoIRu+agoNReY7mpnc1TNqLFsmF66Ay8VxqTIJNe3eZpAc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYTPR01MB11045.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?aXdYZ2tGVWhxL0JHYm1lYWsvaHlwU2ptSG8vTUtlM1pReExWNjBXSmww?=
 =?iso-2022-jp?B?L21YdnFVZ05TSEJvWUZQRWJPMzFJV3hJRWJ4N2hPekZjckQzWVZidnpN?=
 =?iso-2022-jp?B?OHlLWmxoNTNpU09iS2N5cjRYQTNhNmVEVXh2NzdqRkFEMWd6a1VVOW5o?=
 =?iso-2022-jp?B?UTV0MU9PQVlvV3kyclFIeFU3WXZJRDBIdTBVS1BpSCs1WHc5bTRPYWRB?=
 =?iso-2022-jp?B?Rm9WeWkyZ1FOZzUzWlVuTFh3OElBSmRtMzgwNnZLWHh2NVJFaWNURFp5?=
 =?iso-2022-jp?B?aXk5NXJDSkFlNzREbkFkZk8vT2Nzd2RiZ3V5RVFEVjJCdzMvWE16UTAv?=
 =?iso-2022-jp?B?NS9BNGhkT0MrRFRrcDF1cWM0LzhLSDk4bzV3UGFlS3lCRnVUUm5Qaito?=
 =?iso-2022-jp?B?VDVJcXFucTBUYTU0eU9TUFp5RVdjZU1kY2FkSWh3QkVkT2cvcHE3bnIz?=
 =?iso-2022-jp?B?V0hEblBxTjhZRkU2SHQrNGNnMUJMekNTNXRrdzNFQ2FSRytEN0l2R3BK?=
 =?iso-2022-jp?B?Sk5wRTFyUVlhOGtoQjJ4TnRLd21xcUJ2UHpNOUloL3ZITlpQNVJRNTk4?=
 =?iso-2022-jp?B?bkJGbXRjNVdLYmpLSXRYYkRONExwU3ZTMTZnODJ2ZmhNVWtPYU5aR0gv?=
 =?iso-2022-jp?B?dHk0bGZOWDFTZ1lVMnBOL3RBN28wd1N2K3pKZS8rUi95TWlZYjZvcDMv?=
 =?iso-2022-jp?B?TnlPKzM4N1RhbVZsbUErWVQ2SEpNd1piNldSdlNPZmR5UWt1Zi9ESjg1?=
 =?iso-2022-jp?B?c2orZHZaWVdCajdiZjR5QXEyZFQxejE3NnVPUDBUd1Y1ODZ1ZjNheTVy?=
 =?iso-2022-jp?B?cEFwWklmZ0d1V0w2M1NlM2l3V083VWdTaVVQNXVnTWoxQ09BaytBU0pR?=
 =?iso-2022-jp?B?ZHZmK3MrN0dmTTR1K29mNzdKUXBrVUdUTG01R0NSRFp6VEJGbUNyWTdL?=
 =?iso-2022-jp?B?VDlOMVNCZHpBbVRTekRycy9HTmRQeEVOVFpYY3BSdFBDcXpidXQ1N3lj?=
 =?iso-2022-jp?B?K1pDOW1JbUhnMUNtTHhXS3ZPU2NNTW9ZYklpKzJhNlJtQVBqbGRGM0Mz?=
 =?iso-2022-jp?B?WmdFbFFTRVJrdU9HTGZRSGptYVhWVGxmWDFOTDRhVExiaVY4cEVDVkcy?=
 =?iso-2022-jp?B?bEJEaDA3MFQzaGpXc3NCdFJUbnlsLzU2c0Q4bURHcUVxcDBkdXp6aXJJ?=
 =?iso-2022-jp?B?SmNjb1hRS3BMUzhSL3JRbnkrNW1kTm50SWRmd09ydTZTemxobVQyS2Ri?=
 =?iso-2022-jp?B?QzMwamgyOVozY1FHNXRndGl3OU9pK1BremJxRk5LWWdEZC9mNFR0Q3Ny?=
 =?iso-2022-jp?B?VktBek03N3FEaW9RcjhzelJjYnFPeTAyNGpjS0hkbm5ieUdYWVdqTkF5?=
 =?iso-2022-jp?B?V285QVJQdGNNSW4zL0JpaC85cCtseUJSajhXU21kK2xTRUUwZmxXZTJX?=
 =?iso-2022-jp?B?OVFLcmlEZmdaRytsQUR0Vm5Ud083Uk1NR3dKSktpdnpYK2I4cFhlRjFu?=
 =?iso-2022-jp?B?TlMyeVlGZzVGclFqT1R1UXJzWjQzTGhsalNMbG1lbGF2dnNJTG8wS0Jl?=
 =?iso-2022-jp?B?a0p1MFNxWE1RMmJmZ2Vlb0tlSnlHdENRTWI2OEloUloyeUEvbWtLT1Q4?=
 =?iso-2022-jp?B?SWtXVGZKbklrMEZMV1BFVStnU25KTVpFV0JsdGhzZ0FYL0FpRW8zRGY5?=
 =?iso-2022-jp?B?Z29BU3doSCs0ZEZyUEloeGVHSmlwS0JxdmE3TC8yd3NHVmc2M1BxWCtj?=
 =?iso-2022-jp?B?ZlA1ZkhVMmpOeURJbW5RQWZXMWpseDlKMktIVlQ3bGN3SmtuOTRjNTkv?=
 =?iso-2022-jp?B?ay92WXE1cHR2QWlHeWU2VU41TWM3QXhGWWhLdU5WWTBmUHpQOVhvZkFo?=
 =?iso-2022-jp?B?cGhuYmF0WmJCU1I5WXkxRWNFSU4rSENmLy83aDMxM0tsZ1VkV20vaWtO?=
 =?iso-2022-jp?B?TEYrcyswaHFzWW0vSFVId0xkc3o2NzJJOHJraXBLa3U0OTZZN09xVnVV?=
 =?iso-2022-jp?B?WUVIb2NYMks0dHBvd2IzczFqZzFuMnNyQkFEZ1lCVURWaEFTUk9PUTZD?=
 =?iso-2022-jp?B?SkZ6YzI3SFhvNGFxWXh4d2paaW1pTitqSUk3aTU3c2tkK05IVm1qdzdo?=
 =?iso-2022-jp?B?U1VmeTRWeUVVWEZKTzh4YXM1RWx0UkR1Z1VHQ2hvbjcrOHlnNzBIanNG?=
 =?iso-2022-jp?B?V1IwbXIyeTA4Q0tIOUpaZUhPUnA5dEliOEkycENHbjZrWldNaG1jNWpS?=
 =?iso-2022-jp?B?TnZEczZMcTNuWm53TUxJL29zQUlCcVBQc0hhcjJ3Y1VQZFV2YkN0M0ZW?=
 =?iso-2022-jp?B?TXFLMlpNOFl4S3RGM2dEbERMMGxMUlBtVUExazQ5cUgvU1llZVp0SE54?=
 =?iso-2022-jp?B?V2hiUExNS09HS21CVit2cTNObDlnZFRtU0pPbUFwam56NXpVOWJUZm0r?=
 =?iso-2022-jp?B?TDRyMFpUbmZDcUFCV3dLdlJ0ZE1xeEl0ZnFQb3dDZE9IRWxIbEdJMmpq?=
 =?iso-2022-jp?B?dkF0MUdGMlJNUWhtbTRsSXRSQVAyYVYxWlVQUT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Qx0KCkIqYPpNZihf+7xiM0mRqOMkZ77v+PML1/wHU1xZj43g/i6uLIB3+yeNfG5f7nRqq3IMq7hfDlk+x1/WVXZYUUu14gcZrFOcIrlT7ua9jPjNNcajUZg/Jp/gJbhM5mO6qv7EeBg/d2NDGeXhtiEmeNSiG81//hGcpwPqXD0nIAAnRNdHgPO4xxwFXQzpHiY6WRtLalYYTY4E8rgHv17a9rCx6Ye1phgoH0jdkgZ8H4qTaKMnMruNL2+3FmnPUPzOgGGlLfogDEqmL9eTdZHo7OP4u1+m2dKiz4LCyHsDU6t6iTMI4QALM9iCb8UJLqfydCjawHekNOSTko/jwA==
X-OriginatorOrg: hitachi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYTPR01MB11045.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af882eb-3dab-4dc2-086f-08deede3aa39
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 02:38:40.1908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f54277c9-dafe-44aa-85a4-73d5c7c52450
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gWqO/SoNDA3m7YUwfisWw+uzilbQN1F0TlGvLWyGxbtCuwESwRQkIEcn8o1P4rLQgEn86qODGJhOTECkS7gWhT8QAiIsR74e4yzvRY93/Fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7137


The old Coccinelle project URL is no longer available. Replace it with
the current Coccinelle homepage already referenced by
Documentation/dev-tools/coccinelle.rst.

Signed-off-by: Akira Aiura <akira.aiura.bj@hitachi.com>
---
 Documentation/process/4.Coding.rst | 3 ++-
 scripts/coccicheck                 | 4 ++--
 scripts/nsdeps                     | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/4.Coding.rst b/Documentation/process/4.C=
oding.rst
index c0f57d0c4f73..c23b9e48ce49 100644
--- a/Documentation/process/4.Coding.rst
+++ b/Documentation/process/4.Coding.rst
@@ -312,7 +312,8 @@ be found at https://sparse.wiki.kernel.org/index.php/Ma=
in_Page if your
 distributor does not package it); it can then be run on the code by adding
 "C=3D1" to your make command.
=20
-The "Coccinelle" tool (http://coccinelle.lip6.fr/) is able to find a wide
+The "Coccinelle" tool
+(https://coccinelle.gitlabpages.inria.fr/website) is able to find a wide
 variety of potential coding problems; it can also propose fixes for those
 problems.  Quite a few "semantic patches" for the kernel have been package=
d
 under the scripts/coccinelle directory; running "make coccicheck" will run
diff --git a/scripts/coccicheck b/scripts/coccicheck
index 8dd766009de1..a0a0e0f72bc7 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -11,7 +11,7 @@ DIR=3D"$(dirname $(readlink -f $0))/.."
 SPATCH=3D"`which ${SPATCH:=3Dspatch}`"
=20
 if [ ! -x "$SPATCH" ]; then
-    echo 'spatch is part of the Coccinelle project and is available at htt=
p://coccinelle.lip6.fr/'
+    echo 'spatch is part of the Coccinelle project and is available at htt=
ps://coccinelle.gitlabpages.inria.fr/website'
     exit 1
 fi
=20
@@ -229,7 +229,7 @@ coccinelle () {
 	echo " in $FILE."
 	echo ''
 	echo ' More information about semantic patching is available at'
-	echo ' http://coccinelle.lip6.fr/'
+	echo ' https://coccinelle.gitlabpages.inria.fr/website'
 	echo ''
=20
 	if [ "`sed -ne 's|^//#||p' $COCCI`" ] ; then
diff --git a/scripts/nsdeps b/scripts/nsdeps
index a3372166ac01..d4b5ebcc2016 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -8,7 +8,7 @@ SPATCH_REQ_VERSION=3D"1.0.4"
 DIR=3D"$(dirname $(readlink -f $0))/.."
 SPATCH=3D"`which ${SPATCH:=3Dspatch}`"
 if [ ! -x "$SPATCH" ]; then
-	echo 'spatch is part of the Coccinelle project and is available at http:/=
/coccinelle.lip6.fr/'
+	echo 'spatch is part of the Coccinelle project and is available at https:=
//coccinelle.gitlabpages.inria.fr/website'
 	exit 1
 fi
=20
--=20
2.53.0

