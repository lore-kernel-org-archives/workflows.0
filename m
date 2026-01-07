Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AA029BD8E;
	Wed,  7 Jan 2026 21:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767820554; cv=fail; b=t20iRBGs140vGWaR0nSTsmyQ4EPmglhCvclRShHj3PQpSoREfSb2YgAwv51NXTLO7kLA1RHEE//GgrYEEFj0q4F/zAaA/1Bwwr4Vmm/vzPNRTuiS6QDhV4YD9ICc7zK80of8DiF4frqDqO1pnIviziKAjB3LL76+BnU2TINwj48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767820554; c=relaxed/simple;
	bh=A5zAhlpNM2E5DNi+FuZA7BJQJam3pgorKEzi1DdB3lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ngz0twk3lu1ByLM5zrKCw0/k+WHXp4GYkt5yxlcEyv57SUNt8vxIALigWhYUEIwc0ZeBgsyzyTJmur3VO4u7TVwNSJsMnH9QrurV0SzrvR0MozSyYuxkOQmbAEWDdQDQCfhEaJS8XPLc9FkoGqzOtsz3eUFmke5wYwdNyJjXniU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=selPDp2T; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WpbqwhNI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="selPDp2T";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WpbqwhNI"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607ILZEZ2287104;
	Wed, 7 Jan 2026 21:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JHOR+sZS/VwOQQsG7P
	cbnRoCN6aH4LFlJDhqlF8oq7k=; b=selPDp2TD77KOqjLUWO2dtH2wIsqo5nSZR
	nInpwetl0OeTQzjXHTjAJd1iO/4CU08bkMiNoPSzNXzi01ifljfFzvKRms8KTfJt
	dR4cLo/4kGOamIHnCx9csxrooE+usb5DYFLTGWrc1Qw/MP2iPksLKr+9I+s+ocSO
	+9zfVWaS/zdD8twNQIaGPI8tZ3IncrJNhiII351COEwTnAqA1GP5A9Bjl+Xn0zG0
	lFHbaVBxgow1smmmnBesigDOmDwZSLZ2JDXHz21Pa+d0MB3PKOjX2IJXQxnf1wY1
	jy7dO7qCEJD+JyD5OvfA6aLpG/7f/E3g7Dg7uv6PUUOSyL5Tgngw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhvpar8kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Jan 2026 21:15:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 607J3s8A034004;
	Wed, 7 Jan 2026 21:15:24 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjaaq77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Jan 2026 21:15:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQTAz/8aciPASiDzIRnYPS4FsZTkbU+QYA00y6eiMdIDXcJJcHmWrb4Wp/TECTWSlVcaIaaxBSbkxKCPwJ+X/C+1FkRSjN0mVrqHGHkekhaT7QIVqAQr/hAY8MDNrCD2C70d/ylVCm73QzZgOWrdasgl+piCoDzucRcTda9mQ+e7efxh72vgSCLlogHQI5kZaqX6kKGItpj9AZMMpCTR5tqLRMO9heoQXQQuv57/fYDWJVeeltmrMTG0JaazUrfC29npeCL3N1CknogcHBkZXB7jLuuGHL5igP3nQUdrSuze7hGoga4NzcBhgbOrwWsE7ot8Qo0twjwYPy4qjMzm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHOR+sZS/VwOQQsG7PcbnRoCN6aH4LFlJDhqlF8oq7k=;
 b=iIjC0HyP1PqTieRBpK/hs+++Dby2P2kEy+9zHlVXDcOh1s2C4YVnWm7RlJosyfTES3855KvBhV8Ca17UJjh+THUDM9vii0A7RrPGepPqGEnotU/6sRwGBFRfIHfOMlrWtRf1laSpuVRvOJxZ579nWoQIxNVhe0PEVAHrPMvyWwyoFChc/adKZcahPOH5SmZtAJK/ZHfOs57NsvKZU6QB4kIpC8i0J2smv7v1zuYaXQHD0JjUyPCaOFEcFB30G27V1PIy1cdwwBHTkCJOyvV7JSH4KZLrXa9kcPoqmPdAfA8YKpY1k6Tl6BPSXqzcJoXW2hcopQ7Yqp2sViEHGa9i6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHOR+sZS/VwOQQsG7PcbnRoCN6aH4LFlJDhqlF8oq7k=;
 b=WpbqwhNIc82fDKwzK0TtrpPtjqzXIZCfWl5wtXiSZtnZjcmeYuo9is2+UhsVWhMZjuNNXsmvlIZAFUlguX16zGNJe8eqxg8BP4FEXrC1wKpEEeEoD2kl5okcDpW67UzxJrb3VHvoykozp/apXpXE2xpwxu3Fqm8qlOJfJysMsvE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ1PR10MB5905.namprd10.prod.outlook.com (2603:10b6:a03:48c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 21:15:18 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 21:15:18 +0000
Date: Wed, 7 Jan 2026 21:15:17 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dave Hansen <dave@sr71.net>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
        Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
        workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
X-ClientProxiedBy: LNXP123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::34) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ1PR10MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ccef21-4646-42de-2d82-08de4e31dba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K9JSPgaAGhFDTNo02GHDEk/jMsLNTcFeNPjezNelGVRWdLn5dy/zij61ZBEd?=
 =?us-ascii?Q?VekG+jnvTEzCyzEVb0ijOHxLgjS2QWo5PTbG6AJfeoN0LwnZ8FXSRKUfWpar?=
 =?us-ascii?Q?8ggnDqaqKPgEmfzogtww3IkvY+4DeTJ9MlaZlyXMY0LseZgccljnFquEYwWH?=
 =?us-ascii?Q?BA6IFfxXWoPT0WbvDdkERWrUaP4GJx/oHS2RXS6UAenkHDUOL0eHK8aAdDO7?=
 =?us-ascii?Q?TIuDDOXO7fihTGmED2oUpZHsi49FhuobXo0Qv3/Mis+eARgi13gIF9qZpORj?=
 =?us-ascii?Q?Lyon5SOxR3rfyYBxcMIupaEF2Vvs4cTTK+StH2HnWLQhIqfskCEg3D9dxnnD?=
 =?us-ascii?Q?JrYtcyvwtCHwlkUIs2BuK8ixWT4RBISWb5t6iNfRKtVyimumOGueEe9oTMA8?=
 =?us-ascii?Q?7lx4opsnkJEDmJvjb9t0oFPk8/0l4h8O08zneR1CzmrCinZijd/Fd9N8QHGs?=
 =?us-ascii?Q?bH6Jh4D2tJ+1Txw4OrrHlXKV6EVP8Gwl1dDTCHBIks7Z8ophecFTKVhixiEI?=
 =?us-ascii?Q?6lQM9wbzzLDgzOg68Tz36E+sQrGJbuhdtLV50pPizpGFDdiARkGu8FZXh9H4?=
 =?us-ascii?Q?qEKLqZO249cxZHSR9L2zRj7ll/MpqF3NFp+56fWJcWLOBG4exaidoZh1a5uW?=
 =?us-ascii?Q?ziR8C8ZfdtP7FAOsiwHft1X6Iv6HQSQRBGl+lEcC8R4U3goc7XzQmhplt5vy?=
 =?us-ascii?Q?7EcgtAmAKVKdb/sSSGcxfb13u7bTIefaI59u5rI9ofBGq8k9PtjFU5BuUw22?=
 =?us-ascii?Q?nMHnPEH64mkqTiGsralidyNQ/qIqy1pIf23e/vKOy3V386y5GEnwHBz7KNz8?=
 =?us-ascii?Q?nZ1lErZcBXmGKX1RtFHrKFTTX43NMjqmuEcf2FT/zslssu0Ojh4d6YAO6uad?=
 =?us-ascii?Q?4IN2NHUizCQQ6tfBMHtMToxIqrZeVIS0f4O2Lrlujwjhk6vr/fzDRduzqjuI?=
 =?us-ascii?Q?IdJzX3bRda2HyYZCSF9X+mXrh5fZXtoSO5c6BWnOVhhT1b0QmBe/RbznY3RC?=
 =?us-ascii?Q?FsitQL8J8Ikv57qgaQRwWpW5CHdQZnSREq+rkePWvFHSvtW/TGHpvM771AmX?=
 =?us-ascii?Q?sPYNXsKYmNetkM9jvFFjRFZoL5Dhb2gckCRwo9bXDmpOak2tKSbR+P6rz66w?=
 =?us-ascii?Q?jbVgX0tLpNN/9KXb9tvZZrdKRJ+jjtv7a9j3NmOP/c/aUd+//vLffhMfBzOl?=
 =?us-ascii?Q?RlluMnr3e67gVQ9l39+E04y/8KuVKkxgz5rWsLDX3+BjMGwn2JrW9os0+xxi?=
 =?us-ascii?Q?s86QUPWBnOMQePiNZLS+rzdmuRVNW5MJAWzu/Tuu/5Ow/ZI8sdPgoIL1gZ7u?=
 =?us-ascii?Q?6egFRmNwRtfNu4pYDPGuDg9j0QH4sTYVtG3Ml/UW7LAgPqkH2Vsy7OQK5L/K?=
 =?us-ascii?Q?RrYyFKMTsIfDQlUfHf5ZCnsOsSW1J863rycTnxYE5s/InfAKe/ziD4jWd9L+?=
 =?us-ascii?Q?oKQxtudrPrZP5cBRGssY3W8KP85cUmdj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JXxBXdhH5qe4wVq6Y/Lo451iV9i0gKlIw5dQIzwySNp/c0qUAFS64rYP5+xV?=
 =?us-ascii?Q?HYpx3dZe/qMF79bv4234mA4H9j97jvcHgWSgWIOGbgR+I/l1GAJ2rWSTY6T8?=
 =?us-ascii?Q?NXu/6EMA2EoAy3KzR/+YGpu8MToBvpIRAoGEsDrCvODKgC9APdrCm3ck3NNW?=
 =?us-ascii?Q?pJQz542UOidHMZ8RgGukwXXGTdlJ2FNAr/bWPvydnN/2cATRbE/jUiTmQ21g?=
 =?us-ascii?Q?UWtBSKusmcS4mJaZ0+jZKhhFG0XRefvvQuEVFc2tzfEgeWT5QPw/qdgUczPa?=
 =?us-ascii?Q?eSAVSMRessmF7WQppdKz+GBfMQdp84EV9jSSmak5WQVqKUYNoJy0nOxBxUnW?=
 =?us-ascii?Q?NMW1K2w/BLgbC4UjXyQ79BbhJGAWR7RGbJge7BeIzn0/AmXaMedNf8aJnR+d?=
 =?us-ascii?Q?LniA/9gzFUiCq+Kk/6iH0hrqeF8CyqQ/WVxxhXYnR+MXax8pgFzQdZvsshKP?=
 =?us-ascii?Q?4G5r+YwRO7y7vddJY1PYBSw9ekJh+KAqXNs1YuRMhHFJPFBzt/HG6Q/xTlTL?=
 =?us-ascii?Q?Z5cY2juYjtYsyltO9GQl4elGq0aHqg4BpgLytpZNlFeP7FtN2/LZj28Lj3vi?=
 =?us-ascii?Q?4kZEhY87Fpb8y0vBIpoeoKpJXZr0DRe7GradXsbpt9mcDwu4k4WABJmq8re8?=
 =?us-ascii?Q?xiCYn4DVUuYiXka7V7e1ls7498hN86RRhPQ0AXIWjDVrDvyw+wIpICvPqhTX?=
 =?us-ascii?Q?g0PnuKGNsDSNTbyN3HFy6KGWZo8usmu7ws0Aef/GqXu2uJ9djzaucs1kDEQg?=
 =?us-ascii?Q?lAdxRMyNfMBedIGiNee3EFGbYGVbzxw4oQIxozjcY1/JodS7cFvhskQhgfjl?=
 =?us-ascii?Q?eSiRATihdyihEowBMxb9xA3sOrt8JRwefI7dnLSuKJMnj/NbDsN2X6xhwfhU?=
 =?us-ascii?Q?S6McZXcN6CuWEYy1fXtZsRV/MUEuIIC3ncepkriRne0eB+Bq2DP6zEjtdcM2?=
 =?us-ascii?Q?Dl8fQeVXPfjtxz1jwcPDdr3yt5vhdymUhmGxQ8t3BSCSr09NLLm3Giev6OcH?=
 =?us-ascii?Q?FciH4+rhwQVbXh2QYO60pbbD/gV7GFGpv6LgnBHKSpXtA8dR+Gzt9h8eO5nc?=
 =?us-ascii?Q?QfVearCW8oB0zAtskBXoh0rxjEm1MGH6GMm6fb0nizxkZncXYI8k/PLLI/J/?=
 =?us-ascii?Q?mi1jGH1otnSu38V90bboL/Ct+uP4uIFp8XgNuH7mtTmMp1q37cUHbpCntTRr?=
 =?us-ascii?Q?A9dT5NJJ5Rfr91o/jKTzubQSVli3LKtwRwFYJyi2YVPrkBbTm8SmMlCBHKPI?=
 =?us-ascii?Q?OUTDIYzNhgZZ9vxdJZIjSnerCe/wESwfqLzTZYsQOSLbCyMmJ9VmXRmcKHsf?=
 =?us-ascii?Q?zuT5050CT/C2+YJ1rdV01rULq3sVVgUTSeM0iUDwZmyy4qY3QIRFIjb6SmSu?=
 =?us-ascii?Q?3L4Ph3SMQLa9uEtZgXN44WY4j4nWo1g6n9WbgGqcxrL2eonwzxRBqpSUBoUz?=
 =?us-ascii?Q?2dDc7LLOS1KmuKRD6Vsb5j0r9VZlTK4o5wcjOA0WJJfgkNx3KCOg2sH2k6uD?=
 =?us-ascii?Q?MT35somHvvrVLnoCwI+vf5aEpRhmZWir4CnNFb7JPu/nU4bM7uOFuBE5WZPo?=
 =?us-ascii?Q?t8pDtbAl5i8g0rP6KgaNFEMGelB8raYD3a0jU80YmDn2pYOuGHQOVKanIA2J?=
 =?us-ascii?Q?+dxA9GJtoZgjZPeyW7QvRotQXfZyePYeCFNuE6lqlrISHN52DRpaDGapTOhb?=
 =?us-ascii?Q?FEzrSCsLsi31gJQZXyNpPPy+DBG1EDyX+4qQbKaE/z8ttHZZ1cxcPdiZRmTv?=
 =?us-ascii?Q?k7ZLZ/xjujyLUm2glH9h9pgfmrCapBU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	becWCmJYrwg/1csaqT7cyElL5dmaMnu8ZMhiBKZmJU+jyN6NC6Xx9yoiguuFelPd8Car/NVgG+Ah0n1vGDMNrfUPkNXCsuiylXftLpH0WgWGFNAXoPZH4BqdHNaBXoCvufxgh5X3E+EtSu4u42ULtlcNHpbVcuU8GbTcI5Vr57OfrEilRShyyz+Utx1t4u80urrd4GaULpQTcy3ZIQsPPoMLd/24EIcSZKax7dKLPI3UO6iLp1PBJEKHT/FG3nXtZ7rmsBi1VaUdBJTwp/zERrAFn59KAjXyWEejoxNIkPfqPQrpVpBCAdbhJIEeHdSb2xDhW/FJPmnYKWBK6Vgi8dejOtGlxfQXDSEWrfFevhP2QFCxb4/HWZwmYN59u0QjY65/JHvfUzzsi47a16gMaNZgAWOMjS45kQmfbBJLs2z7gRARkdRGF3u6u3u+NacZcwoT7jj4boYqq6Q/pwup3AtJ1Fihb3hWBpTWfdO+W5iCiNZI5LxbOF3UaF1+eVdN8dGSXWrx6HHV/4VvE3pEh3vcbWPXVyQVIvVzE8MjiUxCagn6fo0xXGEus4MeX2ADbQhSVobi1EVGUoL8Vay/+f6+0J/uJhrOjxUau1HplSg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ccef21-4646-42de-2d82-08de4e31dba4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 21:15:17.9879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARSLXvVd8i3c/rn/zYYa9o+9rOWdNO5K99VPYc/B0nDrmCzM5E32ahzD6R1uFjnLTY6wOe1UPy637K0Sc0MAfe8fE73dyePax0NNzwWU5UA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5905
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601070168
X-Proofpoint-GUID: OxP0LjS1-2AoeKsY7-A0Y5HdW82nZDQE
X-Authority-Analysis: v=2.4 cv=KptAGGWN c=1 sm=1 tr=0 ts=695ecced b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=17d8XGD86EwYiGoccysA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: OxP0LjS1-2AoeKsY7-A0Y5HdW82nZDQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE2OCBTYWx0ZWRfX5QRmJhUUag4g
 4UXSt3j9mA4ttybOaAww353h0nKiQICDbdMiPF8rJgIjQQ0SelQRaRQnfoQSd5HS2vXFLbWbAPn
 +fJne8k2ne1X9iFgX7MpO9vZ1Hpwh+sxvFXXVeZ5Xp8570Rj2BEjmhgYJs9KPDh3fDXZTOQs3/E
 NG6CHyG5OvfHq/KNMKDYY3zUnYstPh17Dz/BKIcTSNwqu2lW7zSxitaWxs6jN7rt2gVy74Wa2kn
 Rt8AK4yqyO6qrjUo0JU40gpsGe9UvQpNn+4cjFFdldZ8dl6/03SXySfFSQdMjDkZFYVB8UZ1o6D
 dOLpHn3MNq33RnY5POamc5owNW4G/U2RxWXlb8jVAb/3iWoZDtxoCzPu+ubukYyys75ejtUQe53
 51DMsqgrEQy3rbLiPApcW7LHOUra8zg38CTIl+3PNQOG/8b9IqM1bAYNWfC9CWD0XeU1/EJ9bM0
 xHcpcYKiSg2xIdznbxQ==

On Wed, Jan 07, 2026 at 11:18:52AM -0800, Dave Hansen wrote:
> On 1/7/26 10:12, Lorenzo Stoakes wrote:
> ...
> > I know Linus had the cute interpretation of it 'just being another tool'
> > but never before have people been able to do this.
>
> I respect your position here. But I'm not sure how to reconcile:
>
> 	LLMs are just another tool
> and
> 	LLMs are not just another tool
>
> :)

Well I'm not asking you to reconcile that, I'm providing my point of view
which disagrees with the first position and makes a case for the
second. Isn't review about feedback both positive and negative?

Obviously if this was intended to simply inform the community of the
committee's decision then apologies for misinterpreting it.

I would simply argue that LLMs are not another tool on the basis of the
drastic negative impact its had in very many areas, for which you need only
take a cursory glance at the world to observe.

Thinking LLMs are 'just another tool' is to say effectively that the kernel
is immune from this. Which seems to me a silly position.

>
> Let's look at it another way: What we all *want* for the kernel is
> simplicity. Simple rules, simple documentation, simple code. The
> simplest way to deal with the LLM onslaught is to pray that our existing
> rules will suffice.

I'm not sure we really have rules quite as clearly as you say, as
subsystems differ greatly in what they do.

For one mm merges patches unless averse review is received. Which means a
sudden influx of LLM series is likely to lead to real problems. Not all
subsystems are alike like this.

One rule that seems consistent is that arbitrary dismissal of series is
seriously frowned upon.

The document claims otherwise.

>
> For now, I think the existing rules are holding. We have the luxury of

We're noticing a lot more LLM slop than we used to. It is becoming more and
more of an issue.

Secondly, as I said in my MS thread and maybe even in a previous version of
this one (can't remember) - I fear that once it becomes public that we are
open to LLM patches, the floodgates will open.

The kernel has a thorny reputation of people pushing back, which probably
plays some role in holding that off.

And it's not like I'm asking for much, I'm not asking you to rewrite the
document, or take an entirely different approach, I'm just saying that we
should highlight that :

1. LLMs _allow you to send patches end-to-end without expertise_.

2. As a result, even though the community (rightly) strongly disapproves of
   blanket dismissals of series, if we suspect AI slop [I think it's useful
   to actually use that term], maintains can reject it out of hand.

Point 2 is absolutely a new thing in my view.

> treating LLMs like any other tool. That could change any day because
> some new tool comes along that's better at spamming patches at us. I
> think that's the point you're trying to make is that the dam might break
> any day and we should be prepared for it.
>
> Is that what it boils down to?

I feel I've answered that above.

>
> >> +As with all contributions, individual maintainers have discretion to
> >> +choose how they handle the contribution. For example, they might:
> >> +
> >> + - Treat it just like any other contribution.
> >> + - Reject it outright.
> >
> > This is really not correct, it's simply not acceptable in the community to
> > reject series outright without justification. Yes perhaps people do that,
> > but it's really not something that's accepted.
>
> I'm not quite sure how this gives maintainers a new ability to reject
> things without justification, or encourages them to reject
> tool-generated code in a new way.
>
> Let's say something generated by "checkpatch.pl --fix" that's trying to
> patch arch/x86/foo.c lands in my inbox. I personally think it's OK for
> me as a maintainer to say: "No thanks, checkpatch has burned me too many
> times in foo.c and I don't trust its output there." To me, that's
> rejecting it outright.
>
> Could you explain a bit how this might encourage bad maintainer behavior?

I really don't understand your question or why you're formulating this to
be about bad maintainer behaviour?

It's generally frowned upon in the kernel to outright reject series without
technical justification. I really don't see how you can say that is not the
case?

LLM generated series won't be a trivial checkpatch.pl --fix change, you've
given a trivially identifiable case that you could absolutely justify.

Again, I'm not really asking for much here. As a maintainer I am (very)
concerned about the asymmetry between what can be submitted vs. review
resource.

And to me being able to reference this document and to say 'sorry this
appears to be AI slop so we can't accept it' would be really useful.

Referencing a document that tries very hard to say 'NOP' isn't quite so
useful.

Thanks, Lorenzo
