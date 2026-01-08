Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AE7389467;
	Thu,  8 Jan 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866618; cv=fail; b=M+evJGclFTR47ZjyWb9N+AADrXRDSbW5PTCjZagonj/qEMH/+r6IsAYuG7aBTSVrf/mYWnV3v+C+O9cGCb4/ej3YAB9c26N9h+3r9Hj5Q03VOlv89PeBb2GWhfXuyJyZKVop+a3Z03Lxb0tfQmpAv3B0+RiuAO14Cti2hAwsGpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866618; c=relaxed/simple;
	bh=uhHuVPTVY3BIKZ+AzSimrzr0S65JBe5lONDL8HDi5bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tx/LJ2DOEHHKMARZ1O31Q7GCmey5S3s+X9qYHw7AuwGUVu41QJyfXClg6k5io/bhQUw1TtDXd4uqJZ53RLnpX6RxVQpaVvythucGTXhhJQQw4MQ99CjwXLQiYmbtVnNOxywCFVqH4DRKec4ZS/z61U3CBVEUcAONfosvXhDNAaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lhxm45A/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xtUuAZoq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lhxm45A/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xtUuAZoq"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088uRCl4151987;
	Thu, 8 Jan 2026 10:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Fk5rpcpjG0F0PePTOx
	zYF3LvyjRbvu1BLpoBPicYicQ=; b=Lhxm45A/Q4gVxbaZR6zA8BqFbI4yqx+YbS
	vU/DmpfNuGCJ8lY//aXIpjO5r5wegSMZTJb6a6XuDTtBgMqeI90UTuksoWHmuOYK
	pcBd0vJLNCDVUXXVELkUovCo6a+fj5egBPEecOjiLDgI7Exm4lgpwtNjHMTlX6qh
	UTCVZtFixD2xTbyCzKvf5X0O/lk2cJQ8RNori7GfAb/vKaI5Dp/Akkp5+LxNjUgt
	cKAU4nAvehHgTuObpDeUbnvB72z9pXV1XGM6mZebx8TIT+DXdRleU2rVYcOkt1qf
	pl3BbXlifLyI3d1ikPQIj1XXj2pvqUmXWn/OqC3nWwcst9GDqICw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bj9gw82n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 10:03:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6089P4N4002949;
	Thu, 8 Jan 2026 10:03:16 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjanef8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 10:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhlMxoMLHCimb+IKcJ+LUaPrsOgm6D2ickoOhwjaekN7rOCJyNxMmLIXNX7zD0n0rkQ/mHcrZ8/MUOZKb3bOpl2koxYX9PJPyThlMhpcWyiN0pzOUFj2sDvVhZhq61nC1omtFB3GcqHqqGCW/aC1hHZE/VMIpnO9XZ/djqNCeqGWO3j/CHaV18nY0oUBkikuP++zoUTz2Gk3jk3junq9dBfTi9N2uj3K5uUMVELNZNzYk2108YSH7kAsBKoE50RYGGzLKrkNvvvxsqL7Zos969lxJa9P3CMKQSFQ2GajOlJ8/PH4Gyx2sbsYArPk+Z427zgbYAdaCjo20ezcdTsfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk5rpcpjG0F0PePTOxzYF3LvyjRbvu1BLpoBPicYicQ=;
 b=MCYMs9WbGYwj4zDlbjddg5HZzG1fWy/uVoHQgv/Ci+3c5y6UEjGcwB8rkIVWz+1L9bzeTShXDXMScmf/69BRk1vjMiqZ/zITALIFLIynxptZgL2vkv6JRrlNJN7JVvyj9l8YNQTUCLv1qqzgKLyDDFrdxKUJTWZlSjtdzabQHJ5B5jIdh+zV93+pepPdP42cemZAix9TYyn5rkDoifsBqFSdI9uGrqBZvZjO7k+9V0i+FzTvMZWA1ltdnAn1Is67/DaPdvOLYigBjvwIxa+iX/3pz7FJijMg6wPG0bf4Q/AueIbCkK3F7ZzTSRrO+NEExNpYZYmgorVlvuvvgQPfxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk5rpcpjG0F0PePTOxzYF3LvyjRbvu1BLpoBPicYicQ=;
 b=xtUuAZoqbRRxf2A6IprKrF57m5RXSRSqMsnPPhE8uvxQ4XNVxveiZfxQAg12Tyxx6DqomO4GaZQex7CRLZuipyAwPkKqLQQumMysmXTMMDmCKhRMt7/qeFz1TmRESvIwjW4fa6kTEB4iNWD0c56Zqn6Sd7XqsLue2VY14wdkpuQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH3PPF272D9E96C.namprd10.prod.outlook.com (2603:10b6:518:1::790) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 10:03:12 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 10:03:12 +0000
Date: Thu, 8 Jan 2026 10:03:15 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
        Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
        workflows@vger.kernel.org, ksummit@lists.linux.dev,
        Chris Mason <clm@meta.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <99b046ce-3f91-4fb8-bd15-9045cc35f7e9@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <CAHk-=wg0sdh_OF8zgFD-f6o9yFRK=tDOXhB1JAxfs11W9bX--Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg0sdh_OF8zgFD-f6o9yFRK=tDOXhB1JAxfs11W9bX--Q@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0265.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH3PPF272D9E96C:EE_
X-MS-Office365-Filtering-Correlation-Id: 770ab1d7-6551-4615-ed7d-08de4e9d223b
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Wam3Py6B035/cI+xdvwc+8TozIMEYxzDBspTf7N/Tq2vFQgSAAvUaWaHkCZv?=
 =?us-ascii?Q?vpU6yQZmPx1IoGp8Cws2jxjEX6MVhM3hoF9ywE3i4UCBIqYJ7pmLGxD9k2er?=
 =?us-ascii?Q?Ioin77HXnOggpaoVba0zpLpZHkHeh4saMQOciEWe0gC2t83SKQmc3lt2GTQf?=
 =?us-ascii?Q?bRIDItmToHkXgWUqqZMxUfo7dHKctJwmf6o/gIVfczJ5LcV+yXzgGr24kBKb?=
 =?us-ascii?Q?ENqK0XDsqNkXGX+LWRul3uciSexqVAPSsG1mMZIVICKkdIbnCfZ9jEmLO4Qy?=
 =?us-ascii?Q?RTuMwLsKjDrdTUI5y9EEVvgSesGiSiqfYjUD9hcxctvZcdzjl4fOpB8o9AAd?=
 =?us-ascii?Q?zngTcDCfplSPToIbE95fEsucX2Cxgm92w/zCbfmhRdy1KoCHMJxZ6K3LGTyW?=
 =?us-ascii?Q?x9osRYlGHlHf175h0UWmpzB6CdoMvvwpN/fmt20SbTKmkvm5qzgoSDOTbwQI?=
 =?us-ascii?Q?4eefr/DUHkbmmhu14grOkVHRIGI3LsJ4tbQW9kbEwREouYX33suCTCI76565?=
 =?us-ascii?Q?ISRP/oY9EFJYSe4excM8823F+qkByYMEbSw3F6Bspi5w5awW7dfiDA4Edkub?=
 =?us-ascii?Q?PM2RO8pCLCmOMnjYM2vCQNWd6axXapfIJUOA+Gco1s+g+98hQk/Uf4ANEHzo?=
 =?us-ascii?Q?X2zA2B/7+NZtGZziLvjm5eSeDr3HVJwVxNdUFE5adS1dhuIvqv2sbEq68pQn?=
 =?us-ascii?Q?SdErYNcgRY+wrfKLni5vEJ7COi4E8kt3khdOon6MzqucuHWsGYoABDH6A01p?=
 =?us-ascii?Q?Me8YnHOncy0YGPKdGL3SqpBIvGnDZ8ZmahavEu/RRGRiLTYMA1OS1e6DCeJI?=
 =?us-ascii?Q?FicaDlexjo85umRxYTc05PMv3F6Y3vEG9Qe0Cqvy0yDgKUyqisNZy0Qwukwd?=
 =?us-ascii?Q?QfCDVtHu2DYs8dbTYMaf+CIrtO03FJBT/avNX10hNlz+/Zfs8eMF10Y0Mxxz?=
 =?us-ascii?Q?9HrLljkp2VO9c9A4ZE9pzTab9KRAF5nm/xY4odMmKLkWVDvvoApJPygS1unE?=
 =?us-ascii?Q?uAUEFljCzEn3Axd9ODoxAVCksffmwr4AbWI6Ypilzy2uy0mq4SWUNArVKtOh?=
 =?us-ascii?Q?/O7/wt/+pgxfa06pSXX2d1pg5AavOMHGZhKQ5znGlBBejIt82uJ1GZ8rYa2U?=
 =?us-ascii?Q?43QxXOzhEzMVP0Mrik0mFsPwaYFKlyKRMwAE+19hWfQRahDWhKKsyKFSR/u4?=
 =?us-ascii?Q?3wv9Sz5zv2mevwta9UvrjAi0NgwJmUvtlE7Th5L752dCZYEStnQA4KnGyIQW?=
 =?us-ascii?Q?v4U9X2hUPHCWvvx+a/x8KkkQTDZH4loezAbmw6uILj2PY96VpS+aSqVrylEF?=
 =?us-ascii?Q?a6cnCnJRr7yEk7ru7cHfhNggT8Rpjd+R6FcTuZKp8v58nlhhH+vrT7KFjOkW?=
 =?us-ascii?Q?f8V/HQzKgEXf9jx92UihJ7QU5VwCLpR7VQmP3sDbkpom9kBA77pJMYdguQr6?=
 =?us-ascii?Q?IJWxxxjKgQkCNwHuPocesvlWr2vKMif9?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?dbxMJb7hvmWDhSGbq3y8Bpht6ORUi9xU9r5r2P80GuWLT+rs6EppUvIyr30g?=
 =?us-ascii?Q?242WscWA1OK8i+1VM2fhkX/iRr+rM87hq/uw9E6AYnpOIVGCilTqKZS833jv?=
 =?us-ascii?Q?cgxaBKdFu4vswFkbAOP1ZZjz02hJB0Cve2kcyRbakWGXkuJYcYYRA5i5Dt0x?=
 =?us-ascii?Q?De4Y3dFftHR01WJT0u9pxUq3BryTq52rl4G1qKCdtbyc1axyh0wWc3xM0UOC?=
 =?us-ascii?Q?oycvYl1E/udcP7leU18BuFUfl+NKyQQlz4pfoIqjHHsaL7E93wv/gskp+pbP?=
 =?us-ascii?Q?cHtSbGYFPCoSCp5b7bfX9MLVQ0OElnIIVTkhnBLtvBLF07Ox2wMnn+/5qCNX?=
 =?us-ascii?Q?+wBCs4okfHYZIEwnmM9jUlrti8e/wKH+g0BI8pW/tRBlgxnHMMTCNdcmFNf5?=
 =?us-ascii?Q?hvb1W/wY4bl2tDhW4sMX08nX84LSVIPuAHjt0K6KiCqc1jzhodjOYeYnpVPf?=
 =?us-ascii?Q?KghlzRVNDdeWOC2DxZq7h+dI2u8czayzax7zfcCuYZaOIDjNEsuqHkhJlGxP?=
 =?us-ascii?Q?JmHQXmR9v7AP641VbICknIAK/UBw9UWq2RnBHudyHQJ1nHqR+QcQfVJnqMEt?=
 =?us-ascii?Q?QZDB6hCiQ+eKf2zq/lCSmNQQmskFr0vDbjCtpMVBJb0ht8YOvhwLYacKlWR4?=
 =?us-ascii?Q?Gu3ur9gMxW5RRmdmfdUWD1oqHQF0JfgbxR5lckUYEy83KzPf7I1KEYzDFN3A?=
 =?us-ascii?Q?V+PyfOPDNoSJ8Gu54q/dK88amMzXfzqn6t6DGH3RuAZyf+Cx80dZllgE+Unr?=
 =?us-ascii?Q?2fxlaElYvZCMkjdulFdOLxREUiR5VrdAAjkaruo7o1BoyiNd4IKSwnXMuP3g?=
 =?us-ascii?Q?lAiAehdcAPdBKTQRPpfJ2eomnzmSeDVDbgtYZqr6Z74GZ1hLIvfoWROp+A0Z?=
 =?us-ascii?Q?tKyt5e/AF7MJZrcUE2pbBxawoVDab4LfCg3ePcDU4uv2f9KeismCkEHcaGrU?=
 =?us-ascii?Q?XD6fB62bfA+x6E/E4DwjCKuRPRgGKkVNM6JtKNKz9sM30AXdG29NNNkSb+os?=
 =?us-ascii?Q?wev1vxiOy7nkgQhnCpBj2y3cX8KTjvDX3oWXnjuqcqu/z+cKMWwK0U9sARDJ?=
 =?us-ascii?Q?rQ4DoXnpZ7M7L352CsRoyxtgGvmFQM/E/n3DtODe6EkVjiVm4SZu0KN7bI1R?=
 =?us-ascii?Q?w8k15sLaltjLrjnQDJqNfFaBs+lyJgYnA+Ct8suNM80qpljsgjYBqtUTQoif?=
 =?us-ascii?Q?LM6jmmKa42l3qI3ojg0w5THgLasds0Gh/uLifYM9q/w6fnt6BEfwqw0a/V2z?=
 =?us-ascii?Q?USzMpo8me9zjS97rDH+CXXQJE+f7xQBmsOiH/KHFd0eoHXpZIeTnk6D27Nmp?=
 =?us-ascii?Q?Y5DC76ysKZmCNd4jtmdbmORk8mCpVnxvY9yuGR6gQ+/UACg91O272SdrQcl2?=
 =?us-ascii?Q?EXJzD/7aYU1wCMbSmF8X/GGO1Rh8qqCLdPGSp97lqY54Z1kh7WuvCsI3Jk3s?=
 =?us-ascii?Q?SNVMyPr6qJlzB75TuDKu5S2j4Ql20xPkW1kTVuUg+Uiaj6gSZXzTp46TwBeW?=
 =?us-ascii?Q?y1RSbpUAs9/nmBCHxWD6/iiTTFKt7ItFQPr9TQQNutoos9b9t6Z8nxiGrbIs?=
 =?us-ascii?Q?rNJnyhBs8FamDTaOTO4/afWLX9LB0c5PO9ZNnuInMTivifMuGmR5fnfVMXHF?=
 =?us-ascii?Q?FxQN3zIz7SvTCrwdKC184wMkDWqxI3y++P9T4EAyFhFVwgEFgWEEeoKWcrk/?=
 =?us-ascii?Q?6WOb41FyUkiCI90Iso/gR7sb2LGuZYKIgp/39KM1QzoQb1gudy+jBCPwbIft?=
 =?us-ascii?Q?+5b+6wG0q6EWrg4dquwoH7V+p4EDmnM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pZ8RBkSJPeJuCtNcMJRxV5I7+JFG0cUIS5GYAdpnpiKQ5RgXo83of+T5O5EnK9G0aljc/5pwOKZAcSpktuX+hMThE7QjLNy8855G1mZvIXMfsgKgt4o6lOsykfs9r9c4pKP0BeQwqjTIAnWaMBVNIPJjybUkxs48ADsdEFHhm4yrIH+SNibVQ1gVkofdGrMo/USbk2V6VuFfWFDhqZ2uLww1O3iwYvuYPNaScaQI9UzTmZW4o9eSkZD495D1y7Si8NFswcPDoHhR9uKfxHhbvdZevUA0/PIfwfKfBsETV4xpQtKIMMOZ6TqwfQN0lwgtp7fRJUua97HP4Ex+vpZrbqNzr9Ol9hJ84QBf9r85cxfxDcPy2mLj8guuErfjqjjFipao4E5hSZFvzsRnWTi4xfuTvAeTWpwKKbwY1SLGwfzrydIYSBvFUvWqskmDMLTe7u3uIp3TRB7cdVQlIzmf0TKHBGYe1XLzkOiZiwKTB4Z515jj2WVpeTWRUoH+sHPzVqHlCeEi5C3X2ir4s+WqSfv3QLjOGLztykV2wXcXwjTazXLNINuV+M6QRWaWEDG1vwzzQxdK/KrlfD1/snTqV5GjCSMKiFZaom/L+PnudH4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770ab1d7-6551-4615-ed7d-08de4e9d223b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:03:12.5516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YG0P3qYryUaMHdsJpVyt0xB/5DYCDUl9QXeqZWetf90YUf78yqaUjbvYcdghlv6rt1ObyCBVthAivSNQl6o7QE3MrvOSiljPF9eWQzpBfY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF272D9E96C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080066
X-Authority-Analysis: v=2.4 cv=EanFgfmC c=1 sm=1 tr=0 ts=695f80e4 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=jsdMNyyYr-zk4AcKym8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: vcbHwSdD0BpVdC97FnHfHvDL2rCCk_zQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2NyBTYWx0ZWRfX/xVM1ByWdu+D
 UstkMnclM8L1mFs7NbyJ6jvUyQQG7TDf4QmfbodsQ+W37xwYy9OVCa3sg2yOgd6oxqUuVZZYqnn
 ASTw9OvRPbteaTaNhje8YZUxElwfbU4kCVA+ktzt2M7rdBfx/uPZTFUzKWOARglqbKUjWyY+RpB
 mDBVEYCyryP9NQ/yhdIHw+WDpEokByzvcSqpCGBHpb/I8D//KRBZokGVI0pn2JqoAvhciyy9b46
 xvL+hGE3KOMRSaUcxBULu1IhykKf//brA2OS5YzmGYAOdiuC6i7zljhGLnvaWCs8bFeeZ79gEp2
 rwhjGDNNyiIhWY5UXHSUw6WtQGb0E9YGqkWsQM51mrDVEERgVx/RpMLjYMLxj0d6NZlwQu69Mev
 7IPB2GrPUB/MR/q4nLPj3OhjUZ/HfgBAbBCkYZcRPzHIbv8yHpqcZEGtAsPhSLfURI/mt7x5Ibg
 EbUfzW+eAUavVDpJIdQ==
X-Proofpoint-GUID: vcbHwSdD0BpVdC97FnHfHvDL2rCCk_zQ

+cc Chris as I mention him :)

On Wed, Jan 07, 2026 at 04:06:35PM -0800, Linus Torvalds wrote:
> On Wed, 7 Jan 2026 at 13:20, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> >
> > Thinking LLMs are 'just another tool' is to say effectively that the kernel
> > is immune from this. Which seems to me a silly position.
>
> No. Your position is the silly one.
>
> There is *zero* point in talking about AI slop. That's just plain stupid.
>
> Why? Because the AI slop people aren't going to document their patches
> as such. That's such an obvious truism that I don't understand why
> anybody even brings up AI slop.

The point is:

a. For the tech press to not gleefully report that the kernel just accepts AI
   patches now since hey it's just another tool.

b. To be able to refer back to the document when rejecting series.

As to point a., as I said before in other threads, I remain concerned that
the second the tech press say 'the kernel accepts AI patches now' we'll see
an influx.

It's sad we have to think about that, but it's a fact of life.

>
> So stop this idiocy.
>
> The documentation is for good actors, and pretending anything else is
> pointless posturing.

I mean with respect, if the document is saying in effect 'hey everything's
the same relax', what's the point of the document again?

>
> As I said in private elsewhere, I do *not* want any kernel development
> documentation to be some AI statement. We have enough people on both
> sides of the "sky is falling" and "it's going to revolutionize
> software engineering", I don't want some kernel development docs to
> take either stance.

To be clear I am actually quite optimistic about AI tooling in some areas,
most notably review (Chris Mason is doing some great work on this for
instance! :)

My suggestions are _not_ taking either position.

They are just there to address points a and b above, while otherwise
retaining the same exact position as the document currently does.

(I actually feel the rest of the document is good, as I said in v1 review,
Dave + of course the other reviewers did a good job.)

>
> It's why I strongly want this to be that "just a tool" statement.
>
> And the AI slop issue is *NOT* going to be solved with documentation,
> and anybody who thinks it is either just naive, or wants to "make a
> statement".

I mean, not sure I said we'd be solving AI slop here :) if we could solve
it with a document that'd be great, but I'm not that naive/hopeful
obviously.

Dave asked me to send an incremental patch to the documentation to be
entirely clear as to what change I'm suggesting, I am happy to do that
FWIW.

Perhaps that'll make my suggestion a little clearer.

>
> Neither of which is a good reason for documentation.
>
>              Linus

Thanks, Lorenzo
