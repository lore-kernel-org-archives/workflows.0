Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693AA2D7DC4;
	Thu,  8 Jan 2026 19:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767900225; cv=fail; b=hZ8ZkQycp4h2GF6kzYcpjV+L3N4sOz7x4q8e/OXQbPuZ/HJ9TS/gXfVou0JfFbEbUZiSeCf7Ig9u3bq9XcQ0X+aIRV1DAe3lwLwu153GOPOSlIxfORCzad0uHNOCHz6IoFUT84x264GupOt4BslaevAQN75kJ7020+wysV4TktY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767900225; c=relaxed/simple;
	bh=zKM68UIbisxOlCm21fAPZFeExSf1z90KUyc8Rrg7KxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZyMosSCq+mwKBfwmZVgKmXIe3CyY26QwgdVxOx3u20l8qa0yGFz+Xu5H4YuUN/WiNlx2vhaspWxpyAon2sbqXfhmls3jrIMy9TM2Bl9fvz5JSmlqat7Z1Ml/EZtTAwpzYyNj4krp98WHRhmqMQQRZnhKykJSGseIauKt5Ace7YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DFoiNxRf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aerw4F4C; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DFoiNxRf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aerw4F4C"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608HMcMw611835;
	Thu, 8 Jan 2026 19:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=K86bhxQcyHiMYzvG6a
	hD//jTY1z2xyonPEIzHOt236A=; b=DFoiNxRfWo2W5zf8uz/TEqzKv1zWla1AJx
	sp0zXWFh2/o7CTXfEdqJz6h4ftLfQpcqWp1a78LQvCHPIcIkc/xLtbHwMTCGsaUb
	Q3Eh+zNFpTGA8jxvOvqccGE140FGuhho8tk0390b8fgHpaND2Nv7t4gnfY00AgLx
	4sYGlIpkZY0Y0tylkpF/AoCFJ67W6fv/Gd5nX+ZDaIinb8OIiWPaKj8FvqLX71hf
	uuB2SpadZ5RMo5gdvx/exzoXJjkPHMNWCNUlwzxCYmybpFivKz1Udq/cBPw7h2/b
	fP9LcxHxvQTbCH2UNPX4Fs3tYSWX8x659svW0HLWmWatDxmLLslQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjgwx06me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 19:23:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608HhJH6009043;
	Thu, 8 Jan 2026 19:23:23 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010013.outbound.protection.outlook.com [52.101.201.13])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjb7cyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 19:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaxOTuhvRQfKhJVYEUtY+TH/7bm4hZXySiGLLgHw2qAissXP/cy7H6cGFzK+IFUYRCRb7tucNuvvWe9gzndMKQ8sg7rfeKAyhfqMj24orT0TWi+E+d50vA4EpAalRXOFu6SXnGiC+30w+JacIEfr8Y9xyUvHoDXAqoLyl7e1BIvrI6J5ITXMVsd153bbDOPzj9TiLZSwTTlWUi97+HvhaODEk5KOwbXEVrXTYVkSLs23wcrf5dBXrpRo6joaK0WzzW/JiQXhBiH4NaCJdY1rcXzKYewjQsedyYUe/l46qDIwMlw3Gcw2Jgog2AQO/I9HqFGNDtcixVD/x4woT8EEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K86bhxQcyHiMYzvG6ahD//jTY1z2xyonPEIzHOt236A=;
 b=AIu9m6M0z/rG+DaD6TI325RbRjWDU+0GhTFqca91wOCBvi/35WJ2EsNB2egXfLgTpAcFonDGvRzJsPq7JBGukM00nl0zfizOydxroCPIEfrM7fDU4U4LAltSMkRh5qndyn1LC1ti5xdXe/ZzNvVrOI60q8QmqckXuUBrXmsbc9yx08CkIHgDxVUObAARM3iDlLuoIiKv8sPAij3PBgQOxiF/Un6cJxkWfZ4GzV/lqo7F4wrdO6DJNHNznRUv1f7XAEi0ZcVBKI6ljpGWhU5qbj532Lk3wNff5Eff+XhC5yPkFS6ArqnMNSbx+IfDF4j9OF3tpuqUdycoHlh9x5NcGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K86bhxQcyHiMYzvG6ahD//jTY1z2xyonPEIzHOt236A=;
 b=aerw4F4CdA/aWLWJiZkfwW6kWP/6VyyevIcRLlT+8aLVcQaQ1qJxbJhqkVKsDHQLjIIIm9x9d7/1Om3gVYBZKQEjj4AH+/FT8vh4b2ZnQYcwtuHW/ZSODQxW50KOZu5lhWb7CyW92/xz4fXXzroAjIiR4psveFb5ELsTR5SFvDw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6472.namprd10.prod.outlook.com (2603:10b6:806:29e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 19:23:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 19:23:07 +0000
Date: Thu, 8 Jan 2026 19:23:07 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
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
Message-ID: <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
References: <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4e2e67-e5e8-49fa-35ca-08de4eeb5a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lolQyiWjlf5wNoDLOR5WJOuHcDYEpRJcB4N9kiGCv3sFpfMothNJWy3wOj+A?=
 =?us-ascii?Q?AS0us7QHM2gyn9U/Ld4JepVx3lOhG2SeY5vZ+m6UyHBmv1J4aXYsVfazMxSy?=
 =?us-ascii?Q?xH5sgoj+v6/tkMyDKRKo3FznBu9jk91VrZ0lnE6EDB20wJ8WnMBOrLxvjl0U?=
 =?us-ascii?Q?8H4ezoeMYILMHm5IdubElhCEvlLpQs8yE+gyogbuk8eqUBH/0xSIqwU+fIbl?=
 =?us-ascii?Q?9N6SexLEHTr4yAgPJIbYVxS8hlI/0Go/VZ7qf/aBBrNEFcIUX2npfUEp8uBX?=
 =?us-ascii?Q?MpYPDUocqK7CXdOlK0SUpnCufccgbig2MLtHexLUMMReNF31OQQIaxBLrxMq?=
 =?us-ascii?Q?5VzwA7b7/1QqTsJuUzvYSgF3M+MSn5tik9jM32MeFftcL+UfZCvSj5TCUvF9?=
 =?us-ascii?Q?zWu3iRFUZ9COaE4JZPX7vltuKNLmdDvng2LVjQ1p+bKlO3pQJrZAXTkYBJ1E?=
 =?us-ascii?Q?paLfceDLWvQQgtdDA/PmqW0vKrZIaFwrxMT0NWNicJIrS1LBysVWar5oQYTT?=
 =?us-ascii?Q?NYTN+w9xF6j3kyh7QAEwnWlh6Bf+KJ1c/AVur2SxUsSd4syjoAqYapSZ2Oj2?=
 =?us-ascii?Q?O0xEwDFVKNxlw//wz9ZPw2Qk7uDwQkbUg2VyWexztFlwDWI4/0+ZehDTpubp?=
 =?us-ascii?Q?dVF3R6fTK+q0ppxCKw+WMLP0NDp3QWGIB8F0t3+EiZkyRD5bFwx+wS3abIY0?=
 =?us-ascii?Q?SePULEtkXDz49xOKV1vwnOBgh7cEzrWE7LySdfeGPWlKxsxee3moHWxWfyn0?=
 =?us-ascii?Q?BIUb3LNivXGsNN71BtvaMPK+J4d6cmZU+Q1Hhi9SlRD7rLJg+3qCMQeX+9kw?=
 =?us-ascii?Q?8MOF4HACIuij/GpQR8LpIQ7YGYoPTmiIbWqQaz+qmRcUNRxk4oqP5eP/bJAf?=
 =?us-ascii?Q?PompHCNk2pTw9WYiXVNu0wnaqSCxa2kp3mrfcpwwTER77cyYdl7AlEMlySUv?=
 =?us-ascii?Q?EOJ1KSL5OZbHXy3xJjItHFV+CpB/a2Tmhy9C/1VuQx1/mhG1IoBjUCmSlEe8?=
 =?us-ascii?Q?Z6rGDdymD1bIBbpDusqFpoamStEhGr96QeOpnuk5+cT1+STX2iHD+hpez36+?=
 =?us-ascii?Q?bxAr4xGuYDMA+QG1QfFUkv2ZaeXYl+Q/vAPkQ4d/T7Xvy0PxLyFRSr5TzSXI?=
 =?us-ascii?Q?YkYKg6F2Y2WPDtusLuihILlxlfbjpjeZ6jbYOf8VKrTyxWndnq/iMiOqbj41?=
 =?us-ascii?Q?P7LHPudKmU69F3sEdPhsAGWNcEMPMawnrWGZv/XXqS6PcJH11/TyNCSSkEN0?=
 =?us-ascii?Q?V91uM8S9DP7+6JdruDr6YIYmrbefISJXRUt0U72BEjhfHdWSIGYwF9CO7JoY?=
 =?us-ascii?Q?Eg7ogtQmxH0lYVz/8ezATuVgsO7rSlQKxG6WQKC8zM3J5pQbCpbpjGU1VpBD?=
 =?us-ascii?Q?05BWUHtOoscbzPQx80s1i3uAjriYnSeQwcyaFHyHJapM4iJiZEvwTph2F/97?=
 =?us-ascii?Q?4BtUeZpDST+rWwVjn2IDqUX6y8x9HHZX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F8rfNpQA5CrjZspEJ0YC8gW42cLD3vz5KzQakgczlsrz2iaHThHq7Ub95o5J?=
 =?us-ascii?Q?nZ+XDSIISkrmntnS55Gd3vYOOQAYs8Dbbzuvxtvu0Lep0mDMSmBIN/qV7cSd?=
 =?us-ascii?Q?UgAm+MDJTknuzo6Xni1kTO44RO54skolD1XS8GPee8mpWUrZeKBO+zg/3Qnm?=
 =?us-ascii?Q?SMbX00MhAtn0RcQoLRt+NkublETl/NrMRr0AL8f35DSo6yit54SkyC08kVle?=
 =?us-ascii?Q?QlYsvCWCSj10C1g1CCd7kqB3GF3I6b7MFtI7B8XHpoaq8O4WAh9H15ySvXKD?=
 =?us-ascii?Q?EWAcdEvU6yiV0t8PcTqQLb5IJU/OupAWYN/3/ndE5CUfoWx5nDPPuzjSEhy+?=
 =?us-ascii?Q?GzLX+AjF05pLWsqGzECQ3sLuYovN2eW36s3nJ32fwvFNvhb+laFDKPUBsAsd?=
 =?us-ascii?Q?w9QOpSq19vxspwjvupvPH0PVmlERPCendtsmJdnVF4Yf3TbSxVkthpQBUa+v?=
 =?us-ascii?Q?EHA4znOr0FWQZiUiewRqgC/LIPJ4V+ieF/MxfUpqAdkFHvCJ6YUkPTuITKKg?=
 =?us-ascii?Q?/29X0jxPdyEkd2hFjz5KQJmWrURjrLeWhNBQZX+WPmVJyg9cnNrq5s1azplz?=
 =?us-ascii?Q?IGrw7lBVD8dQxyzYXKHt0k8bWFvPI3EBzuwbCqPhGAxAYb1eBYpnhJYbjJtR?=
 =?us-ascii?Q?0jYAzGdLos0pHmwFAf+UsYeanMzw5hD14gfhZJqSB7TjdD1ZQU07Be4eHA7B?=
 =?us-ascii?Q?FjByJBgsuKjRERqJnDlsInFbpsoMYerflXH69YmfwY1lhCN/2cSpxCe1GQNL?=
 =?us-ascii?Q?/sb5ZhVVAicDvlEflZ5NGv+fumWKnGVROrUkPK9o2bKzYvoU7ecQJ1pP2aTe?=
 =?us-ascii?Q?nrstByhGenBrppTZUedPSx7gmAYfNGWujBcAxQApftCcU6ofzZDz2Ris5Wbo?=
 =?us-ascii?Q?jz4HaBNWoTX+hT73bec/CMu4mkP6eyprRaQ2IHLuSR1db3Z3a+ctE/2VSuDS?=
 =?us-ascii?Q?D0wXxYUt5xfxSPm1C2hL8F95WosfABzMyfUL9qtyFORX7BrcEooBQ9SMwa29?=
 =?us-ascii?Q?NaM5qdR+kmfJgJov6+4FZhYWm7q6X4cx/3m+ivi402UYznwaoccpJEd14I5x?=
 =?us-ascii?Q?yx7w+WNmk2nuOZj64ZhQr8a1XYPqMWFgkljxHpbYXeO5tPgD9KTNoj0Liou0?=
 =?us-ascii?Q?qvYKVUkl/0r9TOom2KaywihZ2krycrIXNnOubIJNuygF98nYtsBYwBcZervE?=
 =?us-ascii?Q?ChLedLJzVfrW7NG1UuwWyIziMeLvmQDA6F1xV+UckT/l8FATf0EL5zvbq240?=
 =?us-ascii?Q?xzJHC/Yqp6kxEYqnMNG/zI6UgkZP+GmrPXIzIXymBpEEnZt+ZOdk6SKyhtIz?=
 =?us-ascii?Q?XuO91xJEkyYJznAqddYXnzfvRJ0riLNZ8USJVaos96/3XjVkm+p9yHj72iyz?=
 =?us-ascii?Q?OM32Q5wG1RtNeQHZ/r3SpySmSx+1lp6EQnOfJtRR0xDSuhW/11YFPuPyKPxS?=
 =?us-ascii?Q?y21Fm8LKURZ/3eQfza1EPYWy+VQo2bTE7W9jSicxMSzwPvRgaqiSmH8avJd/?=
 =?us-ascii?Q?qwAHXyg4MYhyAni2kGD9tJQaT6cNPVB8q3epGA+fKcbkGLZW/ZoGBc380ZXS?=
 =?us-ascii?Q?gLmLy+nQz+qZvmTEMra6ImLPfZGs1hG+TLgdfUw0dquwaEj8dAj5EMMyBqDv?=
 =?us-ascii?Q?ZJ0094iI8cb/EogTZb2mdJFK4fjZhMtNGwIetzRg4XdifX68ogak6+A0bJyw?=
 =?us-ascii?Q?eIN2Fo3fuP3nx6X+rXKe1JdHOCNlVVm1APVNiauxBFS9ANlXmeznBEiF9USt?=
 =?us-ascii?Q?LDCkYKaSQwgaB3WiGLBgCSDdVnlfpN8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ukEHU2szjf1ULP+8WBe6J/nabyYD0YOwHjDy9gv8MFre0g+gYzJG7dOLxptsDTx8PnR3SietYsMPNpl3JXTJH9GXq6nFbZ7B67v+IHaMZgr1n1oYlpXXdbldLQjCY9qI/QU1uzIY7uVi0K35eJu0QPt5Yc8cgoRIIIaUpjJC9ZjiSfSvDgGGJhLcWS1mwmOczWSBGdbBskk/isLAY7J3hgteoNQyNOy7LBhkB1v6LmaUVfH/P1Omsmy6Jptuix+uHs7c4M1XYFOZpNSAE7Y92n8TeNHR4mIgrKYId2EGzGtAydq1dyx/E0HB8MLl1b1DdWukldfr0PqWa47kC6nx+k5KonrmZVDdiFUPfLQiVijIGszs0fc90MGeCslHeJXJYbgRQG0rmHMg2gIDiy/nj1SralUccl5A6B4lLtCMo0YhVupTomRocD7ZaGAogq7A8RuSKDL66Fj06FB6yiTdgWajSKJvc3+GdwJFu07VfvuA78SFvYGHau2YEdzlTCK4wAA5RwyCQhaMz9zkUcB03RyPUJ2UPH7J5lQC7J33oP6PavF+iKVfSi07LbxXV8OtpqK0o37jvP8zvx0eITXJnaXnHXeuqiodqziJmjIeJKc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4e2e67-e5e8-49fa-35ca-08de4eeb5a68
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 19:23:07.5224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmtJlXNYe+vnxltteodgLnWO2nljlR2EYtmWElr3EmXD+pZLoIp6k8+n7+ARdqZYsDu/U9DbhemhJwyKRGyEF6fdLYB8ef+3vHnQSPcul+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6472
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=729 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080145
X-Proofpoint-GUID: LvpyY_OfAor34sF9kL6lRZqzCCalE0s7
X-Authority-Analysis: v=2.4 cv=JYSxbEKV c=1 sm=1 tr=0 ts=6960042c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=_0dltQeT7a2gsSsPBxQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: LvpyY_OfAor34sF9kL6lRZqzCCalE0s7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDE0NCBTYWx0ZWRfX8hi/6mhy+Zxn
 qPYhtVhHhFgfluwuljalFMwybu2NSKL+PuDzHdTw+z1u3mE9seb/KmxG7lP4pTWwyUYkx6ITun2
 su0H1XW7vU4aMFZOxYXm3VwKlncrvMqzKlymFnNX96ZFrqpFsRB2FVlGaFP6AQbB0n/BwMhlNT7
 Nq1fqR68HSA69NSxEyxs3ScMmG+Ttz134aWIkRjwectesuNaJ2I/sH61W8DjgBXT8znzXdq3QyG
 zgA5KVNjyfiEdAfocEgeuuGLjvvSqTyUKxTRDoigOF2GWPI1wumhiw8DD65KOdMnCu3ixegTNkx
 Pl3ejqnUnZtyy1EMKqNV2CcyN855aoit1b1Y36oQRLuFKegH/kVrF3AC1bUcivayFvGkoDPDj0Q
 aaniXmZh/HdeWLqKD8/Jlu7RcTcFNd6wrAfWS+Gfl0TaDPMFr79YvG+aaG6+KtJc1dJExESlcFJ
 1R93iOC/KMNa957TJbg==

On Thu, Jan 08, 2026 at 11:10:40AM -0800, Dave Hansen wrote:
> On 1/8/26 08:35, Lorenzo Stoakes wrote:
> <snip>
> >> +As with the output of any tooling,
> >>
> >> The result can be incorrect or inappropriate so
> >
> > LGTM! :)
> ...
>
> I tweaked James's version a wee bit, but I think I left the message in
> place. How does this hunk look?
>
> @@ -95,3 +95,8 @@ choose how they handle the contribution. For example, they might:
>   - Ask the submitter to explain in more detail about the contribution
>     so that the maintainer can feel comfortable that the submitter fully
>     understands how the code works.
> +
> +Finally, always be prepared for tooling that produces incorrect or
> +inappropriate content. Make sure you understand and to be able to
> +defend everything you submit. If you are unable to do so, maintainers
> +may choose to reject your series outright.
>

I feel like this formulation waters it down so much as to lose the emphasis
which was the entire point of it.

I'm also not sure why we're losing the scrutiny part?

Something like:

+If tools permit you to generate series entirely automatically, expect
+additional scrutiny.
+
+As with the output of any tooling, the result maybe incorrect or
+inappropriate, so you are expected to understand and to be able to defend
+everything you submit. If you are unable to do so, maintainers may choose
+to reject your series outright.

?
