Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FEA2EDD7D;
	Fri,  9 Jan 2026 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945293; cv=fail; b=AdTWTNaIkGK/X1CrBUzQSZKT5mpAdCPBh++IluJLxLwmSQCLuS/KWuho+0fxdtsVVamAcfkzQN6TwIAeOBN73V/daiO/+NYlDvYCjXUFdm+vgKPMtNB8s5J18fHwtTuUJDXgQnwzJ/BN6DIP0bJg7v//nZaU40dHfHIwyvSlkBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945293; c=relaxed/simple;
	bh=QzsHRt6OkSncPcF0+sFB3RGsHZKzO/HipTuCat1qPnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZoRWOUCZMbw+YFq7Dra/MjtN3JGl/tVJIgwK0we7i2911oNTUndBgWxMgIox2gk4w/OuA4mAWn/liOTBAlk6eBBKmwyPPjLSywmji0yrmZhiK52YdjWlPhhrd0XUbruN8OlpaojFEgbND+DON5R4l8bVHmkiwTHsFwSXbeilPdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KUN8Hek2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N8KhEH2E; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KUN8Hek2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N8KhEH2E"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6097bikF3070513;
	Fri, 9 Jan 2026 07:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=veC5ulrXdHOWFJeaj7
	YTiERPlT7vazn6v36jwXZvFQ0=; b=KUN8Hek2x2ePyemt3poeY9Qi95pgqg/QO6
	MkWtcxBnMGFAto3EekLGYba30sF/dWFVSZ7czo3tOpAQLReU79dvmMx2kUXJt6U1
	T2Qpu7T9wNa6Bi21fiosEOReKlOyjSiqUhKF1hHC9WHRBpLAtQ9gLwBgAGxsMov7
	8l4FSytw/sxQocODmDSO37jE2xe2JrfhRiK91Z0tMOaj4s50XDNi6UR4xx0G+ZMX
	t93b7uD3S2ot5acBtAm80bKULyIn3ea9cu8ySgxxFTywWVaxw51PZkzuT30aLOsJ
	p7SiaImQPcVCRBQci5thRmafiPZaBguyt9nF3r8VW7f+6M3CRzXA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjwecg0cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 07:54:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6097Y2IV020471;
	Fri, 9 Jan 2026 07:54:32 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjp3yv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 07:54:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFZIalGPCSLpVrgteERTcdkQfx1i3moHNVq8mXqiS3M40ZdXwxZZMJ4kWNBSt64ky7epk9+X1KRkmzp5+fXrXX0oVumrVRBgVsquqqcTFtc04bM9fu+1KwZNKJ/q3HUTJzQ1ZgP5CFjTLykgL2AjvWHxRW0JO3LdgW45L5Ov6SfhdhT3T+TixrGOEOHNqfdW9GnfYPhiRUMdna906yO9rNEHW6+M2BBXM5bl3FmDqfei7h8p7qHj9EmR7ysjywfy+QgsA/O/0lafySMekrlnJJUqBV3/R8l9Lc3UWYES70Y8209sazSLvoQIJfbt8NdmKz4fHx1rhEe4DzekqjaYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veC5ulrXdHOWFJeaj7YTiERPlT7vazn6v36jwXZvFQ0=;
 b=a+XPN9i08kz38NcTYCZc/x0RcPl7pu0HM+GE2MMg270OvwdXnOWOGdV8ymoRGf82AMalitjCfOGaEImaeFplWZU+TcffPmv6QOgmuq0dlEbs5cmxULfD6L5ET+ZIyxvmJwsmu7tkc1EzqR/5Q9iG8NsFK8shagtxIdkuedcYhaekAOrofKkJvKkoWQnTnkF5mWY+cKcIcqFhCIxTkkicaAoTrVfv6dSKCYU5LWqFe4yWceyqRLXMtrjFk2gdkBJ7FJKYvVHOG6ivgWz7XaZEhO1r3b9IDV1qicRk0Ue1+kJcEz1KcJG0ZqjvbgZJZzh/K8ClhXMrr4/W0F3Wn8lFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veC5ulrXdHOWFJeaj7YTiERPlT7vazn6v36jwXZvFQ0=;
 b=N8KhEH2EM6zSUMIcme8vqRbpF8d2r8J2E/9ixROCAATd+GUY6X73rb5kqwTkC504Cpby8tiRl1KxvFSSlQtrgDUjRo+UQGpPq1366mIXc1qw+QKFGvhRXQkWphWJRl/GMjJq+A7Vn9TUON1YUJWJaY2SYdRNjGXCMOxjetBsGHk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8298.namprd10.prod.outlook.com (2603:10b6:208:570::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 07:54:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 07:54:28 +0000
Date: Fri, 9 Jan 2026 07:54:31 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jens Axboe <axboe@kernel.dk>,
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
Message-ID: <0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
References: <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
 <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
 <aWCSVh6NocePMvp8@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWCSVh6NocePMvp8@stanley.mountain>
X-ClientProxiedBy: LO2P265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::31) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ca596a-cbfd-4c11-81bc-08de4f5450ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V3xs0UOJYH/vmvJGaCI0rwzoALpn95CQEU1lVOb+NEjNrrHYUbY0SPqjFz41?=
 =?us-ascii?Q?URfcLTYuHVsXIkOb0usq8C5I5P4S7A1Va5/MQZNlkjKanH5nV5ti4cuyjkay?=
 =?us-ascii?Q?YCRRtWzKUO6wOjHhN3Aq/wV5K0qKZ7B91tbcEiJDuixN3HGAq40/+gig7M41?=
 =?us-ascii?Q?2S1cx4rgjrcwYje76RMoJ3Wztq+XadfDZIntzVaxvewGZKBgtjrkIibQB1fr?=
 =?us-ascii?Q?8HHDaYwgCqUVuCV592VrrV6IzGvg8Y1xIy9GLutq7dey6cGDZsNgMk03JoJH?=
 =?us-ascii?Q?57D246UuA21vFUNB5LzvF8mWNk8HVJ1S1v7xtHxEjmxgsWXJ9xTQAVeIXc8j?=
 =?us-ascii?Q?PQLBhHOy1kZDuC65BWUlvC+zdxaFuS17Leb1H+Ji0HH5oJn+vC4iiav9ZzLy?=
 =?us-ascii?Q?1RDCZkE/5dUGc/yDiL+P2zdXnfEV+xJlzpyUy86VFaAYBoZulAhoRzXBLw6Z?=
 =?us-ascii?Q?mlIbq5Espr9VCnAA+uom2GTz0b+q/4erDSQBfqCqm5PRc4lWP56NeNCQl9nQ?=
 =?us-ascii?Q?9d1DC8p/CH86Gjrurew2kA2qIjPOioi3JiUSZVUWNoqrwO+gxnf1/QzAuqXQ?=
 =?us-ascii?Q?HGp5uTs3gy78COcdtXP1cEDnZ7siEsvAredsRKd4jxx6oq5nE+WWaaZARgiQ?=
 =?us-ascii?Q?PyEMLf+IwexfZxrpsl6W7loqqo8nBZ7kLl/PrZ6QftBp9AayWzuM8Jb7v70d?=
 =?us-ascii?Q?M+9kQtnH/Lr/qap2CT8+GCbScoomLvr95mouK3TKZncAtXXRjjKhaw7bO52v?=
 =?us-ascii?Q?IrLL3AWkhsw2HAAFDEjmqRA4u4imxk5CSwig3ApVPp4eR3IFKi04gNPs+kE3?=
 =?us-ascii?Q?k2znn+BXvlRc8Gj6v5PE5Kef9CD8fg5Lgosg4EM807VKljggXafT95ffUlqS?=
 =?us-ascii?Q?kTOj9bOSPCuljRfj3LznkMPzuLTFz6gg2fwc/Z/YUQKBtfEquSvJ+oW+Qg6P?=
 =?us-ascii?Q?amEQjW3efwRcM/12M7qKcRAZcVCM1rpM68HdPajkaOtmUpeFKHeBshekh4lT?=
 =?us-ascii?Q?DZRPSjUxXMqHmNbKCtyiwDodRlCV7InUBPy8wkVNEyj9LNDXTRoubxgpnc+5?=
 =?us-ascii?Q?pPEMLg/qqeYGCVUn2BbxvJhAx3QOjlz9YOsX5Vg+zXhz3KW6TevPMA+zqQhl?=
 =?us-ascii?Q?j2BmYEtXE97f5oOZWt0C41mEZuacjWWprTkvXnSixkAybhBduLbcT+J2eUin?=
 =?us-ascii?Q?wTRCvfmmkNk1uYpsIctnmOkjoAf7SU88pTQVp5r/jMiuaI/2i57DvYPCLdmp?=
 =?us-ascii?Q?GVKeoHQvNzCQ0wN9oVS7fe01EtMqPeep5QnNBfFBcQIYQGpR1ecxsl6nC8a6?=
 =?us-ascii?Q?LoJAqO9FftuvG1WUXCL3no2MjrXOCsDnkdvnRJqc8BfbBLxq+H+ROyWJPVk0?=
 =?us-ascii?Q?+bHXVdOe/BNIognIeBhoaRAz9F+RLHh6Fubkyb5HZ6sgITseelm3tD6lDou2?=
 =?us-ascii?Q?egSLi3xLrK6JHW0Q5cwFHPWqJcSoXBMJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eSijfb9RHL828o4i6XMHI4eVGMJZ5ejXYT0P1ARRLqtdylatreAEwJxmjwQJ?=
 =?us-ascii?Q?pj9NnPqamwBpup8kT/A/W68ljqdIx770lVgv+hwCreDf6xRr0TpB2afmzatk?=
 =?us-ascii?Q?/E+IROqB2WbWucjSifPWJEsPmuokWxm+6DMNKpfFF/Nc/TxZFSlVY90USYjZ?=
 =?us-ascii?Q?PBkoag4dduhP6m9v/rLwnGtTVdTBiiQ76T/YpfwezlHNU/bLrhEp+e19jqPY?=
 =?us-ascii?Q?L5e+WeYJjJJbC0UJY4aE/+5rXZ5cDCtTzhuyQxXKzIdSadKYJbm2dA4wB30v?=
 =?us-ascii?Q?VWteUosot0h/rKAeA7qQ4TcSZFcBs/bLZUakE4H4PnfgXvBHnx6jpbKCF4CS?=
 =?us-ascii?Q?5DU1dEmeutHmd/fPD/MLRmjX5g2hmI1HDbS1RC7wPs2mthlaXxnYF9iiHFzY?=
 =?us-ascii?Q?1X4ztkQKe+OMo4hKKyhM9u5f1848KGqzJd5cJJ9ovwODtg1kJycNNPJep6ib?=
 =?us-ascii?Q?cQdBjTf4F/P64PzUuPBhvIDNc9FmGpDEcFgDRnXTFlrNqABYofz8Ppa7l16K?=
 =?us-ascii?Q?ohsFEhSAEUrXNqSD8AjdMBX8sHzGOT2zLMnWVjo5/U2cwlsgMMXqkak+VECO?=
 =?us-ascii?Q?Pf9cVbmeisoiK0B2XQzwkm7Z1+pKAgky82KzxjcG0fijGaKzVtQluHMWZYM0?=
 =?us-ascii?Q?rV2AkMJl2KnBKzNX8JBHN+sqVLgT4jydClqnP2X4K85pNefUnQJPrz+mo9OY?=
 =?us-ascii?Q?p4HoEJJ0uOCkPq4KPf0qon78R2DYMsWcqzR9/ZTABuJdw5DVkQJEXQ+U8/zX?=
 =?us-ascii?Q?ao60MpeajLsD6ZpXIthoSL/7xlsJiSYgeUMZ6cQ/y9l2QPW6Wd1BrBK/STBy?=
 =?us-ascii?Q?CyP2K18w0mcwyyPRw6lBruSppMnF0WoDvDELcCYZziv8phbqTMK89MEgH4tM?=
 =?us-ascii?Q?arHEUD39bCeciMrTn+wSklxR8I01G3H5R4NeXY5ftlqklt4hnwkIZGWmOglp?=
 =?us-ascii?Q?2gfrhemFJzEJZ8mzOmkDUf/s6Nos/eWrRbumvNsOAa0KzXQNQzkSiNL7d1eB?=
 =?us-ascii?Q?Ss/HDTJdRV4K6M+GylZ5NVE6w+nzowX6qVkgrl/qDiH3JDLOmNn4VN0iiOGp?=
 =?us-ascii?Q?K0ctJRjcqpKc0sTPsOl+4jZ8K1rfc5QVlnuO4K7EsU143nGItQEpr6DZg2B8?=
 =?us-ascii?Q?PYg3eIrixfmF96UeDwfLm73XbGr3tK11IT5ahNNqD+bnj2zIg15HqXslWrvU?=
 =?us-ascii?Q?biQdWkj0tNjld1jXokUUw+J1IsCpusAIEb5VN8DucfENaqyUtLLljxZyHiPI?=
 =?us-ascii?Q?knus37Whbs1uwL00aufa1QP6IUvysUBsbhRCaXp4nHs8SOa3j8VqLR+bejcM?=
 =?us-ascii?Q?SjCj8Zo+Od0AEE2sndIIshr1jl+OdvgFgojXaBnBKLOK5KtycectHJ9jo764?=
 =?us-ascii?Q?It1B+q5OUbqvYKnV2JGzLvP2/CNvHc/O7jJ1vueI2mTYs7z+UxWwPAZG22yK?=
 =?us-ascii?Q?RVIVWA4XlETcSiJZs4oYrKYi/36ZYzuS17+LXzQLH/86yMF2P1RhZPi+9eWk?=
 =?us-ascii?Q?AmXAtllvH9IB9OMCyXVpG+hRzBSwWNtp6Ojh1ZBLl5iYWdU8sIube9L5n/ey?=
 =?us-ascii?Q?Z7iUqzn1eCR69oNKewa0CDHiBSpD30mSM4Yl1YDQC1E0ZLyq9Y+6HRbiIcZh?=
 =?us-ascii?Q?bdt1+kGIibIOtug1neL/R3lAT5Pa6yjXmv8m345W4jRK1eVbAI5N2u9EbKFE?=
 =?us-ascii?Q?LZfA+eAWPDiaUB9O5v/L4FqLGW2MV/ykD4u1o6IRCKyFPuUFfxpQtvttLR8a?=
 =?us-ascii?Q?V7YnLdHaDXKM3A60mWYN1NB3UJcuUvU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i8pnmX23Js5uNi4Ay9VYYt0XbBkSrWi3BPXo4BbboWShW3rS7ZSojP8v1TEwfVIcpfb0Utn760+J0AB6lmwbtwe9miGRyW76JSE+e+whNlVzEOWTly2F8cwThQwZZHXr8ytxo970fTZptu2aM23QMZ7Pc0XfpPHkBNY2FlkJW/ibeRenFijkzcZGaq5g4yADy9Kg1NvGMWC8uJYejBqSIP2lirC7S8epfqjQUI7KQdP5HBaPOEsTGEYa25gfXotztsSKdi6NV0Ox82EZwjZS7EAmvprRtr6EVAftC8SZkg+29/m/Hc8vaCLQI6qm/52Afcj8CP3+fvGKVwWCtiN7FaBlOJKhAOE+Lp9hdnXNqNuG55Qf8wLDOSe3tHhWK98ThzlUDVAjN2XTqG1cQTANVcDiB9UPSSKtPCnPN5MofXmHrRN1T3CnWAmb8J107NvSqjoRO4JSUAHqj/DpbsUV0qgVg0x84zDOa1w0t48YJAbmTTOsbOleJgs7cRg+2sL114f+COEH1GnE++BtRot9PVBTC0tezha5MnAz0nw7a4lqveDgyGVHVCrAU2KPyK/X/HZl09zOKYir6ONHcxuWGg+6i3/4iBab2as7kMEaNlY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ca596a-cbfd-4c11-81bc-08de4f5450ca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 07:54:28.5675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U56hJYQDqrf/k1bILyOba1p43G45fuulTIgO4FFSGCuqrohACk5yaL0A/4AO7wdoZ1wuCcFqkUJvGOkB5Lf5SbCG4h6ifE/Jr1OaG7fh/4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8298
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601090054
X-Proofpoint-ORIG-GUID: bpAhGeICnh3oKnYPzr7ci54_qGguJbZP
X-Authority-Analysis: v=2.4 cv=Vrsuwu2n c=1 sm=1 tr=0 ts=6960b439 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zOncSS9fAAAA:8 a=An4rCo1kMYuWtOdG_NoA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1NCBTYWx0ZWRfXwZBsAFnxQgY+
 1BexbaJzghb2W0CrNbvKE5I7BmfULw+h1qwNNaM+t1db58wDmFrYOzXEkmxnmVeLq3mlHsyQa/S
 MQEOnZSTe7mXzdnGjEM4O6PN3xujFmE4mRVn1gYc+lB+eLuh2nx6sRICNI2SAtC/WcblJ1ZMAYM
 owqTimY++EgpS2E8G1MBe6Op4ZZf4wldh8liQi1FIXdupcG8EeUGg9BNDU/yl8IFN/1cdLDSlu6
 75stEbUeRpKoW/GuoOzf6qGEJCu/E9tYb3XRLQw5wrAUhc92UzD5DmTKAmEmsuyyX2YiaxK+S+L
 ARbVQT8BVtOLZj40aTvK2SW2mwDFe18RymZiIZR+TyXQK9R+eUnIm+QjfNvg8GUdcl4+l/hY0+P
 4IGjwHXzgg6AVxOZD1VRosUA1QyBtwaFawdo8m6qrmLqPlO2ZkLDLa8VvG/0RjnK0I4IF2huoPy
 jLZ72mEAT+wANNN16Eadv2nYi8NzvKUS89X5ZCP4=
X-Proofpoint-GUID: bpAhGeICnh3oKnYPzr7ci54_qGguJbZP

On Fri, Jan 09, 2026 at 08:29:58AM +0300, Dan Carpenter wrote:
> On Thu, Jan 08, 2026 at 04:04:39PM -0500, Liam R. Howlett wrote:
> > * Jens Axboe <axboe@kernel.dk> [260108 15:54]:
> > > On 1/8/26 12:23 PM, Lorenzo Stoakes wrote:
> > > >> @@ -95,3 +95,8 @@ choose how they handle the contribution. For example, they might:
> > > >>   - Ask the submitter to explain in more detail about the contribution
> > > >>     so that the maintainer can feel comfortable that the submitter fully
> > > >>     understands how the code works.
> > > >> +
> > > >> +Finally, always be prepared for tooling that produces incorrect or
> > > >> +inappropriate content. Make sure you understand and to be able to
> > > >> +defend everything you submit. If you are unable to do so, maintainers
> > > >> +may choose to reject your series outright.
> > > >>
> > > >
> > > > I feel like this formulation waters it down so much as to lose the emphasis
> > > > which was the entire point of it.
> > > >
> > > > I'm also not sure why we're losing the scrutiny part?
> > > >
> > > > Something like:
> > > >
> > > > +If tools permit you to generate series entirely automatically, expect
> > > > +additional scrutiny.
> > > > +
> > > > +As with the output of any tooling, the result maybe incorrect or
> > > > +inappropriate, so you are expected to understand and to be able to defend
> > > > +everything you submit. If you are unable to do so, maintainers may choose
> > > > +to reject your series outright.
> > >
> > > Eh, why not some variant of:
> > >
> > > "If you are unable to do so, then don't submit the resulting changes."
> > >
> > > Talking only for myself, I have ZERO interest in receiving code from
> > > someone that doesn't even understand what it does. And it'd be better to
> > > NOT waste my or anyone elses time if that's the level of the submission.
> >
> > Yes, agreed.
> >
>
> Yeah.  Me too.
>
> > If I cannot understand it and the author is clueless about the patch,
> > then I'm going to be way more grumpy than the wording of that statement.
> >
> > I'd assume the submitter would just get the ai to answer it anyways
> > since that's fitting with the level of the submission.
>
> Yes.  That has happened to me.  I asked the submitter how do you know
> this is true? And the v2 had a long AI generated explanation which quoted
> a spec from an AI hallucination.
>
> I like Dave's document but the first paragraph should be to not send AI
> slop.

This is the entire point of my push back here :)

I'd prefer us to be truly emphatic with a 'NO SLOP PLEASE' as the opener and
using that term, but I'm compromising because... well you saw Linus's position
right?

I do find it... naive to think that we won't experience this. For one it's
already started, for another people working on open source projects like
Postgres may have something to say e.g. [0]...

[0]:https://mastodon.social/@AndresFreundTec/115860496055796941

Do we really want to provide a milquetoast document that is lovely and agreeable
and reading it doesn't explicitly say no slop that _will_ be reported on like that?

Note that Linus's position on this has been reported as essentially 'Linus says
AI tools are like other tools and you are STUPID if you think otherwise they are
FINE' - which is not what he said, but does that matter?

Do we really truly think doing that is going to have no impact on people sending
us crap? There are a bunch of well-meaning but less-talented people who try to
do kernel stuff, we've all seen it and dealt with it. These same people _will_
pay attention to this kind of thing and try it on.

Yes we can't do anything about bad faith people who'll ignore everything. But in
that case being able to point at the doc will make life practically _easier_.

Either way I think it's important we have something vaguely emphatic there.

Which is why I'm tiring myself out with this thread when I have a lot of other
things to do :)

>
> regards,
> dan carpenter
>

Cheers, Lorenzo
