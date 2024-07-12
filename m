Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1962E636;
	Fri, 12 Jul 2024 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720809805; cv=fail; b=ict0jm5FYGzb1flYzc5/QlNg4bj6dwjhotp2YHF6G+3Ty7wgSCM3UPAmV12TTsGlRhhls9AEJ/rKolRdmZHVxeCYlo+yj3H63QmYSszWNe7Sf4tCn0bxLdnunVWgTsrMBTRHgcd3/GERqY9+C6BlzXYKgvSGq+Tu2kEjFI1QaK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720809805; c=relaxed/simple;
	bh=jdqV/qTMEzkbmpqtYUVqiUUNB6Bw2mxgzLBvi7z4P5Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uzpxf2zYlY8qkl5CIdWiB0aKZsy291mo0i6z3geJCTZR21d4Ovu0+Dygz+1iRXFfhyp1u3pAG38qNGtp9v9HTpaWRZpPKJxRjg5DjwczFsvg1F2nuQJj6i6UguhjCs2mMDRwje3vDaeq7WWn9nRzup2NxbqC6tNjUqPGiO2RxZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShXyGgpJ; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShXyGgpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720809803; x=1752345803;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jdqV/qTMEzkbmpqtYUVqiUUNB6Bw2mxgzLBvi7z4P5Y=;
  b=ShXyGgpJstnhBiowxXUqnB6z1s2dbz+DCEfwP6YZqzCn4w29hsNltC54
   moeRTX1GeSWWXYzHOpGnd0b3ZELePEpk/Nf78HFUTeu7abWxHWCIzjVxJ
   k6U5ZCnB2sf8053RYusKEJEJ5aiCDS7sGjeyRm/VV0NAAphG7A/Y9ZvWm
   D+ZicjwdZerkgzv/UDfER/usc/mz6C7QeAF38tf4ugiYm6i2UBxf9DA4r
   WVRD67Zlv+7GjyqqTDpoikUeVhGt8NdSMlk1fCeOfTgkbJuqL0GRS4VvN
   9nYtF3cSY+VoIGtMy32hGV4iuLHFE7NSFaQs0z4Y69QBL13qpagBroYZh
   g==;
X-CSE-ConnectionGUID: Hm29ju6WQSWXZLRhnXUjeA==
X-CSE-MsgGUID: eUv61w8PQQuBg685StyGaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22025630"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="22025630"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 11:43:23 -0700
X-CSE-ConnectionGUID: 9rs2GBGQTz+CDu5zHZzbRQ==
X-CSE-MsgGUID: CFeXRWHUR7CCr97Djk6FWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="49078707"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jul 2024 11:43:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 11:43:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 11:43:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 11:43:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 11:43:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5ttD+e4U2a9PP1DTaMzQG9tUAEyJrQfs5nwQlICyEdBdS8HCjiuoGU7TFanptaffFmNONaGw3fqbEusS+MSjaMlh4LYKOWiI8DYqE7r29L6RWL759Ykb+hMY2AGANYcZWGkvBEffDtx0/EhNdeHKt3tq5TmKz0Utd89X8ivTAVpBDBiqbxR3IWPf24OIeiwzlYBA2GelpZJVy69bNg1EWkeP4PueNKCIMqPDptwfiO5KjH/ufjxzmOVI/m+EG7IP4IhZf2fm5221nKeiX3AWDBiu4LBCpfb6efYVbQktk5uwmGWIl+RqX1qPwQIzlVliHDFl8TrPOambr418BitWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSqsrUCOu1TwS8m7DkJZQ/gD2AYq81x8LJWgFdSXDhU=;
 b=BiUTyXb7gqi7wNQlMu80jmMhfjUydgtmZc8VfRqOQy0uMRBdNONmZscazjncBmLWmtlALi4a12zYMsjqI//qBjskdggxsaQ+MRZdWGg4grSvdsrRxmXIzf1qxs4f3HghSqySE0ATY4vKWdaM7/GVvTwyyrx92fO+ZhZzecXMCX2m0jUiJOIgnBLRNXgotnUoSSjv6pxwyboYsi2GEFV6doh/lJlVtYeeOx9TBiEsPUW9UgDH/tyGAoXVkvnoa1cda2bMFiftV0k5KSf+YcWX+kfotnvH0foGrYIplPSmj70Cp5KtGkaVGkF9DvASxdKWmaDeVhH2gElhO28DWdV34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Fri, 12 Jul
 2024 18:43:17 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 18:43:16 +0000
Date: Fri, 12 Jul 2024 11:43:14 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, <corbet@lwn.net>
CC: Jakub Kicinski <kuba@kernel.org>, <workflows@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <669179424b589_1a77429479@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240712144903.392284-1-kuba@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240712144903.392284-1-kuba@kernel.org>
X-ClientProxiedBy: MW4PR03CA0328.namprd03.prod.outlook.com
 (2603:10b6:303:dd::33) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|LV2PR11MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 391a17a6-44e9-4287-c351-08dca2a27e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IRleHXsSnAjLQwAA1Jor/PLzi/vbEn+fhFIYQER0FVsHlfW6hBX1KO3Hgvrk?=
 =?us-ascii?Q?F3Ph0BUBFbOWr3+Pu28MKIH08NOPJUk8GbOoTlq89WVHyIn29+LgDKlY0nv4?=
 =?us-ascii?Q?xL5vIK9DzQCAdGjDzPpe5kRqIHkkGAUipUoz2efUSpVJgpkmN5TiPgaEH2C8?=
 =?us-ascii?Q?D53xZHa53fNu+X0ExfVdvpgNu7IR6Qfl+yqrgMjlDI2JfGLplSPJn1U1OAS8?=
 =?us-ascii?Q?9fRtD2FtxgyKDA6ezx2yaVsTw4vPfIq6hNIz0oZ9qvK4l70hhp8HtiG58MBQ?=
 =?us-ascii?Q?qx0gmJx+4ICvWrYGAZhWghOdKELCZmiB/5UMO3MyW4EOnutogvdRdRlfh8zM?=
 =?us-ascii?Q?IT3pUnMqTWBZJL0G48hdnm68SfXoehHvagTURZMmURMa7eWgEmn5dRWI09YI?=
 =?us-ascii?Q?c6V9RoqNWGotqzy5yczVmgwoHALpjChcv/+hNBLiV/XiR7SWiSElMwuY3pah?=
 =?us-ascii?Q?imEEt/xVYn9j7owJRuxTMzTNQSGwxxnhjX+vOtrdcA+Nlw1VX5aaQFFQnDNv?=
 =?us-ascii?Q?wYVzWaVm359t2WcxE+N82o19mkRR1SWeFnjQDFSulEiXCN08XmEcpB5N03ig?=
 =?us-ascii?Q?S557OE+KntDYeaZMYvDbnP3btFVA/9fT/W2yeJXSD/1ciqu+RgXJj1NHkfmy?=
 =?us-ascii?Q?dL6t/LijqwoCJJtsQnYcqypFNXnQaM5lXeEqq0pancOq7+5s9wz9UBaL02fj?=
 =?us-ascii?Q?2nwv2K51C52Uwq7F0q6GCd9Tm8biNVoG0L/khE46+zKbhN+uZw7VmwRCvi7f?=
 =?us-ascii?Q?9hf58UjsCrTjbkSCjONWdkMV9FAxBufmullzocV/tvNJ+hyX3eECobHSeFzE?=
 =?us-ascii?Q?0xtYL1rUUUTNQBTpQ+WSiZahiruuXXB2UpgpRN8m6mzm2TfzVbuVMFdMvotp?=
 =?us-ascii?Q?+emNPfUn62dhytM+CwN61DU0ecn3ABdNShq+fIRXzXD8ohvSiojOTE8KQTGt?=
 =?us-ascii?Q?DUr/Ak7zNObgSA5ATGOIu1fuSyVQzvUy8bxa/BoTqnyGGefFQbecZ4oUM5QA?=
 =?us-ascii?Q?B9y/SDCUW+hG6sWwvd3fKufC4bZ7UGvp4Yz5o+XtpmR92KGEy8hLZoyZ1gqS?=
 =?us-ascii?Q?hm+biotuFKIyG//XVH9MJyKYi2G84PAzpGJ1qy4E51RJ2IWgSmyTdoM7yt6Y?=
 =?us-ascii?Q?iARvVsiJoUbUCXnO3cIkLnBldimIEiF5Gd3cnuXZweXKHeFnW4eW7gw9imA/?=
 =?us-ascii?Q?HFPeeLU/Af+50cnGaULruJeHEin4G/9lRJo6m+v/k4UX7iDJOIb8qXdMI+7z?=
 =?us-ascii?Q?1HmkhMiXu+24IR54U22X+oXvwmnlQf1MzyWoBpp1j3pmxb88dDU5UGx4p5vA?=
 =?us-ascii?Q?suF+1p8uvgSqHjmBy631l+G+knKU/IZltlu2Ko4iUPE3Gw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b/WcwAwQ1N9ioU5abV/xUnDEWgG0D2l6rlFj7SRys9owP6p0HQ2KRihBU0Pv?=
 =?us-ascii?Q?r2fUtnqiGVZpWZZXs5ip+xf4AS6GuHCR4FTCIGKj1ANbatfMcbvt3J6iyfRB?=
 =?us-ascii?Q?LruGzg154KTw05QkvKH3yW/F8heFELUvpkLJo/SjyiWCGwbwJO8JDOkdQWtf?=
 =?us-ascii?Q?c3qRwZfFRooHlKJykNrGTt7jf/GDwUiRrjuATzWRNAMUqws2MoZbq2EGgSCx?=
 =?us-ascii?Q?U4pVIJ3i+XjLjpzGp1537dZ9iB3CMhIrso4sQFc9Txfeft5q9D/tO5iJRUlJ?=
 =?us-ascii?Q?lVoIM5FqIHH5fnfwarjEleEXoG9c4Wx3hAM5Xa6Ydw5gNTrTgYdYV1fhmVfC?=
 =?us-ascii?Q?Sh6sk/xlBIVSWJujXu5nQSlUXwyb72+vmcLC+5wC5PzDY5obdNTuszqLmu0W?=
 =?us-ascii?Q?dlISbGL6KYpx70LEoAOASJLekSGEeHqWian8pNCr1Qi1mXPTGjEGqDxGuEZH?=
 =?us-ascii?Q?HShkzXy0cC3Q+yp3H2DDgh0/fJsSm/H9r2YDZGLWcMpkJjZGw5goaoq2uSWC?=
 =?us-ascii?Q?WKKfoe5iz2MpgkmpH2+BsCugDV91vUEWN6qjv+P2pg35cIhGDbriiQT4V8sx?=
 =?us-ascii?Q?AdzTBrMRSO2jO7RXnpDPIxemZ7Mm01ajco+/T6XyINNRfREqEGwJKaPjklT8?=
 =?us-ascii?Q?jNPpJ5fJ6NSCosz5xFZIPPqDYYK+3/sSv34IzVk+SLCukBuye8zlkw0I1aYq?=
 =?us-ascii?Q?YLJBKCF7rpevJEB6hqPJ/mrV2QCa3S9xZzacy0NiMkJ0orBCQUAIcpvEF/zM?=
 =?us-ascii?Q?BVMVCDmu90IHmMR4/5XsFzOURAJLThVUrO5KiKcCtAMd2fsKB69CEM/wPca9?=
 =?us-ascii?Q?m2fGtNFzsuaiPVe1ytEhTrLlwc96wbzYOblZnqDB3xymoOzkffgNcJStUUqU?=
 =?us-ascii?Q?4iLjlKRbLfC86P2NnwRL9Pd5fJOUJoizeaR1il4+MQnwe6p5gu11cOsg/EHP?=
 =?us-ascii?Q?aFZRCPEUUVCSfiBlL5I3cd2prgl4K5XLWVCBbf4YJ8jwHrs0XGVZnBtOHN44?=
 =?us-ascii?Q?H7auEfJoWjp/Brfvt5TlZZXzSpUgzssSUVe+7wJbhXoITySIzDazUBzD0WFh?=
 =?us-ascii?Q?oD+UqumAfqw46yfSos8F+NgsjsKTt5Jl4WtaSbBuOHsVV210CKOugIHs1UOf?=
 =?us-ascii?Q?L7ZXwVrQHWytTj40MOZ38/9/fLNAz4D2b9tHtoZf9Vo1IXXUSw5yVhe+BbmZ?=
 =?us-ascii?Q?6X50WAAubcAKLWxcVnZzSVnBe2oyNq9Xd8iwfPLb1ymU7rTG2Fxu1haYDWbO?=
 =?us-ascii?Q?5lccYXlCgvyzarQFiHG7F6jn50k6OYAq1wa1uQLhGAHf/MUGTcOwx5ltQxzD?=
 =?us-ascii?Q?JftcThUKhH2364yruHtwYt77NMqFVIaXsvfDTX5p0pl4YwfYUQh47DzgB3Xb?=
 =?us-ascii?Q?uyMwVeKA3KkB7Xt0xMmiFJHCqdJkeqlqG+FMsBnx4pceBlWeEoOE8ivnGpyP?=
 =?us-ascii?Q?IiF7PYmY6FgmDo1qWhqtKww9Il20k8T+ElH+4pJO6Fps1YHSVLtKUhtTBTbo?=
 =?us-ascii?Q?8Y2RjBQ/dUT2SEFct9tTonFyDs1zmPIU0Ww8c46iKekGDY7iwkpPOt/eyyuC?=
 =?us-ascii?Q?2TPAs/jEmCxJ7rXp68odrNd8ld7sGgm9XlqMz0S5rK4J4a/5HURjCf+WDOxL?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 391a17a6-44e9-4287-c351-08dca2a27e2b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 18:43:16.6963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UACQicx4fNdbiYm1HI5yRxz3rosRSUZPTCsJyVBVeJiCjv6OTQ3ytHK5rNaxpcRGudiBkf9Ber9nQ/b4bBhnsH3Pz/R9wl5OhVSX+aqwk88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
X-OriginatorOrg: intel.com

Jakub Kicinski wrote:
> Multiple vendors seem to prefer taking discussions off list, and
> ask contributors to work with them privately rather than just send
> patches to the list. I'd imagine this is because it's hard to fit in
> time for random developers popping up with features to review into
> packed schedule. From what I've seen "work in private" usually means
> someone on the company side will be assigned to handle the interaction,
> possibly months later. In worst case, the person scheduled to help
> the contributor takes over and writes the code themselves.
> This is not how the community is supposed to work.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>  .../maintainer/feature-and-driver-maintainers.rst     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/maintainer/feature-and-driver-maintainers.rst b/Documentation/maintainer/feature-and-driver-maintainers.rst
> index f04cc183e1de..ac7798280201 100644
> --- a/Documentation/maintainer/feature-and-driver-maintainers.rst
> +++ b/Documentation/maintainer/feature-and-driver-maintainers.rst
> @@ -83,6 +83,17 @@ bugs as well, if the report is of reasonable quality or indicates a
>  problem that might be severe -- especially if they have *Supported*
>  status of the codebase in the MAINTAINERS file.
>  
> +Open development
> +----------------
> +
> +Discussions about user reported issues, and development of new code
> +should be conducted in a manner typical for the larger subsystem.
> +It is common for development within a single company to be conducted
> +behind closed doors. However, maintainers must not redirect discussions
> +and development related to the upstream code from the upstream mailing lists
> +to closed forums or private conversations. Reasonable exceptions to this
> +guidance include discussions about security related issues.
> +

This reads as a vague ambiguous quasi-threat with no actionable way to
enforce it. In contrast, successful maintainers already have a sense of
the benefits of pushing discussions to the list as much as possible.

For new and growing maintainers, which I assume are the audience for
this guidance, that are unaware of the pitfalls of taking conversations
off-list, they likely need help understanding the *benefits* of open
development.

So if this goes in as is, so be it, but it feels like a missed
opportunity to extoll the virtues of open development. The benefits are
in the same vector as the "release early, release often" guidance where
the urge to polish a solution in private is a common trait of newcomers.
Lets document some tribal knowledge of how one moves past that first
instinct.
