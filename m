Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4353ED10E;
	Thu,  8 Jan 2026 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867326; cv=fail; b=h8BRp4bMkptJqIMHlP/2OjqVVPtliEuz1nfHs0r5YCinyDuqUawdm+ctXxQwsDygaOjpMb8PixheFKzO2NrAZgkwKl21T4HJx3+YVd2PNwPWufdRYnUBrSmf1z0QlH0H0mpDeF88lItclscXCf5kKLZbwnfy5RNfASITlDhsjMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867326; c=relaxed/simple;
	bh=9y6aF2NouioVh7hCUD+OckgMqmGQfXne0usKjdocsCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L7qCqV+YFrocpl+9Sqz49IPkpL7oE9f6BDJDh9ksYoiIDCgsIqFmLPGQoGbegeQ9Ry5hHVTX6KRj+BAMvnTp505SNAImlrMHSS8VfILNpPsyPP8dfHhSuBjpiaFJJGtbRoGihrU7StXrMp0lANjezBtgFtBjtCgprdqSNkhQNCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JNMOl5aq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0CNs04R7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JNMOl5aq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0CNs04R7"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6089F2rd3966105;
	Thu, 8 Jan 2026 10:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9y6aF2NouioVh7hCUD
	+OckgMqmGQfXne0usKjdocsCY=; b=JNMOl5aqNxHVURPJqV/W8gT4UGIO03w65y
	3B0BTPkwAUvbnEGZ6hHGnwK65yBUTLckMBYBZ7gsl6+Nb+PL2n3Xh1ki80d9sA3Q
	lj+m0tWFkQipmCCFIm6xRAdKm5QkiLs5raDQD8U3SPqtQbPh3X7WluphdDedNYAw
	t9KW5gmgBCc8wWzIVNF22nSvNMq8p9JxN+7fbA1dFiXLa1nqcwy6ExYAJWIVcKtL
	9vQF0RtODH7n9OsjGwX4XuW2ulGccIXGzpP1K141AcsHjaa5MDYVGWNbcA2wJnSL
	MMsOXGgxx//ew25aa+AiVrvck1fo/FJpF8wRWhQ5jJQnxumZ2Fag==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bj9sk0254-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 10:14:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6088unJX020476;
	Thu, 8 Jan 2026 10:14:58 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011033.outbound.protection.outlook.com [40.93.194.33])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjmxewn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 10:14:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4TYgHG0dTy+VzDUI0fgUuSUut9vcrsOOjhKZM5jbw2Ebeo0jZK/FdCle6V1a2siRNDika/MT8hN405cnkYKlINYnu1zrDPTfjx28rEmdQXrg6+QslJrh2HgbekbbLaG0D3I51KQ7MUaOx8VgakE4MhscJ+HcgtJsZrdlA2FoBiTVVw9PpcZ6+tYoyM4Sgj0YDO9zo/aRWq4TyzZBSYlIjm+mxZrCs1CAFVIiGFhzW5elk33kf8edMygw7SXQZosLKVSxzVagzocrb6RO829RhTsO6SXsm7DtAxJOyramF6B/hulHLs2IDzWy6fYgZXxIU/QD7YHs9tjGl60qftlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y6aF2NouioVh7hCUD+OckgMqmGQfXne0usKjdocsCY=;
 b=vZySqW8//MJdz5zWhOU3WPDCT3Tu1+uZqlzEP3VQKJ2AzTLiGYstQOe2wTjnD+WDgqKlrqaXLNbV0eO5I+4kmQwKOnhuf3ekU3dlXU8BbEzo2SUKdd2sgHXi2Dr9t6vdIHLNomlTPtuPLCSuEjUsUs1XHIlufr88W8pEnkzaWOWzLX6W8FzNWv9VbrIxVa7yErUNejgESCx7y4jN0qJPR1fGh0vf5upsMr7tCRHdIm9KOCnkpookuxCVWtw2j4BE3R2CLXybbhNHpLqiwYZ7z3C4oYmNUHsykK1UFo/LJanYyrv519PIcpOJface/ru/dJ/OfgX7KJTtRoqX99I5Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y6aF2NouioVh7hCUD+OckgMqmGQfXne0usKjdocsCY=;
 b=0CNs04R7c7Q+yGxM8FLtve8BjcBFjNew9Vcp2aDysQW9VvGVc1YCItO33Kz5BuUPKoEK6u9Ehduk0cVWoyUwYvnVjrTLTkuHsMawore3HWqVlxPtoT+GW+k3h5b3esAmzRQEfQCQ8j4luv5rkKynQm4oqf6waEON5clYMXvNkF8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA4PR10MB8303.namprd10.prod.outlook.com (2603:10b6:208:567::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 10:14:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 10:14:56 +0000
Date: Thu, 8 Jan 2026 10:14:57 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dave Hansen <dave.hansen@intel.com>
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
Message-ID: <b76a8b47-b226-420c-be23-b187ff272783@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
X-ClientProxiedBy: LO6P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA4PR10MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 1088ff2f-69fb-4724-bd61-08de4e9ec581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L1CaQneq++/6jOEsYW5RtnRoEaHIps//mUNeL/u9qVDb6uRyKgXjsYaED9Lr?=
 =?us-ascii?Q?aLKh/TMtuRSbQfWGJBfW6P5aAjbka3S5mxt9rly9dAcLqjadiJjK/2npVRga?=
 =?us-ascii?Q?R/QhRqT9CeDaCJMm8WAli4gkgmwFSsr0Es4bYn5s0N6Hg9n4ecXrKjADcaWf?=
 =?us-ascii?Q?UwlfL51nILniQc25bpo0q9EgE1ft7h4+NpZTTQP4bt3KXVy2ycRnkhpree9g?=
 =?us-ascii?Q?7OYUOEfpIovdOiGiOifEsjYrXtf1FpjQexw0ttLYVvXPteGEzZwLJ7yRw01O?=
 =?us-ascii?Q?fgP5BgKZL41UftyBhHggHe8OblIjQhbNS9jUyRpqcpjOT42b9LrOIWdSU3UT?=
 =?us-ascii?Q?usT/4aw8sSDBJxTNDxAjRj2Hlu3TQPuxri1ohLYgi/OuPSrntfxRRv+qLBhq?=
 =?us-ascii?Q?yfYZJaSQB+PNssPxM2FdtO/I/0UxI8ShZF91I+lS/SV4xVJjp7ktjB5MKGRF?=
 =?us-ascii?Q?L49zE5HOFTnFtABPk1/jcmVntTIQ9SlJZore6IFk0HnM8wsxC7nOSQ4Fsxja?=
 =?us-ascii?Q?HXuLbVBuYLzvd3+TpRaTwG4H9FuW0JwSeyt9r4PyVzih59EymGNBMFczj2yK?=
 =?us-ascii?Q?G4nchO6fnnldHsa4Y8E2DhCxaxjGRKgzY3nMwfnMoyPIsgskekDYhBrWpzy2?=
 =?us-ascii?Q?WvV7wbSyVeZOZN8YZBzitMkxo7KkWYq+HShVix0xEnwx4KLQacrUIuMrjYcF?=
 =?us-ascii?Q?00ngnX9Y83UY042rI4NUPKXyEyc1C5ZFHUXdj/FpwGMSafWPu1bKGkcKTbHf?=
 =?us-ascii?Q?1pQx4qtw9ocI8LRBAnz1tNb/3Zihs1nKOR1KnlfUVV8mWPke+etriyyVkGUU?=
 =?us-ascii?Q?DHKwFfEWT5qVCwvOb07haNzW6/1T967wmapxZluTY6SlWo/FDIjpMocG73/z?=
 =?us-ascii?Q?+7QW1hvPjRGa0zgCOrbTtS/yUwNEFjboGi9Iw5xUCyjXkwym88kcbZfn/q35?=
 =?us-ascii?Q?1oovhtA/ub+sy4lTlEoy7qUbfYUVhOmaRwy9iG701vgEpDxhH1Rr5vMu5u+O?=
 =?us-ascii?Q?4eA6Zl5rWmtEuK9tCVqVpYdBrBDmGgd1Tv6KGegXkj8RzJ7aZK0UWQZVRVa3?=
 =?us-ascii?Q?cvbfegBDyevAzd3UyHDnBp2oGmXnRTrjKbeRDsOjMS5fiJnFL7YT93t4PU+P?=
 =?us-ascii?Q?9aQ4H+gjBJgaXTPALeCBDQ1cjC0SVacPgQjvGjwqZRmQI0alCiQjNUl/clIP?=
 =?us-ascii?Q?p7hAcFvpL3q8+QImrL6gte3zfyis+LSfudOKhSZhZLd7vlVlqlLZGTg5OaM8?=
 =?us-ascii?Q?JI0ZtqgU9wEyKgzEcR6WwXIIZwab/1URfMIK4pmIR8sWZglY8MvUghbhOHcW?=
 =?us-ascii?Q?8wAOfRXdpWJaNn/tiMR58MCGo7ONqSd6h4NveXqlHD7CEXxd55x1DUsldTxN?=
 =?us-ascii?Q?24mJj3PBlTcHjqgCGSwHmSmsvIdKb1n1JNUTmSeRemYaGeBzSM2ZW2Rl5p3U?=
 =?us-ascii?Q?9eUvvOAfSX+C0rYfWvYBw124Te4uOG9C?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V1lXuydNzxkInpcN4R1Kic25Rh6M8y4FcTYdQmdP0duMs8HNsVKho0dSfOzj?=
 =?us-ascii?Q?thcpePBZbEw0odK2eGy6IF8XaHBbn01byTVUtReHwX+f1aT264Afz8qbmQts?=
 =?us-ascii?Q?h4Dc/YbhA8Xla00ImZSzxJ7lckcwvcsPyGXg+bPYVLhDe76XAHCTt9CgAfKN?=
 =?us-ascii?Q?8GVMVH8BfgHaknYdIElQ4ySlxV0Zc4SpZ3zRQdd2BYpyFQdy/qOFyhlBSEZ0?=
 =?us-ascii?Q?ACEWhbkh962yXvWpUPXjqdwUotM25CBjL1tzpjqHrDLppXW4GJJak54Lryal?=
 =?us-ascii?Q?b1ybiEHWzIRz50vUqR1n4MlY8eqFlrXOgbPlXHE71fs6LWND99+DhSB6D8sQ?=
 =?us-ascii?Q?+soEs/YZCxYuM8sBnFxkYTwgBZFESap3KlXKaiZsNnGGvnHIrpMjVZexKyow?=
 =?us-ascii?Q?KIZ/ZSYApStrfs189ecyFsMsvuwHZtQtUKFfaK/YTiEl0h/NJwP7V6XkasJm?=
 =?us-ascii?Q?R3VROr3wvPvoZNjQRZpd+xx/LPdR5+96a/q0vYtHkDSg0OoRp3U1yVgJR5Xx?=
 =?us-ascii?Q?NG1tp8CZQ1BeOK8taoFBOJ4BLBCw+hY4vW0F+o/O6/bBPpx0/U1pYCIeFekT?=
 =?us-ascii?Q?ITbmYCjRhVUNi6nhACY8dObr7JBCiu85CvIgKkU3bo357K6nAoXG0W+l4zE7?=
 =?us-ascii?Q?+6VVYMaHW+AE3P/6T3eeaJTLGBCLuSFXJvlLVL3xBzSJsPiJGHh/GohhFwbl?=
 =?us-ascii?Q?wsiGv8V+ZrVpHJz+76F7cwzlAegeqa27sNyIHbzFsqr7uS6XQ6MNxp6cDcWo?=
 =?us-ascii?Q?QCV4c0dtNryOuNvIwfL+8e7t+dcIjtC1ru62CmvABplgq7xNqtvxDJ6nxE9z?=
 =?us-ascii?Q?mB1Lzlxamp49JaZ9iqzTLmdagFAmjZokNyr+I0ygpCfWf0vZbLZl0wIDwYxW?=
 =?us-ascii?Q?QmGYf+kFbvjtwFEs3YsTeB5e3xUwgpkxUgRhMoIzblMXqPYxckILaXDMJfPB?=
 =?us-ascii?Q?/3s7iCcGRdDEEmCqHlYPFB0pldRdaIbo3pw/dwyWl71ILgRXqdjY55tFdUcW?=
 =?us-ascii?Q?bOQ49/PfqG+iPh0CnjEPJTCOEe0vqbAauHn5c1htkJOUxKT2ABQPt25vmkfm?=
 =?us-ascii?Q?5Rh2hPjwbwN6oVO+WdmJytUICpNBa2cXk1o4Vipivt/yWs3dVxtuDLU3ajet?=
 =?us-ascii?Q?cAG8Y4AJ/oAOQ8lQBeZJI4iaGem1WJpPlzZGtxFJ2b3WviskILS80PCrX+Iz?=
 =?us-ascii?Q?HYlJQcQ9vWc/FLSFnc3WpySjFHO8F5+ML2Esso1MFVpMqnIiJ8Hfdx9+1Jjo?=
 =?us-ascii?Q?j5lNdF4ndkWNZxA/sONFgeJfn4rmR8WVZ207VCoNLatcVJ8OFkiWGe4ZnqoE?=
 =?us-ascii?Q?6thsDKS/mwJcHZtN8Nyng0j7mW8jVLiUpv19p7ffuTR/bygLXdb02mkFlSUW?=
 =?us-ascii?Q?V5CBN2zO8XPYZg/rjYW8ifbovkIgFkAGJxAuMY6Ut8hInpqAY404gvk1YM3Y?=
 =?us-ascii?Q?NIGXr0yWJ/Ojf+N1CMekPrr6sl+WwkeEYWHgJ1gkiQxNL/uM/iO/i++JwkDJ?=
 =?us-ascii?Q?c2qV4NqYA1u+kLd3U1Gz2eW8UoiYJpbBGhtDPZj7ESH9EPvBq8piZNXiaeSl?=
 =?us-ascii?Q?/DRGGCJCSFQvYG9cD6BkgzmfQMCwGdEGGbPWbfLR7SguwxS5am3nmnX9Ppon?=
 =?us-ascii?Q?+Gmv7/qwNg6SlJyPwO3dRw8pflzm8K3lsaHPaahZxttASbtaNNNk6yHyNaKS?=
 =?us-ascii?Q?Zw0C5so9+pR26NwTyXtuzulumwZRTSynDfgeUWlrMkumTZBINKia6bhcN0HC?=
 =?us-ascii?Q?goUqR32mF4ljSHIeQ86/kf7YKiUNMJQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4b72oqWJxKJbY1Zm6eZVQpYHb8AmZgfsOuXr5g4Tq59zGh5qSWMYM856/RzbjK9TBSjvENOzP2pJcThXgXTAeOXy/DP7oAS34W+g2zdq0qfFe514QVUqcGbBKU7G653NcS6yxIWHmQ2a8vjpvir4uTdK0ic/ZEtF+SRoFz1JB79OoRqTLBFnRtmm9kT4pjszVaIcv/YxvWqR6K+UfSiCJvRKUaWc8RLw2svKrUa86GXfQvOmiVLWDYcNqibLtAjajR0iMiyiIN/ZYCthDC1dKbVPngUYClTmodvZr+t7dKSjLZLVMs/2iK6i3hcpkhu9hiTuEPjNAHjHzjtyT34aHi6VLJr2R5K2vwSpMQQpq9qlvKRpQYrKgU4RYM+Jf3BC27YLqTRZycv0UPo14EhO1DX3wKSPAAiPyWeDes3IWpQFIfzO9Tv9yGRukufd/P5h5rqcLQivyOEUyEobjUmyUZV4Gyk4/Y5BdxzYOuiSk9NcaSYJ+T1qrddTUGOMqDAq+UQtSDJMIESvqEWSzoAZqORmvCnnW8JIocoltjQuqqyn3GC3tovXZbskTi9byvH6x8W/K74vNdhLEMT0UnE8H9Zt53tFaOexQzeBm0A27fs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1088ff2f-69fb-4724-bd61-08de4e9ec581
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:14:55.9498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blD1lfA/65MiJKLRnBDGaaYGulZHeJtHbix3RC/hNgvg1K1e8BFGNQKbM3DD86hAfH3uElNNJkYBJTb089+8YVUgSIcVx+skZ/zHyRvt1BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8303
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=915 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601080068
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2OCBTYWx0ZWRfXxDjpFJLvt1p8
 /FFJ9+TPeweT2gszs8tkWTz/QvN9PLwVcQStduZGGj7uB1GUUvSqamLzCnXzUuBNOI9Xv/Ni5bd
 +LUZ3imKbMUFcOSFt2sO9NKB+YmbwUYqTvCxgnYkwwHnGqjyyIF2Wzq1t3cCePnDFhMOvNRGxZ3
 zBrWF+FXoNGt/UoMcX7bp2WuGY6c3m9EfqwD00kNOFFuebuB+i3m4x6fWi+u5Akb9w/UNTClCMp
 /IgP4xEGj4wotBOUXdhsaM78vaRMYdb+1sozswjNgXRSoKz9vYB5z8i1EwYHutLV26rh3c+jpbr
 Mn2ZIuybFTgPg/jjLU+3rblz+9AkRhkRLPYRa83V8/63WWQSKPf9Sf9UyBAqye30bia8Z45nJDO
 Z3Uf7AQ/M9/tauhv24je2z4z766G3c5k2FMuiJWmhno/3MahTZQFfP3I33bvrx1WbO8DzGmnpFc
 SB1HLXym1RiwHq8meeKSIOVKUjdLIEOGAXfE2EQ8=
X-Authority-Analysis: v=2.4 cv=K4Yv3iWI c=1 sm=1 tr=0 ts=695f83a3 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=LS-rROnCapzSFGr1iQUA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12109
X-Proofpoint-GUID: XbvscQ4rX-tPGxdOOkA0rZm44UJQXCOg
X-Proofpoint-ORIG-GUID: XbvscQ4rX-tPGxdOOkA0rZm44UJQXCOg

On Wed, Jan 07, 2026 at 04:20:04PM -0800, Dave Hansen wrote:
> On 1/7/26 13:15, Lorenzo Stoakes wrote:
> > Thinking LLMs are 'just another tool' is to say effectively that the kernel
> > is immune from this. Which seems to me a silly position.
>
> I had a good chat with Lorenzo on IRC. I had it in my head that he
> wanted a really different document than the one I posted. After talking,
> it sounds like he had some much more modest changes in mind. I caught
> him at the end of his day, but I think he's planning to send out a small
> diff on top of what I posted so I can get a better idea of what he wants
> to see tweaked.

Ack thanks Dave, FWIW if that'd be useful I can do that just to really clarify
what I mean here rather than hand wave.

Will take a look at doing that a little later.

Cheers, Lorenzo
