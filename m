Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90CE50096E;
	Fri,  9 Jan 2026 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974128; cv=fail; b=tuTTzf1lkMsy8GxIPQUeI7JDhlQJjy+iXna/Ya+IrMIBwKvgzCgwFKzz6/NFdvgveSASDqPo0idXytWEbtC9dxDW72m4/oVjn14+xu8PemRPqvc7Sv4ItDOYGdqkiWoVR2e2GLyhWN2UW6qFG5sUJjuJ4VUnLtc0L5zbzG60kBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974128; c=relaxed/simple;
	bh=JouBzo1Ncy2dcKjx4HDQLmh/SnQrXv9hUTmvcBAx35A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=imLaVOxD6voezElv9R3OBeqmCvd93UpRkSddRuIzRkt2QXoxzDKWu8VmtnhyebD9FEI54ntJ45yXE1dXBLCr4GtBawPOYVzUHiYNZXaTQwalmyfqv58B+TOAcMN+QVAICUkcq9nSmFQCmhjwO48sxmpjvsfPUhjpTFhclRNMzHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sCY0iN5C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CbTBGD4I; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sCY0iN5C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CbTBGD4I"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609FPjC53842828;
	Fri, 9 Jan 2026 15:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JouBzo1Ncy2dcKjx4H
	DQLmh/SnQrXv9hUTmvcBAx35A=; b=sCY0iN5ChXD2R9JTrFRxQRhw3+Ww4vLquK
	Vb7YOT+XUDVTgE9Wvymn+xEEk9Lr3b+wlC0LNUfxTQnHHAOHWmpwml2O/sF91Pmy
	C64WH5OmZk09S6joLKOcZWcgIPnhtwGCzDczBXxNsHe9G8TKji0sj4C9KEnn59YF
	i6SvQkwHFEkCJheOKelJs5U22zSEUazuX6Pl4f0gmDq72WpxR1Xq4JDMSzZ2ZIof
	blRbP8cM5isZUZdG/2ybUldvec2/YGl47GlZgKXv3PD8rdTwXePBp7lVns1LoXnz
	LOuMLWsVHeY2pyCwhPIm7y9WI+fH11X7L+Dv8/0OrTzbkb3QZVVA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bk4a581p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 15:55:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 609EpAVv030886;
	Fri, 9 Jan 2026 15:55:06 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013029.outbound.protection.outlook.com [40.107.201.29])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjgj1kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 15:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrrwJ1jt4XP9KbxScPnYz6BwSNr/LpGrH8mn/NOiHb+/eioSx6O1WNduUqevfdzhltRgKxP7grLloIAFYcLnblZWhqmRqIyWfVUShc46Ddx3tQuYiCzGHMsAtIbsUiofpBeV4z8eSMymx7iGgWCuZpLEqOd7Lsd5ZkNXF/c+Rer3O14Aq9VA7a6uOlnh8ggkrQgB44gezv7hEZFVKsM8LZPDbRe0pEMR5bgin7x+XzmPSTa7QJ9QdRxymI4TF0qkc10YrNK1ygR2G8bEq11MCnfemUsnMBIsyyBs0fE2AqLgOhCxPfwZ2iNcpdUsi19rGC2dntoeXzCN4yEOUTPXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JouBzo1Ncy2dcKjx4HDQLmh/SnQrXv9hUTmvcBAx35A=;
 b=IHQYmM+weHdmdlgsu6+q3OgKtNfYumW49isvbJfGpB+HtCtpzAs3VB6w4ChHgkF67Ij/AjDeQT5IwbQDEqhFUDNlLZsawRHlm7cYV7QlgkfHGFIyD/8sXjlr6/oVPyviIrUx6by3BeZxy6hNHMicqUSYig5FQdhqu6qoFIZoXnbr2xpOg54ylUfgUu0o/7XFBLUynoCrZTagyCFb+RtdpXSOt3M22RpNQsPiyG5Giv3OpEsGZIR+YZIIsaVvnk8NSL3zO3IHXdu2rr/3Wz2ytdijr9qc3jFm18xvgpNROlAS7i0CWbyHQEjBD2xnbH6odUVO0VUchAc5lNIB8SeVYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JouBzo1Ncy2dcKjx4HDQLmh/SnQrXv9hUTmvcBAx35A=;
 b=CbTBGD4I8/mzvl8FladNsaCRCxql4k8mDLoJ3VvjnJvsz8dbVLwtqDVVkmuZ57DI15W9YV44egU0qab4fOjyfCSOpnTAyPbbtkNXjuw9DGjO4BtSuehjWPA++1ewI3VpxwrMzIvYOWB+Mt4nl9LjhQjxgBQ82GI5IAq3wr2U6U8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6449.namprd10.prod.outlook.com (2603:10b6:806:2a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 15:55:03 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 15:55:03 +0000
Date: Fri, 9 Jan 2026 15:55:01 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Jens Axboe <axboe@kernel.dk>, Dave Hansen <dave.hansen@intel.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
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
Message-ID: <4a8256ae-04b4-4b4e-b638-5e4cbc2362c5@lucifer.local>
References: <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
 <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
 <aWCSVh6NocePMvp8@stanley.mountain>
 <0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
 <20260109085446.GA9782@pendragon.ideasonboard.com>
 <20260109105104.57d308f7@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109105104.57d308f7@gandalf.local.home>
X-ClientProxiedBy: LO4P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e5612c-2a33-4a45-91a5-08de4f977375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ocq4WuLY9WYbguSfRsmWjjhN1m3csTWOJaerpFGaqa1ClmkdKREnYM30Rlxy?=
 =?us-ascii?Q?5vwwEPtXgPxFW0w8uWFuaMBn9g961iOSicKibcd1rUeb6r4zVAq5gnhc+Zrp?=
 =?us-ascii?Q?5Uua6kkx8vN7Qa8hyMQoVkPp+fPejeTNGH2M3D7/pC+IjhKZfH9IWFQLSLMU?=
 =?us-ascii?Q?nsK2mcdthXFIQXUqTz1oqamNCWNEPR14hlEZgRAlJmJkGSKI1lqbHe1J+FUC?=
 =?us-ascii?Q?PRCBFxQoQHDy7RSp3L6alYv/gFZhYUtM+ZiU1g9IlxoEsw9uzXFpG13vkZjA?=
 =?us-ascii?Q?Fk/BgTBrg3ILzYeTIEsUPD3Xp/waB8UATzUOX0rR4jtXcfecyjl5I0s90xUw?=
 =?us-ascii?Q?ZHABe0tJKXqkOI72TWtg9GgxOQrzj38iNdrjTb3d31n1b4i/ou4BtJVVNvGm?=
 =?us-ascii?Q?aoYp+2WE3SmPbs1ag6g5OgN/CynHH1yNWBkUwYInmW5RA8zsUHCd9n9twbjk?=
 =?us-ascii?Q?6aZtQvmgeWIp1QfFKAi5IW66a3095i7LwKSJb6K5o5toNwfD+Pm5FgS8c2Ij?=
 =?us-ascii?Q?rw0FRG11JH0uoRIS9t/e4yiqkiPZhSr5gm0MQSQL/9lllBB8xpTQDL8mm/Ql?=
 =?us-ascii?Q?GVQtKSBCR0I3lFQmg24gi25wfshzcJU0vCjrsiIpdPXtzUdaoSKjkVdh5HsL?=
 =?us-ascii?Q?xyFkwLTv1b1k8R8wd5JqCyIzwAolOJrNv55q1+d1lJ/8OpGEaJpHBXm2a9Dk?=
 =?us-ascii?Q?R3/cYz/2yqaR5D+n6ngmyvZRVuYJAsoWwFvnuY3BARp+9MlBgXruFyv1uUph?=
 =?us-ascii?Q?d42Bdbgq7csL6TnRwERAXxpRu5WBRChgkEbL2T8RLqz+paJM+OPxkHTwjZyY?=
 =?us-ascii?Q?bR/VAYeEiCGkzCV8vA/dtT5G0LrGJt3FxS+TnwC4VnBfrGy5mySSFUNVD1sh?=
 =?us-ascii?Q?bBC2pe7c3d53uxSNJdpj/OwGSDaH8Qpcq9t59qg98ud1fBw9NbU9ny1eIb4V?=
 =?us-ascii?Q?wvykqWXJJEAlvD27PVKZ8/pZR1GUfJtt0VSETWQlS3GJK5u0kjIoL7on2ASs?=
 =?us-ascii?Q?/v0bOzayZ7emk8X2RSWlwvF1esIcPf8FxBIkHbYhADNfMZvFTnE+1j4zVfV9?=
 =?us-ascii?Q?BJSlDasBdAbl3OWkCWtCW72qK2cnIy12si7nmDoQPN2rvGqPLm8gdrtG1Ukl?=
 =?us-ascii?Q?BW4Hmc76v4USg8iH3kHgbhXh1jdiGYx3TSREosxkc2Cl9OWyG5KegsxV3Y9G?=
 =?us-ascii?Q?lcQy7ravuHVy6/IbSI17s9If+q9sAhFJ+X/pTTDJsN/DEpbAJMWCkH188bE1?=
 =?us-ascii?Q?LlhoKG5Nsz+GCKZAENz0l7wCIP3rQX4FqGtlTY7sVraTZ1d0X9qq5Gip5/VQ?=
 =?us-ascii?Q?CU9BTxSDgZf7tYCPELSzj7LzWmS30dx1DeKUdH9AM1vrGCp8edoFPQVJ9Jqo?=
 =?us-ascii?Q?HNNQRsGeoocqKhQiAYu+Qbfu4Jlp+V4mkjnSL5BcsZtHnfG14x2BJBwCBVP5?=
 =?us-ascii?Q?R0Ehv9/TGvHju/n4YYE0xv4gb4pimOap?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?szElN6KvIUPZeyp60V21qFEdvXS5p4cdTv5NCLBs7aT6ychCp3ghcmYM1MGs?=
 =?us-ascii?Q?ATQYjC7aeLG1pfXORqjQEKy6j6wmpKIPC/gZuCNAPZcYvDKYl9SNxqg8nymI?=
 =?us-ascii?Q?gjtm6RdwGONX6xWiOd1kxWyJP09Y4+Z6LGPj2Gr8NY8QVCAJCM0R30O/FOSp?=
 =?us-ascii?Q?AEvZmLpTQw7UBpjP+M3fe4Wij5Tqkr7rmHPZQ8JgJSdQNo5uSgrst26LGSNa?=
 =?us-ascii?Q?Q8T/BvQDGqqsP182F8E2eOpFLYMWj7RGS7MtcsnJPtKT2PthUt/3OULdnw2H?=
 =?us-ascii?Q?6tG4mldP9cm2dDnHgu67tgNxHpW1bMdJ53DXP0Wm/G1OzirbGyhKqglUELIF?=
 =?us-ascii?Q?/sZZ3KhrJNp2XVyddZJIypgnz9M2cqvhEr6g6XJfUblddckYzMeFuYys2pDL?=
 =?us-ascii?Q?zfHN9KV0JvKenJd1q+m1FSUVbqZFHcMEIpaD7Hk1l8UEn1UOPQpMhhq1RCNG?=
 =?us-ascii?Q?+m/ARBeqDGuJm9rZtn9cNQBUyHfnklI5p/NwdSGuynvDjMXlDkQDhPCWXCnI?=
 =?us-ascii?Q?oyrz/pK2VNhRd8dGZCqDFiyvvAiJOVu+1ad4zgd/e8TldXdZ+k1qu23wv6c0?=
 =?us-ascii?Q?jWfovpSWoQZpJ2UNeXZocKJ9KQc9dpff4DgXljgCt1AKsNWnIPCG1MozgSL9?=
 =?us-ascii?Q?hYJdpU+SRadMfJh17Bp324GexAo91ulCZL9zO7/RhFFZ7Rg/E6HFmlJJ2fJV?=
 =?us-ascii?Q?rH2YC9WYZAyDYC6Ee6g9FlR4l9jxp7LlhW6ah4tcgqRAcZpMu1I0daYDkntY?=
 =?us-ascii?Q?rX7NkgNrzXnYrJdDNzP+oExczUbXPO/JvdBz79AA4mXbzh3f6bJh4oIXxVD9?=
 =?us-ascii?Q?XtdqFzpiMkNwVCZPLsWG0oIhX9Yu+EVPLmZw8wBpXMRtEhrCdVr1ySU6Hpis?=
 =?us-ascii?Q?1C5tnwzwgel2K6/dRhb/1hp2+PyCKdPWg0CMLMgEMxlxctJrTV4RMik9CmB7?=
 =?us-ascii?Q?CovhwA0w0+IRvVCFzAC+6207WwOoVBBZ76/vA4KFMz4BcTi0efWqCq9Z6ruI?=
 =?us-ascii?Q?/jsGPx0bBCzQg5Ez2mMmH1pS/OGavA/BAOslmY17dnqKrlj7f6nTvRykeLJV?=
 =?us-ascii?Q?BH6pl3J8tNJrNF42GzJOySGUMRm/4JRzMC5qXOZqntIawaYPu5kw+2jYmR54?=
 =?us-ascii?Q?5dwPFvGbtbRrpBIxr9UQ7eDxWExorO1DEDjUPPYWrOEm7vMPTpPaoEHdhfJg?=
 =?us-ascii?Q?PvITtNhFxh9QPxdWwwNiPvSakPAE5z0ylx3tG5BZAlbLPORzUE/rwwdBZbw6?=
 =?us-ascii?Q?bq8YBJl1n0YAom35NK0P57dAbvAcusD/dfAa4UHdOPE/89KgGrYwepafS0Dd?=
 =?us-ascii?Q?HGRXawim8nDY7Xf0LXVwMdMSlEmPolUpu7KsG+bTIB0lJ7Iv4eqspghGb7go?=
 =?us-ascii?Q?GbPuRq3+VNMnRz9dd6WeBgyeybbdnKP2kY4hGUGgJgw/r3gygoVIych4zHLm?=
 =?us-ascii?Q?K/WUXU2q9/+mGAgCJzRDnEjZgcszJmN/sTVWIZ2skRi8Tr5CYOxLRg7v8LXG?=
 =?us-ascii?Q?uM4nm5w4MZbQGab4Eil5c3gYeJRvm+eKj7hoTRqp4pVt41zje8aPT925KVnf?=
 =?us-ascii?Q?QjFNAN3g0CBaXVEfCzCY69h428EPbVBXUO0tqGgdqS0Bn9tHq0IrcTf2C8T5?=
 =?us-ascii?Q?F4r6SYYyY0eJtFW/BQ6ChyAP7EUDfBpX1KleSoYwwc9H5+LY4VzZHGHDnl/R?=
 =?us-ascii?Q?3cCbaI07Ixfo2YhiTJBb/FUlGB7zPJMi+3Xaite02FMIbaUyOmCeNKUFdo5L?=
 =?us-ascii?Q?jOKTHlXtiMjvXqISVD1r+cPpZREuZxU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Nr3ZwcxNWEcO8UT7aUy/Iuco500ARGUTlNEGZPg492TVVvprPM1gAdOw9fMMgdrz39+YwfB8z1Gz+7FLInLua8lBNoW+9XnLQHv6ROgpw0ktds4mSLTVvNbYVS2UWnThrpQYQfrhoQSCxu1sgn+rkkXMH8psI90xZvIclLVtepOL7eWypwctrbanZ/tW/lbF3vB+LMwnwSve13hrh6tqxW8FvwhCZtZkdZQiGW3hUh8OMll7tSX+evysdlRl7fULzZs3QkwkWqYfLKx/kp1U4FaFiCwvPifYW2pV4e11HMebG7XGzZsqLtKPR8ym/NWGIdV122xRmKFa+NgP3aEDY2UZy/M44qF2BhhgPefOZWCM15VwBen+7yX6NdDUy9/iULZQu4lfKsfTcyjNWsQ8NEfQKRvpifjMchiePC5Pn4KCOAmYl0glrLxQ6i9yr0GXESjNOjTJNHtcoQibwKlETVZCxMOqZugDU3ZGyjAJd8LGOO6eBWAKHTNfQb7XuZcztAacpWno58jr3Q7TAK+Bhd+MNrCTRimgvdQw/lAjSsmv/uKCzgMnLmatuOXTU5WDMCKIpW2aRItm8TilT3XhzfRW+cKH8QVEP9798t1gST4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e5612c-2a33-4a45-91a5-08de4f977375
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:55:02.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pUccUfRWqJWApIxrHoFof1TEg3VvFCKh6pg/tj7ecHHRC24woPXoJBfhCCb7Q03Q+JiJqiqqDlbgsWdWpSI9s4bMdPFY9Mir3oxi50dyfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6449
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601090119
X-Proofpoint-ORIG-GUID: QoWOv1rwRYte-7uPVqSe-Ec5D_PWYo8L
X-Authority-Analysis: v=2.4 cv=GuBPO01C c=1 sm=1 tr=0 ts=696124db b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=MDf9mpxQxfnZ9sCkwVYA:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22 cc=ntf awl=host:13654
X-Proofpoint-GUID: QoWOv1rwRYte-7uPVqSe-Ec5D_PWYo8L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExOSBTYWx0ZWRfX/U9eaGbHaZfD
 kC4ZixNnV0WuFM0Zdi9OL/uvBCAri40B+vA/ouMPQLQR/yG2kXsyCnSaaGCPy88HBwM2/6C00Ox
 b6ysykY5x49FWjZ3La/nr7AJSJs9lYKbfF4fvTITyDBJt9tmW2N+8dAJbLgV9+3QdyDAAcbdJ6P
 ZY89e6CDrABCzabzcc1i1nYz1o35yBS7cKUBsXig2gJ2LIqAwIsDQ4QgNJIDsr4RtFVJYRpFPyc
 5/SSY183s6SdLEB4+WGXqoIh4Sztpp8flOlthSChuVQqSrtUYPrQEvbQJY7ZbEJmGRtoFmQe0W0
 8plE8xxI/qNMz/Myi/GACITYOiH+TDplReESuLpGDy6j3BPekHWb8jA0KNjfsdN9EXx1LvLU4gl
 p1T0BgUAAyAnVgq4pO37qXgOo8zbFE9ZgDTPmfnujnUTjBpE92GG9+PFNYuj3oDq2C0fvaRAbrL
 mf8nTF8cBNed0ehbUJK/Ut0gjVVhD1xwW01ArQRQ=

On Fri, Jan 09, 2026 at 10:51:04AM -0500, Steven Rostedt wrote:
> On Fri, 9 Jan 2026 10:54:46 +0200
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>
> > > Which is why I'm tiring myself out with this thread when I have a lot of other
> > > things to do :)
> >
> > Thank you for that. As a lurker in this mail thread, I really appreciate
> > your efforts as they're saving the time I would need to argue as
> > strongly as you do :-)
>
> And even though I'm arguing with Lorenzo, I appreciate him giving his
> feedback. I'm not at all frustrated with him, and his arguments help me
> understand my own ideas about this document.

And to reciprocate - I'm not frustrated or upset with you or anybody else
here or even Linus ;) I see this as healthy debate and that's all I wanted
here.

Civil disagreement is a vital part of a healthy community IMO!

>
> >
> > While I agree with the argument that kernel documentation should not
> > cover every single hypothetical case that one could come up with, the
> > issue at hand here is real (based on the multiple people who have
> > replied saying they have seen it happen), and I don't think anyone
> > expects the problem to disappear magically given the industry trend.
> >
> > It is also absolutely true that actors with questionable ethics will not
> > care about the documentation. I do see value in being able to point
> > developers acting in good faith to the rules, but an even more important
> > point in my opinion is the message your proposal gives to maintainers.
>
> I'm actually not against a document that is all about AI slop. I'm just
> against hijacking this document into being that. This wasn't the purpose of
> this document. In the TAB, where we started discussing this (and I was
> supposed to be the one that wrote the first version, but thankfully Dave
> did a great job at getting it going). The focus was to be to document what
> we currently do in practice when it comes to tool-generated content. Notice
> that the subject of this document doesn't even mention AI.
>
> I personally (and I hope others do too) want to keep this document focused
> on transparency when it comes to tool-generated content which also includes
> testing and such.
>
> Now, in the future there may be a need for a harsher document to cover AI
> slop. I just don't want it to be this document.
>
> I don't think AI is just another tool, but in this document it is, as the
> focus was to talk about all tooling that generates patches (which is
> everything from sed scripts to AI). I don't want this document to be
> focused on AI at all.
>
> If you want something to point to when you receive AI slop, create a
> separate document that is for that purpose only. It will keep this document
> clearer and also be more useful to the one that needs to read the AI slop
> document, as it will be explicitly for them.

Sure to the above, but it seems (...?) you are ok with my addition to the
document which hopefully is tempered enough to provide the emphasis I'm
looking for (note I say - all tools - even if LLMs are the most obvious
exmaple) - without being so strident as to seem out of scope?

>
> -- Steve

Cheers, Lorenzo
