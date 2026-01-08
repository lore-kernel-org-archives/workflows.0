Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C94D496F5F;
	Thu,  8 Jan 2026 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880466; cv=fail; b=HoZB4ZUmm7JA6ThTYSKWTY119tSiYy6IXlgqE2olVdz44nXBEhhuZPDs5UTJheu16mNs6ZesyXdfThqLa1E5dhuAFUkB0bOojCNr2UGNyx73aH76f2uqriGg/0Vu/leR4ah6C9db/YT76EdFZjxF/4yO5Q4mVTeqALBMpC7r6JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880466; c=relaxed/simple;
	bh=/yS42sT9LV/boaaD8XEEvm4HTq1ITeIBzW1gEQIFaY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cCXLkXkr6VabUsNipbKDHuj6fVuRG2syzdhVTfxIKwExxAfyRHJJLdGHGYf2eACG+mAhhdBQbwP/a4Gc+6wbNBfxzAlsEkv4hv/SBsS33du/A+8mqk94O/rPz018Vf0Kx1AWDSyLPRbzvGn6LhrtVGf/xGoEy12PsSQcoSgLddM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lbxh3DA/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CFumL7gJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lbxh3DA/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CFumL7gJ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608C5Axc267686;
	Thu, 8 Jan 2026 13:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6dCeCYKzuG/leOl1mw
	CHFZxEU/XJzARw6TJl4Xoq4RA=; b=Lbxh3DA/Un63roVNhsIehqg4jKaM4dGapG
	zFtLd7bmVORn2JJvkJS0NIr/be0qVidDMTvw0/hITRAUPY/2TQXRjKL5VV+sU6Tr
	K8LLK0b3NtKI86jTYlxwWFJqU0V+pz8aDh7XXmVJht6z3n5NyN0Iad27QEGOVy0v
	BrBqTduYUji5KnReR9ABEPEhKs3F0rOgIN7LsJv4k3gIn4EkjO4EPPYviTxv2ISm
	tqLV0bpnER9pZORPcZNf76bu/bgbOy6mC6I0f1UnO8ubLc6c32ZLyZGYZV8TBja3
	UUouminGJ4/L+bMgIU7pho836mTvHMUMAy+LN9FTM6w7U6WNQfIg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjc9684de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 13:54:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608DgXEX026331;
	Thu, 8 Jan 2026 13:54:03 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjncp4e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 13:54:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0DqhJXlziFGvbgXPlpnCdK6rPVxxGrhtgOGCyTt9Po6u2jpkuHc6aEYulIekEEza/reaOLpAIjaGrN+oZSjmJE4XE0f5YTnurUIiwUrIS4mEyuxELelMMctr6rzuH2Cgq7AmFdhJuEbrpPRYbOkR2Q9vdxmpY9h+HHARlSvh2gAf6/9ZG3we6l/Z8ssUHh5h5lrlpTxcSgpZtsxE1SlW2LN6CxUAoqKg5Se8xAEAXpSjFlYVpg/lfLkwokBxwHCn221xITRLDP9MOTvhvSbDdXP3lwn665YfFW28GQe58NI0u29TXIFYiAcw88JE/YfGWMjViwJLffY3/F6vro9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dCeCYKzuG/leOl1mwCHFZxEU/XJzARw6TJl4Xoq4RA=;
 b=pt2TWmuZZThf62QBG1BppEGIkliHNc/XrhYHETnKPdBW4uk6wvKQxj0RJSzVGwiP9i7F9gSiv5n7C48+u4RomkNSXrDDZRmDWrK+UT3TP5gBsoDWPYOvOwIxajXZTP829AtUTDeQkBZiRy6pNZeViXDTESNTxYoHii0dtjyVOpL7UvHikhAKUuo3h8ErQMGIG5V9HMpC77EvASDcVTilc1BqV2dljANgjoJX3QfhxPe84UarxsBbAvWCWE6/xTm6MhpShjeSvloF4faFGrCVfJJtDMXMGjoeQRLWbp1E4vR0GQbV5tt5d9+yB/k1w3CWeIdmRV5lnS8YyWSN4xA7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dCeCYKzuG/leOl1mwCHFZxEU/XJzARw6TJl4Xoq4RA=;
 b=CFumL7gJi9luH82I7QzyD5taaxsZpNq0QVQrJbijB3lgbu0t8DWtuU2mrcQ1D5l6oP1c/0tcY3sQ+N6HkLJK6WDP9YF6NCAfOEn1jm26eaHJZ/Oiysa8SWx4dIE31rqKXWLfE57NSMbEhVt9bA+I1qwYb3+bwAMVHZfS2knq8f4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB8221.namprd10.prod.outlook.com (2603:10b6:8:1ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 13:53:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 13:53:33 +0000
Date: Thu, 8 Jan 2026 13:53:34 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
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
Message-ID: <dfe0ef3b-0569-4849-8ab4-de52276fb053@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <c04c84a0-c38d-46e3-907d-e32191cfc9f8@lunn.ch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c04c84a0-c38d-46e3-907d-e32191cfc9f8@lunn.ch>
X-ClientProxiedBy: LO4P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: 5667d1f7-35b3-4049-3c9d-08de4ebd4fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S/29bqRhXBp1xvi4cVQlhwymWWy+8LNjleamlhhB3LYcpPyCXeuZAZForFVO?=
 =?us-ascii?Q?71l6BZetcSEPOjRfVOykxAY6rW/wW3vyJm9UHu1LmsPFlzAErSwp3yEZatmk?=
 =?us-ascii?Q?rAN/MfVsnI6hI/zBtHq0HMK5Y1zoeOIDfd62T4M/qYVPwqRTd2an0ymcf/kQ?=
 =?us-ascii?Q?4FSyabFSYnO90wQezFThSSOpXFCyK4bmHdsg4a9KFEUAU8J5SFafdZBmBRNV?=
 =?us-ascii?Q?s+XBphk+6CSbO+YiOcx+giN9Kr4TzmH2J0iHztHzE0OrUztcVgd3PhrmvTQn?=
 =?us-ascii?Q?bMdrLpISM2wyqtm6zUMuRYXFSj01k46KsyoIysMPz+KJdLf9+7i2pOH93pCQ?=
 =?us-ascii?Q?HOFM8OgWOjUCpZpBFfVrrDOUhUYpjsWI0uBNXu2v0T10nqQHNLp5tNtQ6TIU?=
 =?us-ascii?Q?lj+HJtWwXpqAbk81hn3xvtCaXmHUCKWOZwndFUMB8csNX+3LhTZEFVTSIv9X?=
 =?us-ascii?Q?RQqWUFIVNbyj4FroOXoH6bd4JfXA/G65sMl1ijHymZhpyYg+UVbLf29TEm25?=
 =?us-ascii?Q?6lEXxnRK8Xgp5PpZwK/OA/mfThS+7kr37v9wJ7VZ4HJ6AwDICA/w00vsM1on?=
 =?us-ascii?Q?1t9cqBKR9MY41ZLNNZdiAxjxyvd11XPc1PtNFjFvlHeJ6R+aGMCM2ag2Nvba?=
 =?us-ascii?Q?C9v8vZbU7f1GwqMDCGm1eatEEY5ZU4riYNfbtX17YwCmIBiqPRhjeRnv5QGJ?=
 =?us-ascii?Q?x8wzyd1FVt/3xmAKdrQZoppJaiRy7RiBTKZfk2oLSubFO8a2VXHY+jVq9CQ2?=
 =?us-ascii?Q?WYG+dWDrPvMR/SN9RYqLUL2eeJr6CZpa9c6XAr0cEf2eaIDBCBRyqgV79CSK?=
 =?us-ascii?Q?AlVg9iCJB+Miz9ROYZ95jVkVtToGMbMwyvLRSuu3YIbzN0UAY3wCGQjcseyr?=
 =?us-ascii?Q?Lcs5vKeWUMePmgjhLYnnY8r6jvFMlhPFIXGaugyALGnmV3mUyNr5y5K3Qf9G?=
 =?us-ascii?Q?tqMKvaP1EuLyJwmvoqnFiaQY6xBmYFAdiQoiDDlRo1jgDVfn2IP7t26z2YRt?=
 =?us-ascii?Q?XaqAkTmuun4/X+iMMMRpqAmyCGKvqV+htIgVd4gj12vNmlF3o3rLv9e2fuI+?=
 =?us-ascii?Q?x6sevjWspEU82IljILJ/YJmkY7HxZgzPHlNOw8S590j2sYyzP61KZ24q6htW?=
 =?us-ascii?Q?fPTGVtDFkajo2heC+z3294ddsxwlldUAmpkiaEuVTGAh18jW7ffPO6JnUZau?=
 =?us-ascii?Q?yior504JW8UIiljt/uzWR6WDg2fPQzusVCyjnOX2GyLxF7TSf3L6+gu4QNxI?=
 =?us-ascii?Q?kxEe+yT0H61BEd2qtI2TZWHxALNz2MhAnCzIdKXwwL5pKdcBEdfullUshNCc?=
 =?us-ascii?Q?7gJ+uwGANCHxsHdBWUBqsjeRo31zl9VZ8lbItvDLjsuuanVUoTQyEdhY+dfn?=
 =?us-ascii?Q?SD41HiFCJ4caofbkGSW/tE0s0Xb8vUza+OAQbRbAvb4jqVQ7eGYSNfZ+1wT/?=
 =?us-ascii?Q?PVziPivRr6v6jXGDuEhjM7/MfU4DkAG6RZd+Sg+Pjpbua9Qs4Lkksg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xv+0Vp4PwaOvS7gVtF3vldxtxHC2y9fCzrDQN5LV304o92FxG9uZtBneb1z9?=
 =?us-ascii?Q?fZLwXXKEf3QznVq4wpANgrGwSL7DW3NkKwo/SpCU61udbE0uevPV8CMCMYur?=
 =?us-ascii?Q?fHR+uGJmTLY9hAv8d0pbNivZGxtGQ3Qc2e8fGDzD4jtPwSyQoDy1ABp/SaC6?=
 =?us-ascii?Q?9oNv0KEq3VyqcOcuLDQbMiLDucmhCVwDMexhVAe5sMkz3Tb/PxLs2dmEQidD?=
 =?us-ascii?Q?/EsxKk4Pbi9W6aC+wrwK4uaqDOHRtBb3hWkBZ4ZIqX7/hsV55ll22S+zJ5MH?=
 =?us-ascii?Q?SEDTb/s14b6BKpkGiT+C1UZyY5Oe1svqqeaQ5VngnNVQKYbjJHEQGa8eU44t?=
 =?us-ascii?Q?YYx+mKglGHmP+oplCPx0DiC5LNiL8yCoP4bMLz981OV1szwYZH7NaeCQW64z?=
 =?us-ascii?Q?+0TVe+so2hHV3BRAqX+yHiCVzcBJlZ7Wb7aKI/Oi4LoftJQbvojLYqgG49nK?=
 =?us-ascii?Q?aHlUgMI8Bc/gYkkLjcE7X4t+OoRlW9JDq9ghTkl8a6t37OqtyrDpH/bU1pDq?=
 =?us-ascii?Q?RIvMLVcgxqtTYKI+Xb5J9GkyAYlcnnZ913W2hxOx2U8hI0pyCEad/mnvnNWC?=
 =?us-ascii?Q?/G055cHNvmumHwu2bpNrkMz5hfkCl4s2jkKxFV/MvbGd1VMbgiE45czwj99T?=
 =?us-ascii?Q?/KZqNXHlJY31KfG5nRta5QPo2KrZoK5zXnJL99u+u9TGWr0Wx45eL3Os2tPm?=
 =?us-ascii?Q?7xmJ8kQYdb16ic4U0p7XYuf4ddqEp8PT6FC0gTsvkfE1qLF9j2fsrMTuFgAI?=
 =?us-ascii?Q?F34nZ6iv+ARaeFs98hVpiwpdi9rvgRh+anBMTNOhiMw95Gg/kY1Dj5o/ZpBO?=
 =?us-ascii?Q?wD6u2kwZacNVhgB4EPHOosub6roxg+SlFbYaTJW5WFZetL5YxzWhaWMgV8qG?=
 =?us-ascii?Q?lL41xOO6FXVwQpIU+0LpjJ70PHfiJC6zQgB5BZMQ7YhUfwFslJ2jblQjXuj/?=
 =?us-ascii?Q?1andZruoGSnV4RGFcApqq6z5jg0spRc/pzIo2sQA2gia4xsDg1QAkSanC0i2?=
 =?us-ascii?Q?Ikf0KKz7Zc9v+s+Utph7+ml9Bfm6ou6tGa9YDdKM2AniwQGDitNGpQhi/DvP?=
 =?us-ascii?Q?5YGF8/HPUKQ+St/0EcQAPc94KEL5knpHlUsFesE5GuLGjTBR7lRWFho7bTG/?=
 =?us-ascii?Q?VYikIM7P2RJ83+3UE9B9xj3qRGm+L7m34jyFXykOc6qNnfS/IV2LBdLhUXZy?=
 =?us-ascii?Q?16iDq77zxepw7hhSBTsAg6LaXJxxDpdcD0VL2siL//DX8uAxuBj02foWp0hx?=
 =?us-ascii?Q?ZF4PvAokpEqRObvEcEiIr+7E38A5nrBIOfhZpFRSaPpJEl0S86yYfdzZ/40F?=
 =?us-ascii?Q?ue7JASqjDdquhrajiexpHc+vpXdg9kSW/zVqth0/gCWX3w6f11vsi79MyX1H?=
 =?us-ascii?Q?3vUGWHpPt1827sPCaE6kavxSL/N5avzPXS7AUX6YyBuq+fs61DeVdmHcmwzP?=
 =?us-ascii?Q?ajkkFj+7KlvDW8dfyHLbcHKRTK8KZCJm5PhDVW1haCQEAvlKWCba9fo6ilGq?=
 =?us-ascii?Q?ftidXpt+JAsFXJH+4/5/V6QIthHPi2+rEqG0mES8meQ9FLEmvMn7eE1bdkzw?=
 =?us-ascii?Q?THDCaRq9byEb01SnycKy7IvHYAxg400Xi1NfM3IhURTn3zgUowsaD2jTS9VX?=
 =?us-ascii?Q?JPdc/JqaZviTTqBOwzH2BHZYFLjfN+92lI/iIVOmZT78HNMy43p0WvpgloPT?=
 =?us-ascii?Q?zYI03Gu89+uHb9mhpUvrEppVWudNPvTy8tHk2lRPmJHhmZ0QYhSXoiIPi7k4?=
 =?us-ascii?Q?hjKruO1lW0C17Vhw8Ez+LxdCuZtSbLA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u8fqGTW7v0xiudQNbFR9E+gT5KWyj2fsKUQPwa+mjVN5Qa/rzjniR88VgtCT+uNUJR2U9pKzWjjSSEH9ezw5IEEghZAsIrVHV2rKBgBagDBH1qgHP45Ii5oPQkolz4PhfeaSaBOQiDLVTu4X8u5attvjC9kyGOATrD2t+YM0Gc84HiQ3m6ML1lqqnSY6FwGK4rK4jS3GZFbH6r9zo544ZmNjTlsObsWwpNFIzt+tKPSXawXJv68nDtxVS6xpvNHbVUj4Cx3LfuD84ucSnkKvaO/9kVaV2twuctHosGR2wKp2JPThsqPaGOijW3a584aOjh6CY966jEHeC+T5QGtTFI3tjDoD4SgEwaK0rRgTTG7ktibuPIDSJWt5QFcZ2ZdRp8zFf3iTnLEqDOAGWnlQpO28YP1at3OQtZ8f+MORwHkNJMf91itk+MRaYmMI59LKWWH9gTXmMFQO5lJg5w10fPDqcdhJT+BWzjhgMplwlbDMzQH9c0n68xxVjGsc3in5Iv6nPXVrCSxrtgVyBz9qdfQE7o/QzZArfmKf8Djt0+1LaBC2TbFslRkNMPlj0ouElrc4/N4x7udJVovjQF8vPtOGoP6v1nKAUl2AGxuRmvU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5667d1f7-35b3-4049-3c9d-08de4ebd4fd9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 13:53:32.9962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lu4XogvwV+ASWVL0eS11LHaYETyF9uzLs8z/7f7g/VkQPcnucuWGbC43R1edfUKq91XGuJAClA7DRglSK4Hv8b5ZCXCyl96ydW1581Cp1gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8221
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080099
X-Authority-Analysis: v=2.4 cv=P503RyAu c=1 sm=1 tr=0 ts=695fb6fc b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Cza--JIpxysQ5Up80YIA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12110
X-Proofpoint-ORIG-GUID: 9eH8qS-wGIg4dP0ybhV2yQvdYsywjheX
X-Proofpoint-GUID: 9eH8qS-wGIg4dP0ybhV2yQvdYsywjheX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5OSBTYWx0ZWRfX8fEWukcIL+eu
 XD6DMaWvFw1PG5weWLdTgPlWwZ3uV+D7j2+vQjGdAIG0rSYB4UI8+eHM8dxGVWqZ2/+KhJUBhEm
 3RnI10PtUZRchbxbVaNRmEp+/bC5QQsIqxTwA+If2ElIVlDdBjVxUKrS/Ma5yTMS/jTLcHJRA08
 F3Tm+BxfZrdQkCJ8WvSAWUoSmDBxtxeA1xMrrqEq4pYjjgAfgVlnXo5aWbDFbfFCCKvlrFDKjLL
 zSEdIHJDWz2P68QCYee54/HSFZGKjpaWoxPamKdkukIAMg2aes538iOnSrolAIMsLCC41U9kLZx
 I7HEb3KLcrMwcvvSaIV2b0nRqhv4C6PyEE6MZHc+VJnR8XnU2Bma7L4xcxJwCYyi/A8UwPZKfe3
 BifTpAx0Um6IYoJSlXldGuzlF+2dGx9bUkxT952MMx4JgTGyGaZ1jv+xJMAkyIFaS0Bz9fmoOhJ
 UT4JfRmurjlIl8vBDjJtOLqBk9+ZM1PNkgT3Owq0=

On Thu, Jan 08, 2026 at 02:41:20PM +0100, Andrew Lunn wrote:
> > And it's not like I'm asking for much, I'm not asking you to rewrite the
> > document, or take an entirely different approach, I'm just saying that we
> > should highlight that :
> >
> > 1. LLMs _allow you to send patches end-to-end without expertise_.
>
> As somebody who reviews a lot of networking patches, i already see
> lots of human generated patches without expertise. So LLM might

I mean we all have :)

> increase the volume of such patches, but the concept itself is not
> new, and does not require LLMs.

The difference is the order of magnitude possible. There's a real barrier to
entry for clueless people, and there's a linearity in time taken to generate
submissions.

LLMs don't change the problem, they change the magnitude.

>
> > 2. As a result, even though the community (rightly) strongly disapproves of
> >    blanket dismissals of series, if we suspect AI slop [I think it's useful
> >    to actually use that term], maintains can reject it out of hand.
>
> And i do blanket dismiss all but one such patch from an author, and i
> try to teach that author how to get that one patch into shape, in the
> hope you can learn the processes and apply it to their other
> patches. Sometimes the effort works, and you get a new developers
> joining the community, sometimes it is a lost cause, and they go away
> after having their patches repeatedly rejected.
>
> So i don't think using LLMs makes a difference here. I've seen the
> same issue with blindly fixing checkpatch warning, sparse warning,
> other static analysis tool warnings. I just see LLMs are another such
> tool.
>
> > Point 2 is absolutely a new thing in my view.
>
> And i would disagree with this statement, it is not new, it already
> happens.

Well this is the thing - it varies by subsystem. In mm it's really not like
this.

At any rate, given you disagree - the document suggesting that maintainers
may dismiss out of hand shouldn't be in any way controversial :)

I have submitted an incremental diff to make concrete what I'm suggesting
at [0].

[0]:https://lore.kernel.org/ksummit/611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local/

>
> 	Andrew

Cheers, Lorenzo
