Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C70284662;
	Tue, 13 Jan 2026 18:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768330266; cv=fail; b=kz+T2kesQwR6lyqrvS4qFufcT+RbDM7Ze+kn3kYtQhaS4N81xvuMHZOkGXFx3WabmXF1OpbvNNPr8rpagscvTi50WXd943hRsqWLJHGlLfMt8D9lXvz/TX5Q5WEJbbvgm+vxOh0lplPPUnIzajaTPKikdb9Z30LnTvyEzfI/5Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768330266; c=relaxed/simple;
	bh=NqSQeWEHzPDkVBXVTQ3nPGzV4tj0piPTKbiTykbgdtM=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=GpMo43FsTl0/lTljaIm1/uVlPJ50cRorpzT5lN8FxecPrjO4GAK3SvQTSzBT3cLUrC4BwAsZ3h5b6c2qCm0zoNvJCDPEZCL6IxYvA7lsZf0tZ3iEzwdBG+IO0S7f/ECVvqjmL2t6xYiEBzwVpcZnCKkfzSrad/r/UHrzmeKo1Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH6fgEKz; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH6fgEKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768330265; x=1799866265;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=NqSQeWEHzPDkVBXVTQ3nPGzV4tj0piPTKbiTykbgdtM=;
  b=SH6fgEKzy1tIVxPUX4npzAb9HH21k+kq8gJJwK1FsyhkVX7uzVsFOuXm
   5U95K3Bz0ER5keV04czPrPka/ekZH841HaRokvcbVreZnp6mXb0N/Arqc
   bVvfwpcHewj/farofjAG+ygsv8842nmjzFtakq+i3KwWT6ht6Rh2qW2k2
   +ip9T+jbG4PdOQfT6opF0gaPGgQlie8mQAsZSIwNE3Ghowf9Ncdh08jsw
   XDPMkPxjH657a/0s/rDvK1vtx+lI1kXHBfK8CXMiIJYvW0iyWiDYrmFb2
   KulOdFF/2YujOGh+oJbWudGpWrENZs/PXGVzzKAFIn72EZlb3jc9B38qT
   Q==;
X-CSE-ConnectionGUID: UotGVyp3R0OCb5jMtlEjoA==
X-CSE-MsgGUID: qOk4V2ExSiiMSDCAIhhKkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73257878"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73257878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 10:50:49 -0800
X-CSE-ConnectionGUID: n1vU3DfwTKqQZEeGcaLk/g==
X-CSE-MsgGUID: 4wU4621AROyue5ZjW/nzdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208618559"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 10:50:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:50:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 10:50:48 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:50:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eq+fJuumF/XcgWaEZYkL4TQGOuZRjUc0s17C7eW9+/OiwlLi8AlC6bFY09pvGgyf810b/tuG2ceH5pwWoVfT+xAmvgcVZzkYqs9Z4ppf/jU6XyL76uz2ETcNM2rDq0y6K1rEPQr8s7kUP/pSbaOcKSLMRDdok/LIH7nRVZNePmt+xlDJb03/vSsblN0NKsbvIA0tDLynA1toDjpejtBp66t65l54jSIQuGhEefWxU6DwG+q5443Dcbge8Q1M+DHYCjq+Fw39QsGWnkWE8aKQm7vbbcYg68fHYsBzrhq4n9vEjwNdP0Dbb+U4t8V+82Kbx63VShQdkQZ2ktXQprkZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqSQeWEHzPDkVBXVTQ3nPGzV4tj0piPTKbiTykbgdtM=;
 b=uZ1Ca3nBj/12ggbNp4Gjt5FvSJxN14cdDBLXmWjiXFnsacYsjUjP7zTA1Fj1xs3EsprvQ0GTAeaRD1HUjoLG8uDD8sc5D7Rzlc+0+NvsR86Gq2V4amJTOw8M28wyd+hChFg1oS8p6cEdA04WFhoAlZ8wZtB2n3kxq+Z4Kmecwz4+7qwbaqrgsCrpkkeiaMYQ2EdBQdTos7zOZczFoYdAOdUFPHwSRbvbNs6nlE1iiIQZpGa2dbxT9U9w0eF9gZcUw7PzuH0zS1A/MOq9iLt0oPVfHYbPZkCxht8/3r+wq9ukv8nI5O1/9GmewUPIg/T8L07xJzFe3YtVggngftNlxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 18:50:45 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 18:50:44 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 13 Jan 2026 10:50:44 -0800
To: Sasha Levin <sashal@kernel.org>, <dan.j.williams@intel.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, <linux-kernel@vger.kernel.org>, Shuah Khan
	<shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Paul E . McKenney" <paulmck@kernel.org>,
	Simon Glass <simon.glass@canonical.com>, NeilBrown <neilb@ownmail.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Theodore Ts'o <tytso@mit.edu>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	<workflows@vger.kernel.org>, <ksummit@lists.linux.dev>
Message-ID: <69669404e2bf_875d10028@dwillia2-mobl4.notmuch>
In-Reply-To: <aWaSQsl8h2wnBjzj@laps>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
 <aWXYi35pu9IHf2eE@stanley.mountain>
 <69668cfc63bb1_875d1004@dwillia2-mobl4.notmuch>
 <aWaSQsl8h2wnBjzj@laps>
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for tool-generated
 content
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3929d921-ee5a-4caf-6f90-08de52d4a888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3g0eDVLWWJrMGZ3WXVHUjd2RFcrTzhsZnZTdk5odEd1bm5tZHQ5SzFLOU1Z?=
 =?utf-8?B?RXExRE1OMk5uQjU2WEcxV0orc29kNlU0c1I5c1Q4a29ObWNCaE02Tk1NK3RW?=
 =?utf-8?B?ODVYeGUxOXBKVnlxZFlRRW5obnVqU0UrTlRKb2xBdk4xalhGeTJiWGRVWTRp?=
 =?utf-8?B?VTJtL2JOUGhraVBRb2xacFkwOUNNMzg4KzBhM1EySFJvWWp1RVljbkFmaERX?=
 =?utf-8?B?dWZReU1mbk5ndVh6dlNDUEM5RlRHQnZjbE1lejQzQ25ERDVMNDZ1ZUY4TXVz?=
 =?utf-8?B?eXg0VU1UQ2RWbUV6VVJrdFJZT2JiRnZxb2JhU0h2WDgyRUNydk9XL2xBY2M0?=
 =?utf-8?B?ZVVCeXArY2hzaUdsYU01TDF2bEJ2OUlUWkR0eTZscVR5Tnc2QjhzVUV2bG50?=
 =?utf-8?B?MkNROHJlTm5YYjZTU1pFcmdyZUNDYkpIN1NPbTcxNXVrdis1aHYwTlNmQ3c3?=
 =?utf-8?B?TmlQSXhOZm9la2lnSTVwd3JMdU1vYm1sTjZPa0loam9JalY0eXhaZWx5MVdS?=
 =?utf-8?B?TDZNeEgxK2puZkg4ajd1UllZdDhCM25RRXNmM3B3djFHeWIxbU1wTlJhaTJI?=
 =?utf-8?B?enJXdjRoanA2dkhRZm45R2tiRi9QWmdGdnVEMSt2Q3FoTGV3bDlTWHJoUFVJ?=
 =?utf-8?B?WXJDZ3VOYnNqY3ZadmRncVdyTGE2NjMxV0Z4c25xaS84a3RrNlBiZXdqbnpN?=
 =?utf-8?B?NDhvZ2Zsc29Eelh1eHFJQWlNVjlZVU1vYjFmUVBTeklZenFPQXVDOUNrVEJU?=
 =?utf-8?B?eHJEUjk0Q01CR0wzd1RkWldHK1VsQ1lYV2I5RTlGU0dJYnNsRHhqUmFNaGlm?=
 =?utf-8?B?WEQyNVRwVW5NT1JxM3lGQ1ZhZjBZakRodTZGZ0tsWXh2T2lhbWJOV3MxaUFs?=
 =?utf-8?B?Njc5VjlGTXc0S0hkWFZUREt0SmtpUFkzKy9WUnJUbFhIMGNNbEVTS3ZMdzE2?=
 =?utf-8?B?d2RqYVNlSFJwM2c2WnV1WE1NT3VJZ3cxZ0Z3TFAvUkZ4V012WWtkWWE4aFhz?=
 =?utf-8?B?bTh4Q2l1ajVMbGdrSHAvRDAwRHlIMW5DU202WmMvVEU5SE55RU5Fd3B4alc1?=
 =?utf-8?B?Lzc1czd2N2YzL3U4dkJHMmxhSzMwdlUvN3F4T0Q2YWpEZ3cyZHdBZ3dlYlBy?=
 =?utf-8?B?LzUyd2VVaGZOLytvRlBmam5aYWd2M1Nmbld6QmRCa084OW1NeXI3SUtyNmpa?=
 =?utf-8?B?MFE5UVgzays0cHAyOU1sSmloVml1dkJmYkNFSHJtN2g4RDBkSDlITVRIUEJa?=
 =?utf-8?B?TjZtS3RjdzR4ekJQaFNQcFFMTlVHamdja1NOYVVrd1FUbkZRTXV6YWxTT2JE?=
 =?utf-8?B?KythTm1CUGxrY0VwMnBwSEFXRi9zSlhaeG5QU1BlYnRWRkk4bWd4eVdDTnAy?=
 =?utf-8?B?QVJzYXlRcmxQS3c3Q3U4MW82ZzkycXpUdVlDQXJKSGJyenBZVUczVm5aZXg3?=
 =?utf-8?B?ZGFXcklqZG56TVgrZkJhWkVSNG5INDd2Z0xFTUN6ZmxJbThWNFlCOEtIVHpK?=
 =?utf-8?B?QjFyMnlmeEhFaGxOMjlSSm41eWJiVndtRmdIVXNTOFFWOVZ0aHI1RTdlQjZF?=
 =?utf-8?B?ckwxenZxcWx4SzJLRTdLOVVUcDNVcVBkaUt2WHhYT3hKd2pFejQySDBsMHpC?=
 =?utf-8?B?Y2g4bVVnVUdmak1CVFB1NHJKMGIrSWdxaUhtVVVKZUl5c3NWTHVsc3hLSVFs?=
 =?utf-8?B?aXdPWURvVGQrNkxrOGNrRitkMC9wUkVnZTR2MVZEMHFQazhNekVqMXVrNDhv?=
 =?utf-8?B?b0dNc0lYb2lWbHlUQlFJZkE1OGVVQkJVT3VlanFIQnJUTHkrbFRObnhONVFM?=
 =?utf-8?B?OHNrZzhSVms4UGJXWE41MHh4RkYvUUpxM0wwSWJZQktVcHFVSDBJOFVGRHJ6?=
 =?utf-8?B?RFMyTk1SeldNTVRFTnB1RjVWcDVrSDhmeC85UTFhZUlpbWtSeGpoSSswNzA5?=
 =?utf-8?Q?G+dl+SdFL3m4YeeEhwBxurLP+jeDZfMi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1JMS3NsUVhadmZoWG1DamJKMXhOeUpGOW90akpTQi9qaFY4WTIzODlMU3FD?=
 =?utf-8?B?NHFER2U1THlJbGdibks0MDJEaDV3K2hjUHR0dmg2d2VLZzJNNW1zbUhIa3Ez?=
 =?utf-8?B?bHAyZ09DaHdMeU5aMjZzSlVVd21sQ1hLVWsrb3l1ZXpOTXlZSG5LR3ZnWnNI?=
 =?utf-8?B?bjdHd2JpY3ZBcW16cFZJWW0rYTZBWWkwYWFiMzA3cVZVNUh3WE02TXRlRWdx?=
 =?utf-8?B?aThNb1R2NU1vbC9mS0FoY0ZKVFRtRzFQZG5Tb3FhTzFFcmpGdHBQeDFkWFlo?=
 =?utf-8?B?WGNtZHhtcS9EYWcySlowSnBqamZkdS83UFo1WkNxS2lFQ2p3Z0tCMjBEQk1E?=
 =?utf-8?B?WkZKak9ydU42SklxeTZKRmdQdHl2NHZWQ0c1OEFlU3BVaVZ1MlNKYTVpTWp3?=
 =?utf-8?B?NkNMNi9TWW5XN2RhMkpJTGJQOHRoSSttRlk5clZqUG9mQTlrRUJxQkdiZU5N?=
 =?utf-8?B?Qm9ucnRQb2gzQzZqQmk4aEpBTkNha0gxNklJTmxZamdubXAvVEFjRkVpMzdS?=
 =?utf-8?B?OG1LU2lxSDBXaEJmeWtNVGNCdUpwZVg1bUVuMVlLeG9MTzNTM3FBN2l2bTFK?=
 =?utf-8?B?RFFRbTQyQkxibWdtM05HdWFJRXUwbEoxUUQ4blF0Z3dhYTVJQjlSRCs1NHRN?=
 =?utf-8?B?SFpnbUpxbWZnMVBkUm9JN2RQYkdJWUdUNlh2VkxMNGFsaktMS2V4bkFRZlhn?=
 =?utf-8?B?Sm9vcSt6UTI0K0FKMkljZGRyQmVDT0c3U2x6Q1I5VVBsbVI3ZG9kRXVsMW9J?=
 =?utf-8?B?OFlqb09jV0prY3JsN0lkYU93V1czUHRrdW5UVFJUVmQvQlIybGNzSDJBalYx?=
 =?utf-8?B?TE5ta0VuZ0NHbU1LUFB4L240bk1Rb2ZSaENoLzRFaXg0ZWVJd3J1MGw0b2Q5?=
 =?utf-8?B?RHVHR1dHWHF4M2R4VGlVcFU4UCtvemlzMnNNaWU4MkttKzBoZDJiNk5kNHFz?=
 =?utf-8?B?eWVWVkgwSWlSQU1TZm11U0xQUDdlYjFTYVhMOGpQb1A1cVBUSkJteWEvcTAz?=
 =?utf-8?B?MGs2Y3VXbDZvRU1LOWd5UTUxV1JMejMvMUEzcEtWYlpWeWNNbk1Ca3RvandU?=
 =?utf-8?B?dGgyT0t3d3I3TmVta01qZWkwOGRBb2dmRXp3N2ZkNlZwNFJiSUtaNkZVQjBt?=
 =?utf-8?B?c2RjZTI2eXpBK1IvbDljSmFiYXg5ZEVKT0Z1QmtNeVBzN1lFeFhFbVpadTVR?=
 =?utf-8?B?eWMyMDZDNHk2b0tRcitSdWlNa082T1cvSWpIdVNiN1pNQXM2QkRlZWJmVFQx?=
 =?utf-8?B?cDFOWlYwZkhLcUZINTh1V0tFajNrUGpLbmNYZFgxZlI3ZjlqM05IeXo3b1py?=
 =?utf-8?B?Nm1jQXFrYWNyc2ZpVllkWDlkZlBxcGZYcXV1MzBnK0JtN2NyNnpwZjBYYUNN?=
 =?utf-8?B?U0hPWEhZeGJFckhhQzVwaFBXRU9aNVI3UXBHZHFaNHhMd001MCtLenEyZkJX?=
 =?utf-8?B?dkN2SVlNZGtqMlVDM0twZ0ZqYXF6alR0Rkw0OTh4TGNJbkMvR0xlTkZsU01H?=
 =?utf-8?B?UkZFamtrQng4b1BTc2ZNSm11TnVENUhLUjRUNUtYcVZQSDkvRFpXVy9WeC9i?=
 =?utf-8?B?RXF0SUtYMFF4S1FFcnpvTHpRZmNGNUVCT2tnbmVBblBva0lLdEtwSmh4K25q?=
 =?utf-8?B?Tkk5MEg3WENwblAwTElmNHZhbFNVZjRDQ1p6VEF6TEEzNytRMXQzU1lOU3FH?=
 =?utf-8?B?dW9KekcxeFc5VlNBaUlEQStyd080SWJIc0lLQ01FVWVGSXJ5YmNjOEVLNk9G?=
 =?utf-8?B?M3hWYmVHM2lxTTRtU3ZaUHVTZVE3OXFNVVBvclVDaUZCdkdKaUZyZ044UGph?=
 =?utf-8?B?MDU5eFhPdk15TGNHU1lqcWcvNEZDLzU3VnVuVHpzNXhSTE5WNUlxTE1FcG51?=
 =?utf-8?B?UjZSZkExUW9ZMm1VeEFCMFV6amNvcUxBY1RGOEg1Qm12RmpTZkRqTEI0bnEw?=
 =?utf-8?B?aG16RXNuTUVlVm1BaVBjTDlwZ3VYWEgycC9aajM2S042LzcxQVprYSs0UTdp?=
 =?utf-8?B?MGFWTlE5RUNEeDZQMWlvMUhNZGwydDljdlpjUVFVQUNRMGV6b3E3ZXREeVhO?=
 =?utf-8?B?ZnhsZ0g0cERsenlEOWgxaFplbTQwWEVJczNaYWc4aE5uSCtzOFphR0d1ZHRI?=
 =?utf-8?B?R2xibEZBVlpOMEJ3Y3pjeFF6L0lveHlUNlQ2cnpsdk5xTEo1eVhHVTdockkw?=
 =?utf-8?B?V1pkRHdWYmFNbVBQcmhhMUpkSHhTMi9ycnF2bmtTbkUrRmhLa2dZcitaaVYx?=
 =?utf-8?B?MjR5WERwNGo1NzBVVGMxSFZHM2xTNHFTbHErZ2lLaDYwYng5QVJPRWUwQWpk?=
 =?utf-8?B?T3lNOUE1OU5YT0lENng5Vnk3U1cvN0dVM3hXUy9ZQUgzTTFKL3RHRVg0ZE4r?=
 =?utf-8?Q?khfUOFAlmmv7L0hs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3929d921-ee5a-4caf-6f90-08de52d4a888
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 18:50:44.8643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOIGYFuZAjxfXY9SrYiue8yWPT9JclA8yJ9V2C8bxIhddo2IDMe6h15C3RZUjzHpU4dO8hHEdG8zLvi4sKACkmmcyFh152EtGee2SwYHKIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
X-OriginatorOrg: intel.com

Sasha Levin wrote:
[..]
> With a rule like the above, 1700+ contributors would have not been able to send
> their patch in.

Good point, I am not suggesting a Reviewed-by hurdle, but can see it
reading that way. I expect that there will always be a significant class
of contributions that will never need author trust to be accepted. Yes,
would need to be careful not to destroy that wellspring of new
contributors.
