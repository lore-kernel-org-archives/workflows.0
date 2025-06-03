Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7686F18DB26
	for <workflows@vger.kernel.org>; Tue,  3 Jun 2025 04:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748925700; cv=fail; b=l6usNNDcakUGjqsbmwJIzAc8g95zatbs/tG4unXyADMdmyU1u3YgaZ89PLy0vursfhOI6hYAyjn5WjMSTN1J1rxVoZNRIs0gRXF7NqeFAMEk9kgyz6ftWI3cSiDfIos4kknSDAJLG03rsH3SwqLp0IQLe6kfgfhCP/We8DBmPtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748925700; c=relaxed/simple;
	bh=Oe5kfWdvEdkvaBILH50p8HOgfKyo0Vxqr3sjFvGmhjU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gqKkvRlQ21qi53GmaZR5lXCwFPaFl80vZQpY8jvHt9tz2nqgxt8Uf1kPzr+FZGRXxvvgergCivne0Wvwt+c5tkX59cRXP5bbnqZbbx8iYopGwxdaDu/uaSUf0fVMKi34uZ4F6R+q7XJP3YPkhkZCnO11UDQHMa6mZIMntloKRpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtRE9tZ6; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtRE9tZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748925698; x=1780461698;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Oe5kfWdvEdkvaBILH50p8HOgfKyo0Vxqr3sjFvGmhjU=;
  b=RtRE9tZ6O6CgpIDRR+x4QxB90ErhvAzhh0+baN7Xd/ZPArdNa1gott0p
   LiWBwVvNX+V6MWrZ3xcHKUjg1eRILFG2HtrNOYPBHLbVuGteN0GNl94rA
   BrtO7Rl8s7gatLkQRsCge8OVdkaQp/slYqq2ZUYRX/aPR4UOKJVAi6Z3Q
   b23fTTQ6t9S966cFCZmU4HPlg2jW4ZXSbhNCQWEF+lLUw3tm6ySW36Qb8
   3o1D38AinpDz//UEEU/Op2c+juWrMylgFX3dczzBsHZqPSLIjc4jelaVy
   X3H/HSAnOsVRVjXT1khkFgiaF74jTcRPuTQycGsZARSPcUTW+4EhlcKzF
   Q==;
X-CSE-ConnectionGUID: 8NzW6+ajSuag4nFi/NhLXQ==
X-CSE-MsgGUID: 8Jw1NVg3Q4O9ohx873v+Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51051592"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="51051592"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 21:41:37 -0700
X-CSE-ConnectionGUID: rJPZwai5Tu69JGpiizl5qA==
X-CSE-MsgGUID: cNwF/jk4QP2iCZqQkUzJzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="167919824"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 21:41:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 21:41:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 21:41:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.57)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 21:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cgm+0gYyxiNuO5AaYtMCPAcf/Kno2fTAQ/LTPLCPTHM36iITogH5fq+fXKpSTUQXaXxv89LlAsvXRGi0aY15/rcKvJTKWsfqTuPAQ3kuk2v0baA2yurpZIEqtpZGRU7X2oxR7MasgYPtDhyEJL5s90nr0f1jHlpN8yYHhRaXzNCUK1fFzv4qtQGKDlfrbx9n2BNibYYDxxgIFb9dja7vEWq87GNOeHYXUEvEUWwNTyfT4dd4jdN7WiKowGcXRlg22ATDGkyxKSoDOXbs3lfDnaP+56iqAZk+oLwYbeYy/GToa243+rCnJIH10TbwT09kO1AMz8L6oSYiQJQDQwqidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADryWpaF9s5GG7a5JgXElcg+XfcngaCI3q8+DgSp8m4=;
 b=Iav+D/PjeebA/sJK4xunW9vCrWmwphnzs6+FZZOp75HYDYxaKN03Y3nVUOCHKI3OU9R+nVBMyWeEQzkxSCPUrQvQIVAZVqLKiwvinoiErETZ+vSo0ixWnwhWMH/rpc/1xIsjkegyhnw0EgxyOrtwABQVjwv8fVLi/1HmOj1xWds04L5dgF9uueKQg/qRTsxXqDNgzQic4DuScpD+6GUWlZBOIZlSBGVUQwNaOXHXt32zB86MgIymwl6MkH+uN2Tbwi44OhQSKMdDVsAHZdyX1phEO6RhQTcd9j0/8vV5rtFeMEn62bCJpL5mUqzZGRDEVLVrGiXZn8Dzlzmv+ffyIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB8749.namprd11.prod.outlook.com (2603:10b6:610:1c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 04:41:35 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8769.031; Tue, 3 Jun 2025
 04:41:35 +0000
Date: Mon, 2 Jun 2025 21:41:33 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Kees Cook <kees@kernel.org>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>
CC: <workflows@vger.kernel.org>
Subject: Re: Fcc with "git send-email"
Message-ID: <683e7cfd3b2bd_3e701003d@dwillia2-xfh.jf.intel.com.notmuch>
References: <202505301222.55018E78@keescook>
 <20250603003627.4beb1ae5@foz.lan>
 <202506021606.A2CFEECE2@keescook>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202506021606.A2CFEECE2@keescook>
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: 72dcf932-5fcb-4f24-d2cd-08dda258eb83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QdxxaANzuNKlXFUG9YVyw2C1geCbwlPRNXFzSvzTRoZQuU74EqRee9Jo7OoI?=
 =?us-ascii?Q?tGZFkqg7Ex49CY15/oMFLN8gdqYRTDkAC4lf2OApFzSYVQVTdf5WOurx4AnH?=
 =?us-ascii?Q?dzeHfPzc/jVAf2CHxV7cQ6Gt8Cgugc/Gzga0v3xc9djj5VV5HaWz3nCDnfOq?=
 =?us-ascii?Q?i72j3kLivY2YDyTiCh6wnSRzVTWiI54JHbDh5IZ7+w08m7nRUt72nkv+3fUM?=
 =?us-ascii?Q?QoN7NXGqChI3jaRikK5y/XivISHuW8QdPo/jQpRxNzumec2h2+wrVo3hBthx?=
 =?us-ascii?Q?k19Y66T0kgoPAagdiTvyW7Rv2UqenfYrDSw30r3e4a5HuBliHecNDRhfK6mm?=
 =?us-ascii?Q?tZK6crBZtWl66v3z7t/B/QDSb+Nbr0s7FzeDu3pAQr/Adwc/gtJXXUdCn4/v?=
 =?us-ascii?Q?r0PtvAhTTfv6LTzPhVYKlXcJgeOfPXSCQ3xK/TMPHHh4V4NNMIQImpWEm6I7?=
 =?us-ascii?Q?j6EjbjrCr8UMl+bg9Z3FLT6dE5DnPOnGD/7Q3DoAZLgQYrVgt1GyvLniHrg+?=
 =?us-ascii?Q?CHxb07wQhLHMm9dchLI4sSSpRYQY/vtoOWvxvMxcawyHkCq8dXSt8sjljwKe?=
 =?us-ascii?Q?z+jCDSkv3itY2EolsDfDAn2nW0GO7yOQU7aBZaiiY1u//y/Jo9MhvBZ+fnk4?=
 =?us-ascii?Q?Fe8lQiKOXOvp1m5aay4f68CBYkBgRzxiAM/CF77rcX1I2y6enDoX6Pn8SXVV?=
 =?us-ascii?Q?SdUzIHDyzVitgn4181kk7SBWWEpMH+gfLhgMZiYFnxsmWRWGnsxjq84iwuVr?=
 =?us-ascii?Q?eno8x02oAv9NvkCK5BpSTyaLHnS/6Trz0yAd6ZWSBiRDUPXeY3ynG4ugoqfW?=
 =?us-ascii?Q?sp+L2UA6kZIEo0o5KWSoyLEJ+sjuWk71Zcq6kLvdnuoyW5iiIGm3uACw3ofB?=
 =?us-ascii?Q?OkajmzhXHzVZG+evZ6L7VMc+XobPDE5SBk3kSTEiNQhA7NntE2hITSqAsKr1?=
 =?us-ascii?Q?30OT4Ca2ahOhvMs0apX9lSPdf9fc/o8sOuCPJXzbDpuyUAZ+yx2CvMDcmjaa?=
 =?us-ascii?Q?lRk8HfJ0q7Uolp0v/tx4e3ECmQ07Fg6Km4YLyn8Ewoe88mrZ21PB+H6RL0UM?=
 =?us-ascii?Q?hCoeA9Xx1Lq73B5U1PXAvcLzygmqP4RjcHEs8mVcH6cN/624qMtaLBqVMhRS?=
 =?us-ascii?Q?qXKQXdw06iORXo9xvi7IAueWOSL7b6LmH56hwfggdenVb+iLqJeDjv8PNdRn?=
 =?us-ascii?Q?BXzJbb/3Fzd0mVXcUkNzS1EjW5MZLGSEoeD47yKbH5DfAETLnLa/JjHLELP4?=
 =?us-ascii?Q?N1X2i46+N2ane7uECJB4xokuEvUlV5prRNLF3ZoR2IJWkxOkyo4kEWSqPVsZ?=
 =?us-ascii?Q?FjxkuraqPs06P9W9weKSImdoxRNUwd1CzFNeFWAax33TbxBSLy5q/uF7yp3+?=
 =?us-ascii?Q?+Cn4MoSCMaN8JaVIT/bGHOUtxhI0RD08SAVwNNfcFtSYTboY/qLaUOE0dtEV?=
 =?us-ascii?Q?Lq0n+p/2c/k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?USxu+/VUdVU0vGf486ibx9oRZGcO5zFoyorlIqxhPRCBJPOc2rF7WSHEYJCG?=
 =?us-ascii?Q?bahe7y87Ya+saXLgyoTGxwmxep3OIodbRSgEwAi7HNvtU65J/dJ+4RoHDZap?=
 =?us-ascii?Q?1T6of5fFzL+PT3ASqcNySbcf1Il/aHOyt5jIMlKIEjMEvcduQd1IH3yleHYC?=
 =?us-ascii?Q?ooj9GgXiE1l0n/k+X5ddmLoWZH2ig2TvGfNtWPm/IuhxhMDliaPy9YpQGkjP?=
 =?us-ascii?Q?8uXnxb+XnwGOIhVjEoIKJNpuqp3o/S+Y51+WhmvdddC3TGd14o3fKVwgBHBr?=
 =?us-ascii?Q?kQovvdnhQ6rKZM8H1TfYl+TB+pd1UV3GfdtP5QKkWv+Uj5i+J/m0cnYhKG3K?=
 =?us-ascii?Q?p3m5cNXfQiHFt4VJHV4ogpqJANVivGRofEU41mGD9BZ3Nqu+EBZuyTGL+Hmy?=
 =?us-ascii?Q?RWxX1gkOBOC70fR3bXK3a8ne6nUgUsda3sLjwFILw7Si1A9b0X4jdAAUBj7v?=
 =?us-ascii?Q?6Q2cpKD6s1ilm4X05BtFjvGNoN7PHU22GsHtWg0zA5aVHlqSzSALV2dn9V6n?=
 =?us-ascii?Q?FkNzXtWWINSC2zETVWd1NIPcyHGtIYcCle8CIDTiBbEEKv7W0XkrOfr/Lvdn?=
 =?us-ascii?Q?7vIbmG7C1Kx+e5ekRFvwL6US/FJXIJTSE/U6bmp7kYlaqWnIYdIamtmwHu8B?=
 =?us-ascii?Q?/jGOpG0hZDb2GraHhLcGNzpz9GH9Gbm0V4RQisFbgdPUzOrDsVlSPt4T3XE4?=
 =?us-ascii?Q?pdH0Rg15pbICehQ0popAhqUNa9rUANX6jHcooh0aglAyOwgpSkTO0BHdYmU6?=
 =?us-ascii?Q?520fv5IBJA/vvdHnjigMZ+JQoRpapAqlI0npJ8jDLaZm4RL02ox2Y5TVmdig?=
 =?us-ascii?Q?9yS0WHCXaM2BvuQcrJIWjbjFEqQ/dOe4FX3rBOiJefY+8Ilt8CGb+lACAVr5?=
 =?us-ascii?Q?2eWeuIMzlI2EvHPPq4j8/QT9tai5xU3pBAmAA7WbasM94buoQvdzE8ldt8cp?=
 =?us-ascii?Q?A26E7zbtt4nzcFc92TfIP/dUwicOZvCbGwZhHkDlyLok3q8UV1Ehnc+zsn8G?=
 =?us-ascii?Q?i37+U+zskzceWIA3+gdjf8ygDdCgxkcP6A7CwQiey94ywyjjum8a4IRg8CF5?=
 =?us-ascii?Q?5na0am9ujyp8akPhI/FUhLqW3N8wknrrvtTe8fVxhDYcg4SJBqn0GVes79W3?=
 =?us-ascii?Q?p7WQpfDqjB/eUT1PBo9Y3cgW8U0VFs2NQ4Coyp+x/USWpnImPY8S0NVgg/29?=
 =?us-ascii?Q?JlyUxcZWSiqn9Vefo7gQ3vBcUHW+IxwPW2JkFlh0MSoEU6FKI9E9IKu1k4Sy?=
 =?us-ascii?Q?6eO3cv2NI4G1ANehOGQo88GXS9123juM3lOPXsyc4uf+19dNO4x23Qh/sc0L?=
 =?us-ascii?Q?+nDkGlFDUoA6rxLlE4xRtzbMFeF4uThdz6JGo+Z6nzdBWROpcUZKTdE4dWXP?=
 =?us-ascii?Q?oMgc5CbY2+GWOFMGskGt+3RGXyIZNo6Lbh46taIOZ5J5XvopAfL9pDGuofy0?=
 =?us-ascii?Q?2OWyix8/ccsLwYMw6asuwjxo52IASTpWftLnjsP84O/V+Hewoqt2qE6cjSwN?=
 =?us-ascii?Q?CDggEHbqXlSobDNwveL9D+ib2PB2+/UTNHKBEywHV0CBmsMhrAAJIJkV+F5T?=
 =?us-ascii?Q?fPHP3NkM1yTX2aMicfXjNeXk2/DYzd8laQsCHoMTnVeosUy6c8xPsemse4m5?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72dcf932-5fcb-4f24-d2cd-08dda258eb83
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 04:41:34.9957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHrgRwVIJyLP3pwaYn8BZljxn/rS4a09J1ZCKGwIN1QOtcO/OsfaIYhUimiZPmtLqwIf5LycN5WWG9G5shyOfzLJF7BpUVAmzP7W859nEbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8749
X-OriginatorOrg: intel.com

Kees Cook wrote:
> On Tue, Jun 03, 2025 at 12:38:32AM +0200, Mauro Carvalho Chehab wrote:
> > the tunnel script redirects the e-mails to dovecot imap daemon:
> > 
> > 	#!/bin/sh
> > 
> > 	export MBOX_LOCKS=fcntl
> > 	MAIL={my_imap_folder_location}
> > 	exec /usr/libexec/dovecot/imap
> > 
> > With that, the e-mails go to my Drafts folder. This way, I end sending
> > the e-mails prepared by git using my MUA. One of the advantages is that
> > I can modify the e-mail as needed. I the case of PRs, I use it to add
> > a summary of what is there at the PR.
> 
> Interesting... this is close, yeah. I end up spawning mutt directly for
> my PRs, so I get the FCC. I think there must be a way to get mutt to
> send an email noninteractively...

On the way to the setup I have now that just an oauth proxy to Exchange
Online smtp I played with a sendmail script that did:

#!/bin/bash
mutt -H -

...but at least in my environment Exchange Online did not like sending
longer series that way because it started an new session each patch. It
is happier with git-send-mail which does it all one session I believe?

Not sure if PEBKAC or Exchange?
