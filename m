Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8B29DB61;
	Fri,  9 Jan 2026 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974762; cv=fail; b=hkT69ECfyNVM3TM/NmtTA4em7BL7BAzlaz39OLESz+p6Cw8XKXlfdylyLHlXkDoPDsXOph0JnqNg7yhv2gQnvA/GEJfDQzpcwRp+bOstIELgGYp5SoX414CYWT6ECRTJy+4GQ7Fzq5Sj9yJZodsvTNo8LIdraITM23hoWADGWRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974762; c=relaxed/simple;
	bh=7hC2/V4opci4bbd7hOMqAkz7TZYqNHywy+TgtQ7QAao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cdACKU9pJ53B6RP11m2ukUhP+40YoDcaL22hSAQNW4OYXTBELOlw64b6zVs86YtfSFyNbMzfp+I9fk/sWI+3sf0irg5z1aSuX/49HArcWlzbANjAJ7t5zpFPQJkjzyYkul6eOW8dBH+9Z2wOblIYLroTPgDDBQuGX6STvbC+nfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PtJ6oTkP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tMR6g7QP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PtJ6oTkP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tMR6g7QP"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609FkDRZ3287592;
	Fri, 9 Jan 2026 16:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7hC2/V4opci4bbd7hO
	MqAkz7TZYqNHywy+TgtQ7QAao=; b=PtJ6oTkPROXwWyHv06wq6pi0x3Gzmcr6oF
	XZZwIZk8AWOJ5xlseQK3+BCo8GJxWqUV6ralPCVp+VR9SIvxKKiGhtSA0xPABKGx
	RUoUUQlAyEGcSBgf+uWR+gOnxPXokZtNE5FWh2k6Led4RvYyhSnXCVxlLIvnHc9H
	eH4Ia0ODbTS1c0mGFoqKohFEA9CV2aWoDsPRd4+xnJMYux3VR3M4Wsku0wA8kxay
	1OddFDpIDBZwgo4olI+hzo50guu3eXZa3CNJqSsRxkhaNyGw3103dI6YOAbPZ9IG
	gZugLflyLDRleYd+qfa8SELY663LIBtGf1ozmEx4zFFQcR9i3uVA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bk4khg152-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 16:05:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 609EVBC9029383;
	Fri, 9 Jan 2026 16:05:42 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010069.outbound.protection.outlook.com [40.93.198.69])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjphs9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 16:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUUmzMzaO8igh5G8ZJdX11OJcrVJlzUoivw0GT1D2PRXIbp21qQzAeyrw8V4jAPfdp0mMvUwk2/45lDpuf8FJNujmH4CZ4pllkmFa7ZpvgGeZcnNpwp2DqZ8+26xJoi8Gkp5z/Q0kQPtfUa0ahs/J07OqKq+FMQ+PJThF4DvgZ+axOtilEFMz8+qKWxw7/o1XdFd6jwQFrXfQV7L/YiZEQwya1tbGYDK3aF/9RSe/ztaqZKB5UDuMYjftMZAmBwqJcxByCZOwH0FcqfihGmZDY/tQpcs+V+eRSZKtbafnmqrvZ3xPFAml2NNYiTmdFxTE+6wVobZhmveAUw4TxwxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hC2/V4opci4bbd7hOMqAkz7TZYqNHywy+TgtQ7QAao=;
 b=EbksoDy/PuPRTB7Ta1BG91Bu0+4CvasLLomvB56rXNFFP7GpXQp1h4xNqDSeBDM+Puf628utxbDMNWcsAG2kwjoGnX5j5/1ZTLjoR98I7blmYaTHfjQbLpxgc8NOq8wpJna4zlZGdBoOL+l7n/yQ2NqZ3PPOBXgvYMcGBQDfkg3EJ4H5wRTGKcWmTAXCFHLg7W2mYSmEiYny6RSQ9QljHQ3F33xfxtB/52mjCRFB9MSWR6jNDselaD57fB+n5Om0uO8FRdm40elOTHJ9+NOXipN40ZAKq3ZrIyNEpLUNP80WoJwtZV2mxdzLTEHUhRrYcOS2DmfIkpeRg8Yb7m+sLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hC2/V4opci4bbd7hOMqAkz7TZYqNHywy+TgtQ7QAao=;
 b=tMR6g7QPdwrAlAE3ZDXOhXAkisgENkii2V/33O9EafhuxpVJQzxQ6lLBWggGDfOisEhZyaWqeCAGD2s+eM2Je5Ou4niAi4s04rA71pRi3SwIRV3n30CR+nn5Wn+t8M45nfFpwJpUeY8TTUrssLyjFeB3Llri2qBGD+6pSL/HqqA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA4PR10MB8712.namprd10.prod.outlook.com (2603:10b6:208:561::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 16:05:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 16:05:39 +0000
Date: Fri, 9 Jan 2026 16:05:39 +0000
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
Message-ID: <1273cff8-b114-4381-bbfe-aa228ce0d20d@lucifer.local>
References: <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
 <20260108151437.3188cd53@gandalf.local.home>
 <cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>
 <aWDf1zlLTKmw9xnq@stanley.mountain>
 <d6dc605e-2f33-4db2-99d9-4c3c83051ae3@lucifer.local>
 <20260109103924.3de6fb4d@gandalf.local.home>
 <3ef67380-bc8c-42c6-a5f8-416440e4c445@lucifer.local>
 <20260109110347.7fa1e655@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109110347.7fa1e655@gandalf.local.home>
X-ClientProxiedBy: LO3P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA4PR10MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 260d23cb-cd16-4bf9-6b09-08de4f98eee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ek5jg5UX0Vie+pwTysTPR/9Dk8rysdcZ0N435KjCwvvIsT+TdvE0R40G00sy?=
 =?us-ascii?Q?KMKHeHEBfGmU+TLwQ2o16y0d4lZ6qsNZyF/WtmtcH/VnSJ/inHGFvEbvU6cm?=
 =?us-ascii?Q?vwsAs3BcNwqhoLCizVCMREUtGDIuSRQc6QeI/OqvvvMJRraOIjE+42DizSTc?=
 =?us-ascii?Q?3pLjBaffs1MvIPYYjeANngnUTpl5IGcK7HcGhwtIctjUnUyQd+PkeP0WHEbT?=
 =?us-ascii?Q?CUWr09sPccT/SBAgt3OjDG3DhD89RafEdypRDP8uyTB6crxi3DbXQoSTU2xI?=
 =?us-ascii?Q?HxOKniAUAaEDT0QTT9vyxz/X8LLpTh4WnGcK7RqBr0NblekU/TZ+6ZH3hOix?=
 =?us-ascii?Q?eDN50AAVXFKr1nTpS4nvkP97M+otR8LPBbWjjWyIVCQoKEsnbWmw1H5anpRA?=
 =?us-ascii?Q?ATU8OjXaBKPyZULQqTAr9obIThoAWCwH3DsRiJ508S8JEaLQBRonep2CmCLC?=
 =?us-ascii?Q?1h7Jl1VErh68Sdvys5JFD6gqD7h/hefJP3oQSDGuU9pW/iVPkvuzEzgwurf5?=
 =?us-ascii?Q?lsM2A+CbS+llFS8qlk9Kt+AFI3Kyw80dLRBdJji5MflJogpGS/5cEjMvjSgQ?=
 =?us-ascii?Q?Y/1DAzDHeTTulnf7SZq8hV8BbQrZW6hq8nHQFsKTg+kfpvUdPJ3CQcKIZsnm?=
 =?us-ascii?Q?KcHhSrY8MzUO8W0LECLHhm6jxj7oD2ylJKB8hjOzVJ/Juz+G9cwp1ksszRJK?=
 =?us-ascii?Q?JZv3KqPAurZvuqOBU7ZYtJqgxweZbmDc0gGEk5cZ0GyUlp4XzPwcYFUpYAc5?=
 =?us-ascii?Q?5HIV8Gv7rnSwmgNaNa8Vh5wLzuLu8H7Gh1WKAJTRn5oZVNvdguK1WUZ6TXxD?=
 =?us-ascii?Q?knHuFg+IWCFXlUkqUUxmFxD5JX+tSIm6rlcgI5643IKOLZvhuJkJC1lvj0jg?=
 =?us-ascii?Q?vNSFpMcfbeku8udo6ySUIp/7m1DXSn+S4g+rhvG6oGrn+CpvJy5wQ9McWCtC?=
 =?us-ascii?Q?fZjLt2qYqKJEOhmdKoT0RwrCJJJHcVlbmz7YpC3YcCCKi7pMUJe1hB2zcbNQ?=
 =?us-ascii?Q?xKdqJ98aupXoycacYSJlWg6Aswk4jI1gstAVQQ8idZjITio31oDJnP/SgzMl?=
 =?us-ascii?Q?2H7VvMtkXxjRIafmt3z1eXcmM6h7U6td8r+4pDwyHm/4geiiAxHlW/jcS3QN?=
 =?us-ascii?Q?Nm4DRBKHI8yJsqqPJMpoyDV2iU/HfVV2kaddLo6kJPCp9flsOpJT8zpUZq5W?=
 =?us-ascii?Q?nq2F/zskwb6Cm4j1Y2a8mOPr+kFtB0KB1lyLDLTyMTB67uKK6VtnxCWyoWYx?=
 =?us-ascii?Q?jLr8aun0JkU98UvRFrdjN3QHicmSFIRigGWZp8ArgSrI58aojJj3f2J663Qq?=
 =?us-ascii?Q?JT8vw9BHukyjvZyuprkLYIxfm/vCet+zWHzAtYvowGB34JklQsLReC9jd9CY?=
 =?us-ascii?Q?CuWCUWwJLzmNt4vCVzXHCyr8ctGmHQgxhLNNFgQE9IKofraCD8hbjzFfcWen?=
 =?us-ascii?Q?0tBVAqgHVePLJ+MJimDm9hA+HUU4n7WO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x7znjNEWdk603j1ENcaZd0oERXAJqHGFW0+jh5il3UzGf7WKbpo/TTuvuVHp?=
 =?us-ascii?Q?8gN5Nj1qxjWlMQ13DFNAc2mbAkjM4KgB4leEZolBaLweHwGXG2NA0KI9leTK?=
 =?us-ascii?Q?fxmbWNqnA38FbNOzH0h6NqtfsESR9FKF6iohoV3/C0uUdpPt3diURxP+5zV5?=
 =?us-ascii?Q?yBjmiPRloaP+JeSr+U9j0UKpcU4riEXhnyhc2nACSCpUqv+FyOlA68IDmpWc?=
 =?us-ascii?Q?jZuG+yrRp8KzZg5hXbwTs4Dn8eUBqfv4AGFK5gSHH3tlmAHqjsYRwsOBfU9O?=
 =?us-ascii?Q?kXx7vcErjF/Yq/csql87s6bmHoTjj9qdGp3dyujzgCRLasC3vmMagpZEObtS?=
 =?us-ascii?Q?OxvmRMoRoh4FjXQUaUrSvCzxZX3EeVtUiS09x3LN7nyQRgKHZKZKyjCVg4dd?=
 =?us-ascii?Q?zeFYl5uWbTMxP1gc88I0YSW5pvSmTZwm4fYcFpAfYIH7Ch5tpV0G1siQKRxt?=
 =?us-ascii?Q?f1eewq7JBmsiBf7gG0OdeyUb32u/Ul4cbECYjwDsL4XYDSq/9ByyFmK0Bk2S?=
 =?us-ascii?Q?+XI0PuLRBXVdxz31j9qZlUxYc/HmHPdyLDpORUirH0Y6oCpCB9EF64T5JfBw?=
 =?us-ascii?Q?wO6hebQMQ/oCs4uud0+gt93NmuM+fMxW5GwAhEgFuerFWL/K/uLfbY5KlQAf?=
 =?us-ascii?Q?NUQiNHIjKszNBsFwNyLZgmjZFSDUmgC2Fp091jEBVIBlT6enwewz6xrAqI7D?=
 =?us-ascii?Q?Bvvs1T0zgHHz2R6iy6kojiQDuX+GLI4XKrEmiXhN2hE6JymjNkWqgz08e4y2?=
 =?us-ascii?Q?j+n9TWTUyoqlUHABdu9b8F2/XRkojkAsfu7aJq3NWdD+yg1meKXF+gfQR/xP?=
 =?us-ascii?Q?yXDL4U+25qSkjzqJO3vaxQbLw2tArnerthtjQvxs39CxYi34Lrnde0NMN2l0?=
 =?us-ascii?Q?r2WpINOLiSgcV9VrgRHeLo7fK1PyDfi78TZo3a0lxt1O4VE7A3xQeA0lz6Se?=
 =?us-ascii?Q?6RWlmFFwEkjsjd1KvTRE7ickX2flJYSEaGPc2Q0rKB0ni1KrKbaM+cHYBhIz?=
 =?us-ascii?Q?PxN6c3Ie9VX7wz3pXKXwDAY/7Ea/PHqE60LnJT4b5JZZ9M8XNbdhF6aeiAOm?=
 =?us-ascii?Q?2GJX4UNIPynZWXFzT6WeI0uNKO9ikr4KpfBrkurR3scUw1leBf43IJTGFfYG?=
 =?us-ascii?Q?xgvxZlsquNSOQGN52IJYv/9DCIvSPkKiGKcJvnVFD6IJSFBddTSR7WFZ/mPj?=
 =?us-ascii?Q?w4tKiyanBkbUPfBODUJYrQmcZhW9t0ZFicCF3XqiuKYRThclXxqj8w8JwzCi?=
 =?us-ascii?Q?tNyyIk5gjkb4GqzmnNCQZhuFIMKxeRWemNP7WZUpDLrz2CLIpwCi/wSVWleY?=
 =?us-ascii?Q?pNFAzz5NHuCE5auGlNCMgkeovSh86fSKAy61Sz3vSWxVfe43dM8ui14gxmca?=
 =?us-ascii?Q?PfK34fsUmnDqiAYMyxc2zQCblI8xw6qDX21vTPw3acYM2eWvOAl641HRS3IQ?=
 =?us-ascii?Q?BLAucDd9DzYuaNqENcYRO6mPRi4l+lNK+VOLMaSzyLv6r61CAJh6mImPspB1?=
 =?us-ascii?Q?bZxzdMcaxsKuzJXM28jCzUyAOmbENvuockvhZK+APw5v7gzecbeOyozOccHP?=
 =?us-ascii?Q?ZQZaa+A8kIJjYX7glGt6t002qnVAKDsSxfh/7VotUO8mtSb2AiO3T4UVk9xz?=
 =?us-ascii?Q?KMcG13lTjCiO2B1XrSU8dqhKvaGoGH9MPINA0VxACpoqF1Q5Ct5/iTcc6IdF?=
 =?us-ascii?Q?N2pRXxtv6/ZlzGy/L7Pq8ACXiWLDEKfLjzxV9l/ZlDFSdDABUNsdSMKbFI99?=
 =?us-ascii?Q?59CqP2Tcn4RGUTnTAEGhj4e7Iq8nJcc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dyuMNLcVGpa6bm6C5ho3i/DdP3TxZFdL6ZOnOZy7PLRXh0o+iyxAc44MgoR/vWwhGah3UUz2uzrRu+pQeI4pT4dz589KbpXzvMYOgk01+1eBAgCZrUqHTlR5UNe2205T6iK0SPsXAhKjYi5L8WigBW6bZUX0Gtc/ei6snfdqys6QPBtF1Q1HjRYPdVIn/aXcbwf7YK24F5i5PA4kSP38iLPuUXihpnwYF+f1mhSghsxNOav1UtZPxMjUtDUwdKwWg/tNHG0lJ06EkVE7IEj+/OEUeewmM6QmLa1+FHzlCTjNhbRSrphhTx5d4xPSnkWX6OJl4eK6aQg2r034LaTBufo7sV0uH3UV1R03O76pO9+lcd0NOyJqiG12qFL9/gkLbfqtb7N4Kc7bYM3wMReQxDKtc4rF9WPTUly31oD7r7k+4RNaypmtAM24JuiCQ3gXl+lkaJmy2iTi1U+d/akw3W1A7kEZrT/UESrPhkA3vk3EbKaL1QCbxHiVlMcJAAe7dIpSDj63ts6dcagvzUdJGD/Pg4i3MAlhYO8vjvEDsbX/N/SckRho6hC3Dhuv0rm9y8KBuv7gP+0vHZ/QvW+dINyoP4OYjJquEO75gu4lmPg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 260d23cb-cd16-4bf9-6b09-08de4f98eee5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:05:39.5749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQT30L58/zwQMs+BaEfYcLkn4tjg4xg3YjgPOFL6zzSHVwdpapVG27hNn0cM3MSqd4j7Otd5/b0vJuERynjXugAcoIdgcTph0QC3R4ViX50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8712
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601090120
X-Proofpoint-GUID: 6pYF1olRalsvhe1IGOivDpqp1r7xlAs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyMSBTYWx0ZWRfX0d4UoYb0cUIR
 57VG1W25/QmCxmOqHcfjlSJkI2wBPurc4VtlcK7HasVUs3xc/zAz59QZhV106NAOHii9V+O9BjM
 hjjmfIkYQYqQWu8Aw5YltFARDQA+zH0FJBVRXYar4xMudaM36VS+cHAqikZomOyQ/BYSYylvCdr
 roclnySA7Zt+cvUyeRgOb4WTU8n7DFh+PCLnAlQtFKaszjUg/pNRcYsiFgQcWR1917ADWNUJ6x6
 A9+CAZdd3XKey+DFVaEew9Pcim74MGmXPrnbYWXqxVADhHJ57xJhdTNe4v4E1mMYroEK1XvWJ/Y
 VVVv3k1YSwhxAflb/eB5NGFr8YrNyxI3Zzv5wvoybJ0h4FmVoMZSgFUM5lsuG51qBhsx2admlJ1
 zhyIMtxCbH0Kxct4TVPDmKZgEm/gOItIV2JPJxhGX8/tBvNrXcfTzrQuqUgLgE8/Nn9M24guTPu
 u0K9vifFRPwNwUE9tFUwTJCuqXIh11kUvjM2O2Xo=
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=69612758 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=FFdu__6zkI6AHsCVxqEA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12109
X-Proofpoint-ORIG-GUID: 6pYF1olRalsvhe1IGOivDpqp1r7xlAs_

On Fri, Jan 09, 2026 at 11:03:47AM -0500, Steven Rostedt wrote:
> On Fri, 9 Jan 2026 15:48:49 +0000
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > On Fri, Jan 09, 2026 at 10:39:24AM -0500, Steven Rostedt wrote:
> > > On Fri, 9 Jan 2026 11:25:57 +0000
> > > Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > > > > I don't really read that as grumpy, I understand wanting to be agreeable
> > > > > > but sometimes it's appropriate to be emphatic, which is the entire purpose
> > > > > > of this amendment.
> > > > > >
> > > > > > Taking into account Jens's input too:
> > > > > >
> > > > > > +If tools permit you to generate series automatically, expect
> > > > > > +additional scrutiny in proportion to how much of it was generated.
> > > > > > +
> > > > > > +As with the output of any tooling, the result maybe incorrect or
> > > > > > +inappropriate, so you are expected to understand and to be able to defend
> > > > > > +everything you submit. If you are unable to do so, then don't submit the
> > > > > > +resulting changes.
> > > > > > +
> > > > > > +If you do so anyway, maintainers are entitled to reject your series without
> > > > > > +detailed review.
> > >
> > > I like it.
> >
> > Hmm, you like my version but then below argue against every point I make in
> > favour of it? I'm confused?
>
> I don't see how it's contradictory to what I expressed later.

Haha I should stop arguing with you then and just nod and shake your hand ;)

OK then I'm good with the above!

Dave - that LGTY?

>
> >
> > Did you mean to say you liked a suggested other revision or... really this
> > one? :)
>
> I like this one, as it relates to any automated tooling (checkpatch and
> coccinelle too, not just AI). Because I do believe this is documenting
> exactly what we do today and have been doing for years.
>
> I always scrutinize tooling more than when someone wrote it. Because using
> tooling myself, there's always that strange corner case that causes the
> tooling to do something you didn't expect. Whereas humans usually make the
> mistakes that you do expect ;-)

Sure well it's actually unexpected somewhat to me that this happens to cover all
that off nicely too.

Obviously the same thing applies to _any_ tooling!

>
>
> >
> > If so and Dave likes it too then LGTM, pending any Linus/other veto.
> >
> > For the rest of your email - a lawyer would say 'asked and answered'. I've
> > responded to every point of yours there about 3 times apiece across the
> > thread and I don't think it's a good use of time to loop around on things!
>
> I believe that you think I disagree more than what I actually do disagree with ;-)

*Nods and shakes hand* ;)

>
> -- Steve
>

Cheers, Lorenzo
