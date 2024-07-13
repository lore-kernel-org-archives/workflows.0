Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4294431;
	Sat, 13 Jul 2024 00:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720828852; cv=fail; b=q1gQL209jnTqkPAtv8D4WOfByFBtOXc3FcicHRfJqXoeykkUFNDuMdEQwwh0OYSJS13vK4QQYFR86qb+n6S4F14xu9QT8tKMPV/tp9gP2lQEvtjf6MNE3Xu0o5ARF8A0RtA0Ac9mbycreJ38NPD1Sihh6EYzQiF4RUn/+QLamf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720828852; c=relaxed/simple;
	bh=ZimKlw8WtlIwQ6muEBEA/f2ijJZX7+vOQe/ULYiwX3w=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MCgrNtiq/7wLh6ZzfAhqt/yJUQhKpxYW/ih34cUrdGiHuRrkFxOb36bt4Rmjsie8/mWn7o8+zQvT1WJIsAzsQ/ZZ2kjHX5Z4+l4vq8IAM294rG8m4r0lCnPRfBTe00wO0NCycw4Fib8NjL7JgtwzlYfVIxc5CIuyrSwRZ1UcOQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecnGkTmR; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecnGkTmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720828850; x=1752364850;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZimKlw8WtlIwQ6muEBEA/f2ijJZX7+vOQe/ULYiwX3w=;
  b=ecnGkTmRQ0shUqcqIsPqXlN3DRVPuC+0O45fqLafrIMyQIxrMZ1Jo96u
   JVqeTcqjxHdnuyh4uWYGQ1jG9ehI0rWE3R5BAmMI8/VjKyTLy9jmbRfwv
   n/EFeaSGI3ngcpX7BOqoyzoMFxd4IrtLgAonJuLpy2KsY71/cImSHpJir
   Lj0t3tyJQaHswd/EI/b23RYneiGGWWpZq8jN56IUpgpwWdj60kcodKFG0
   P9c0L3ZjegODTWpntu47EZr+PoBuh1yZECSpEEXSCiz/epDJlmu9snTtS
   Cg1HHbFqdA7Frd4KCznPEXig+ZLhf7MxRhJ/sVmugPlkkL2sDNADIz13v
   Q==;
X-CSE-ConnectionGUID: iCiZIs0dT/KoMGM2yT5a/Q==
X-CSE-MsgGUID: XyXTOd5uS3SR+k1807PVbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18133925"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="18133925"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 17:00:50 -0700
X-CSE-ConnectionGUID: /2GBNcUFRpKL0rhhotWFIg==
X-CSE-MsgGUID: ouGcOCgfS+OIh9RDoTwwoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="49718389"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jul 2024 17:00:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 17:00:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 17:00:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 17:00:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUQ0dx5DWIm865LoCUFVHdQr1djRkvUz9ktT05+aeyRShk1+4qozDfXGA//LjulgpiyfgvhSKmwX9IzkUwsqDOOl72xOQ3I67l59nONaExtVF9SL48XwPa01G+WT1th9XZBGNTMP8l5GUkgn7nx3grsbB4DqKJWG+E8NeQDD5sa2NxIMAiOKkur/pOw7qCfjzYBMSTXi55Cm2zlJcY2RGUTD86FamtwmT2+UP3sxatEDFLSegOpSqNBykmZrmmqP7YP68uMMsglEyll+NgzVgxERHod63CDYMNiq7LJS3uRZugMrTm49pDYowyfoGB9yMJByINUgzpdo6ijdrSrjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jF3Jch7NhQeeOlQhXupe1Qx/vJpQXv58hpic30Q1guw=;
 b=JIma/fPT7DkOWXPRCcF9RwwUH20Lp0dKvIOdD56S2vpWwRobFjBYVXRk4bky5XIo3v+RSBVCDuE2FzgEWQJ8sPDMvEj4q5bl9svIhKjFldxOWBXp8fVsxmCsylz6KvklA8Uzdb/HNJUmTmMOeeV9MU5EuZAlXM6UTgcxC541P5/rIE85MOKPkeJhHoajn9Esap28S63PcLDKZit1iNcK1Kvuk/ps/yvtdgxgpFTQFcEmVm6lmWCRXcF6Rgr2r0pKJnGsYJc1yYeDLSEje0gmuzv9pOMtHFjMTIhi+VGuRH3Xiv6UFeu6a153+Ez+mIhC70FQqdvBwnII7p3aZUfQOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Sat, 13 Jul
 2024 00:00:47 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7762.020; Sat, 13 Jul 2024
 00:00:47 +0000
Date: Fri, 12 Jul 2024 17:00:44 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>,
	<corbet@lwn.net>, <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <6691c3aca15f4_8e85329470@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240712144903.392284-1-kuba@kernel.org>
 <7570937c-ead6-40bc-b17f-4ade34a2acf6@sirena.org.uk>
 <1a30aea2-e8e4-487d-81e4-dda5c1e8665e@linuxfoundation.org>
 <20240712201156.1413e80e@foz.lan>
 <20240712164504.76b15e31@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240712164504.76b15e31@kernel.org>
X-ClientProxiedBy: MW4PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:303:16d::31) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA2PR11MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b0418f-a823-4d6c-96d3-08dca2ced924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3xomW8KHGVID0iltyVXobGvAUe9ROD/o2ppqHNrmhsdEVFxvwcNehnZwEHF3?=
 =?us-ascii?Q?AuHx0vO0+wcqigI1Sk3XEGT/9OVYE+DxzMLyV7WS6YGzFoGAGGSkJgmkUBy+?=
 =?us-ascii?Q?vX+gX2HwJTqW8GrxiwjJuBXFyY3rOyS3chd7hmRgfym8gnJu7GnpKXxVu7iu?=
 =?us-ascii?Q?FHxlqKDAo5/qWBeFu/AWFTQyssRPF9rhsI5t8+RdFgQ7oou09F8+QeLYBK2w?=
 =?us-ascii?Q?6RQE81sbmqe8nQV21PN0rC4fxlN9pGpqSP8Bre5V3f8JCc4zVVWoRqXUeSy0?=
 =?us-ascii?Q?GUl4UeoYp2gQKcDNy377F04I6G4Mvj2JMASGXYVwvU5RGC+iyCAEg/V1jCVx?=
 =?us-ascii?Q?pqxeYpIdtPd3LZ6df4BcdCr4WsLjfmFlBrkniQ0bwpjymKvZfRVa8oxG61X4?=
 =?us-ascii?Q?W+PQMs/pk7IrYr09g9I0YSeW+TgdCRIBsS4mj8BpqE1sUcoF6J/nzcnrQC0V?=
 =?us-ascii?Q?7EaVOYQDwkMwXM7r/pWzXX9+teUdyxlK160TEdzTuFd+aeq/qaa7x4nhZ2v7?=
 =?us-ascii?Q?xw3xoo9BvrRfVr1aEyzIp5M+gSngeOiE+eCXJgc4jCnTcUx6Renu3OUWBT6R?=
 =?us-ascii?Q?xoq5EJG0ZadFdCsVBOuTWlXxuW5KtTUfYAaGJXDMcZ9y8bMv9gNmlklMF6Ws?=
 =?us-ascii?Q?/mhjBRjn9SnAbebslyhtHdo4HsRlNRg40J6v0zZUxZZWSmFpnvSqovs6bTSH?=
 =?us-ascii?Q?cH6TgfrshJ6mY/6Qmq5mj6VE78TqwWm3DNdgIW0DNEUrBlYEgOLVNONKvPZ3?=
 =?us-ascii?Q?ixzjKjeYCEhGMFMPp1n6NrKF6kzcHSBUgPXx990kHS56GajK3Grdp8S15glY?=
 =?us-ascii?Q?/5EA3n3ZeXAbrr3Spu73+/MuTiDi8kR8KGFI46lll3JI9mIF5Qk5mqKZhjOg?=
 =?us-ascii?Q?htwE8vw93ayUgifg12oz+vFb5nkiVFUCNqjKimqXGNJSbFs5yJupuGA7EKNk?=
 =?us-ascii?Q?wI8fqMXf6xRwntw5aJSvHdnQm57DpBWookm5p3carrtENVT1tLzDQcByelLS?=
 =?us-ascii?Q?x2VcPRi58X2ydrTabCH1gdF/4K4zlZLtJiHvel5QOs1TLQxdbkP76Kq0WfeY?=
 =?us-ascii?Q?/kDmtMSK/naajgf9US1szNw9wQYeVTv6PzCwrxzwjXsW463bVgJoRAdK7WRc?=
 =?us-ascii?Q?uvGdFzxeZr9EO4O21gaKY2wL4BE7Bd+X79QvkdL/iH/jL3dnHQCynhfBf7sW?=
 =?us-ascii?Q?LxdilUw9CQ/eYVYYpg53pvIey/AshitiIW8WQkrIqC515gGI93N+5Imx4gN+?=
 =?us-ascii?Q?UwyaHVunCjRe07wFcLScqWywjkmJwF8jt0HYFPz7cMEC7j9TtnxQ4q7Nfv4S?=
 =?us-ascii?Q?QC1IAyPORBEoFe2jBmmKsuojhLkY20ZYFAP+UveI5So3+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uXoS6IYBsBSaefN1CJzgpvbOJbAKDpmKrClJPjt85OKXzK5Y71QRT7gWphfU?=
 =?us-ascii?Q?A67aEvTKE+qxZhb3i32BDlvXYaea7OhECiZljjoxwFn7x0YQfhMioR/VEppX?=
 =?us-ascii?Q?NXq419kyModALwxD+yzFADiNB9eSW0NSyoGJD7Pm1vRP2sLISxMKqKS7wCUP?=
 =?us-ascii?Q?wPNwu0eLnrNuF2MNLIVJLVjvHV5GZlISdU2Wrba8g+K0jF+8nCe/kTlWfWWa?=
 =?us-ascii?Q?VnpbzqrA/EXAroq1URwvA0/czwiTMipIkhlFHQwKFZxIB7abOVtZX6sOxQW+?=
 =?us-ascii?Q?4Euf4g9SAWcr062Mbq8smWp+FY3v8SnLaq9e2ULN69b9my0tPDXA2nlL6E+I?=
 =?us-ascii?Q?h033ieg39s6wHNkuDsDPIAheyNnRRcz/W8yKaiAdoKCxYRvcWAmN9ciJ9tSf?=
 =?us-ascii?Q?JeAH2pwb70iQRGaVP60Qm8hA3/HVL5DwlB37o0Ba2i/QcibiCX++0Ya4xEpG?=
 =?us-ascii?Q?PNuPFtves5NoZpeg+EuTcozF7b+EeAXMr1nFJtHXPpHEastsgChVHJ5iXszd?=
 =?us-ascii?Q?dWxUPNkdzw1yc6gjmKb1sibGkEgksgIsrgy8fMXnQsn7yINODa714IuPgbej?=
 =?us-ascii?Q?vg3odLCxZDGyVyGyHCoBOtr6p/wHSE4+M6fzYAYfNAI9kiKlxa8IouTakJfR?=
 =?us-ascii?Q?vts6Wg3LWaOHsg9JksAz7YcwloHq3fsSAalBdgVrrVZCUdmV+Bb35ZtINs+Y?=
 =?us-ascii?Q?cH5SHsujAPwgHwTFdz5L3Neqt8bIQy2Zgu3kPlxeZ+9xP7rA+racELWlW8PV?=
 =?us-ascii?Q?uR8xAu/hCtKugmZupBN8O6qhcVIG4/wHE+bPNk3N9UF8uq30E5IKBhRNg4et?=
 =?us-ascii?Q?1n+vARQwpL0RvUEFKWE1jsNd3PDcrhdgIZ4V5pediZjYsYWaXpeofLYUMDGQ?=
 =?us-ascii?Q?QgcjEdtYvjDn6z1n4C/GwOggHQViogAD56yWc41fa2pYJPaYJEMjiDJ4qa6Z?=
 =?us-ascii?Q?Xh0ySv4nXP5d7tFc02BhuCyvFl9esUG9fVggm3JCpCNUwCJIO9IPAFXDdn1O?=
 =?us-ascii?Q?Blp3LzGRqQR57pOwkhS8nPXco6FStBeCTKFlz7tQ2O7yQc/lJaHTXHa4VWRz?=
 =?us-ascii?Q?JM/JWsx86aZ5YOEluovwTaPY8Lrr9ADXlYfry0HqbIKrq0E6SJIJBatm501O?=
 =?us-ascii?Q?LO/iK7qRcbPne3Ypsax5mf7f2d0kDi2wP3umKAatUd7mfFx/t2BYZ5T5SWqX?=
 =?us-ascii?Q?f3Ou7C9E+yfeoqtoBPB4LXmPJxuFgRX6/bxmBk3jCUnISiPzM8F105OQYDOd?=
 =?us-ascii?Q?APMk6y+79AUok84mfkcfKquR1yWlGjUdr/amNJ7/qDMpT/lefgnntnHYx2/Q?=
 =?us-ascii?Q?hvziFqAUl3WzOpVsHltZhxAqrf3J9byJ2aJ8VZEFWC+r1acHTENg/A9Lgdt8?=
 =?us-ascii?Q?43hiXK+MjAe4cUf5fEWF7R/UEIo6ktcyvBzuaeKAo/U8pc+18FaQfXe2Myo7?=
 =?us-ascii?Q?x+H/i8cROSHymaCG1kjA97p6LN6FCP4N4PPKj7ciR4fnT7Um0fkCSFrGi4uf?=
 =?us-ascii?Q?0DNrGNAjGxAAeTrNHHla0bQ+u/YA8RiersNtQik704cXSF0axwYfzcpIJnHI?=
 =?us-ascii?Q?AluzEsaaDqnKT20RPEBiztA8IGOiLT16GjrXFL99yeipo31rQ2mPz/UlNd2h?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b0418f-a823-4d6c-96d3-08dca2ced924
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 00:00:47.0897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AT5/YMh0Gq+cqjV0Stcd4Ie+5uBwmndF9vKc7YJis4S6KBe+XmpygRF6vsbCrQyluQ5Si7S0elVHO8nS7x/xNMo+M01Dxp4GxgJr2VRTIYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
X-OriginatorOrg: intel.com

Jakub Kicinski wrote:
[..]
> Would it help if we speak of "open forums" instead of mailing list?
> I think LPC including "hallway track" fall squarely under "conducted 
> in a manner typical for the larger subsystem." Here's slightly edited 
> version:
> 
>   Open development
>   ----------------
> 
>   Discussions about user reported issues, and development of new code
>   should be conducted in a manner typical for the larger subsystem.
>   It is common for development within a single company to be conducted
>   behind closed doors. However, development and discussions initiated
>   by community members must not be redirected from public to closed forums
>   or to private email conversations. Reasonable exceptions to this guidance
>   include discussions about security related issues.
> 
> > The only issues I see with such talks is that the work when
> > co-authored should be properly marked as such and that 
> > reviewews/acks taken behind doors don't have the same meaning
> > as an upstream review, as they may be due to some internal 
> > formalities.
> > 
> > IMO, the best would instead to give a positive message. E. g.
> > something like:
> > 
> > 	Maintainers must encourage discussions and reviews to happen
> > 	at public mailing lists, avoiding whenever possible to have
> > 	internal discussions.
> 
> That's not the message, tho. If someone emails a company privately 
> that's fine. If company has internal processes for its development -
> also fine (as explicitly called out). I'm trying to set the baseline,
> not describe the ideal world.
> 
> I am specifically calling out that if someone submits a patch, or
> reports a regression the correct response is to review it on the list.
> Like a normal person.
> Not reply privately that "it's on the company roadmap, just wait" :|
> Or reply with a patch company has "forgotten to upstream"..
> 
> Maybe it's a cultural thing, but to me this is where the relentless
> positivity is counter-productive. I don't want to encourage people
> to be angles. I want them not to do the shitty thing.
> 

To be honest I am lost trying to understand who the audience is and what
the actionable takeaway is from the guidance. It sounds like you are
trying to educate drive-by submitters to push back against requests to
take issues off the list. I think that's a reasonable education
campaign, but doesn't that kind of "submitter bill-of-rights" note
belong in Documentation/admin-guide/reporting-{issues,regressions}.rst
as explicit "how to work your issue upstream" guidance?
