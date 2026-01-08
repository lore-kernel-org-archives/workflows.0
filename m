Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8731830FC25;
	Thu,  8 Jan 2026 18:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767897073; cv=fail; b=S6RZku6zaWyzmr7VrhGOp+erh5AVX1c49JIDt1vKz6PSVlpBukLRQsKHi+j/o1KAgVe6sOnHVxGnjLcjws1yulxLeILaLnYZzofE3NQs9El8XdkTnZGYMGa6FTKyMS7aWTJCB1jMggvxcekaE5K5JiTa4xBhSVWoInB4nSgX5yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767897073; c=relaxed/simple;
	bh=XgEbyc+wIecB70+YZrQVwUZT8Cw3BTEi9gQPxer1Gdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lnuJUP3UjG/QWbW/WruqdVHJi8pTLiI3R+ff6d5+kp1U0Fb9SwfaIudyXpCzzfD2EA2XGPpTrhd8LHfYPJtKAtcRpeFrX7fNrtLhrMYpHzp10sxJzFUhChTOQIScrwTIsa3L3iK8GIfSTapmgakQFC+XuBi0R7OA9K//Ug1W7uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OYTx7QmS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=E8wy4AFn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OYTx7QmS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="E8wy4AFn"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Ho29i1207559;
	Thu, 8 Jan 2026 18:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=XgEbyc+wIecB70+YZr
	QVwUZT8Cw3BTEi9gQPxer1Gdg=; b=OYTx7QmSs9mIQv+81wdNz/lwumpgwzEed5
	GRQT3R8vt6Hth4+l/3Ss63YZZKRx/dFSpFPN/gjA0MXEXGseGSoNUGNnopJo/vqS
	kombn+Hsl+k6MuuKZytHPgYZDcQQSl4S8F2vIUVVDHshynSl7emskjsTItVq9RXU
	6omeACTh/Zm1NaK+BJStAdhHta6lfgbU4y/PGgRP20RmmddWu5Q2k96LP9TxNnin
	eIOaMOqGuBLc+0bhipJ81DlJeQVWSJfvMW5o7oloq+3ZjAjCDKX1itcRw/VtL7yl
	DlDDuFytfUNW5pLPmD42zCsC+EN2iw/JQu7j85uFyp5TU4VtgGsQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjhb1823w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 18:30:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608HnXT7026442;
	Thu, 8 Jan 2026 18:30:52 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjb5d4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 18:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFqBCkfT3tjr82ToR0nn4zqxKuJZqHFDpTGQWf6qrBNQDOQ+z7MuCTvtcYKbPuxNzCeFhxMiSgDcTK/Ivxq7rDS8rABYWfimBoYn7ye1wNgNWxHjG901dPiHXtgKPRL4THvBEf2+dxnEdJVUITJVQyQh4PZcFrNtkmTc1SssdfZshraEKUXjVr6L0AxT6MiIbfrg89TmUj+QDKfMUcKic6z7aImtNB3JrIdm5oi7+WrV28/2oTzuUzJerZ7eVf9xPhOPJVEk2PDBACGLIPOcd+Z32t6qTLqY5mwYqzKPbTpkb+5msiT7lLPcCcwriORQE7SpWfARwLCr7lNoVp5JxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgEbyc+wIecB70+YZrQVwUZT8Cw3BTEi9gQPxer1Gdg=;
 b=OhSQUmZjw0H5hF96e6xgNklaRT6aNjpc/rcquH61wbjDGeOcI9p2E5swFtxj/7eoGtVntbNBVr2eMLEI5BVBXY1mmS8DVwLuXZCv5KJptJGPEwvpdfrsqdbqhyFg7ki8n/1DpNHZc/duZp4TJ1I7K8yzrKBN2k/kr2B/NlpFDlrkltOYeqHw3Pq91GfTMt9jt3tXzx4JjgFCT/+8uJmpoLOMqrk4YGAuV9DhL5t0Nsj25tmNCQdWtySYsbJ4e1dSnK4oeAhuqUSUXGu44lO3d8UccsKXez/OzEyxcCunEmMhYzR4ATWlAqgP2sVXi6Gd1RkesRPgTXiThIjUHwk6Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgEbyc+wIecB70+YZrQVwUZT8Cw3BTEi9gQPxer1Gdg=;
 b=E8wy4AFnpqoyINk/wDHnZswBR6tZIwbndmzzbnY+XH7xoh1Ot8kO9J9p2Zh1yaPkYBlNsq6ACzjitRHoVSpZURBwwi6khUE1zvTPsdNsKNBglPQ4l0lSX9ADd3FHfalYwulEYp2PQihk1Z41XRjKRGNqZCwOTtCq1h/6ULfseAg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF7E749FEBA.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ac) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 18:30:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 18:30:47 +0000
Date: Thu, 8 Jan 2026 18:30:46 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
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
Message-ID: <1611fe9f-26b5-4e39-b6f7-5a264ed810fa@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <20260107165816.63ff25ac@gandalf.local.home>
 <f72c3894-f83c-4bb9-abfb-afc2aa22c705@lucifer.local>
 <20260108131926.59b456fc@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108131926.59b456fc@gandalf.local.home>
X-ClientProxiedBy: LO2P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::24) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF7E749FEBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d19cff-5ea3-47bc-167c-08de4ee40a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e6mLC1W8k7y0OU7NmUKWs00PNhGhZR/NJ/0oKviguvAU4R6oP9U5oNxcU28k?=
 =?us-ascii?Q?mnlMBAOJ8bfP4sK1DJ3ZZhSLFIwxOSMhiyWmwwEpfuIHkZEGOUzUCnEiCLm4?=
 =?us-ascii?Q?5HjnDkAgBF5oNAsh9c98xpEo9+U7jvVGNwpJI8yfGaeKjm+MlNaQ7e7G15UT?=
 =?us-ascii?Q?bJXasFGpOZnz7FpRYSvqIvE99RDSssG90GHP0M+Rumd8H3sDrvTZiugrGphX?=
 =?us-ascii?Q?YYxhnI/9jDwok22Mvn8/u8EI97V8qhRbWRwvOyqoIr+52f7F83zEwPVXKSOg?=
 =?us-ascii?Q?a5qZSlEfefuvX9Qh0SFRDpMFyu0+Dis9evRkqwHsKxChurBk/i/GLcdKegix?=
 =?us-ascii?Q?/zL4L5fk9egzZagHbjG9+sor2scalz35M1xBOqhAFBEvC50nCg88UNEajnzR?=
 =?us-ascii?Q?ub3+mPcbJgUvL6iMMFvZx2/pohHSPCkoVMgDZf+LvCZANmBx/B0Cx2GO/rXs?=
 =?us-ascii?Q?qoOqkXbGZIMd4x3YbpMNXs7OugmN3FQKAymWBusQk1f6wGixLVGB7do4nBVJ?=
 =?us-ascii?Q?HHw0j3U1aGinTIj4ElLOo1sxt775TT9MhcMpTH4pjeiWWv7sJQqX1SICTEUf?=
 =?us-ascii?Q?0tDiyTRbjSMucCDFt36/RtpV8EfqV2g7mMeJQBieIDGEUMKdD+xmun9CpXRz?=
 =?us-ascii?Q?1CW5pmaeuwIHKnqiEYhIPxQcXA/aWviVbVnIu5my/VxNeBFj9VCpZu4E7+G2?=
 =?us-ascii?Q?K1MnkFLIqWOIxKzCuVEwDld0rvCMyV9Cj8pwbU9wGWrq6RNDX2RrG86prwWW?=
 =?us-ascii?Q?0XWIKcfc5UIf0wZVgOjawwhqVNJRujlqrSH5uBd5NYICM/EuhE/emR5WWyM7?=
 =?us-ascii?Q?2YsE4/rmYTTY36bxNr7BPS9REfZoYseMutKZJ/2G7C1BlavTDg6SEOhS74Hh?=
 =?us-ascii?Q?ymAl95W+QHHD1s2Tx3ZuZcEuZmn+Jl/44cnRlGsf4f9fwqlH98SvXVVHvP8p?=
 =?us-ascii?Q?4C2zCL3UU+1TGR4joQEDQhxUqzcBI+3ST3Cw+ABj6Fd98HZQxL/20WpNjk4s?=
 =?us-ascii?Q?AUig0CNkVcDKg3obX3d5P0bYIvtXvjBhR8JdWA7xFOmpFDT1cSathXTVhEnQ?=
 =?us-ascii?Q?wYEmER2NrTjwWRSl41fPQkXONNHqVvscD6Id4XTSo90G7tZy/KArRtJrazcR?=
 =?us-ascii?Q?SdvRfX71OSXT6zCxo2dX/UK1KgxRiz9assng7jjE+vzycPYgDrch6JI9hLCM?=
 =?us-ascii?Q?biJLAlEtEgCp/uqIN9Vb2zlKUsKqPeYBt/sh/lSjZZuRYt0xQGkEKDyWMUj7?=
 =?us-ascii?Q?ErIZn4YJZdpW+jzQ3R62LRNUChVzYqWPTMXxfNoNVrrBoiAFsP/AFvmRnjVg?=
 =?us-ascii?Q?8CexIQtvtc8KC/DhuUHSAVfC9vFZ2mzwUMv2re5M5mwrWlIso2MY3bDTVfVw?=
 =?us-ascii?Q?S3TOAO4guCuiMYHcKnezIc4POy40dEe2kWwp3OzA/s4YUchiQy10jS3Tf43O?=
 =?us-ascii?Q?juhDUZ4OnFTNrwrkzrCagW4Nn75DPE/+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6aD7KbS5uULPQLyN9zS4hsXZdH9qL7bZMdjB5Vj0WJvwIfYczJZYOmJYK1Ab?=
 =?us-ascii?Q?kIXvDzwejjP2SDymzTD8q3hzySe+7vCv6pYY4s+0vu7LO4YOretGihawU5kC?=
 =?us-ascii?Q?I6QEDJF/x06u0kYQ3Xm5SGev3scDxzJ2Cwziu5dvTEaywE/8c0Vdk4tSw/py?=
 =?us-ascii?Q?8jV4INHr5muXlf+KQxkueFLTW20aaNzQgxr9TnzIrM3N+KTPqlgt2IsmgbtN?=
 =?us-ascii?Q?rGQq3ioAgTu7NVVHPGDnDh1d/PsXCzCoYWEU5jYX191PhfBcT4PCAS+Sn6oi?=
 =?us-ascii?Q?Riq4v5h//iZvJ83Zd/iD2csonGIsVqvhCLwoZFww8Ubc9S/CiVXhAa2tTaSf?=
 =?us-ascii?Q?i7eWZs6MNs/w7gaQ4TL/ygtt1RSfPDWygOxTii0uuQf2B3rakeIw0iS9/7ZV?=
 =?us-ascii?Q?Nnao2svLLPFtzbCgANOVvgbIDyflLR1AwSVgeNZtA9xnuSXgeOsp9ogvfoU3?=
 =?us-ascii?Q?UG0d8aY+hGJauup4A06q2DhNdPjlBqW7CXcQ+chzIANiGJwM76Lg06bM15qU?=
 =?us-ascii?Q?AOE5u9VFt97JM2SJrl38AlD/o/zsZKffB8lArIiKRihwcUBI2JrxbdTkdgnn?=
 =?us-ascii?Q?9R9Dh16EWsyxYMDJ7E5L28a1Bd2h9GhjVWRFdLgjduN1+vMBzwTBzBRO7jmG?=
 =?us-ascii?Q?7MR2y9DRd602PZLBtDhbQAEy+9p8k4n6pd4xjCcoiRA0P1M9tq0KNf8qdxXa?=
 =?us-ascii?Q?K2//l3gdsJg4kolL6Bc5om2LA8lfRkwsZDABooJRnQPISLsOSR2+0/CsRDmm?=
 =?us-ascii?Q?nQxzsIxCKielPkcRCL6c1sK0OpZ4bGtk7TFXG017fhM/6RfuBylp0AGMLoea?=
 =?us-ascii?Q?FB3pjE6F0CDi4kzKUSgbKenWoA6N0OUU1OKvbpzwyIObhBbpaMxXaJI5tr3t?=
 =?us-ascii?Q?jaA8S7wcCl5++ADxO6/v4XI+DaIiGumcNyOTLfZSY8xZcY6iLz3vJyDhYFGj?=
 =?us-ascii?Q?h7K2/le6UZ09IX956kTeBSQ7bhK4p7bwwwNNEqH7N+lzAh/3dG25lz91hC1I?=
 =?us-ascii?Q?TFE/a5fcM8r2l9SXa0BbvctYQj/y7YiMDirSqFzgwvUbq8dDargSKN+d424v?=
 =?us-ascii?Q?lb3+xw+zF5uuCOkMDYS9pScFK1ceGW/WgmkJkSe3U+vKHNQkWKyKw59kCDu/?=
 =?us-ascii?Q?P1ryINn9TjZqaIaN9kXkG5mQ5HchDpbZyBybronp2fLBrE8MrOm0BWJrrl42?=
 =?us-ascii?Q?f1zhLDwy0xdLfBZGAiS47W4zbldeJtba9N/D56hhnAbEOpFkF3oftNDYRu77?=
 =?us-ascii?Q?VMQbpHG6wwXDKN9uwcu+CjNlKo26F43eYKaf2gxhdFyQ9xnuV905++eK3PRb?=
 =?us-ascii?Q?bub5Wcasx3Zmxyeg08RBrmE3gP92I817cJe0nWWgL5I4D1p24/vuZ3YFtwuJ?=
 =?us-ascii?Q?+QADyFgB43jamLlm8RWpTOfNAIe4Zp8QXrkQEqsLZI4WRpJHKYLvMcHxCd5D?=
 =?us-ascii?Q?GPRZuhlSjveDz3YvDMqJXGdB6Lx6SJQevKTAwXz3PXo7qFepx1jBTz2s9gB4?=
 =?us-ascii?Q?vLeVG7Cmj1X/VVqKdbkqRLvArAW/rdSvuFoNg9u2flEXvp044xeon/UhUkhe?=
 =?us-ascii?Q?7y079fXS1sjt3t4S0DN9a/Ph6mafdfFhl5NNcjPbB3UJujEtPL8RWAW2KsXg?=
 =?us-ascii?Q?M5gjXxajtQsia5ydndnmlSZbA5/7RsHkyuOnPp3eVV27L8YAyXMOhon9mN8J?=
 =?us-ascii?Q?LTJ5mqRsInyxuCZ4U+SaufUvn7C47NpbijEFjB6+BkjbRQswNa/Bikczu5B0?=
 =?us-ascii?Q?IR5eo0A3XsTg3A5VWeTC8tMeKqww+Wc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ou75zIYoalekQh+0XNJSufeqK2oN+8rLw2nYucgJOLvNNf68RSGC8f/0+VBYXa46YmcJ1u4yVw1HLxDiCuObyvud9xPuVD6d3EL2lAujN5Pbb1jg5TAoV3F1kvJqpUdW0M9fRO6Dzi1gv5SLhldcWHomzQV6tF6Ke+lGva6zhPaNnnVbCvAq0NxtKqWtIZ4UrmhNTZGTOcoGROSR8AShnGuM5HWVfOAsB18JoD/qPQEGxJvLGzzv4vmdBooSyJJpgdldvIWX3CFwRCSWMmsPrEdBkDoftm5MDtQvild0SzdkKKBaL7ahaY8Pl/RwhxkO+57d/eA7URMaGV8KQuMrXD70YV9dkLFX3Y10TarD2arr/Jl0Yt99wgmGxwtmJo9ZwXGzmMg7WpWO2Jc+s9Ry3f4X5JCWixi8yGkjxB+mHiy6O1U/wvC0uwak3/8kU6bhRSSfr9f0gihZlVQ56E+lcOHqUqWjOHnVwtlCVbScAn0cc0JQMjyYI0f6wtw4wYignnNC3LbmsIKtCVxZF79KsaCWSNmz5KWeNmefb4MyIgV8uUPArLq6MmgryVMZKT5rOpA6ZYntFlvcbK47FdBkQxQD0mw8C+vwN2y7jmCcxYw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d19cff-5ea3-47bc-167c-08de4ee40a9e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 18:30:47.1662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XgikP/MkrUJ2lcj1h+/ZLDbzQdlbEW4fOBgC0MrGqTUo7puJIlpiCNWxq1Iw99QTNM9V6jktyIaroUGlZo3u/5HsFlCxXXyiBOainGW2zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7E749FEBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080137
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEzNyBTYWx0ZWRfX+CO1FGveZEEm
 u63mkr+tx4CbvA8eMb2hiOMjK4QTO27EE7hmW+BW8lgJc3IZyzJNqjfal6fHI83ZMvMGG/Rfrnz
 PEWcOjoF/thelcjMw/ik+eCYb7uU2KsHcBcz2ozv4wJ5rxebgux37jF0gnf7go0cRLaYY2PyJQK
 RRBEJW/uVbbynps0wdHSrIWZhgwRSY3n9jMz4cL4m5JIs5U7VmucnPmel6nPPqK0o/h3eOyeKMn
 WNMCrp8zbZBXaukQrvaCfSmXNnWDj63/ysBMkeX0IG/XHlmfUUhb1DeXd6PoyuhjBb8ef4Doqj2
 G25DxZ6/kagN/DIdC/gbeGm+ZTnE0DTbv39M1IBBLvRpHQBABHOFzKvkEtkR/CttjJNe/DbFvvX
 gwKbcFNq888n0Y3rOjcAGfrSiMjPQI5j8Rt0ff4osvgW7T6z+xXelEeGgf0pvt68P3AFnD65ohT
 IYXsWRFDy8yEa28rzsw==
X-Proofpoint-ORIG-GUID: xnvBxcfdTcKP34ErVcLd6RzmcGnQlZFv
X-Proofpoint-GUID: xnvBxcfdTcKP34ErVcLd6RzmcGnQlZFv
X-Authority-Analysis: v=2.4 cv=S4PUAYsP c=1 sm=1 tr=0 ts=695ff7dd cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=FTb1W2UGOuGqz3ZxuKMA:9 a=CjuIK1q_8ugA:10

On Thu, Jan 08, 2026 at 01:19:26PM -0500, Steven Rostedt wrote:
> On Thu, 8 Jan 2026 11:29:47 +0000
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > > But one thing I learned about my decade on the TAB, is don't worry about
> > > things you are afraid might happen, just make sure you address what is
> > > currently happening. Especially when it's easy to update the rules.
> >
> > I mean why are we even writing the document at all in that case :) why did this
> > discussion come up at the maintainer's summit, etc.
>
> What happened that started this discussion was me reading about an AI patch
> that was submitted and accepted without the maintainer knowing that the
> patch was 100% created by AI. That maintainer just happened to be me! I
> made a stink about not disclosing the fact that the patch was generated by
> AI. I wanted full transparency.
>
> A long discussion started there where we noticed that we have no written
> policy on transparency of tooling used to create patches and wanted to fix
> that. That was the reason this all started, but it expanded to "Oh we need
> to document our policy on AI too". That was an after thought.
>
> See why I'm still pushing to only document what our current policy is.

Hm, not sure I can square that with 'these rules already existed'. Were they
unwritten rules...?

I mean from my + outside world's perspective it kicked off from Sasha sending
the patch adding config files for LLM tooling, then the MS thread(s), then this
thread.

Though obviously you mentioned that occasion there.

>
> >
> > I think it's sensible to establish a clear policy on how we deal with this
> > _ahead of time_.
>
> Why? We don't know what is going to happen. We are only assuming things are
> going to be a problem, where it may never be.

I mean google 'AI slop'. If you think the kernel is mysteriously immune to it
I'd be curious as to the justification.

As a maintainer I find it mildly irritating that you'd be so resistant to very
small changes to the document to put a little more emphasis on this and instead
ask me to wait until I'm overwhelmed.

It's not really a huge ask.

>
> >
> > And as I said to Linus (and previously in discussions on this) I fear the
> > press reporting 'linux kernel welcomes AI submissions, sees it like any
> > other tool'.
>
> But this document doesn't even say that. It's only expressing in writing
> what our policy is on transparency of using tooling where AI is just one
> more tool. AI submissions have already been done. It's only accepted after
> the normal process is followed.

Honestly you really think that people are looking at this as a general 'tools'
thing and not about AI? Really? I mean have you _read_ kernel reporting lately,
especially the more tabloid clickbaity stuff?

>
> -- Steve

Honestly this is all moot as Linus has made his position clear. But I wanted to
be heard.

Thanks, Lorenzo
