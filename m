Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B20283FC3;
	Fri,  9 Jan 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972936; cv=fail; b=aYnAw6+sGm8uiPH2jQpHTRGzEWcwnvGfYk0pDDiQYvMsSKdtSb+DrDUZTwqoTokLhvS8b6pBA1atBT9cEPnK5XZ3rCJjdC62B42ZrV/UQpe3PeXqKO0IsoO5PSNgWhJShY9H6tjtXJX1rHV4mcjcJLcZjBHTt4eVS+dHmnEwxa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972936; c=relaxed/simple;
	bh=5V8kljJumnhWqigrc2jQphbl6ZK8gDbyGTKWlqKvUf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cR5P1ULg6tXc74SPVST4B1SPtTCr9i/ecBPDa4bTWSiJD+DS38GesITJk2SWyxRT5GmaSoY3agi2JDgJ5mQ0uR3l/ZSqOiMwb4dE4iuSfibRsAXLHKawDJTpPGU4SVOyFTUzwiYH6GHBy62gaR+Lg80uyLGrKvho/Q5mXksR8/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RT4Gknm2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EnLRcFz0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RT4Gknm2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EnLRcFz0"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609FAU2n3316693;
	Fri, 9 Jan 2026 15:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=93PevK/VQ/RNZl5jun
	nZV05McbnixfsKSjCZOjDUpLw=; b=RT4Gknm28jD4pkfQCHmw47RPsgUgMePWb6
	/Q9B8wyoDBsWdY3DwAdybABzRmq9RFWpmWTJIOneWiP2F8Mb+1R+e1MR88ZG4Au3
	OzGO1qaaRMlyAfK1MMDNgQHpXPruUOfSi+2KjomqFAVKPKVRDcsRxsAdVQGUow19
	8k1gKraZOc8o97IosiwvyH3sskNIGRjF1y1YZnRotrVkkPH19tzXPwHnVqBC+h/c
	E2fm2VtiBYhW3yg1IJMxwsxh6bP3mrwnV+cj2GVSYH9wzxw4Cwaa/crJ6XwTmwR9
	xVvj7/VUZ5GKnPH7hozEMGZXaXEGp2YIFi6Kmstubdb8573y/0BQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bk438016u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 15:35:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 609EK9Sq034042;
	Fri, 9 Jan 2026 15:35:15 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjcfj43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 15:35:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgzGEKfAllB3X/iDyqTbxX0bcQMprJcrm0xKrJorJNX/P9/C1QmWDXTw/K1XCVHMlTkf59tRmBKgkfxONKHMsf0uAL68HZGiMXTlFgwzGuwGyoapiMT3EnsAPj804ESKCgN9L69GRJFFTSSmpcfjH6fW/1xo9tGeN/pTCzLmahWvEEpQyy192aAGH780N8f2cde7nPm5oa0rHapYIf4LxwBzcvK2GWpFLqHDJRwmyq3EdGNSh6+QPzmgOGPmPTo/OhScLapQDsSjv7NWLQn0DH5yx/bhlaKxqs3DLUZWfBnfEgVQjDIu6nqxmJab8wov7vdKiMo9wsPketIlsqVYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93PevK/VQ/RNZl5junnZV05McbnixfsKSjCZOjDUpLw=;
 b=Wbp5KhxnSAOAKUV/YXsWKV5cU7m37oAHFg+KDsMW6VVGSMbINVnYtX0+mLiVOziwth/gYWG7QBjBkXv5iUhvpcOr0Tpxu0rki4t/JHZfmVH9wTgvegLMVUFl19V2NAYqiYN0hBxwfy2p0egVFWRwYX5bxMc74XfQP8Ue8syhJy09Fxeg7YkvcsmFV3Lc3a6I00Spa4aNDf0L1RWXICOF9KYsu6OENwa8Igclw/7t7hVopQ8EpacT6uu10EE2qURijtF9ZW2MkS5zjJX0filWvXuZw3YMi/zAGhT9guRv+KRMmhVaMeCFGq7vRsYjGtm0FkMj0XPTTxej+J+zwCjQZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93PevK/VQ/RNZl5junnZV05McbnixfsKSjCZOjDUpLw=;
 b=EnLRcFz031q2l7nO2DaMRVdhZy0sG4nkjbMLfjXp92S8OIXOfxAenOHsX9iFlkAbz2bthhX3Wy+1xZjqRGY5SZVQnt2DMqd0513oCGXyCFMbjVqU5I/VPvwE3RMVnFfJGkUnOGjasaCfpq1y41RA2Ow4l2VinExo+MLCjUHpQcg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB8095.namprd10.prod.outlook.com (2603:10b6:208:4ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 15:35:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 15:35:13 +0000
Date: Fri, 9 Jan 2026 15:35:12 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Dave Hansen <dave@sr71.net>,
        Dave Hansen <dave.hansen@intel.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        NeilBrown <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>,
        Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
        ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <2428ab19-c134-4ee1-b7ef-01710d1e528c@lucifer.local>
References: <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
 <20260108151437.3188cd53@gandalf.local.home>
 <aWCVYLuUFZrsbfd-@stanley.mountain>
 <de260c56-d3dd-449c-b5af-4d85b268f90c@lucifer.local>
 <20260109102846.3feeb36a@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109102846.3feeb36a@gandalf.local.home>
X-ClientProxiedBy: LO4P123CA0171.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: a72efef5-8936-4a4a-48b5-08de4f94ae44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nZCHSn6ONqcQlwsN/qn6JXVN/eukoFDTCYnw7oh1VT8dKp1mwETSCjJhjYO8?=
 =?us-ascii?Q?tPOj86OwJYo83RUyteK1Sj+f2QziuKLjnlHDtB0KoacczaYSpL5ikQCWeK2L?=
 =?us-ascii?Q?DxW5Hzzc6rVVg4euuMseL+ZVsiC1ufqOWlCuYPODq9Zeh0+E9k3h5crX17JQ?=
 =?us-ascii?Q?OXONNohDi//UztGjmVgj+RmGmRW3Fa5Cs6GKF3fOJQKnmOBreZC9w0KO4SEV?=
 =?us-ascii?Q?Vo69BBHZsjF6w0yDl1nOKKhnZBAqyOFbIfUDSm/hYI5GYvIs/YZHEVF3hB2w?=
 =?us-ascii?Q?4hCmKSWI4Wk06ay+SocjCwiMG01xK/E/8tvnTAJOFR8/GPZPRoT2QInYk2U4?=
 =?us-ascii?Q?B2ZrRk32mb7IbAfHvIXnX/dfjZ83H1S2I+h19/oLQvJdD5z5KIExKCAigr3M?=
 =?us-ascii?Q?vXJij/nMYGqNtMwYLmznurGzVMkYcgMgk1zitDaG/jKnu5P2lTAAKf398DWR?=
 =?us-ascii?Q?d1kgUfr823VYugLvrkkD9Fh/FD0gh2j6C6YbOcBFUb43nM+L2Kxx9rh2sFMD?=
 =?us-ascii?Q?NCU2/02e0yemQjCZg8VJLuKAQvhwbTqw38DyD91JQPQvYd5++BG/C9sOmPIy?=
 =?us-ascii?Q?1v4eVZIbQ2v7QtJFq22LDslMdjM4Ncuzhiz7gq+DyLFp/SUW2mJCQ8/HmQwS?=
 =?us-ascii?Q?mKypwYEJk3GXIenuqKQNb/kt3SGKHHmAMaKBI0R/BhjpxHCQAc0ZxHAK94e6?=
 =?us-ascii?Q?pkveKU5Kk2bKZlEKT69xrHzxmTuP419LGDp1hjneuwOSWXQ+XXuHm7m1z+XB?=
 =?us-ascii?Q?j4LcP4NhpBL0pVTS7SzRLLNA6rDXQDCPOVxq+9QqU0xX5QVZbdahvzPZL0DQ?=
 =?us-ascii?Q?ZVjWcpecqscORg1ke+S0q73kF0ozam8/WqElUWBtfjWMZgIrkFCUiC87iEZg?=
 =?us-ascii?Q?mcKpEqU0KIaob8wf+IYAuWYxHyi3SERjTQpz16dwIWBNJC0qg/L9o9qbXHbI?=
 =?us-ascii?Q?XcuwpzHx6XS6YTZ1ij17kmt1t9w+AO2/+vlcNM6/TGU51o+/YEVW5S5SKuGe?=
 =?us-ascii?Q?y0p1P/TVI/Fp1a/3tS8StPBsy9BPFhqAd6lvz+cFmldCISOGi1zN8C3K2Anx?=
 =?us-ascii?Q?LLCV6/wKvie3Cs3TaF9eypgtkuG22UQUJTNbpEc8oT+EKKN3igEE/nNfRpiV?=
 =?us-ascii?Q?ZESrmR61C83RyqivzFDzMYYA+lsAZP7Xk3V7l0zSCjbPCL/7isfLrmsK7/CX?=
 =?us-ascii?Q?/J8bzecb1OGrXEn/N+DvPCbFS0QdsXUe7V8ndmYJS6+/xprKfQy65x9GYzj6?=
 =?us-ascii?Q?WLR4ZyKLyVf/iFnmn+RD8mF6J3oYylgW1myk5RaW1c6XBSOhYLwGlgPzkpOb?=
 =?us-ascii?Q?2FHk0h7j8vAGTDfuMVRUZ+3HRSqnY1ho0cPNgPFbXsiQFT9FFDMbkdSn32s0?=
 =?us-ascii?Q?m6NlqIsUclW/tvgk3RRzpXfeDlUv99EnTJh4baD3vEOFLdHp91asrRjTGzWt?=
 =?us-ascii?Q?n6DMdgtNI+i8XJIO6Ty0Q2QY9na/kPMp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?binT2ie630QtjM1voTvMZ5/dQT+DvcR/5zFMiGIb/pSkz0Zhg78AEViPMuwN?=
 =?us-ascii?Q?UmuOMkDogs4F7zOjASZYRzMtHqRPkOp3ZTlklTgrFsdDFkQtKldwkRFcVBgy?=
 =?us-ascii?Q?Nvs3XvG8XKz4Y46575ckjtwEoow5dhRcx/WlA8hjLOJ9bqIICfEuhf8wSyOa?=
 =?us-ascii?Q?ZkhTg2lWghdGgYMQXRQyymQMuT1M08O3tJFXIMF7lAiIQBYtKP7CiSPld24s?=
 =?us-ascii?Q?bFtirN30E+jiofEaShu3hcOlR2ppcwxSB58vemKVo++9fCYsd1/vzbulFe3L?=
 =?us-ascii?Q?KT0TwXwr6tC2x7qz4UTu6y2XomN+3j95h34HFJneuxW8T1xgm2DK7cqXledx?=
 =?us-ascii?Q?Oe4BAhQvvp3i/3NIIqGjWjvu+hSDErEWfTRtuCCn2gfz1xtiQstAakSKynQO?=
 =?us-ascii?Q?rqysRcJHJyMDT0r0fAoqDxWFPw5h9HkvpLbgfz8ZYQCBjiQJnWH1g1w+uzyc?=
 =?us-ascii?Q?6aIgq47e+XJO+5cNQDYOOp06C0uqwyGDVe+qnddqsAD+bJdnLchZ0o/djvA/?=
 =?us-ascii?Q?uZI7eiBAs30uWlNx061e0G0Eh9UuhcItwcswRL/xhbzyt7JUYj9Aoq5HT3+D?=
 =?us-ascii?Q?JL2VA2t2MZLmOXrsTijv/VFvFCB/0p5e8DGexL+IF7maFLlD05nU4U2qKJ8b?=
 =?us-ascii?Q?6A4WFY4qc96/e+1WhEVHQ/IfET9+7+jJPDbInVSKC5b94whypHdeYEw7Tdfb?=
 =?us-ascii?Q?NKfyyp3u1DXRS4gUXP/5MfreYt+M4jK/tIkX76CqvcyGnqo4z7Ys0/gFJ7H/?=
 =?us-ascii?Q?Zza5V18chvYL2vywmiPz4YSsvO1/zAtKPr7UG5ct/KvEYn0FMMkgqF8fqAlU?=
 =?us-ascii?Q?1Ng7bvJD4gybiqgkNitRozxBm95akFEKW+md6xCHmvMBi3daKM3SXz5vGBlS?=
 =?us-ascii?Q?8vWJ0WzJ5b06PlmI9juxXU/l2xjNyAQf+U+VB7y8fYULGdNSx2yfoqPX6xgy?=
 =?us-ascii?Q?UIafsA612SqT6jhxOmORlORX2zyUXNOTfhe3KFPA6zaP7phcPI6P6mSjypgX?=
 =?us-ascii?Q?wNPz7bwsUepiJiyqXKxudfkNcGML/8DewRoXI3U1BDTzOECKi/dkmWa33RD2?=
 =?us-ascii?Q?jQMaOWUMVo1oju8ZnsuqjMnVtjaDnR6sZpppxAOJef1Q8WNApEtG3jPzXmpg?=
 =?us-ascii?Q?4j7K3ter7g1dUpGmgqMQudur20PdwJKXZEQzAuGnF79aAee5S7R0kxe+2RNw?=
 =?us-ascii?Q?Uu7yOQpTEAvmEzeZwGoYIq4JWxddSCwvCTvHv5ZTOsgZKKzW+WMle9PRmyqI?=
 =?us-ascii?Q?F3/wKXVpF9IIsXMjQs6rYXeuxMx1PsbsYcFQnWmZgbXszukbzuREfw34+/yh?=
 =?us-ascii?Q?cSSD0OlvV1CjrG/UFSW70fmOKFApMsV6eRZaI2dvjks/bkXmBBqkmC+3xTVy?=
 =?us-ascii?Q?++GLn16xR+UvaE9qlePIEXOCFmaOuLzJ5sDx99Nzw7u5zEqNABxZLQv7yyXa?=
 =?us-ascii?Q?hwoJH/N/67QMwDzrVSOt2XHYeER03XxBNqNSK6XnRbCWHPwclwS+XWek1MAN?=
 =?us-ascii?Q?1EZli85XF72Cc8ssIrDDOnO3wyEk+gGsHr9eKby3U7iojCypePpJ0tONoMKJ?=
 =?us-ascii?Q?EHdKDgKz7HdmdscehbgIX6n65E9wdFRkzIzrO7g1NyvGkvCP5bNXrk9PFqJQ?=
 =?us-ascii?Q?KbgZMmL/n6uvPseU0vDhf2wWKFpdou61jx5tL9A3K9W4gvrPigDqBZ+Ukl+A?=
 =?us-ascii?Q?HVZBOZ2GpfB5berPqcM4t0vaCo2BqtVG3VBCiDKCQWDUvbGogvTADJNuOBQi?=
 =?us-ascii?Q?/uuW0RNGiGEKOXDMIxTAlyYRtJ+FLss=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t/JtG0JcMA/Iiv5PIaQXOMFFG8IZ9jLPrkMP/7XJyGH8y7apInHOGbp20RcFBn5qXiWmSzfodXcKo5rayj4U6LlYetEKygY75XNyK3DAh0ZJy3gpnjbTGMA9QpGVUXlD2sYK5m+hnyqd7K6ceY6hEcdm6K+Vn0C7PrW6rsWGGyQCiRkrLpYQ7Ux0iSazIdWD+ve2ct5+lZoEDP1T2dZJGZwHu3p5CJgstxvCZyIkMFVmZ/pRq4wg2Te0Nmf0FiGGDtdhzEnfhK1yfkx7CrxIttANDHoL0be5u7haA7wAmybscsHqzsm+gUcjh0qdKYc5vH2MWbefChrNTKLQPt18T6uhhlLhBWSMwBN51Hud2MSFSOIQkn5v6E42ZzhZENYAABhf2QhslzCB22jtdGJNVaH9Oi5pLrl01ASlsVPGk9KkvfK9YuLRhTTxOqqXVkBEN1l9gf/fmULyz6rMhhpwGkA/nC/J5FS30GuLzbXjZIY+y6sww7zKxoIs+J6NfP3DIOQOc82xE6aOhI5tLG505vcBa5HBqXfI/jAKfko45pcyGb3dr2vn8TaSxPY/TZ22+8zyUx6d3UJI22+snygWo1dAzLYTJGhJVbUGJAqIz74=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72efef5-8936-4a4a-48b5-08de4f94ae44
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:35:13.1901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nq7wR2eNal3CNlo4OrFuNj0M+co8Nv8T0dc6N/jWEEwo1uEMHBbEbmMHB7fdiS7wFuMWUFcePevydAAH1HsxKR8yOad4ch/nHUe5T9ZoOOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601090116
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNiBTYWx0ZWRfX1VJFl/RH1uMi
 jUdAPd2wwuFzY01ZAc9YI/v/uYZJqShjCOEKHPrtpLWHIm38/WmjYyCI1F80m6XNfNoln1KGWPs
 yDrWOq41hKn6pIJwLn4XOWnm/mApc4KqDARYUJT1dbxAhN6pX5yAudN/gc4+ra2sooroZfq465F
 wAQgU10QaDq87X6yrTH9bSkQ/dvfDoFaUf0CYinLgv2xKrVLRm2OTyYPvSc2hcYr/LRfV10RL7c
 RKJ6SCRM8g2c766FYVTrM/mMbqW7ZzkBgeqr37oGSKxXRJrsSlcd0BXaFV0Ih9AzxfUz0llEhnt
 RyRGBIdXqUL56q8nh+2uYNHDUdmon02OrRzus5Xh85gYsa9WQhWrLE7v+hwdZZVdjMzoHCNP3MK
 AKrRwaghu7VZwqusVI07P4niqAEQ3TMF1gpBP9ZMg/CJtY2cwdPKdvOrmwKOQKt80OuJiFIKIds
 qqYKf3swVEt/BEEnydA==
X-Proofpoint-ORIG-GUID: aO4c2CLdfvqjZ2Zq3QAoDRoPe8FrvefD
X-Authority-Analysis: v=2.4 cv=UbRciaSN c=1 sm=1 tr=0 ts=69612034 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=_dRe52YcnpiaebSr8HkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: aO4c2CLdfvqjZ2Zq3QAoDRoPe8FrvefD

On Fri, Jan 09, 2026 at 10:28:46AM -0500, Steven Rostedt wrote:
> On Fri, 9 Jan 2026 07:28:01 +0000
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > > It's better to have a grumpy document, instead of grumpy emails.  We
> > > need it to sound grumpy and it needs to be the first paragraph.
>
> I disagree. Specifically because of what Linus had said  (see below).
>
> > >
> > > AI Slop:  AI can generate a ton of patches automatically which creates a
> > > burden on the upstream maintainers.  The maintainers need to review
> > > every line of every patch and they expect the submitters to demonstrate
> > > that even the generated code was verified to be accurate.  If you are
> > > unsure of whether a patch is appropriate then do not send it.  NO AI
> > > SLOP!
> > >
> > > Of course, sensible people don't need to be told this stuff, but there
> > > are well intentioned people who need it explained.
> > >
> > > regards,
> > > dan carpenter
> > >
> >
> > Exactly.
> >
> > Every version of watering it down just makes it meaningless noise. The point is
> > to emphasise this.
>
> The thing is, the AI slop sending culprits are not going to be the ones to
> read this. It's the people who want to do the right thing that this
> document is focused on and that's why I think it should be more welcoming.

I think you and Linus are wrong about this. There are a class of 'good intent
bad results' people who will absolutely do this _and_ pay attention to the
document.

I expect you as a maintainer must have run into this, I know I have!

And given how inaccurate that register article was, I think you can see that
having something clear matters from that perspective too, in practice.

>
> That said, I just started looking at your other email and that does look
> better. I'll reply there.

Thanks!

>
> -- Steve

Cheers, Lorenzo
