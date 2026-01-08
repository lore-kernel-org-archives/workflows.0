Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EB8503FB9;
	Thu,  8 Jan 2026 14:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882319; cv=fail; b=uj+H8jGRCNyjAs/7Wl3BhMxi/9qt5/aJnNmetTVHmxriFblDSsbgFYAuJQO3XYOTaPR+KhQrIxOUi2V4B+Tw3RzJJZvwd3V1/Czpe7/FVfJhxkQvkRa04NBIOlYPwQhimDs1RzInKbJ3oV+12bLB4bKYMnZyGOx1xyov7rkAMVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882319; c=relaxed/simple;
	bh=+977YzECcIwQmKq4Zr7XMhFlHzDl7JjrVoWHTByyABU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sau1L0vym9tQaXAM5xDio7OBHB7NHqdYco4aljKczzlLqXkrbNpTCm2io+Lvz43kvq0m9dlGlfaV7bWoQneFaXSI+KQFWUibkysEAtQ9eTb+9qLUJ9OgJYMOTAC9V9kOaw67PaA4Y2cK19ch/UKO5DBFhCY9ThZdDaIyEPCe52I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sWwScq6P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wu2TIP+r; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sWwScq6P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wu2TIP+r"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608EAGMK285202;
	Thu, 8 Jan 2026 14:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+977YzECcIwQmKq4Zr
	7XMhFlHzDl7JjrVoWHTByyABU=; b=sWwScq6PBrRPRjcM2Jvb3m/ufgV0Rw4fbP
	c/zG+EYDpPzsHb07QhGkaIG3o5M8iHzRylFzn8inoF8aWxDypZL6Yxof+BbI1BTX
	Rms6F3+rVVzePMP0qCSQs/FYjxBQyVl1TRu1CIqUtsyabtYm54IX3Ypz8BQ+kJtO
	ZF4AyOWgoZuxgwTQU/9921FB3WlvJyM8yjdvqNKsV8+OA4spIrG7W+GgYUJBOJ7G
	exy71tuUjJeiaX5HAIZ/H3WrH9T+DzJLibod8LERQJ4rFFZec7kR6Dn+j2EN8uhX
	mjeKocUJWD4ZTjshw+jS8apMHNht9L5eEfLSMPZcVBUPAVFdr5+A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bje3vg0rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 14:24:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608CFaS3033891;
	Thu, 8 Jan 2026 14:24:56 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011003.outbound.protection.outlook.com [40.107.208.3])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjb4umh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 14:24:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUNLW/udz68iu5fwulvTkp+lZM7lmrAuqS8FDcy/92wGnxItmhLntMaCVFu0kBGupobnCuQ/h2h6HF8nkMQ5s5pOeVLFlue+fjiM9hFqPmaZDFxGhxlKNAj6JOfXtsIAPoqlzO53njH60a9x5LKlUvwpmElouVZPcFtUM72lUERmk8fpx5hbJifDsBhEt+UG38b7BN/FvH7KsJnxoukXCtNv7W9LMs4aIpKWz0GsI/fwwHOxc00Gjre/IOruG84Wj+gubGep16Th9BXfMxNQ0JNG9piIsy0Y3dY7zEXr9B3z5sRRdWEJgXC0dFuyFoAOUBa2F+siTUFf9CK8wN0bHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+977YzECcIwQmKq4Zr7XMhFlHzDl7JjrVoWHTByyABU=;
 b=Q4IBoZchzkZmBOmiEH2e84w/UtC2MqMA+wPQXGYOnjr+b9iJE/KXwC2LVaM7CinPhqyxTaoF1LnBA+Mcj/7NC/9oHs6v+q8GxUup1aONfvwZRv9PmToaBD2Y8lsyF+kLT6K5VVYaeCetB7QGJgsSSgF/ASl2+W0XoP5D36ft5KrpO8MBokbGsxBoqVAbp3iChuPOLjWNeJFbj4aSnJ4nkMwaGWshszeHdoleq+ID3rsKAkHwWVBUSFty1J3srJ1hzZlnpBjVPHgT8W3R15Dmq9HBg8+vm3RiERaGKHAl6Fw6V3dfyG31a2Lz8DBAEGvuxJgN8e3RJDotr4fy8Ccoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+977YzECcIwQmKq4Zr7XMhFlHzDl7JjrVoWHTByyABU=;
 b=wu2TIP+rOz3mTtwtRbZDfsvACady23lHT1kX1T+jRUEm8ovSjT+gC7Pv/z+dke38KVNsNKCgcqChBsMAmNx9WjtaEgqt3qCnDfg7q/RSDDR08lDCrB8J0N/tXKSi6nhoOdypY9rgwjBZ4FcDBYTI/BIP9PGHb3j4rt9uefsLnJk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ2PR10MB6991.namprd10.prod.outlook.com (2603:10b6:a03:4ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 14:24:52 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 14:24:52 +0000
Date: Thu, 8 Jan 2026 14:24:55 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave@sr71.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
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
Message-ID: <b8dc3dae-2d48-427a-be91-bcca53424d53@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <20260108085215-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108085215-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: LO4P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ2PR10MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 13cdbde3-6cd8-4754-0b71-08de4ec1b04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UOTsaZpHlbrZlgfpvpudum+xUcBPAKYud8sSORr1LuXuxH565iNrGtK6Dure?=
 =?us-ascii?Q?bv4x9sBM0U8nZ/0SIqFKAthyPBDo34HQFiDsSfx6HQ7ZAgy8e9Jd5TQW7ZbJ?=
 =?us-ascii?Q?/qGn6bfhtEjl9xMvSL7sko3046bXJYGq+EEdyL8DhJdMBJwebOANNH4icObh?=
 =?us-ascii?Q?XYRCBVmH3NrD1gTe1YFzfntFxA0HrykI3dWsGoUBSv+aFMU7qttoGchfQPQK?=
 =?us-ascii?Q?sp5kvDMjd+o8s1Q1MYKQHKavdva3/XLI1YmGD9mWc3F7s++p3uHYN/KogBYg?=
 =?us-ascii?Q?1Bd6OAJLPjzutGoHjO0Sdv1x5I31X3rJA7xdtE/WQs26LKqCEBat3NNEdaH+?=
 =?us-ascii?Q?iApUcXEgEi3+inyDQPN2Pdll51UcABGCe96IxOdbMS3l7J1Gd7farx2ZaXCk?=
 =?us-ascii?Q?egKrm9nWWVR6sYiC37OGo6lcbGtr9yUQRZStkiaTSUP7Fgq5obtmz04gxgxU?=
 =?us-ascii?Q?Tkdwo2+bEutHDcqCKpIj8sEK4tWUkTUtU2zHSfaM2XZNZPQgIpb+eTZuYODa?=
 =?us-ascii?Q?Nn3b7yonqbN0yPSDrxOaSRsPYmnafoEXkWQqa6JQHHQdA+IC22A7cGSrgBJG?=
 =?us-ascii?Q?Qiz8ysaGFjIhZ0fKRONXwSSQiayAzoi2kE1IqUHgA/fWgyR67iEAUgOIdr91?=
 =?us-ascii?Q?FUo4Pip5b+rSbhhEQMluLutFL3hueTgLsKkCBUPPL4GThf8Y7Xt+w889R6Nk?=
 =?us-ascii?Q?cMKrJiAhmGBfDDfDnD5hDcudAceLhs2ryxHQY4CRLYvSgj/aCjeuKsDkDEVp?=
 =?us-ascii?Q?Hm64/Rljk6CW/Wtk+mnIIIfclMdFskQiD3H73iOI5QaBcGHA0QtD26nweDYT?=
 =?us-ascii?Q?wqADBHYjOJoKdoBjUsT8PWUOWBG7eDDyCT/ioAlZ2ctuAWW6EVry4HU4sOyj?=
 =?us-ascii?Q?W7hJhCOG78U4OeotUwCWt2eHmXa/8cduRt9IDGgXuKdwi3osqGdqr11RnnGN?=
 =?us-ascii?Q?fKztLGX9ERYgVXr9SQni2rYB2Eb8fuWdx7P/X+celgJuf0DRkhc84cRAT+7k?=
 =?us-ascii?Q?msaeUJe3qmypCGe9N50xhxjPqUpKK6xS0W3ghiNpsT+PYMlwqGQ9cETYNzCP?=
 =?us-ascii?Q?TeWwPkTnpIg3XDo1+qx2aAzA5XaK0Fp1/33gK3Od2oVWWjfN7T8RBHgubkgy?=
 =?us-ascii?Q?dWvPuXFOHRyhGrilPQHHbQUKIrbColXXeL4bQ1+4WXh5WcVUV4OUI2C751SU?=
 =?us-ascii?Q?L6lgjsEXOLLVGJzZ8DEwgEYvye1Bfc/DGIqIdZpECsN11iCFuqJp1epHknry?=
 =?us-ascii?Q?Du69JT24GMOyTdeplSyqKkEnD3uepyMxDus7nVnxasLAs6DLevKFubZRcOef?=
 =?us-ascii?Q?jAt4fNctmXAQb0zemc8W/SkSTwHYKI/lYJFO88Vai5YhgWjZi29u5KCZwbFX?=
 =?us-ascii?Q?U+EuG8WPG7RBoEeDNm8H/alQoirf7bLuppGD3JLTAKQCMwMKDfUZt+dV6FeA?=
 =?us-ascii?Q?M6IwljpC4iejNMssZoKfTX/qBs9RAAS3os5cw9XZRMdMMFQZnWGyPQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UeimMUk8N0Ri0neg3X1LLfjAOoO2Qu1bBF4HY2lCkncwlOSoN1YZnPKvxFBH?=
 =?us-ascii?Q?bDDJWE3IdLtzWsu9A0IFPdmsw8C7l+ZMXHjREtB+i11RJ0CHtVGXTDLMoBVv?=
 =?us-ascii?Q?tDJcm+j3WmQdwHTIXNYQbMZbwQhkN7yIrlL1ZcPXFwlN6dJ/r9xuyOcnYD7F?=
 =?us-ascii?Q?Qm8nMEOT5mdJ2+/07XRelVc5iSfIZj6xJ4eobdS3pUMNrzPYtwmmtCEcQUMt?=
 =?us-ascii?Q?FHYwR7CTd6k9LQvr4F229cuQNJQZK8orsQgl6BTNzCNXmPPh1zlSiisXQzeJ?=
 =?us-ascii?Q?r0tKNVvUnm9K7mZ17Rs+lM+zhHCPmPESjMkyMAcsjy83e3siraYvsbAzsmmO?=
 =?us-ascii?Q?MIONLtOzL21vaMTmDi4PTz3VkHVRiXx+sWAWedVQzSILTriPcYi0DKcmB75M?=
 =?us-ascii?Q?B9OtsxAoVNkkWUghkIHIIbCWpJQozv+dvg2XqOjr8z/s2m2kgeFNGxNUAQTr?=
 =?us-ascii?Q?522D1dRAmGbVXfM2uIWyXvD2Xihve3WprY5q1MMiNhaVf++7eO5kSzRcgTTX?=
 =?us-ascii?Q?kywDR+Zau+KyG3nDgmfIY2+LSim2SxMou3W70uxEG2ey67vHaNBFUX1JLwdU?=
 =?us-ascii?Q?vy2zqK3/QXlxze3cgenXeTzk8zRenxC+A0e3YGqxDaEwAT1GeyXSt+sK2NqM?=
 =?us-ascii?Q?0qJ4JZjXldDNHf7HVbGpZC0pz9HmiXnTk02c/vk9MROcrJqNpIxd1nhm1b8V?=
 =?us-ascii?Q?OMPjxi4ogZdrgKkZ/mdUIVJYPq8ScnCDCfIV66EZZPxE0Vx0BVZ2LLgc44u5?=
 =?us-ascii?Q?eAstmxPMKRGC5Ae3v0ad7FZCKlQuM1EWe/oPujAH2/394LXdpM7+siZMF6TF?=
 =?us-ascii?Q?GFZBoRGtYX8kqKPQQNUVSMHFlGwb0+XsOkGRy9m6gVwuZ1WcUn8Pz+o0q+rf?=
 =?us-ascii?Q?QkpnZ2Q52bOD5xu9syU9b2eeUthdcWKWHayDNdUPyzjdt3uCY/5rdarKca7V?=
 =?us-ascii?Q?NAkp99OnQDI/IeIpems2NyD+Zepy+nmmZxKMnpcNtXoxfADXsLmwAhdK153x?=
 =?us-ascii?Q?JEk3u6FR9ZwkQKo4m5lsksa5Qc/oXbC1+Z9C54Ia/smikUWylBWUDn/fVpwW?=
 =?us-ascii?Q?ScJekBryjhlv8Fyq7uCxEZPYhZQb8MDBhyb4PijpkObr8HO5L6RNkJyd+wK+?=
 =?us-ascii?Q?jSN5DA988M0KwHq0A067JPVqZlEoGZ7M0YPbyChPWINTcm/udIi6uyEEf0K4?=
 =?us-ascii?Q?KQc/lYLPKGmI/jkzcyO4zkme7Dzpm83Z7kGedJGSB15LlxFJmA1xNz6peCi/?=
 =?us-ascii?Q?apIKBROgoQ7IIPRTvhi9GhlJJ8lSSj0jBQGEGqm7J8sSRYMIuTY7uYeKaGcO?=
 =?us-ascii?Q?8OVBlEySwIRjY9L2iR04eUwrVC4N++l3K7frBtOpCOmysu8IbLIJ9UkQPo8/?=
 =?us-ascii?Q?zwG3YdELqn+TMQd7vQeLCUZ4i8eHIfdAhprnsrapY7Ng3tx6qQG2fvpn+Suj?=
 =?us-ascii?Q?Nme9n0sdJ348bxK9V/3bnS+PQYvGcHBEIqo4+tLvn/WZB5k1MvrVzOd8WozJ?=
 =?us-ascii?Q?zPxPQKflF5WoF+Yc/1Th8n6+d21rzKfLQftn43BLVP2U/2w4P1zIQilWYcnx?=
 =?us-ascii?Q?etkQSkkFvH1+lJMBeqH9kOloqBZ61C9yuK2kb3I8ELUVrZhv2/tyi4oJ5IdN?=
 =?us-ascii?Q?8+YOKICjr2xYGjLqkgKl7hHPatmchlFa4RIaHomxQ5v8hdq6H9aqgPP4zbks?=
 =?us-ascii?Q?XLMTb3+f5UaXpbGg1o8hDtKCpmcNqPT8KCMAtCghjYKw/HS89JrB4Oyk73ZD?=
 =?us-ascii?Q?x+Ceze5jfwqxDLRF0btkhxima8+p+P8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UMxMq5gmw5anGXpl2ndkCuihp20UXfh71J4org2MOSU5BHMoW90nKTRUyn4FLzcjB8nhGj/+KjTl58pQtgIAT93JsE8lvSLl4BKQEtOzYOzBNtIfZ88sboshJctamvV8M6k7p4t1MyAwt6O9GHHnWHoS0Nupp+5waWepisGPxKAc+zlKUUTYk0N6POQd9Xo2VgslCWKKNIXM9VwFQgY88482GoM/6IDf5omO1w0LrZiRfMgQB2wY/ez+Z2Czuch9GaCCZsoMC2jHgWbHRHl3fWgW2M10MCnAwYG/rtaGtPnsvYTuzcx/benykw9tKZSG3NIHqybC0I5dnruDELmWa35QgbMRbNDU/iLwwvmDKF5ANpTk9xuJABfLjZmRw7KllC2FDOlbb7pMfPkA3Ztli+5+k1lZn+Q5+n990K4Ox6YbChpn0hiloM/2EwsE3aH45x/ZsTJ8NidjYYMxVzqA6RenmOI1KZKXcPODWxYNMKFkb0z1j6+6G3pt+jCFzoYy+W2io+XVyt7njnqvo3wM391D3QPG0n78tUEYo9HpnqjWH2FFKPS/WxvNKLJIOWGpSFYYg/eAbKcGExJs4e8xSyp5Ey4TrtvvoRjZ1ztM+3A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cdbde3-6cd8-4754-0b71-08de4ec1b04a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:24:52.7589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qdZo+ffygWHdlvHdmGWwZX2on4BmtqUBXyGiil+724J8rYeqPAC3FMyQ+hEs+tBoJPEOSwLDhazm5ZEjjW5bkwV2jSJXXdi44ncB0qDYPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6991
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=779 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601080103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwMyBTYWx0ZWRfX/cWED9Rkd+DU
 Fo+Y0erpgthwjJ5EYr0wzivto6PTgSa4ISdD7DudyfabWYoPXN+Pspwyilg7PDJ66kcJkDfI+Ew
 33xYUw5bVHSXg4/exp8/Gi/9lf0LU0R7wQjs0TQCsLADDLz6lZGk2lF9nbjwpMMBid3VHsFxSlx
 pGEuwO3DwTBg+9AqpdeiWPk5D5PP7cMHoMJc8bkN4LAvQDVp8Q4+OFjMSg6sgtUBIYQAGM3HTP6
 38pYm9lLNVvCo73HNm29T+xp6vKotfBAt0Q/cBC/XP4C7C7DdlzDss2Zj6o1tEquTl+E5Odftrr
 8+oLBBH5UvxkDERY1Q6uRZWwuOQAKAXCo26ZveFyRDPd28vRyimowQVYAmq4fmZBiXbJXAQGQBU
 nbWnFJkPBR7M9dU3PQYXlKtHUMvbGfwgzYoiUxjWat1Uz45pCkQGvd79wiPasS/45S7v/OW+6ep
 0f5UxMBxrRVhZelKE+A==
X-Authority-Analysis: v=2.4 cv=fe+gCkQF c=1 sm=1 tr=0 ts=695fbe39 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=bQOl02JGu9EAoBJy2XkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: MmjEyRINoEkdr-wehlwCIgcqYu7FTrne
X-Proofpoint-GUID: MmjEyRINoEkdr-wehlwCIgcqYu7FTrne

On Thu, Jan 08, 2026 at 09:01:09AM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 08, 2026 at 08:17:09AM -0500, James Bottomley wrote:
> > > +you are expected to understand and to be able to defend everything
> > > you
> > > +submit. If you are unable to do so, maintainers may choose to reject
> > > your
> > > +series outright.
> >
> > And I thing the addition would apply to any tool used to generate a
> > patch set whether AI or not.
>
> Exactly. I saw my share of "fix checkpatch warning" slop. This is no
> different.

I'm a maintainer too and have seen this kinds of thing as well as many
variations on a theme of 'bad series'.

An analgous thing might be to ask anybody working in education how these tools
differ from all others students have used previously.

Checkpatch fixes and the like are relatively easy to identify and can only ever
be trivial changes which can be reasonably dismissed.

Whereas LLMs can generate entirely novel series that can't so easily be
dismissed, though the sudden appearance of a new person with completely new code
can be identified.

At any rate, even if you feel this is exactly the same, you surely therefore
cannot object to the suggested changes in [0] which would amount in your view
then to the same kind of dismissal you might give to a checkpatch --fix series?

The suggested change gives latitude to the maintainer to dismiss out of hand
should the pattern be obvious, or to use the nuclear weapon against slop of
asking somebody to explain the series (an LLM-generated explanation should be
fairly easy to spot in this case also...)

My motive here is the asymmetry between maintainer resource/patch influx which
is already at critical levels in at least some areas of mm. An uptick would be a
big problem right now.

Thanks, Lorenzo

[0]:https://lore.kernel.org/ksummit/611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local/

>
> --
> MST
>

Cheers, Lorenzo
