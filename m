Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E1B8BFC;
	Sat, 13 Jul 2024 01:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720833490; cv=fail; b=PygEPX51BCebUdvc/dd+uYLmlZ2MLqTG4w4fsXDHILvNFSNLW55k06QJjRc+GrimmFr0/eclSQPt2HZ9jj5TYoiGEOKf+szmNH+5Fgx+dZuM36Ydv7IIcnG/AN8YQX6ZAyhAWzl1irtuEp4JGcw65zl4LpUC3bnElYIjHnWc+0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720833490; c=relaxed/simple;
	bh=ZYBkwPtHeV7SutW1ICBX0A4F7jM9k8hpbhn1IDIerM4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iv1uqMw6i9AJXlcZZTZIxZL2LqVSlehI4wYg3lsT5kfu0i+Ix6Od2wtsZ9Pj/ENsB5+gJLIz3mPa2edk4+EJ2xF4flUtfwf8SwdWXiYZF8dFvRwGaSYXHLw6zLXOpLPsJqHKNBmVboxM7Lk1piv89FCdz/tY/J7IuytFlBPPrHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3oDzZCN; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3oDzZCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720833488; x=1752369488;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZYBkwPtHeV7SutW1ICBX0A4F7jM9k8hpbhn1IDIerM4=;
  b=a3oDzZCNQLMytO6hwOmvNfoOHY5L8j3KYglVD+7ij+coK2jAycej4uyo
   yJEg7sA26015xRL+Ow6dcvS47mXwTh/DZ0Zk9nu6RFeyQQAJbHw8jvjuz
   B75BaFptRlXHoptHL4tyLN7ugsFn+dMkYsLMKMwYzo8LL6CUQm3BSUrk1
   x5/4uFevm87XiewhtrRjLwn1GAIHwy5nNblK4GbU1fYHrFOWRdlFdporX
   5gAOw1SadEmMPRo8wsOn5+KhaM8al+HPQnogKxS+0PEd2ffhUHvbQIXkO
   uPD8u7+b48IFD47b9jM/fiuZzIwDIi73P817xaZn32UiHIcFq9OFkl9bb
   g==;
X-CSE-ConnectionGUID: CsX962NlTHWUt5ZfXyeX7A==
X-CSE-MsgGUID: 5f2RW0neQcCB2mlEbc2FZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29440669"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="29440669"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 18:18:08 -0700
X-CSE-ConnectionGUID: JdfSHnoMRhWwyD/8pevDrg==
X-CSE-MsgGUID: 4V1AVzGzTR6vYMTuwRsyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="48811129"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jul 2024 18:18:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 18:18:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 18:18:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 18:18:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 18:18:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMi4uWaCPTy1ptR3uo339HtCtU3pNb/QnMj3gAXYeXnM5pyP110efzA7D8lcbP+e8updBpiVbu0ZZOP5edFeAnDnzy8fY78AC51qq1p082CmqdKL18M93HVO09a6z80x2VTLUmll+N9MNZ52/AmrRubnHGQZZvF5iWbBfiWjhZZxPTQxmIGSWc4AO8wN28O26mAaSSGhziZsPpEI3Ns2SPGnqQtGU8nYQNLdxgerG5ca2Xjo1pQ6hmkDuOiao1byPoOh2SU6ptgNya2EylWGKV//1HA+8Q5zfw6c5wzxuAu59Xh8NgSqMWbhT9N5xXJ/Fx0G0xSTQG8nG8imuiiLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/YMaywtu5yqn4hMd6xEdOb8cPyoXBqETA6IWihvQQs=;
 b=y+8jDWitX0T6rDqvCBqE0nXgRpI4JPA/AunO4YbPAM/5NKmYd3D18ORRNYFANCcuCPD8OO1S96NGEKvybEJcewGk6SGG+V1v03UEqOk84QGai+eHsekPFLvYBOprya0dWp6QUZKAesm4cz7aXtqmwRQ63HFiV3N5gS99V/CoT6lTkKKksTQN/MjYugmcflAvncJu/Suv4QQxTWDjbqmyTrsfFH7gYpRUm+9vb9xN0nWIjLt26FZ3wKdxYWgzYG+uRW0b8wKiVw71hj/rNhytGfHYIr+Z6dbtTn00AH3j/GMh/MnskwUiqjE/wevExPXm0RB9XRIcUK5XQZpSa8VWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA1PR11MB8098.namprd11.prod.outlook.com (2603:10b6:208:44b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sat, 13 Jul
 2024 01:18:05 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7762.020; Sat, 13 Jul 2024
 01:18:04 +0000
Date: Fri, 12 Jul 2024 18:18:02 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>
CC: <corbet@lwn.net>, <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <6691d5ca30fe3_8f74d29420@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240712144903.392284-1-kuba@kernel.org>
 <669179424b589_1a77429479@dwillia2-xfh.jf.intel.com.notmuch>
 <20240712170558.50c89238@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240712170558.50c89238@kernel.org>
X-ClientProxiedBy: MW2PR16CA0010.namprd16.prod.outlook.com (2603:10b6:907::23)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA1PR11MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: f2779467-0c97-4f2b-4edc-08dca2d9a584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7oXTxL5mm91c1urL2q+hdyH4ZVk8Y4zcCTdpXkLvWxKo6xCLttc9ARKwtWac?=
 =?us-ascii?Q?eYOiE/mxuQagKMbIYYteX++GGDly4b/K1mrGwKrUWyQLPXIh1Z+LuquF9rCK?=
 =?us-ascii?Q?N5ZqzhLJSUYB7rDKyHjMbjzdRxBnZuF7TUUWNE4fbQ5KlnlFXKT1028ijF4S?=
 =?us-ascii?Q?HC6rt1DiZLkoStyYKRrs+PLsi6rnaPodMC9tyTO9XPGSg9WD8H0pKd/zeD99?=
 =?us-ascii?Q?ei7q1XcPK+tVsV23YPchH7tnsd2KunXm7Tp+z0MTPRIsWpYUJvcSoBvQGwVP?=
 =?us-ascii?Q?4DGK3X3FQj9B+UR4woMFaEhud46h/rSZrpcfLohI01Pq2ZKA5Hl0XOa8JEiJ?=
 =?us-ascii?Q?FI5+Dl2Lz1R0P1gkB4Rxx+69p3Pk1GOPAkk0HILuiXz6HaIMfWlgcoHt0s6q?=
 =?us-ascii?Q?vhEW1WtIZJFlouNWbysD3qOly/TrRcc40o6q7SuJH8Q/F3jhFKBLYG81f15N?=
 =?us-ascii?Q?yxoRqAkmBYFAcfmeoVqEbl5HjA17DVnkA8rwWuFVgpPiZH3x0UyUckPe9HXQ?=
 =?us-ascii?Q?K9a6sOkG3QUiIPeHX4sN7ZETiwPZQKMerS2YfTv417KpiSzMeiJrYON5nyG4?=
 =?us-ascii?Q?9Se7LOfeKNiI6YFRcN0FA/zaB4SUQpVZX0M6Z3uR5vN0iPZkVSYHFUHwIA8c?=
 =?us-ascii?Q?akJYoxbbS2uEXJqm9O4ofsEFabDtReCbbkJ8XdNZnch6AZUtDut/iownEvlQ?=
 =?us-ascii?Q?+5eezUBuoD4kYEbiAVJwfVXNGHPZoNwD719BjYH33YUPJ157DTkoA1D13sLm?=
 =?us-ascii?Q?knCQR7t3QIffEoWgPPirGNqw13rYcS9J+14+epX25r0mpui7Y+UFhWxPw6ZH?=
 =?us-ascii?Q?84J+y6NZIutJAqK+9B4IYhLHcfBDcyVkCAuoORa4fxtygs+oZ97VNiPkxn6t?=
 =?us-ascii?Q?RRgPO9kqGUDPkL0qp8WoecyOfpFwSSd1CJPBEXmwVYz9dzZRxRH6elHH41Hd?=
 =?us-ascii?Q?E9SUaGeMJXRI34/ZzOcRkH22cchiboOts8ZPtmC3eBr1ENWTgo2MMtUn1Mnv?=
 =?us-ascii?Q?6wnzCQ9T84tCsJOTPEveNNZqOnEuI4KZ32i5r5FFr/+PTaIOmUWFhpHlDSvf?=
 =?us-ascii?Q?3Z7nXNAg5xDifgZmayliWEv7sPDjCVLxWsNoSieRunC9IBdQq9NQLVvY6rol?=
 =?us-ascii?Q?kTN3jko8Bkw3Paj05MagpZuTfgLbk5XLOvoMKAlCH0yhWXouraEZn5XSx4vG?=
 =?us-ascii?Q?+NSr/yHNYn3chlG40gYGZFPXa9YdK54pOOoUZqX3KJEa1jX8NZYuZfg18cTu?=
 =?us-ascii?Q?KrN7qPEuEdniDShB4Ch6f5llPHC1nPBkKtIPWxMRheblvOL/sPvdvN5E4IYC?=
 =?us-ascii?Q?h5s5n8arHF6tSYP8YyZ4jM6s59RP7l0uR+m52uxMp7I4MA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vq8xPdfgLt9EOYkwiYfLMkfLtzeGJ/Ze2X0oz+6V8a/DNCmGo8nAQC+5YRDA?=
 =?us-ascii?Q?sXySjXSfjwz4t+kz3tNktk++gpSnh6JGKIZyGvSur3vMuRoVpa4jL5ECbIZk?=
 =?us-ascii?Q?gmD208fRtTBbcWInrI5IC1Ce8+tBuDFrCLVtmJqmtTF3YswiqS1bbU+fzcYv?=
 =?us-ascii?Q?Z2d/EkMkostQsriJmmlqT0+jRmiEiCE25ugQpiRtDG7IE7JHPNvYDDDHcNQ3?=
 =?us-ascii?Q?t2P0YQic8Xrxd2NyHudchGjoRunJL/rv+zctmxEFAJzNnmZT86gVin09x4D+?=
 =?us-ascii?Q?DpqnWFT/auaZtt0vHtHrCPs2QPI1kc0ZMJ01w5NMJfT/GOmqYQ488As/eTHA?=
 =?us-ascii?Q?sJOTW2mzIhSo5OuUuaR3dIZshLh1LrdwSYKQIu6dIUWKHcM3x3qvy+gStTS8?=
 =?us-ascii?Q?TCNnO5QG+jI6KG0vTvVEC1dlFiwybboizjCydVEBqj4VbTAZaNqazPKBc4tD?=
 =?us-ascii?Q?2Xehyt3BKAbJjIKlG8j1uuLaUrTcxXXObZQPhPRIK3aO8otv8W2yDEo53Wil?=
 =?us-ascii?Q?Ir0/nlugv+rotjUTJ5VB1gttiiFwB63HYNxo4gmD2BO62xtKLEccEqhd5xfb?=
 =?us-ascii?Q?GcLPrHkO/e3Ob5AoV4ae/2L5XgZJtPBjsTb7u/RcZJaC5OXepSvgdRRMVOa7?=
 =?us-ascii?Q?jHm/I5N5P6HeFwEnuRCHtkF2znpPtQV5hNMAm3UhiMgyncgtgdCZTSvJW2tT?=
 =?us-ascii?Q?6oAr+gJi9MLItPnuykh5wtl+cd5YJBdNe9aUS8dgJ7sBIw4gbHX3OWdol1el?=
 =?us-ascii?Q?qBUnc2qLU/Qk4gU8txMwdUE7QHRcZXvX38/FsBzo9t4Uy9lCMYunhh47GtFP?=
 =?us-ascii?Q?kBbDcuHebVHdelHKKxJHF0hQCsD1BRJIr3u9RnwuaL8M0JzStlU8G+0XiyK/?=
 =?us-ascii?Q?F/gQI274uIX0+/8mMF0Dqroii+dTs1ERk3WHvodZdIvISLElkHX6eKr/oDSq?=
 =?us-ascii?Q?xZVlWh2byRE3XzHpzOEluuQmZ1eS7NP1AIVWdKBbJQrABzuU87JyK+8Voe6c?=
 =?us-ascii?Q?wRe6ICgjFuOSKtuGL1BdVB/sd2npFL4eJ4BIDYRKIMu9PoTvEycFi/dJJqTf?=
 =?us-ascii?Q?wCqpg6JouSWcoy34VxeGISyld7I3QzGdp5cGqwzTVaMHYxNy4Ad/mdsjSZ+Y?=
 =?us-ascii?Q?hVveDtxfXOgF0rT4bdwFRShHtdpwKlwQswUiTE6LnoeDHqCzP0yxSpSMPttb?=
 =?us-ascii?Q?/yPWH/maik7e/qH4kjDUxwg4zEcSSxFigfCmBoqlRQkFoLnP7sEjHqgfvvjZ?=
 =?us-ascii?Q?HMTZTAW+MDISs8lA4KrzKRW/wst96FWPVxGzxG9BWkKuSfDlBbtpsiXV/IJb?=
 =?us-ascii?Q?Dr1SXTub5FQ707hpS4Lncqvt49nlM5EVCBEV8QustJFtdjyUpbk48V5kJonX?=
 =?us-ascii?Q?9S+oNjSSNcZxtj7hJMJCQ4uAnChAJITiNKABQk5oBkb/GbZxd5muIcjU4kM0?=
 =?us-ascii?Q?HjOqpMFZa2MAqhBJlrEd1kg7iZgsBpOa7NF6ar/T4dveoZM496XMstWH2cWo?=
 =?us-ascii?Q?DjsUBwVLfWioPxIvo+MMdyAK54wgulBjq8Y4TwJil16rVBOIR+hmoB6gRklq?=
 =?us-ascii?Q?l8svObaRVG2WzMSHO81M6xLt6SPWoJmiGPvIKLaBvnH6DR89jeMlwnEPtLFL?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2779467-0c97-4f2b-4edc-08dca2d9a584
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 01:18:04.9368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCWasXKeNB6fUCjXgH/keh1iuS0+Hw1Wo2nQcJpfH1ic22faPsHibIdK3hdMQbMxn/oKMjwtVyuPgokJaA0VvN6CPMX3ZANU5FiXZbxa4b4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8098
X-OriginatorOrg: intel.com

Jakub Kicinski wrote:
[..]
> > So if this goes in as is, so be it, but it feels like a missed
> > opportunity to extoll the virtues of open development. The benefits are
> > in the same vector as the "release early, release often" guidance where
> > the urge to polish a solution in private is a common trait of newcomers.
> > Lets document some tribal knowledge of how one moves past that first
> > instinct.
> 
> Hm, the disconnect may be that you think this happens with maintainers
> without upstream experience. So we can train them up to be better.
> In most cases it happens to folks with experience who are good
> maintainers. They just get 2 orders of magnitudes more patches from
> inside the company that outside. Then a contribution comes from outside,
> the maintainer is overworked, and tries to shoehorn the patch into the
> existing, internal-only process.

Oh, ok, I was failing to grok that from "Open development" note in
isolation.

If the guidance is for maintainers, I would say just put your changelog
directly into the docuementation, that reads as specific and actionable
to me.

For submitters an update to reporting-* might be also be useful to
remind them to push back on requests to go off-list, but not necessary.
