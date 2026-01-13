Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD89836C0A0;
	Tue, 13 Jan 2026 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296533; cv=fail; b=L5GVjt0xgy8PAAUJu5AG1gfP3dv1rRr7XSWWZp8OZtro3NZs4cZ39V+KOVSFV6S5fEX2d3skoMwJtr3l97saac5YTyjwHku9fajtzLgNrbFD7hcSa0kaf00CEQWI+CMcxd006Zgzk+NypBDEdH/VIlvsrq/6xPxX5KqQ0B7Md44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296533; c=relaxed/simple;
	bh=qWQXj0NN9pbFZrGJVsu97HCHF95sY4T9gEdiAIYEKaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sXNCKH74r4sNZfTxgif5tmg+hkCoH1QWkLT8K/neGcdsXYNFGtJIuzN/oLMOcMC791hoLWbgcnkTt2RBy2Qo8DrYUZbmhD9fpvLFDU8tMFdFVTwApxJAIbqr+MjbkX6LjQvkPdbvK845jwGYjbLqaMoVCQMUCYn6womYgpmIS/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JG1muJHB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aSkpxjuP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JG1muJHB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aSkpxjuP"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1hJgc2677774;
	Tue, 13 Jan 2026 09:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=mR2exFhOV4aDkCt7y/
	Y9BuBMEmfKcUbfw8yFwyCybZA=; b=JG1muJHBoUbDUsJTC2Zxe66tWgO+XNWssJ
	mM0wrUTbpYdB1nt1VoG45VSVEEWk3UWcHBCDZygNV6ImOF3a1ZyV3O+tyqS0+wYO
	XMaewpAydmum++WRvUXgydtklhIw3FA9NrD1rJnBXmE/4CVwl+UVBjUwQ3kL8GVH
	eTuLNsqgBHNAkjZxM4j7iPbNn57F6kQSS+ZsW2JfEpGPrpNax8WCo+VDhu61ZAw2
	d1taE2iLZj5qwllgXaXDy57kjFZHqwvR6ehla6BMF5DLISa/O/7UqJ6eV6p37Guv
	2FBR89z2P2vVYtsIIgve80/BizFF0NqpqrLTRUAuX0kzF2urB3lQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkrgnu3ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jan 2026 09:28:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60D84CAZ028706;
	Tue, 13 Jan 2026 09:28:22 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd78gbax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jan 2026 09:28:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTHGFPsTxoGSUVs6f06HCXXsQniV/RKcKz18HDvzd+8ESTvV0Pu9CJyczAF8BXjS7GoOfF8Kkm1ZV6fHjeMvVdZu9tkombKVtILAODcqtJ0y26AnYZyQd3Lf7IieLCn3fQtiK2XYFm/Cs/oXaxobgN1CUKhEvNzto7t9um54FbtibZkgGpxFLd9rsP//RuncFNBAn+J/mgtJwIHwLHoXXsGaICUWZKHBhhORptCMedbGMYl/GI7enZGNd5rFMY2aq683gNfaf5VcJNYe89to4Sq/2jXOIVtmKQFWs6YP4CtnCSDpiX8lbCx3XZaV7YyxDsVR4GDu5K+X6iXPbEiKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR2exFhOV4aDkCt7y/Y9BuBMEmfKcUbfw8yFwyCybZA=;
 b=dTPfm4c2DtKKS0jCfQ55+Icj/u0D9WBQ6hWeOugTZz+maS+4oMedV/wKQJArg5a4kxw/K9UB1htebNYi+dLCyUfNFpVOPgGVfJDw30HoRzAzA63d3HZwjBX6TZZrOKDDirJLF62rGfAJQGO/hx4yYrnH/gJJO0ARXyy6onfBAykXJRRyHBJx2JLaxd9Qq2Bg7B7aYtdqrFGf65lIuONvcRngtPmevmtAa8yBD0iV++006BdpPzFpqYg/tEWHqBRqt7oNj5VO5jYCgVQJI7VNRh8i4VXpDAayb3bI+gdXX+tgE4zWSkxakb5hmbJ79XOC12Q86MJ/2h5TskOhu7fJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mR2exFhOV4aDkCt7y/Y9BuBMEmfKcUbfw8yFwyCybZA=;
 b=aSkpxjuPVuTc0TIprWJzI4rToKhiu6t9XLZlgP4l4PtbPShzczl7fP6gBVbQbmrAXzz4mI0xCKQJXJvrphImCx23wnKy8IILc4MvwUyj3DlYJnCUnYj3ydO/Uc6cbdJC+c6gkjN+aYFabSlkJyuIoeJVY5q2UKmvuxuBxg6+ZJM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB7902.namprd10.prod.outlook.com (2603:10b6:8:1aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:28:19 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 09:28:19 +0000
Date: Tue, 13 Jan 2026 09:28:22 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Simon Glass <simon.glass@canonical.com>, NeilBrown <neilb@ownmail.net>,
        Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
        workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <6312797a-5c75-4c2f-9470-2de680bb8d91@lucifer.local>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
 <aWXYi35pu9IHf2eE@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWXYi35pu9IHf2eE@stanley.mountain>
X-ClientProxiedBy: LO4P123CA0250.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d33313-fdfb-474a-b2e5-08de5286167b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TYfu3pVdm8lUCbinOKddaoeE85E8ajYoQMmWXRXC2yM/Ks8tPJLh83HLk7/t?=
 =?us-ascii?Q?tUjbd3wQm0VqHP0qx+3pYCoBMMBRHTduPuK8xIJnt+BRqIC2SGrQWGAP0717?=
 =?us-ascii?Q?1/ZYU5Swi6azdqMfCIIgJ4vvPM46i1OuU+kwV2tZQFdwnArrEIxXGijV2rDt?=
 =?us-ascii?Q?eO8NV0TZxDYZef1iTybw2wyGry5ns/DNyIV95qxv/+GYs34/mSH/HHtsvNqX?=
 =?us-ascii?Q?naTwYP+8fA1bYrndYGM8Jm30slhloY6j1GL/OlP2upOEKBjL1tvCMIKFKTcq?=
 =?us-ascii?Q?j1rMSFP/BamOaRye5+ejle2KFgdMfsgUrfFsbgP80wumBeY7pUgbAIwZY8+p?=
 =?us-ascii?Q?6aOunyiR5E+K/7bbjR6Iv840QA+8v+fWFdqmY/pGoyG6ZEVLCrybkD41TxIa?=
 =?us-ascii?Q?AVZu1vFRs8VrJxWzcJl1Z7RGEETSWwzamWbVD0gGch0sYm9EYVMM7ebN4Ynq?=
 =?us-ascii?Q?+UOzJncrGr/MIJn6QdAGubfydJPmqsn7vMh1kVRRyIkRjyJh6WF9bi2a0Iok?=
 =?us-ascii?Q?OYYpLJ7FdhnXSxan8CBn+IIEb0qVcKLs53Pzvqbl1xLYHusHKZX2iLUTbjVK?=
 =?us-ascii?Q?uW012/Nx+djJoJbuXpCGC87rx0rmUbwBi3CMqMOJfMl1jW2B+a+Cn0iOmvMT?=
 =?us-ascii?Q?ZvP1jfL71dy59J9QwnwZ7i5hZ9Y2Fp/80gbYfyZCPs5/54p9z0g4Zu6EEB5s?=
 =?us-ascii?Q?FNUlJD9SmEinrz++5pQce2QWfgXd1CyzYcLt2cxoHJN0l8CwyGYsZ2Un+d1h?=
 =?us-ascii?Q?6EEX/xC2V/yjtEobQ2Zjyjv2LxFbCx/nZHw8JPkzvXIQPjUSqLVMtOmEgfwc?=
 =?us-ascii?Q?J63AZNzCby3CJnuLIS2C/Y1lIYZS2XCOsU6JIdZkiDDwaqVU3Gmm86yphCC6?=
 =?us-ascii?Q?uxthrj4lebalARfqWDtAQ3EQsZDw99/rEdCxoW9hG0qUW2OEySct3CEJFeOa?=
 =?us-ascii?Q?JvVgUADu+9RmhSQrKJeHJh696exlN3vtbidoueL3imRB+ZdEcOBCZnlJ8reN?=
 =?us-ascii?Q?qyCLaOfIPG8fzsvfvdiKrRtJtfAqFU4EjvmuTrgNdN/Ewm8UQPeDTUaK1SrG?=
 =?us-ascii?Q?erguEctgeuTI2riY0nbdI5Mnfv0+Rdo/mSaOHNfFLLhPNsVVQjZG9PRNQYRg?=
 =?us-ascii?Q?WFObD69TMAxRnT0z6PYrEoG2lzHSZd/DObS4p5i+BnkYlzu0gtNesLStRy3r?=
 =?us-ascii?Q?gBKiOBlAm6a/hQATWnbvlXrhH88X9oHv13xMU0o2BvtIFA1A6au1entFBmQQ?=
 =?us-ascii?Q?R8iekkBuYa3mylNcA1niIypQNOSTfRbrLu0Ttm0QwaJIRXMZZ01DP9lm8D3i?=
 =?us-ascii?Q?/WVjXRkItiEeG1PZiG8Hisr73uOe+ulBWWSYD4F9aaUGfgPGPykkZgfMBaow?=
 =?us-ascii?Q?/CsHsMfVmChXWCFDKqhpV+JLuSTgwx9w8rmM40rJK4n0o4AtiLXJMCOq6Olj?=
 =?us-ascii?Q?GQdjl/XlgHLZpOw5+vl2AULCIDUmh4qy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dcwnA6VycmT0OpGxTFFohNOCpw/nDa61egwU2eKSVfrtlsjymqklC6ZIeoCS?=
 =?us-ascii?Q?Aqv4ox3fyx4MSCzf4Tq09/svwSNjO+pRtt+DJAm3tKoeNvJT+Wld2qJNvwK2?=
 =?us-ascii?Q?9ZVnerfDXqo4thrzODEBP9ROUc3JnF0KQF2QpWTLWCczQAe35esbtV1fcVwQ?=
 =?us-ascii?Q?NTDZd+WhHl7kdEwfkZ675YOrk3nu1gYY8JHJBtfuVy1iDmIiWXGTPtZoJX7K?=
 =?us-ascii?Q?bJX0ppwEi0gNRs/w/ZdabKHD0Kag3OMta0FdQV/nIo2DHsLCtLND0C1xc9DH?=
 =?us-ascii?Q?2pOtQjxxGn19UhRTgs+HYXrN8fRxD25I351FAu8Brztij348vQVFgeE8cKrf?=
 =?us-ascii?Q?6FdMRZQ8TNZa67QhHIN3uvEeh7fuHa778jsvM4EyQb1NgP1yEAxKCBIhikKV?=
 =?us-ascii?Q?6+BTuqzZeF1C07l7TTdhUKFsPgexQXoBHlQduhYyec8akkcIfFWfY+DDhAJ0?=
 =?us-ascii?Q?MWHJEmHaSm7gRDdfy0sH7euj3y94J0je6rzqyW8M68bdPQCkY0hkmibwBAr4?=
 =?us-ascii?Q?TiF11ad2HU1yj2R36M3wUJ2IjD2NKNDr42qTf/abdaA2x9fmgyPY3A0hJFNQ?=
 =?us-ascii?Q?1zKdfHPJSr10Ehyi7N7gfXBGqUZx/uf4oAwdEyRbDkOhMGE26fgelpidr9Va?=
 =?us-ascii?Q?PJJhFHFYeh5J4S7PEQjI5/PTRBOKcYejBssBvYCM3+0pLicQpad+NQT/QtKK?=
 =?us-ascii?Q?wv5xCJobyurcNd7FKH5YNnRQ7u7XONKCLha2bwoHnILPW0s5J12Mpbfeg424?=
 =?us-ascii?Q?I7HbTNBVoIBPYdJzAQp8pRCVPte8XhlL6WyCU1RNdPMyX0nB+oTBdDsZpPZ+?=
 =?us-ascii?Q?bvJ2r0dV7sqTM9NjDOZ38FZ3cGSpelguPXdOIO+Plzcc0eBWkaZzxvbRjUTV?=
 =?us-ascii?Q?jQ8IvjR2YKCbjeUBZHC/kBXe0AZ3O0xxioK4v1k/RezAzIAaef4XkviHVH0T?=
 =?us-ascii?Q?u8Mk4bVPMCjEbcNHJPXHUJmhcnKXnyaCa48vZIHHD3tVgu2dMssTbHh+ZLif?=
 =?us-ascii?Q?dYbTmAjVv+XoQ9AyddYeC7yj3XbaYyTSpEgcnuMaJXYlMNAzjQ/Uu+hHhtV8?=
 =?us-ascii?Q?Sxt/1jISPlM7tvSIBA/JP/fPQjwFRl3UMiJ0n37dsGxFAl5CQbtzZX4OzhOO?=
 =?us-ascii?Q?177n5BxTcSu+T+Yfwz8zcnQf+thUseaNn+ukB+rNl+9WfKLeAccUz4+rdSq5?=
 =?us-ascii?Q?CnafjC/YbrO/2KGdmtuLD72SigNmkRQ2KGcfec2b3tS0EgC20d+4dto6/DsK?=
 =?us-ascii?Q?ToRj9jE42hx54vZgDbavqLE6s+NNK2kTKEjnUs2sONOP1V8UGP8/ztf9x8rA?=
 =?us-ascii?Q?SlCIwXSCOkJ0Kz59FqAcZgaDeiRLgOuqcgBScQlxgIM3TbHHbUKjK8dCOcXU?=
 =?us-ascii?Q?TNSGTutHmC1ndwvEI0GdqqQC31zjxn+lzb07UgbOFJSttXCK/scTOazoIigh?=
 =?us-ascii?Q?UABcY29lz2l92WlbHdNlb7VkRfkHMt+9307cpiPnWsoRInh4D/+JanTDV1Tf?=
 =?us-ascii?Q?vBEQqkA9MIMEDe+O+9CCtj2QJXixGVUw7MbWozSc1yS5le/ZpAfljur0PAZ4?=
 =?us-ascii?Q?U9l3X5XHmqdyMiIy28xo+5+VldbC+/qW1GFMjNPV/2bHO3sbt/ORPovSSttm?=
 =?us-ascii?Q?HqsKuKOk2b2fB0+QnkXWmcrZUGGuB+w3oGoxfQH0xOzvfYQtX8nB84WA5h84?=
 =?us-ascii?Q?RlOjwCp8Kp/zmjVOd281CERsVRa+L/YMtw8qKVOfaKqr0/b8l4XZxW4QLIyJ?=
 =?us-ascii?Q?R5Dc2nAOfXBzPXO3DK5i3CZEG8F1T5w=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q/bWkc/4V5LCDFt9YUSf4ntZ0F45x9fe50UEK5+Og3alcqvamLoz7RswjuPB7mVOh8Jp5bJk/Xs/9FvHZe3armjCapr4PG2ZN2ReeVjV8YNgMACOq5Virb+KCWKXpZtwk3Css+U9yj2qsTRBquI9SCi68S2OERO3OpsJazHYYL+TZvMK6bzAt9AeMwL3FWf+rhqkkS8GpMCk35Bs/RirqmN1JjNoZhnQCZA1KDPwAvMdOfltbfbJ8IDcmnrsnSNd05SqbbL8+9Mxm4wIIPbSiG4UD8d5k5rfhOK5Be+D7IzpfYGYHdf6TPtHhWnXawHZDSyVHdX3m2VctvNBahWfVKHcGPA45mSpDjP2MyXdUjfqnSKABljnDfsM8xS9nr7icJuuvHoa/MQUS5yYa5n+b8eEdNiR/mTPmUjxnbJLSQekikXxn95fKnDtl7x4+ReNAkZPggqznT4zbbgba/Uyvv7oVdWkIg+LLCJTwb0vlFXAF35S5+zNlIGMJWmiJQLoL/fNVjJ+JIJ30DV3A2trV7BAp/7Y5tu10rRRSsY7Kq62yu3j1yCU9PCLDMvv+QPdVeAjaQuLN1w7TiFrP3Ksmte0yginm3g97U1nAkaXXic=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d33313-fdfb-474a-b2e5-08de5286167b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:28:19.1253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFBtuQReq0DaLBCu1AH1xmTv0WFVbegkkT81P1zxzA+AVtVCygjWvop8kC0DOjui1GXC2E6qURA9ZXndNa1Vz+rCT18NimdUKjHP+31AvzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7902
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601130079
X-Authority-Analysis: v=2.4 cv=B/G0EetM c=1 sm=1 tr=0 ts=69661036 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=2GWnp8WPBQcrnFXcpKkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: NkIULx0mv4wXK1AWmYm9v9NPy2OZGqmt
X-Proofpoint-ORIG-GUID: NkIULx0mv4wXK1AWmYm9v9NPy2OZGqmt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OSBTYWx0ZWRfXyrRLM2q/6LlP
 iSktoGBoqmSO4Kj5HEsgWatdZ/q9MOqGNYvvZGok50maJCAOEVSh00hEC7hnWqCcloDa9CxeWgo
 lqvPNAikbUrB6p9MVeTGep6fb99LCfH0Sb7Kk8pxYQvH9FRCdI5No6ZlIK1Yfr/SQcZ+lEFOndc
 2KHyPGKsMCVGtmDIM6yZ/MXZttm5dj6cRos19Dcz8GTM2PoX7s7lBv523GffYwjJmvF+Ocru3HQ
 q2wEsFAcqrtZCBXN/007x1bs67i+n6PV+FeK7APKdlcel/MO2/TdzM9jCRn4/U18f2HWc7klyrH
 XgRPupjXEYcFYNYIlcykFXzEoZvHgeYHs8ePmJIhLG3PttqRiBS51Pd1k4RpfA01vhaL8w3sTwd
 UHa323qHtHxqs5Hyku8CHHeuc0LR3uI5WZR7NXQNkFTvY4dYvOA4hLzCG/F78bogwtDiNZykQgE
 OOJe1S8aYtqwC3qBZMw==

On Tue, Jan 13, 2026 at 08:30:51AM +0300, Dan Carpenter wrote:
> On Mon, Jan 12, 2026 at 04:06:12PM -0800, Dave Hansen wrote:
> > +As with all contributions, individual maintainers have discretion to
> > +choose how they handle the contribution. For example, they might:
> > +
> > + - Treat it just like any other contribution.
> > + - Reject it outright.
> > + - Treat the contribution specially like reviewing with extra scrutiny,
> > +   or at a lower priority than human-generated content.
> > + - Suggest a better prompt instead of suggesting specific code changes.
> > + - Ask for some other special steps, like asking the contributor to
> > +   elaborate on how the tool or model was trained.
> > + - Ask the submitter to explain in more detail about the contribution
> > +   so that the maintainer can be assured that the submitter fully
> > +   understands how the code works.
> > +
> > +If tools permit you to generate a contribution automatically, expect
> > +additional scrutiny in proportion to how much of it was generated.
> > +
> > +As with the output of any tooling, the result may be incorrect or
> > +inappropriate. You are expected to understand and to be able to defend
> > +everything you submit. If you are unable to do so, then do not submit
> > +the resulting changes.
> > +
> > +If you do so anyway, maintainers are entitled to reject your series
> > +without detailed review.
>
> Argh... Flip.  In context, that sounds even more sinister and
> threatening than my over the top proposal.  We have to "defend"
> everything?  "If you do so anyway" sounds like we're jumping to a
> "per my last email" from the get go.  What about:

I disagree entirely - you have to be able to understand what you submit and
defend it in code review this is absolutely standard stuff for _any_ kernel
submission whether tool-assisted or not.

I don't think there's anything sinister there at all, and I think it's a
really good way of _clearly_ communicating the fundamental requirements
here.

>
> If tools permit you to generate a contribution automatically, expect
> additional scrutiny in proportion to how much of it was generated.
>
> Every kernel patch needs careful review from multiple people.  Please,

OK so now you're contradicting the key point that we can reject slop out of
hand, which is deeply counterproductive.

A guy sends 500 tool-generated patches and now _according to the doc_ it
needs _careful_ review from _multiple_ people? No.

I also think this is stepping outside tooling documentation and essentially
asserting things about kernel review in general that is really out of scope
here.

> don't start the public review process until after you have carefully
> reviewed the patches yourself.  If you don't have the necessary

A useless person will 'review' it in advance without issue.

Requiring _understanding_ is a lot clearer I think.

> expertise to review kernel code, consider asking for help first before
> sending them to the main list.

Please no, maintainers have enough to do :)

If you don't understand and, if a maintainer asks questions, can't defend
what you've done, just don't send it at all. Simple, easy, clear.

>
> Ideally, patches would be tested but we understand that that's not
> always possible.  Be transparent about how confident we can be that the

This is again stating some kind of policy that's very off-topic here.

> changes don't introduce new problems and how they have been tested.

This is actually bad - you're saying it's ok to send whatever, as long as
you're transparent about how confident you are? Perhaps a clueless person
is very confident the tooling in question got it right?

Again I feel requiring understanding is a clearer criteria here.

>
> Bug reports especially are very welcome.  Bug reports are more likely
> to be dealt with if they can be tied to the individual commit which
> introduced them.  With new kinds of warnings, it is better to send
> a few at a time at the start to see if they are a real issue or how
> they can be improved.

Again this feels very much out of scope.

Overall your suggested change undermines the purpose of suggested addition
- to _emphasise_ that we don't want nonsense submissions and to state this
in _clear_ terms.

I get where you're coming from, but I don't think there is any sinister
undertone here - it's completely standard in kernel review for people to
challenge what you've done and for you to need to be able to defend it.

It doesn't imply aggression requiring defence or something like this, but
rather very clearly setting some extremely minimal, sensible, ground rules.

>
> regards,
> dan carpenter
>

Cheers, Lorenzo
