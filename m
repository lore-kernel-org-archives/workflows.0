Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02031331207;
	Thu,  8 Jan 2026 21:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767906309; cv=fail; b=jGZuDpxa0hcB/zmSbfxcRTsa3fyQdgolcmgmFm12+PE9YZ2rEolWqAtbl2L1JdG2dp8U8ycz8hp9aqzTkS6IQSKew3szMZ0aJcwQzXM0qUyiEmilXsuJjlzrLxLy5bQJ5ELK3gsvj0EWR0ZmUvI0xh+GDz6zHy+CJUvcGfCZtEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767906309; c=relaxed/simple;
	bh=CpyKf+4jgL4024DIlDJOwk4SvnH1PUOBVbT7SIBZPQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BEawUCnQm/qX3D4p3tXzpkPBZZFNJMI6E70xmN2WSN2q2UWtq82kvXQX+ZP7tbAnNR9epyHUMu3d2w/bVnCd3/gSYNtKBSCH+oj1aoD3DC8+hho2aCbgVYx0XHfBOH9lXJSbmGrUhiqZRElvGMunyI5fNRbcz6m+MeMrJHNF7zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gIdqR9IJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q/iQYSJT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gIdqR9IJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q/iQYSJT"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608KtHYK1433633;
	Thu, 8 Jan 2026 21:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=F61sRPYGZ43QhKiGXF
	6e5OrGiqgDCGG6NakOQusNl0g=; b=gIdqR9IJBcPdZk5g7BresAKYmQ96EvaQVB
	TyMIH7nl3HFOz3fx34zg+hqjzxJaxDRdkZOj+HNwBafj1g4z8T/CUrKBZexFWMdw
	hVuM+T2G5QeHaeGj8r96vi79RrYSyz4ciW9HdzsPtrIPedkklyQDtPnoh9lUM472
	yxfVnZq1Ya9a11bOZcLAfaGIsaao5ZWCVLgxAWS1SYEVLslVX5mgDG5TTAALRP3R
	CA3ekgJIQhhOd7sg+2pC5pwM08IvbxKo0pUCEKlXuFgJPxDgn8omZOj5j/lAuMy8
	ilGYnK2511PEocqbuqIjcOlGIo8fTeEUdcSXtgy7iLoAtq8hacNA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjm1u80dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 21:04:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608ItVkj034063;
	Thu, 8 Jan 2026 21:04:46 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010038.outbound.protection.outlook.com [52.101.61.38])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjbj7j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 21:04:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKKzs40pw1/ajJrjXzs7Iw7Q0p1S++PVnpgqD1DCp0YKuobog5xut1zUk9rwBtI5WZHy6f79JzNkDilZtB4q9D7BvF5Pn5HBzEsAO/FWhCEqlSeA6inKisJ6GGTbabM5HmB2rwW9j8o9COGutwo/GFZ7Y+WgbFpESWO3a7OaE0Yu1Oo5/Kj2Ab2QxEzIqdrD36HiPk9WBytIFqDSj0dZBHNk2NFthiaGlECUQbDAL8bSqSJdqrD3iroR7/TQPtQ+563C4CTKH2pBkzTB2jAgWP38hzcz6sY6JSoMLYKyFGmkXixBiM93C0HSAS50bSCLuPqvHTFtKeCrmqvLpH0/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F61sRPYGZ43QhKiGXF6e5OrGiqgDCGG6NakOQusNl0g=;
 b=ceAMzjsoLHkqzF84Se3Y+Mx0DdzsbYDr3kYZGenIdB3ZlW6nGAQ43NgSA7Kpo/xrskhRyM2Iuk/7+gQCk2+YqnrMNF2MjK69BRuu9JKgjOnksV9pEfSbGBU4B25U4zb2hseB0nBR5JD5JR0aIH9WrjktqqZsjoTttFhaV+FJTJtUDUmf8g/1sVdE+UtDRn0/10p20XUMurQZfCqMGhiUpMtP3xPOdUn2ugL+1nJVTSPCWHSm5y4+38Lz+56eyhrwDp2uFDBpK7UDLVEN8q57ar7A0HCAlMttLPFRYMBvRHNVdZGmN3KY4s4A0PXTvPXW39eJzeUdLA+qDC5l1EF7EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F61sRPYGZ43QhKiGXF6e5OrGiqgDCGG6NakOQusNl0g=;
 b=Q/iQYSJTac9hJiISZUVWluPHicB28sA5yWyX9laGiSF1mLP9x1gthO1Y0YShs92I5H8aiZu4oq2+Ag8/LucnX8JcGhr2xdRVoakuZUWq+/eu3fLBcrekd13gxnnWjYwhet2jaQBD9dLWX7ulISYY4HKkyAUsSN+Ybd9NDfZTuE4=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ0PR10MB5860.namprd10.prod.outlook.com (2603:10b6:a03:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 21:04:43 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 21:04:43 +0000
Date: Thu, 8 Jan 2026 16:04:39 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Dave Hansen <dave.hansen@intel.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
        Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
        workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
References: <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
User-Agent: NeoMutt/20250905
X-ClientProxiedBy: YT3PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::23) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ0PR10MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: b23ce131-4b1c-4097-1474-08de4ef98b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+xLaMZszj96VJ4frDqDSSDPj3nWIjD1K2pX98KV5pogc+dRouLWZ6TvpU6W3?=
 =?us-ascii?Q?0eWnjf0Q8bWsCi728HlCbicSEoZyYhrYRhATitd3mCq4nu3PReywnZnEpdjs?=
 =?us-ascii?Q?/HFbQNaVtaQGUd6n5Dq95ImUlkXbyH7ALuBAaGDOFSzzDc3IqBzOCw0cLHwZ?=
 =?us-ascii?Q?Ab7yi9ELcnEo7Q0hzydlfhmYrOF89cpALrSiO4dxza5OOASv1vE074d/6UNr?=
 =?us-ascii?Q?9FRzX9LJ4288FQkinMn3rkyEmc0LnBgj9yXoAVAysVHcretcWj42V9UIX/Bv?=
 =?us-ascii?Q?DzOr8bqfoqehV24YJuDyf7o2joxFjIGwEZq0SrTToKbUpxOLN4LnMUxAiy2a?=
 =?us-ascii?Q?tLoabQYUV0XrfdfU4Z1tCQWDDy4HvvR6CZ5N/RrzzEwXdi7OMih4iSxMz6Pd?=
 =?us-ascii?Q?cvJD+/w/8fOsRgU8NU8SPBR4bNXxLyfMW0JnhoWxBT9nOD58u9YeQ+l1Wa5m?=
 =?us-ascii?Q?ukXaDoWHSLwDec4ak3F8ZuaG1hm7bzakA8gAiA15nOQImiKnCmYS+tMICIip?=
 =?us-ascii?Q?OUbFBUJVyW+MhUs+ojqRPz5pBp8qqEyw29748urBNoAFvhnivih3X2EqKrwO?=
 =?us-ascii?Q?ny5KyQu690C0ASyw0sfE20lNLiwtxKsnQGJ+Jq5UXlF/ZplpRgK0g0G//RCy?=
 =?us-ascii?Q?5CiiPC6Otu6ejE3GIsHga2bwjWxUuRtwjezfTlqRoqu82AfT4CjC69FsdYjT?=
 =?us-ascii?Q?5L5gYfLj3Wgin4LDS0M9aLap6EQ0YbdoD69yZlkJp6dYdBs1voPIVPMVafTQ?=
 =?us-ascii?Q?G+/vv7VOu4PO7plhEFBEWSXirha2qwoo7vKgN9oZB1bjrnMKxbwkWl8/Gzni?=
 =?us-ascii?Q?Qh2fW/P3JUnrXA/HgUz/L8izst5VeL5LJqgwGHHxKa/yu3UEPqVdGRjPZ3YX?=
 =?us-ascii?Q?lUp+9SmgDa2RjsW0SLEsIiJHwDTQm+JPuxvefY5rsXirp+h7rhfs4TwqohX4?=
 =?us-ascii?Q?fsQ2lJNj7qhA4rq3dN+03C8ibiq0MWIMmzr+3zAQnx67h/MzoBtiWwhAHUtK?=
 =?us-ascii?Q?JspbYlZxD/V0qHjVgo0+V2VAyDng9M6tPWklwCQae5achTWJD+z3GFdrdP77?=
 =?us-ascii?Q?57TBUc8XpyIbJ3VDq4294oiXONews/ONU5bT3qhV5nFRF+P81Ek6ww4Ay4r1?=
 =?us-ascii?Q?XSczdnIEHIMe123QU7M3nSVhmz/UwiWmaCbo4FWoFvNAKMdYfIwiydyt2uac?=
 =?us-ascii?Q?+qSkhSi3iJ/5zSFfJSQlS448wYJt8hMkoWdS8CNLTCLXTammty7Z7OmkclNR?=
 =?us-ascii?Q?JciNdRT6SL8guXpQnFA2EAZT2PNOYB1whHJ4sTFKBEk5qviDXMaxoBgjUkFH?=
 =?us-ascii?Q?E7AgopiLbkd98OR9TlL3k01X0Vc3XTqY2/Gv685Wmt53YViDqjp6aeyMLns8?=
 =?us-ascii?Q?6jQoHj6EW1kMDzgPKvVTkb+pbClnj7OXA8om6H3pnLXmVGr7kmeT6AggbgDN?=
 =?us-ascii?Q?XL3eoYmoosP8AoXYJbt4waYQL2g5gGKQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qg/Nh1lzCmYtO2XsEOERotV/MDuUGE1lQVkIZlhqK/li4wznxziTGN/hskGc?=
 =?us-ascii?Q?4NSjZemKk/q2eYZ6u+buutIubo0ClXUbXdGc1CVMFcw/PM7amLsk1Fg/aXir?=
 =?us-ascii?Q?XPC9KaFvGhCj8tpN+1sQch3T2NohRj6JvfkO+av3Q+3M7Z1dQumWOBPMWVay?=
 =?us-ascii?Q?VPlJiWxHbT5AdqlECS3i+FKPFQW38aK1qbjp1Dq2lrEqC99PS0xsnHA3MIgg?=
 =?us-ascii?Q?Hb4iBoGMKP8YLrna2BM9qhbRV0W1AehbF2BdJVrOy4FF4hVdcnES/sNSM4W6?=
 =?us-ascii?Q?U39r4DIAf3qkD43/AhDuUzR8FLCXdIYYuks+joXdQl8XZ5eou/dkVeiZtHuH?=
 =?us-ascii?Q?xUFnCdap4tYBpBoXQlJKIuzwUcTkBCIh9o+BuZWzYe76wJ+13nLjPmG7AC/i?=
 =?us-ascii?Q?earRRJeIsX6HREGctJNUQLVagUAfQkcamOydK3ngT6yrAHP+wzg1mBdoCg70?=
 =?us-ascii?Q?WQYwGXc/zBB6Hs+D5c+LZZBkkYMHi+6zMbfhmzQaeTfY2Zg0t5bf8OFIBcJw?=
 =?us-ascii?Q?wZqitPqQoQ9bVuTJZaoaJ2uBHvi9nIVghdsPha2PctNQB76NIKAUXhBa8BoR?=
 =?us-ascii?Q?JS/+XIzUQJs1pXv4Ga/gbv0AuFGojal+82MLtps1R/QypzXv2iIZQiDUwvze?=
 =?us-ascii?Q?jMd/gCeibFebd5eMCzH8I/iVan7ymWGBW65MYAFylyUVTiunPPCJdl4DPSr+?=
 =?us-ascii?Q?8IiJY+ffDq+8oaErudlMHu4WIDty6DeclPElAhvS9XlK6XFNasICUhoQYlRu?=
 =?us-ascii?Q?8a5TTXm2g22/QaxGmU+QEkGIsUi2MYZz4zhlA+bNhJxGCkHf9hysDxMcLwNC?=
 =?us-ascii?Q?jKRZBpBE9kApz7rgkLwRvtdlKin3uroep6RuU9BLaUeKLQ0RLkfXDkiEzowE?=
 =?us-ascii?Q?3ziDmw9Sjr4oMl/nr8MoBfTeIAGZ0MYiTbn7JrDcbe8NDv79cAu79w4ELTcy?=
 =?us-ascii?Q?SM8RNIwB+0wSIRk3tb3M0n+n4vZtNSPp16vZ2q3g4Bk+ze7viPFW8hHEl3rb?=
 =?us-ascii?Q?KB7JVIhBRbhuSqcKjWOW+5ARS0ff8gIx3VoKHM3p/8MbSTdXsB6AGbWeWmB1?=
 =?us-ascii?Q?pFf++YYSUt8CkPNxGyhRNFvq/XYTwWS0bqWfXuOwQ8NrJLqnsFU54bNDKAsU?=
 =?us-ascii?Q?QtxS7eAD8uZbctGnyEx4rZpTFyW2fwMEXaCVK4Z3TJMwpsizftc/oY2d8jX5?=
 =?us-ascii?Q?PluJSA5O1SBlUN/ZQxxjr0XJ8GAvyerVZ1pT12WS6TSgpanpjF/8bOOtLK/B?=
 =?us-ascii?Q?+7kqVmil1Jn8Z9mtwFJweY4KiC8KfHCOIeVUhs4sD4dl4vCBLolQ2qetyY5Q?=
 =?us-ascii?Q?aS1u5TZ4mckFlkVS4wwEQPXwT0Ajd5trerSacQH11AB4ts+wor6CllcZ9eNX?=
 =?us-ascii?Q?E+trf46g6HzpWzNzjCc5TosnqdiYz5DqngArlKLo7Iv0NRQKTvroJrBVlBhk?=
 =?us-ascii?Q?4ZpUcNG9ogQHutT9QoagOV3T9bTS0pDaobburomm/7iAcUKC7fqntkG5Kk6N?=
 =?us-ascii?Q?tZfqAZXgJHfzjDq/9RoNnFJHmYUrqoYJh48Jr3nevTSzmKzxcSA+geD19JB1?=
 =?us-ascii?Q?G1xBJPl9AgiHcb5MAzLgcZ813u9iOybj+n+5gDeitTNYPS2dJlkGuNgLYNOt?=
 =?us-ascii?Q?ifCmLsmrFpdZtQFdqqXUdEy1UFC1oll12qWF74xf4u5QRXqdQw04y8HcENcc?=
 =?us-ascii?Q?yqjYaxtSTyTq2VwrUBvsdupc/Pb3L1p4n6P7d5wsoBYQ46Vfa/8AQoSYMzcl?=
 =?us-ascii?Q?Yd87DLLTEQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FY2h4jCZQ/KK70Zvob+yxvjU4UMtSINABOTyVc8CotZS8pnsrp8qZjcWSxp/mPumhwGSKygicmX9kmAYUyfAgr5TYsifwwudK6MXOaEDh2CFzGiogJOFi4p/oR6yMs8miRe8TvZlFTm32In1aGwAtotjShxze+gYRQp/V9LXu5QBb+XYllxpmAZN9BeYg6gGgk8SYMINdKnypqnQW0tfmT88vM4N3/9MfVbmvNjgUE4YXoMPfGxuj4914kpxPvLuIFGM0ZSEvhxDchEeQ1tpFy9gS0Z4TxGeiiY7LNHXOj4TRwS50vrlvXi81bne3oydb4K2Q3raHtXXfj1RqWoRrombvjC0P9c07+zlOlH6iylVhtjmv2wR84ijr9nfH9+aeJqJT9mHdweQ4tIdBvwvuCWvk3KTopjfR/X6SPgmtIqeqGb9j/sgyKBxE4j+ZSSSl/22MfQRv8q2iz3pURgFl5d6lPJr7psjQMl5CFxEjEhC4Kv+xxAAvur9tehv882PLIV/hTz2dNespPBfZph6xkZI+JTJeV15s6vgg4khblIL3gOAShw9v0y0FZw4b9/x8UzKVjGN3PEHdrUAlP1Rm59zlDHV1tjYA0I7Myu8QCs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23ce131-4b1c-4097-1474-08de4ef98b90
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 21:04:42.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4hrr4OznyPqdXFfjKFnIjmA1dguxe+NEH4ETWpp0JScVpAFAUMXFUXo/2XY7AeEm7FoHThewpnt7kT8YyqpTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5860
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601080158
X-Proofpoint-ORIG-GUID: PtEEGkqtov1QqtRVyICdHPyxtIQAt1mI
X-Authority-Analysis: v=2.4 cv=Q7TfIo2a c=1 sm=1 tr=0 ts=69601bef b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CodtFWu30gMgVokXJhwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDE1OCBTYWx0ZWRfX12BH4rZOjosJ
 fZOPsH4Ni3Y6/zGKb6YtlhoTdkAQ2l0i91dfJcHiNeMFehg/iQeHHYezYl9i4hRRUlE6CUBL65d
 oxgfIKwmVjVrN/Rk+0pJxSiSdOmbe9BA014TzCHSvq1zrwgfLvKQ2+9gz2reXF3cDwEJz9ivKIH
 vEJh9tJXwcBuEXkHhaRhzTKXfItI4epaUOqo8fXq3xn6z2PPeR+wBWyP/hINPIjENJ9S6zBdIRm
 nVUx2ieBcO8e6xivdQJ8vu8tNchaAa29zA2yM85kkW7pq4uLgWaEGmeyvdoJmsMb7on7vLUHsyJ
 Up6YF+GlHtw2kmfEGgsZTb7ZFm4nZ1iWNZf8gvPCKKeYTxEzuMv/tpp6FvtVZf069SctYWMdCtl
 7VvNo+cdqEK4l+DjDYfIR3v7nJEeC4ZMGEDmwtKhc/IvZo0KElpT/snEUVhC5iVj6lIoNGp80L1
 PNeM9PGDzSTMU6u1cXg==
X-Proofpoint-GUID: PtEEGkqtov1QqtRVyICdHPyxtIQAt1mI

* Jens Axboe <axboe@kernel.dk> [260108 15:54]:
> On 1/8/26 12:23 PM, Lorenzo Stoakes wrote:
> >> @@ -95,3 +95,8 @@ choose how they handle the contribution. For example, they might:
> >>   - Ask the submitter to explain in more detail about the contribution
> >>     so that the maintainer can feel comfortable that the submitter fully
> >>     understands how the code works.
> >> +
> >> +Finally, always be prepared for tooling that produces incorrect or
> >> +inappropriate content. Make sure you understand and to be able to
> >> +defend everything you submit. If you are unable to do so, maintainers
> >> +may choose to reject your series outright.
> >>
> > 
> > I feel like this formulation waters it down so much as to lose the emphasis
> > which was the entire point of it.
> > 
> > I'm also not sure why we're losing the scrutiny part?
> > 
> > Something like:
> > 
> > +If tools permit you to generate series entirely automatically, expect
> > +additional scrutiny.
> > +
> > +As with the output of any tooling, the result maybe incorrect or
> > +inappropriate, so you are expected to understand and to be able to defend
> > +everything you submit. If you are unable to do so, maintainers may choose
> > +to reject your series outright.
> 
> Eh, why not some variant of:
> 
> "If you are unable to do so, then don't submit the resulting changes."
> 
> Talking only for myself, I have ZERO interest in receiving code from
> someone that doesn't even understand what it does. And it'd be better to
> NOT waste my or anyone elses time if that's the level of the submission.

Yes, agreed.

If I cannot understand it and the author is clueless about the patch,
then I'm going to be way more grumpy than the wording of that statement.

I'd assume the submitter would just get the ai to answer it anyways
since that's fitting with the level of the submission.

Thanks,
Liam

