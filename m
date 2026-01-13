Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F93806D0;
	Tue, 13 Jan 2026 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295440; cv=fail; b=b3S55jPg/i/7fLMLjKyYDwVaCdjTOp8iNiaUMkl1TPNcNunQLW82qOF/Gdf/DX/xTpxz3l8MWj+HkFk+x/zYhCiaM6sbqRoenwuBYoceTAwprhVuTis1UkXlESBuwboG73W0YxBL+4zbFUfq1KgWZ25DGv6NW4jW0jKZ0WeSyLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295440; c=relaxed/simple;
	bh=rzqJj+Jn1e0o7hLo0vjDtTl+ID0S/zjzBaCpTVloOaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=auxzc1w+0Te/jhuPEUI5LB6K/Irgd9B8XAhaAvWLJ74zcA/+giXIQ5Fp/p7JWV7vqtwxzIKzswPI0ykW9hDplZP0R/JzAk6SITSkBqmpuyg8dF3eLmcUyG8OSCLHm6wrHI8sZmT6fxTsVxh5Aq/gczHmyYwrpQVOcvX4qjTU/C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kdssREQn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Jz0PXttZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kdssREQn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Jz0PXttZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1hECI2677475;
	Tue, 13 Jan 2026 09:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Q+Tuk7QyqFH1cFC8Go
	QuJwO8O0BXYzAxeX+lFck9Yno=; b=kdssREQnGVcLhytLfFg1MoplgjtKKiAwCd
	0UCqgtREy34j0lqe1RrnIF5I9zK7waLlUwKZpmy/hrxIudlJZ+pJgUtez168zPEJ
	G42+Rra+BBf3jrNq2rFFYW43qC+GTtL52GV44y4Y3em/vpctqkuziRIB7p8Eeiii
	MJ6rRNlG/OYp+HtwmzVoeozR1c7Frvx4VHUhmlix2gpZx553NiiVim3gyithCqic
	r4DKewxhXnheYi/bxqX0/KuUJ3yEWgIIsexyctHv15KtgY7n06ldkJoZrUzdtXpj
	tLUfntxrlei2SaDU7qWJH3JwvIAKaO+Zdv0EW2IDginw7lezv6zA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkrgnu327-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jan 2026 09:10:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60D8XZWu034710;
	Tue, 13 Jan 2026 09:10:00 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011035.outbound.protection.outlook.com [52.101.62.35])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd78gm8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jan 2026 09:10:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyTC2GHNxBunXF1gTfor0VvliDzuHs2NztoeIG4mgCU2sVm0kEoua9se4um8r4jhxrxQDqIECAy+By0GDPbGRm9kp5reEgPfT2b5uHa4bBaUXI6u+AXM/X5ou0DB459to4iOZa6fw/lNJ9B4QUi7FT9tSLYlte6zYr6wlogok1ya0XoXVPzsScavmUKip8TxN5ZR5dfNa0PNjwPSfwinp0LUuyTuFjyrEVWkkAJirSVYS0YLudvuT1bmcN2monog1aDj4+A0YemaD0HhhVtxK/5WEuWPOc3NPEGlsY9Z48ujE61rdq8IzjmuWK8SyxNm+ZnA9UN73pT9fO36OLud/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+Tuk7QyqFH1cFC8GoQuJwO8O0BXYzAxeX+lFck9Yno=;
 b=UDzE8AhNlIjMGii5NNlpyKr/yRNsyd1PUwz76025d6kNZflQxRuSNoQ9UDlwgpu0zrjxLi5AjA2kZCTgekbLOsKHj1N0IJw9juj7+KYIq54QiRx2ibQmKA7/WtHqStcJ4K5m2Q3sL7U9dTSX3nkyC+1RFjjefBQ2vZOzPHwOOpt7nj4coZw1N/OFOzM8CdQQULEAIqZOqbtNcGEsKnAq5oMzCo9O56qj6iXHMWndbZzZlPjLqd6sNwUf8dA+h1mrr3MK6zXnZsXxlrN8n80EbmyhyC5yIz3Kxy2Xb2RHBwFYTi8Umh3R3AO4dMetvO/jPgf5UMWqNI/mqFldh873rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+Tuk7QyqFH1cFC8GoQuJwO8O0BXYzAxeX+lFck9Yno=;
 b=Jz0PXttZl0JxizrnF6W6ujgkrvu9I++ozKZiJMmW6obl95djCUWXQKFkKiMkPnvGwBu3X4yZsLlyeG8iSzTlbSEkYvwhgeDxXe+exdG/D/mZxtKECl3z3f0KnUtgbtzSQ8LxkCaHHB9Fax2RZCJkFAul/Sov9Wn4ZK0wSlULlF4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BL3PR10MB6187.namprd10.prod.outlook.com (2603:10b6:208:3be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Tue, 13 Jan
 2026 09:09:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 09:09:56 +0000
Date: Tue, 13 Jan 2026 09:09:57 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Simon Glass <simon.glass@canonical.com>, NeilBrown <neilb@ownmail.net>,
        Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
        workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <0b019625-bf70-4736-bc17-7a0c71d6f38f@lucifer.local>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
X-ClientProxiedBy: LO4P123CA0117.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BL3PR10MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: e689b6ec-fb03-4e7c-576a-08de528384fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aA2yRjj/xCfGY4mV2SKZv7b3G4L8Lnm6AuuLac6v/dSoT3XQC/1JQ02cGKzz?=
 =?us-ascii?Q?FYe0jBjhlCfm0hwOGR1YMiW6jrmpaC5fv2PpVgGKfOLOTHaaiA6aeD9b7mLq?=
 =?us-ascii?Q?Hi1Pci2yEHMrapQlDIvDE6zZ3ds/Kkl7gT2r07nbaTmXVPvib89I+q6sWUgH?=
 =?us-ascii?Q?OYgMli9/m2tdlVrNfHXivpIgdwnjRmWE3m5jgKyyOY5MoPZh6UmherZ6JONc?=
 =?us-ascii?Q?E8ct7x3BGpe2mV8Zb/+YbsvDJyCEsilkEHWbpJyCzVPdlBrL2R5ptVljme7U?=
 =?us-ascii?Q?9oqQfGftgWtL35Ju5uJiowvnju5RRrXTCPcLsN+gtQ1kBDpY7yanc8eD2CSA?=
 =?us-ascii?Q?ZWkv8/ZZcxwf2OAUUTak7rtSrbMLPUR/1RL/zogKW7nNGCnGNkO2LzaIXFPW?=
 =?us-ascii?Q?qlxw71WI/GD472BLJnS1Jp5jDwKvrHkhyDwIABVHgpZyCGVEASxV6qJxONjG?=
 =?us-ascii?Q?LSvcvr2QWs7uFzYKIoFaUdFun0AQaK2i4wxCLpeLAXTeZHSan/GfN36izk/K?=
 =?us-ascii?Q?5BI75F92QUEgP75EhjWE4Ikd4xufZreM0HBwUgUri0JCYN+2IZiZqs8U+IA+?=
 =?us-ascii?Q?+u+cfEGxqNTD08mBp9s3gV9XzWxfKrk9p0ejxyz/YLAqGWyEyN50B92qxQfz?=
 =?us-ascii?Q?Xn52kpyAXukimpYGQCtfPvVG+yAPLcPMMaf22SJBDNnLOuFh5+HgP2sshaRT?=
 =?us-ascii?Q?ShT1v6CEbh6nM3uOrD4cHzks2B8V3YSJMAamv+YzkQNWNVVwTXanKCa7Nbx7?=
 =?us-ascii?Q?gJIHFNMSLxhLY+taIKxqvD05oOhshE96SVFu2Wtn2iJQUlFbRf/8v0ZW6cgJ?=
 =?us-ascii?Q?FexX1EcLDYiAkxYkZBzALaZ+7lbmHbGrmAbr99idiw41Dh911jliiQbbZttu?=
 =?us-ascii?Q?dpuSPHzxjlaBuLqGfTne/4j7urv9RFEdVzFrlaSTw3fp2RLaghSmfahX8Od7?=
 =?us-ascii?Q?unD6zaQeMr/zAQEI6yYHLFaBBFMg8EHpQZ9I199yl0Fw7vWToGhxXJI35Wbq?=
 =?us-ascii?Q?TnAzMZxv+ify7ol5AJr8dMXJNpZzVRA/bU/Dlu4fxu2/rwvPre6t81yfJWFs?=
 =?us-ascii?Q?WmCJKBy4mflZJ8T9eGE4p4xSHH2c63fq/lSi0xze7+ZuRHEl9TicGfzilxHE?=
 =?us-ascii?Q?rMw7pVDpoakxWuFRNGtf5SjoKgqCNkltoTW3zrOlm+zRAP4C7ZR2zmth4qtF?=
 =?us-ascii?Q?28Amx/aqrrYTBBMBShl+TazwotWN54iq8JB2fNi9pFt+FiFCAmXIvo1OzUuL?=
 =?us-ascii?Q?fr8F0ug/hcKxCcl7kjx586BiBHNAjII8S1vWmTCSZ9G4mcqk1n1lMb/eNzPQ?=
 =?us-ascii?Q?LgJQLhJJ+EbzDgBZyZUvxlRXDJOOo9ZOfZHos4yPYlN+b29vrceBHtSbBnQm?=
 =?us-ascii?Q?U2ZZCVE0yyIJyRnW/sprsLDKx6kqLVst/xFYpcyJBFU/KIr2VDxFszJwVdf0?=
 =?us-ascii?Q?qCvg5SPOCUGNhweHlTANpVuksCqSMjP3Fj/HoQDCT9V6vD5BD7Qb6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j8+E75EC2k/5xyBtWHjULa9Bs5HCHlUAHINesazhkjGV6+3TuPyXsgPE9kKF?=
 =?us-ascii?Q?Rj0OV3ezkaxzx3Kqis6Yjqjd91wouMZDlJXl2604QYqE5DiO+H4Cl7qSg1UI?=
 =?us-ascii?Q?bCsRUWIT3X5J8mm225B7woy2mGQ1LSSx3vSMnITMjCiZTLlboJl7j8twKVUe?=
 =?us-ascii?Q?eo3Sx5WTA1INW87Bi0lYU85DSviLrDsrLSla2bG5fpxN2FjHGqzgwPzKtXtH?=
 =?us-ascii?Q?Sp5gPEWhwcNeN8ZU3NDlx5IekIpAaHihxfKbo7ywDT7chihX+mu11XAS5MWi?=
 =?us-ascii?Q?m+v8tpK6xRaBCgIIrXHfP2niTHmh5F6YRj9l+wZEXq++A0jcuVOdiu9qRVTQ?=
 =?us-ascii?Q?la5nnOjx+nhXyyBAb6eoTAPcwsta1f1RL5kJvjpm2ouVGRRyTGGDIgkaV4l+?=
 =?us-ascii?Q?qWsOGjrGPvECegjzertGuGRim0slv8wk73COUaHhR1jIyubCn1Xwcb4Aw9tB?=
 =?us-ascii?Q?Z+zweWWO3qhxCurRAjpGENRDxBroayymx79PLjM6NnVkcO602fAL4+yYcpA4?=
 =?us-ascii?Q?bFg5Dm0OyLiij0Vrx6URuGBTLgECG5wBq0k0u3Qwxf5uSej9uKAbQk3KVWRT?=
 =?us-ascii?Q?Wjz6+lKasLGYrZqAIn+NrLLvbFvuKCIvn6Td/inQU9/VCCDJa65uMjUKDb3m?=
 =?us-ascii?Q?QQIOQY4L9uzhJzYuAyA5Q2bbyeKV8DAa1fHAoZokLVUSfeHr69QracLDsm09?=
 =?us-ascii?Q?d0Pi3vePp7uUsKYN7rOyadcQ3RQoHNttQrZXrE0D3mJXUsXiWf2hGfsOpEyT?=
 =?us-ascii?Q?B0G3ABMO+6Nk4Fo4SXLXln7CoOh7/+958RA6Wog2mI8o3wrSTurZfWM8Rm2Q?=
 =?us-ascii?Q?LP75aSBl3d0YbbSek8IFLqyvrZa1+dCWFgh//i/RxtIqYN+jK7qr6dqB+Ftu?=
 =?us-ascii?Q?z+tmEk2uEswnagb8KeTskv9RtCrcXYVyACmtiMSdM3WqhDj//Ih7x8vm6k3M?=
 =?us-ascii?Q?Ix/VNrjnqw4UZa8Oc7yIobWFPt1D492F5FgsY3gDQhhn0hC3JcUooCs7M012?=
 =?us-ascii?Q?t4bvPTUEM+Pn4XKMr5g/rjzvj498x95B7QFmeirEbXLBH0DrIUannrbyMWAo?=
 =?us-ascii?Q?KMcaXtUYNMnw13ruWwcOrug+76BNA+gphTAOUnWsYows0a8zz/cNHxhjK3QL?=
 =?us-ascii?Q?qPvW/7mhapIX8ORCvIST//83bK3jjOgYXDfBa6vpphB3IEkGCh0bifQMQ8it?=
 =?us-ascii?Q?/7wU3azjlhrnnhQ0CTZOeg5txLEH4Lh4dYP5VGbnHiB8FR8AZWLtDrsXlpkv?=
 =?us-ascii?Q?Z4iLWTa8cfWjkxf/klXOqbkhv/+Nyic/lZDYQDLlnXhuywCawXcAQqgxKXiJ?=
 =?us-ascii?Q?gGwHfCr/UP84heIJa9vKq+R9X6Wy2fQDK9ITxa2VWVhTuSRh++vvrJysfez6?=
 =?us-ascii?Q?ocHCoRH0ssfP2jcRzLA47FKW8CZpHfoXRcXz5l6v8NAHZ9+wK0bIuaTvPkfG?=
 =?us-ascii?Q?4h12EwUMExlw791nXsy4E7mnNY2FxH64IH32SWyDdmRjfdoPDOciukhA1wfV?=
 =?us-ascii?Q?WVDV2N7TeVUwXJ8Yf1AzzkMUYycKrVEyStbYu1nga+qPeb7nHea5bgXnchXf?=
 =?us-ascii?Q?8aoxz1jCPGcANflQdOT895VjOxvrcJhmNGfD5TiI3y8216Htv/fnuNhsJVMw?=
 =?us-ascii?Q?NKiXj9/TPoTMCN9CgDNWWkOZXZllKt5mUlPNwXR/q9Z0S48JmNBQJrypv7uQ?=
 =?us-ascii?Q?wAQtoAReOO8cGeRxSaulQlYg4z/TJVP6QKQjzVCAfW72Ng3/MOFZhlCjBq6E?=
 =?us-ascii?Q?cQ3/VdYk4jw7Hn8cbVF2RZNzbnrdk84=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xcGnWwzWEibbsWfSzyin6FTUfCqwsJ+Z5ORbuQ+RAJSUU/vGxP147pjooCfCTQbp5ffTV54U/3bMzZQfNvTFyuRtUSXTWMJ2dbQn8oyUA8wqkIBvmP5N1+3Lj1oYz0g3IbCnDgEbyGY5ZOZO7BTdo5N6S0tMYOoE2syY5Wu0ZCoyesECqBbbtWSDG0+tTaKJRj+n9BUUtg0Vz3oBBGq0a1YvNFTzLb/pod290+9GAbyec0RJSa+tQzQi28OS8/a+Ez6nV2KS1tJ3DYuCc58UeEWbT2azpddb8HZBDqjWvkyFiv3IVdlcUpdXQ2se223xs6GhIEcoC2voqGhuBnv9Rg20pJtblpfojwtcRoCNliDZ7kuODUtsrSHfOoJKrqVnw56Jw8abo6/yfhNlwq78AMvoD0fIcpnpQdw+b++JEj7zbqPyy/At4v4/GDU+YNgA+pG/3Rux9IYlOuAH5pILPGKrpGyPwDmmfa1xIY7zm4aW36asxMC+kP59xmRow7a9mpDyXqrUxG0HRiSH1N3OhJ8A6lLI2MwnXeEXLGk45NHLrSe4vVGw0BQYtLex6hzOnJ1Dwd71j+70IJKzyUkWbzYpn5ecjHapNESPwJs13jI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e689b6ec-fb03-4e7c-576a-08de528384fc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:09:56.0635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeuEe5gXqvvbsBrhowGFWWTzWCSq9n4evRKc+H38NvRkDj6fALh8R/Ee9I8eDo3D3jfJC9bLM3fZET/0C1fLEYKVGqKpWT6PkVvDUVAhYs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601130076
X-Authority-Analysis: v=2.4 cv=B/G0EetM c=1 sm=1 tr=0 ts=69660be9 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=yPCof4ZbAAAA:8 a=ag1SF4gXAAAA:8
 a=meVymXHHAAAA:8 a=DfNHnWVPAAAA:8 a=I-1mG6jRAAAA:8 a=07d9gI8wAAAA:8
 a=Fwa3CakwYO5cQkxbUEQA:9 a=CjuIK1q_8ugA:10 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=2JgSa4NbpEOStq-L5dxp:22 a=rjTVMONInIDnV1a_A2c_:22 a=vAntc5lzOlbkVmf1VcWC:22
 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-GUID: U-_gdFLK-zQjs9PAHzQWVyLIwPOBTLBl
X-Proofpoint-ORIG-GUID: U-_gdFLK-zQjs9PAHzQWVyLIwPOBTLBl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NiBTYWx0ZWRfXziA46gi2qmak
 dbR1UAn6gk687XLy05c02PBVlD6bKSm5h1PpkfS12t5uuYGmdQ2+zOWoSh5CEKVP/M+1W2OczVk
 yDHpQ+AtvM0G+Lyub7mUWBMYVX6Iz1eO2cmHEnbP20sjdsBZiVYavMWzlVIEReigJZE52pl/Z21
 5XCapGqLpCxcWfFCaWDOda/KUaOzugqiQPj8iEdTMNMNjcFEQ5sCH+mWxHUDKtFe1Mf9Lw5zv9O
 Yo36pFQRF81p3q8j4RfMpJLxxBZC+BDxqIRqh3xmZGIQDEu/QHj1THyqJdUGYmj+XxMTSXXms+i
 wpW+fDWIbzHoEiz1xj2ZZM1Ow0SMlgrjfiM524kuffhujWGdmmbBzfAQm4I9ih4iDU4tCx/QjmU
 AHDFsQhZ6So7ymfwQb++tp+QopcCWUsNT/d5Bn8nDGLFgcq7Ra3ivw9fy+p3iWN/TSufy5lKNT0
 nkRWqzBFQZ7HB+UBr8Q==

On Mon, Jan 12, 2026 at 04:06:12PM -0800, Dave Hansen wrote:
> In the last few years, the capabilities of coding tools have exploded.
> As those capabilities have expanded, contributors and maintainers have
> more and more questions about how and when to apply those
> capabilities.
>
> Add new Documentation to guide contributors on how to best use kernel
> development tools, new and old.
>
> Note, though, there are fundamentally no new or unique rules in this
> new document. It clarifies expectations that the kernel community has
> had for many years. For example, researchers are already asked to
> disclose the tools they use to find issues by
> Documentation/process/researcher-guidelines.rst. This new document
> just reiterates existing best practices for development tooling.
>
> In short: Please show your work and make sure your contribution is
> easy to review.
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>

LGTM, thanks for adding my bit :) So:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> Reviewed-by: Shuah Khan <shuah@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Reviewed-by: SeongJae Park <sj@kernel.org>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
> Reviewed-by: Simon Glass <simon.glass@canonical.com>
> Cc: NeilBrown <neilb@ownmail.net>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: workflows@vger.kernel.org
> Cc: ksummit@lists.linux.dev
> Link: https://lore.kernel.org/all/cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local/
>
> --
>
> Changes from v4:
>  * Modest tweaking and rewording to strengthen language
>  * Add a section to help alleviate concerns that the document would
>    not enable maintainers to act forcefully enough in the face of
>    high-volume low-quality contributions (aka. AI slop).
>    This is very close to some text that Lorenzo posted. I just
>    made some very minor wording tweaks and spelling fixes.
>  * Note: v4 mistakenly had "v3" in the subject
>
> Changes from v3:
>  * Wording/formatting tweaks (Randy)
>
> Changes from v2:
>  * Mention testing (Shuah)
>  * Remove "very", rename LLM => coding assistant (Dan)
>  * More formatting sprucing up and minor typos (Miguel)
>  * Make changelog and text less flashy (Christian)
>  * Tone down critical=>helpful (Neil)
>
> Changes from v1:
>  * Rename to generated-content.rst and add to documentation index.
>    (Jon)
>  * Rework subject to align with the new filename
>  * Replace commercial names with generic ones. (Jon)
>  * Be consistent about punctuation at the end of bullets for whole
>    sentences. (Miguel)
>  * Formatting sprucing up and minor typos (Miguel)
>
> This document was a collaborative effort from all the members of
> the TAB. I just reformatted it into .rst and wrote the changelog.
> ---
>  Documentation/process/generated-content.rst | 108 ++++++++++++++++++++
>  Documentation/process/index.rst             |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/process/generated-content.rst
>
> diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
> new file mode 100644
> index 000000000000..867bf8894289
> --- /dev/null
> +++ b/Documentation/process/generated-content.rst
> @@ -0,0 +1,108 @@
> +============================================
> +Kernel Guidelines for Tool-Generated Content
> +============================================
> +
> +Purpose
> +=======
> +
> +Kernel contributors have been using tooling to generate contributions
> +for a long time. These tools can increase the volume of contributions.
> +At the same time, reviewer and maintainer bandwidth is a scarce
> +resource. Understanding which portions of a contribution come from
> +humans versus tools is helpful to maintain those resources and keep
> +kernel development healthy.
> +
> +The goal here is to clarify community expectations around tools. This
> +lets everyone become more productive while also maintaining high
> +degrees of trust between submitters and reviewers.
> +
> +Out of Scope
> +============
> +
> +These guidelines do not apply to tools that make trivial tweaks to
> +preexisting content. Nor do they pertain to AI tooling that helps with
> +menial tasks. Some examples:
> +
> + - Spelling and grammar fix ups, like rephrasing to imperative voice
> + - Typing aids like identifier completion, common boilerplate or
> +   trivial pattern completion
> + - Purely mechanical transformations like variable renaming
> + - Reformatting, like running Lindent, ``clang-format`` or
> +   ``rust-fmt``
> +
> +Even if your tool use is out of scope, you should still always consider
> +if it would help reviewing your contribution if the reviewer knows
> +about the tool that you used.
> +
> +In Scope
> +========
> +
> +These guidelines apply when a meaningful amount of content in a kernel
> +contribution was not written by a person in the Signed-off-by chain,
> +but was instead created by a tool.
> +
> +Detection of a problem and testing the fix for it is also part of the
> +development process; if a tool was used to find a problem addressed by
> +a change, that should be noted in the changelog. This not only gives
> +credit where it is due, it also helps fellow developers find out about
> +these tools.
> +
> +Some examples:
> + - Any tool-suggested fix such as ``checkpatch.pl --fix``
> + - Coccinelle scripts
> + - A chatbot generated a new function in your patch to sort list entries.
> + - A .c file in the patch was originally generated by a coding
> +   assistant but cleaned up by hand.
> + - The changelog was generated by handing the patch to a generative AI
> +   tool and asking it to write the changelog.
> + - The changelog was translated from another language.
> +
> +If in doubt, choose transparency and assume these guidelines apply to
> +your contribution.
> +
> +Guidelines
> +==========
> +
> +First, read the Developer's Certificate of Origin:
> +Documentation/process/submitting-patches.rst. Its rules are simple
> +and have been in place for a long time. They have covered many
> +tool-generated contributions. Ensure that you understand your entire
> +submission and are prepared to respond to review comments.
> +
> +Second, when making a contribution, be transparent about the origin of
> +content in cover letters and changelogs. You can be more transparent
> +by adding information like this:
> +
> + - What tools were used?
> + - The input to the tools you used, like the Coccinelle source script.
> + - If code was largely generated from a single or short set of
> +   prompts, include those prompts. For longer sessions, include a
> +   summary of the prompts and the nature of resulting assistance.
> + - Which portions of the content were affected by that tool?
> + - How is the submission tested and what tools were used to test the
> +   fix?
> +
> +As with all contributions, individual maintainers have discretion to
> +choose how they handle the contribution. For example, they might:
> +
> + - Treat it just like any other contribution.
> + - Reject it outright.
> + - Treat the contribution specially like reviewing with extra scrutiny,
> +   or at a lower priority than human-generated content.
> + - Suggest a better prompt instead of suggesting specific code changes.
> + - Ask for some other special steps, like asking the contributor to
> +   elaborate on how the tool or model was trained.
> + - Ask the submitter to explain in more detail about the contribution
> +   so that the maintainer can be assured that the submitter fully
> +   understands how the code works.
> +
> +If tools permit you to generate a contribution automatically, expect
> +additional scrutiny in proportion to how much of it was generated.
> +
> +As with the output of any tooling, the result may be incorrect or
> +inappropriate. You are expected to understand and to be able to defend
> +everything you submit. If you are unable to do so, then do not submit
> +the resulting changes.
> +
> +If you do so anyway, maintainers are entitled to reject your series
> +without detailed review.
> diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
> index aa12f2660194..e1a8a31389f5 100644
> --- a/Documentation/process/index.rst
> +++ b/Documentation/process/index.rst
> @@ -68,6 +68,7 @@ beyond).
>     stable-kernel-rules
>     management-style
>     researcher-guidelines
> +   generated-content
>
>  Dealing with bugs
>  -----------------
> --
> 2.34.1
>
