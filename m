Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1FD2F6918;
	Fri,  9 Jan 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973754; cv=fail; b=Q49TX7+reMqHxWllmk3gTGmOuv6Nzcc8Cw47MoYS+D5kv8DxoB3TYo8LsdM51gdpVhvz6o2FW4NsZl8HUxcv8kI1UDmuoXAZUT2QpNF+ficxtWSbhVOgF3qtlcoj2iFsC/bP6an2j1wsm985voWCSSt6r+4UkczmRTzYuSkMWgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973754; c=relaxed/simple;
	bh=SR8uE3Svw5xAqZeZTkfWW4+U4SRItOJpM0I603fNMsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KfzurbVlKPCAPlsRbFTRaFznNeKs6vGl2Nw0ZNvvlbr/04HAukWEkaQmDiWZsvJE3UCUoO0xS/TuVX5Kkj5oqnrTyJR2f705XHcfkx9Pd3wQvMmUL+NYVyJO6TqTDGeb2pYQObgrSRfzjCXmI9ac6Pe38WpKq5qJg3NpNDa0mNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ao6S11qG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Npu61Gwm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ao6S11qG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Npu61Gwm"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609FjLTb3286438;
	Fri, 9 Jan 2026 15:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=SR8uE3Svw5xAqZeZTk
	fWW4+U4SRItOJpM0I603fNMsA=; b=ao6S11qG0N0GNpUTX3LJvsolJdA5XvFvRo
	RMBh0c47oMHC+4o70/jGVBINk/MEgs85BtMt5YvRj6K6jQXXrzY9MfYhAX48mXNY
	ljCVr4TErkRRBodvGJNJmdXkSizJSx7yL95s9TXi+Jq7bVh5kRO/NY/GJMmEQpBR
	R3kjytvqPJp2uzo/VfpAFrdepcJTJPIxF3Esz+JCEFLUNCPAwuJreZl4jXDHxRWZ
	9nbBFtdNHvAipuc+q9UyYgYfDT803mLGoGHhUEPoz8LcuXujUoETJi+EvDsWPmbM
	KsV9QOHFA1qzeahzODk+2p91naEW8dz540FD5ZdcxO0SvXHtQt2g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bk4khg07n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 15:48:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 609EVJQr030640;
	Fri, 9 Jan 2026 15:48:52 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010021.outbound.protection.outlook.com [52.101.85.21])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjghu78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 15:48:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7VBkWJPnl1v43PFTEu9oEZJ+df0rz2VfcjaqwrPuck5k/ybvdX+AX81oPizUu1raSGilnamEDuPksrJSuM16E4aIH2lAcJ0p8lKejPgYzROap000xe2FSOyGyelYE0yluyPgy0msH2OIcrzMzfCvtrNLizM5k048Hv++4iVDCjTZnrVcrgoJjwPurB67BZFB7fHT+sBUURbbs+Uqgs+TlYmxm82/6QQA3gY9rwo4BpiXcm5UmFRcZ40umLnDzkNPjYvekXMDMmHy42ugn886nzhyeqaPAmEPo90LZjyMYCEvZq/Ws3KCS6LNCRIn8Ejjxnggqj/QYSWeghr+gV/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR8uE3Svw5xAqZeZTkfWW4+U4SRItOJpM0I603fNMsA=;
 b=OQbZPZB4U3XIHUHq3qWndfplk4aUwvyl2CC1fAiHW3rradbF5+bMHS5Rk+CmOw7zVyhMGjl/QN7NJCO3gOVK1VpVVghECvlwaPwPufX/D6VXzHjeuC4aIWsda7tAEx+ydn5MdU5awrbvZ84FQd10WFvPdaB186JsQWnKybeDs4pJg8NLUMvSC6des19L9FXtfryV2Dvr5rO2KhyLAhLcftPDU41j+m8NNHFcTQQqzn+z68pcMg086i02wFHN75xndMPQ2QZ7a2zjEp4iKbIafKcndoZfIVp5Tuks8ga4IDLKGYg6OipQUhiMoRH+6xS6tCQS1a4tE2B9SHzbpm2YbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SR8uE3Svw5xAqZeZTkfWW4+U4SRItOJpM0I603fNMsA=;
 b=Npu61GwmWFZQ8SzIUAAYZS6sWYDMumORmU1kkCsVx6RA+bFoeRhxY6ruRn87it6fP7l2vURGH9IaKzpBdOju2aNoEJg9JIuSzhpMQRsYYxhVM04rOa4wo2EB4mCz8Q05F0NRMEveagvxO8X2e6BUYUB9myohMkey8O98pjSwJi4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8682.namprd10.prod.outlook.com (2603:10b6:208:573::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 15:48:49 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 15:48:49 +0000
Date: Fri, 9 Jan 2026 15:48:49 +0000
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
        ksummit@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <3ef67380-bc8c-42c6-a5f8-416440e4c445@lucifer.local>
References: <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
 <20260108151437.3188cd53@gandalf.local.home>
 <cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>
 <aWDf1zlLTKmw9xnq@stanley.mountain>
 <d6dc605e-2f33-4db2-99d9-4c3c83051ae3@lucifer.local>
 <20260109103924.3de6fb4d@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109103924.3de6fb4d@gandalf.local.home>
X-ClientProxiedBy: LO4P265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 39981871-fc41-430b-267c-08de4f9694e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TL/TjLaKyCuEU0gAbzo5+i03LrlRIsDl17fJe9Z0sq2zoljojnbEGXQpoORK?=
 =?us-ascii?Q?nRhHA8QIh1WqAhGr75uSurShil0d0GojGIHueZwf++5s51xBeVKlTf4bx22i?=
 =?us-ascii?Q?RspzxDUmb6E1M0OcHsiK3by584YVb25kmKXeuUeCDVpF7uHjjqdDDGDpRMYC?=
 =?us-ascii?Q?dISjVmLVrLIUSQjzqEN/udJO8QiDvJ9HT8dj06kZ3SPx5+ZIOLlQOr7Jah2T?=
 =?us-ascii?Q?Kpg/K34qI1Fj6h34vq8dF7N76dwX/p1mtx9Fq98qjiLRAGhyPR4LnRYEwOe7?=
 =?us-ascii?Q?Add4Db0r4R+vUUz1/imUJLFks49SCxEccEEaQMfqgAFdrOF6WwndXk7PYe4e?=
 =?us-ascii?Q?waj1GHsGAiCIGu+dzz2Imhka4LEbMoX6TPizs6/+G6qOIMo1bQEQC9A7vPcU?=
 =?us-ascii?Q?kZGc/lUcjbCLLc++9yShzttvmJT8UkeH0V+SwBEx6Uld050KRQ4MGK5wrGq4?=
 =?us-ascii?Q?Q7TW+bdtvFoQlbnLbEWhitVlysoQ3hCE4sM3m3EogusAytm+2ZURqaDc9hD7?=
 =?us-ascii?Q?3D8TAEhXWyyi6XZLFcrKUQeL76ZHwNDu9s7t9TnqRvd+teXRu0kd4yoDb2zJ?=
 =?us-ascii?Q?k7X+0pPOlG1dNY/Mr7FgZRBbBhQgIUjOz42uPyp1k8YO0CJTmlCd0ga+nQLc?=
 =?us-ascii?Q?pSnwmG7o1/e53tIIl+fGk0CR8qW+TwCuSuo9dSYz4vYJ2O86o7sudGBIarw/?=
 =?us-ascii?Q?oNiECDliwoiBGFSiD/K7POhqjtCEJlSn1KiE31AglIEK9fXbZv6V8oDlecOD?=
 =?us-ascii?Q?ZERqEbXXIlmKE2QUj8/tTjZDwK1VvIrbHBy853w+Vfhi3iJnKONXiRiCvL30?=
 =?us-ascii?Q?a4kCODcDgqkCX2zDe9lQJdgb03tbdhvXpzt0OauDuzMYdi45UzpUVDLNzEcp?=
 =?us-ascii?Q?+eNHF8+UMq54oQ6/Sb0Qu3BHqmF64KvOOiHxlhzKGWtY5Ciibdp6r+ee+ok5?=
 =?us-ascii?Q?fRb0YaZju6T9oyabMmqytmR8WcbKUsQM6P5lFSPGHziKLrfUnZSmup/oF6J/?=
 =?us-ascii?Q?4rByoA7iZaMVt3irNbilnyBqW5osYQdiILFN8NGL+/4SKbcZAcmgn8b9nu9+?=
 =?us-ascii?Q?PrVOikVlk9GNAAlhgmUWTYgVF3unJAcek+cXqT9GHfKsylR8UoRWDtMBZIbB?=
 =?us-ascii?Q?gGkEspCDJVCvyRRz3Q0gtzn8qaGptk8zDaldVVl04+51x8AxEPos8QqijYUu?=
 =?us-ascii?Q?M4ReU9uk/BuDVeuMtU1FjNyOdqq1vzujXlTl/K0dQUhxDzSW2bB3ZFdMQnw8?=
 =?us-ascii?Q?17G+MROzN21ELaKqXV6I05X0YdiGQZc9E0aQcr37Vos5nz/8GKlkzW2+VtMH?=
 =?us-ascii?Q?zlOH3ztT18GuitKx6lfXZkXib3rl3kYb6oxGOAF/cAJ3rk+V2CDESkjd4AKf?=
 =?us-ascii?Q?jWUFKbORGqUXO+JXeVLrgp0+3sVJW8pXKj25KiKPuSYqqP29v/PfTaI66t0U?=
 =?us-ascii?Q?ytxH4MqI+L2rKPNa3RZbIgBa2/45MkHI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xQ3uJcaAsKxpgW7Y1LaVem0970q69Cd14hByx9VS1i+jM17+XI7dNeR4LvRf?=
 =?us-ascii?Q?ck7d4GgZoTvJxVDIC/T3R533rnbdOMCC0gJeuFIoMxTmGFg6lGPVXNZgQHrz?=
 =?us-ascii?Q?ZqKSJkFRP34QgnsNKe0pF++TD5IVlQKeMPz4iITo2gi13Xu1Bo5LuAOZVgW1?=
 =?us-ascii?Q?9hfzcTsnB2rrlOfUHKOvKZUsPhrrftrH86dVV3stScxq6YKld5MsmKulior0?=
 =?us-ascii?Q?caOBdsVPWqxhXSlSOclqj3LRgwpy+pdzVSCHibUZm0/sbk+CgC//noG8Gef3?=
 =?us-ascii?Q?15RcEotwgkvegpGsVKvwVdEMHRUCaugTPRbnHLV0rIB2TCVsaOpFRIx/DG3X?=
 =?us-ascii?Q?7YTV5rU2GDG7/TLDyzZLsYwi9sjJqtZbIZBuekdRx84EKcRUT8tLFHVjbw4+?=
 =?us-ascii?Q?nZ68t6EeJrxXlAnkH194e4LolJMZ+MCsSo+8IB3IzmMcAKKzUsTC+QTUYIMf?=
 =?us-ascii?Q?PylZqlLDmWhXYq9VJlHF7HZmKx2R1YFZKZfOs204WdrMn4UomkDdJDufUkw4?=
 =?us-ascii?Q?VM/3x2YK4IjI6NValZBar+Pb0aNqBeAiIFbmEGKc2tIrJzydHBsxriYxH3/W?=
 =?us-ascii?Q?4RTPNmOFLHgsQwfG+dx+h5PgszzY6zn+v2S2ww68ygkPKwc85omXL12Ynz6r?=
 =?us-ascii?Q?C7/9ojH3NBfD7uaADv3J1w2QuFUzz+F41nYY5HBN5GkXajfUC13g3YSKBdRL?=
 =?us-ascii?Q?LhelLcnKjzmDMAcE3RisZFHkfuFRxlxMYkxXF/Pb+N8ytxQy7mGZYGFkVpUV?=
 =?us-ascii?Q?9L5u/PxieuiRLdToQf/EVDSWNKNHCpCECfK1+AWr+JZuH5DrxNnKCauei9zK?=
 =?us-ascii?Q?yoOzup/ayTDSNQelpCfy/+54bTwgu8LUWRNrpy8vZHIiWdxD9De67LSNGaeb?=
 =?us-ascii?Q?mfDDVH2Si9eAGqIsTk6nUoeCO1X1WPCFThd7MST4NhL8rVvUOvBnxXDH3nhx?=
 =?us-ascii?Q?glhpKQyl7R8hzCg5+zzjbb47E+zMIk2WlqHvZjPw3D+ecLbyTCQn8ULRlnM4?=
 =?us-ascii?Q?onGnlvY7Yy+Ag6ec5ABf4Bh2LVqfDTOhrBWSr5fW0uIF5s54pFVRBX5L3OMU?=
 =?us-ascii?Q?zgp0n/DpBcE8g6qpEd1099mXyPso+qE21cIm4cD33so+p/oYXXl1w0y2jQqz?=
 =?us-ascii?Q?WiMZQt1ZYSsVFiqr6Od1ZSi6i8qpyX/SpNcT9GAS4k5H++WImu33qzqmhJXf?=
 =?us-ascii?Q?jUj/ndz5Z4YkjhAOc+EdZWVeeL5by42ozFp7ZGPPUc8+vyIfD3Fd6BmcwHlY?=
 =?us-ascii?Q?gqEt4sfam6wiQ4BhC24qOT+V4oIjksXguWyhWLLZNoRbYqM7esQzCS+37ZIz?=
 =?us-ascii?Q?bw7cbc+TlhuXS5WfmwOA/0YnmlhmvyQM79/a1/VurZJJbyO2cmBz9ckun1cs?=
 =?us-ascii?Q?0x2oHNtoTgn8ZUQvd/a/Upr4taq7zpVDeTAHOz76cFprJJgwyDVe7ccIO/L4?=
 =?us-ascii?Q?hfg4bXWJtjROB+EfQMm/dYumPNi38v0WKp9GsgQopmd+d2+TIF6168C4OGj+?=
 =?us-ascii?Q?iaq8FT377mT11i2j1g3uFEu8gAbRv6xb1nYHPpZT5Wj0PHPGfHnjO2yrpVvF?=
 =?us-ascii?Q?cxILsI3IDZik/6seOPQtiTqEVJH+2PEOMMacZv6XktJFDzjT0GiG+XF0+zj9?=
 =?us-ascii?Q?+C6HnVDLzVEoC5YL9vGu4dqKofH4CY3HmbqPNVEvGAmfee8pUpz9j4HtBoIK?=
 =?us-ascii?Q?3AIJKhZ24xpecilrf7odHCMyuuhoX84mOwz0w340+U57l/KXCL0fM1HsJCmI?=
 =?us-ascii?Q?2THUSWTHcQQnCUVmgIghhYwYg5dVUnE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z4gUrJ9Q1Y56z9RVPAG4T+yYVo+xjmX4KgTe4YPXWwKUjobQRfjV+KLGtG9OA0DFf2rGk+/fjcVKWuNQRkjXgjwb87yFG6pV49chQ70yDu0w8rYnv22iGRpUTWfjXP1Ei14dDpes766lO6xXl+XQCSlp2ntqBGqr9uq8kWmYgXv2isJbrnRY4NTPCC+iNTsvpZq9gibDuWzO8v+Pzs1fvbNCnhB+kKgLJdyuh6ZXx9l217jTQKz2h5wYl+Sjd25OZdQA5zoVTKWgDonp8m1BWQUmLqyQiibbGFNuyoa/tRnGbwBka55pkhZIdmoNXEAnXqcrnYQxRhdJGU2H7/qDL6Tmm8x7ZoMGR/86ZTSePLy0+3XiM2w6XJSxj7P/c6v7Ckrlg0446mnPKJTbfsuiXV9W6X1FyfoJCX+WQsJ6pAwlEt8eCL3y2N/gL0XdLkH0Je/obmah6iG9zBFKSvulxbbzlf6W7mCKyARLpI1PsZgcDfhnXRQcXuqbGAOTgqhIzIh1Qt2yLNlgqYuLqUcRv5/QUuXz2EPtvdXjAdc21E5c9SGPB7oLahlWWDm8cf6G5mcl7aaxCr39I1/QzAdubSWOIHdhr4EKVLf+rw+Ycvc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39981871-fc41-430b-267c-08de4f9694e1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:48:49.6159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3lmStwM7KiWzHQXkhSHg9LAq8ZlY8QD8fsn1RKgd636WhPgwK8yK70hhQdrnuyD5vETS+v9IIz3X1PQyBg0jY/5oiVo/QL4wc0RqOW/Bmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8682
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601090118
X-Proofpoint-GUID: 2ZoctCwzq0kXCzqftvQRJwN4UMqDEa9m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNyBTYWx0ZWRfX8fP7KNAaDUp9
 0LBooJFJRN02cZGtQgBVmyg4DH1BZqdxCo5cLPMzgHT1N7GPE2q6UzjDYvTWLwDalUJZ1xDwtEw
 YZ5FoufKwCOn4VU+mUM1PD2u4EK8PJtIQLcgtoXoxU0n3t9hOtrZ1ceQkdOg2F9E3TGChlw8AIh
 iwQre94KubAgEM1XuM6kjtRBG9YCmZKBiAhtcxWcZIJWysPJ9/ZxldRsbuxTdxzYCDaC8gcHAOY
 kVDrA98JprPnRKrosIdLSNnUD8gb77rzS04xANbm14om1XqeI7PWQTa9N3qip3lIvbqqz+9JrI/
 aQv/txHlhDzCS3A5zuC1Ed/pwh8LBd4BzeUfByWIjYRUxrLDZIrg1e5RNNS2i4dIXWjamx+P8Ez
 p4t2SLBBL3p6onus21rLRE6ub4dDNURey7T8rP/ml4exEM1bJPtjgkGCHRmoqiSUQ36B/XOTxtP
 DWvv06Gvu9yujnH/kok21M+oMZcWKQF6LRS+uvuI=
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=69612365 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Q1hTIvhnuLv5KJR1nFEA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13654
X-Proofpoint-ORIG-GUID: 2ZoctCwzq0kXCzqftvQRJwN4UMqDEa9m

On Fri, Jan 09, 2026 at 10:39:24AM -0500, Steven Rostedt wrote:
> On Fri, 9 Jan 2026 11:25:57 +0000
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > > > I don't really read that as grumpy, I understand wanting to be agreeable
> > > > but sometimes it's appropriate to be emphatic, which is the entire purpose
> > > > of this amendment.
> > > >
> > > > Taking into account Jens's input too:
> > > >
> > > > +If tools permit you to generate series automatically, expect
> > > > +additional scrutiny in proportion to how much of it was generated.
> > > > +
> > > > +As with the output of any tooling, the result maybe incorrect or
> > > > +inappropriate, so you are expected to understand and to be able to defend
> > > > +everything you submit. If you are unable to do so, then don't submit the
> > > > +resulting changes.
> > > > +
> > > > +If you do so anyway, maintainers are entitled to reject your series without
> > > > +detailed review.
>
> I like it.

Hmm, you like my version but then below argue against every point I make in
favour of it? I'm confused?

Did you mean to say you liked a suggested other revision or... really this
one? :)

If so and Dave likes it too then LGTM, pending any Linus/other veto.

For the rest of your email - a lawyer would say 'asked and answered'. I've
responded to every point of yours there about 3 times apiece across the
thread and I don't think it's a good use of time to loop around on things!

Cheers, Lorenzo
