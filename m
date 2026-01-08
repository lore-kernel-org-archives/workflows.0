Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3682443C055;
	Thu,  8 Jan 2026 11:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767873272; cv=fail; b=Itl61d2WwnSYKfcf+qkPnwEa+Rq91ACVpQfmSN1gcHOFSzmIJQwKDCxRAr5zUu5y2Ov24ZA+9jH7cnXhRDiPxOoJTrmU0QetjQfG7ZubgORY49096NVrC8duI9nA0CJtHeig82N4YEvefzQKMzAiDYHteAKsLVCHiQhVS8UVFjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767873272; c=relaxed/simple;
	bh=fEjhGVpDZe1ebUFKi91YHNgvtHkPHnJIdaFheXuwyr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AlT6IYJaFYniGB0QhKtFj0j9So5qG8LdcE5kWPrj3QHS/5qVOFIwz1Dqs7Ox4BcadgibYG16klP33dgWyDpiiO7MFE6Vtw4Ux6Gdou1Q0wzkZMhTV7MIRqXDkXKxzQcnTMKImZddCFzNA1goKj83PUXPFYoZN7J7A5RQdEbC16A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dboYXdPM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s+hV6lYT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dboYXdPM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s+hV6lYT"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Al2o9139324;
	Thu, 8 Jan 2026 11:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=fEjhGVpDZe1ebUFKi91YHNgvtHkPHnJIdaFheXuwyr8=; b=
	dboYXdPMZFQ2A3KjmU3Tp3ddA4vwNfoqsu7dkDHzgSwHymbLBe0mY/spSq76HCLR
	a5JWeO69iF81V98hsX7MJzt9iiQ/qyxDLgBBO5kEbsMTv60VA8wfOPwHtVa2zYYU
	9mH6pGZt26hi4lbwGbhKCxPQK9JLFMpoezr8lorivPd1V4ZavJ1xMkbvn/oYeWB1
	93sGf1NKVP0vJ/28WY38pFO8ZJ/AMqS7dP+KaBaH8HGXgOaUb+NJJwZ7F2dxmes0
	wKOOpYv9/fjAo/oq0U1Lf8F3WVHQy5jcPQHyAv6gKEs+/vwrbbMzxwfQVW4e+Z6p
	DCxZ5OyqFAbonJ4uVHRWiw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjaxv02ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 11:54:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608AIp01034048;
	Thu, 8 Jan 2026 11:53:59 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjb0a0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 11:53:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nY3V+6H18lhGN0273Ig/SifvfkKlxE8jwL7NVqnTzqiwqd6R9B8g3TDeDzTVeMtn59oGrXmbog/TWu0HwKeedWuTG64lv4uH93tApkKerXiLwOXfU0dONHSgmKHI8xI3Tehbo/2WojYmpOK0x008IxogjQ+4TPS0INYUmXjVEnoLKDFTvb5AHOTNRmBVnCeiJTkQkJg++f4aj1VWC/a4hRbbTFYEz1GpkWMGz9tVrLqzqdXKKSV98TI5Xa/7uCbTQ2GULyw6vrXZLQfW0NkxwCGqcrFfNEQnl03ugtqO+mMKIExgxHbGZta1Cy9p0l6cT3nSIdER3W4T2RgRvOc1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEjhGVpDZe1ebUFKi91YHNgvtHkPHnJIdaFheXuwyr8=;
 b=wAGqiQPcOhrqBTeScn9L3OxKZJ9odB3CHOTbflWNXJy6F+Bmct5agwylT9TxPlQgCAPR+tVJ/1IkSkjZI79dvp/VbR52R/15VeN87qkozYozTbcoVb2HXU31DG64MsP+YRrX8Uzsojp/TAl2rlJOEzR2U+N5YRnKJ86A+4i7lwQiH87asFB0813XWzG0/nm/5MzG7BMalvT9JzmKqdZQzPc8FxM0IVX+8w93NDf3uKzG45sOeUi087p84Qbl1XHvJHSBBieLysPt5JNomPuij5RHiI017GGHjWkKhbywMJ716aVdjvznw6zGNuuqszNGUBgR70hxAkrpowHzpU3JBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEjhGVpDZe1ebUFKi91YHNgvtHkPHnJIdaFheXuwyr8=;
 b=s+hV6lYThbYpv0VdyITPkU3UnTes7gSKnC2BfFUN15v1yVkeuTf2bL1hPgueb2niD6vQqnMBTkGHHRUzerzTaDxgVv5k75m6JDld6mQjNvAkEOjQqPNZX88/eRuPq1dBBeJKR7+eKHlCH9ibYaNiIFGOtYDd6s+tZ8PpH0A+5pc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB7113.namprd10.prod.outlook.com (2603:10b6:208:3fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 11:53:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 11:53:56 +0000
Date: Thu, 8 Jan 2026 11:53:59 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: dan.j.williams@intel.com, Dave Hansen <dave@sr71.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        NeilBrown <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>,
        Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
        ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <c9059fe3-24da-4ad5-b098-696040c80122@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <695ef146d651b_4b7a1002a@dwillia2-mobl4.notmuch>
 <12d910d5-0937-4aba-976c-9872289d21a4@lucifer.local>
 <CANiq72nmAw0sZZHJfSoHOZ5rXgoi7O4kETASp2F62XyALqZ8gA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nmAw0sZZHJfSoHOZ5rXgoi7O4kETASp2F62XyALqZ8gA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0519.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 403b9cae-dc08-40d6-6097-08de4eac9a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dm1zRTIwYXJjbjR4cldKUnk1V01tMkQrNldZS3A4ZGQ5QnhrSWtaODlOSW9h?=
 =?utf-8?B?bUYvU3V4aVFOQ3VHNG83dnhuUmNlcVYvWS85YmFTMUZ3aTJpSm9qdEJrZmNi?=
 =?utf-8?B?dlRidnpQeGRpdFdPSWFSbXYxTUdjaHdBeWtzTTNYSlF1c0V0NVpKdEhXT3Fl?=
 =?utf-8?B?MGNNMi9nenUvbzZsSnBUSndsM1p1WVIzTjEwN3VaZ0toTW5DWi9nYXpGR3B4?=
 =?utf-8?B?b1pqa25yT0ZiYVk1ZHh5TS94MFhtSHlEcVNaM3YvS1NvNGxNRi96OUxlV2p1?=
 =?utf-8?B?ZTBmWXJucHpMbGpPRndweHErWWhJZHFhcHhMbHpiS0U1M1kwWGRwUFZreGhj?=
 =?utf-8?B?aVFaU2U2dytPWmdLaXllRlk0MWorZkZZczA5eko4dGV2RWtBYmpVYmh2anR1?=
 =?utf-8?B?bjJacTVRNHdJL0c4L2hpREx2ODlsYUk3VnAzelI2cE1wL0RzeW9CUTc5WDVO?=
 =?utf-8?B?VWNJM3JxdXQvNlBPWmJrL3RKaUtscldIOVlVeG93eGkyb1pkSlJMbGRHaCtD?=
 =?utf-8?B?ekUzR0xSQzlwUlllUHBDMDZMdHFFQytTQStWQ3lFcEVmbW1uMFlNUStwQi8v?=
 =?utf-8?B?NkRTcUxHbGNmZXNEaEgrNUZjV2g1Z1A3bmMyZUlMb3FCeEY4TWhLS2U0eUZ3?=
 =?utf-8?B?TFZRb093RmVwV256OEUwZTc1ekcyNWFJTEI1RTN4OU5lU3dlVDk3RzdRN3NF?=
 =?utf-8?B?L2g0dnVyYUN2OFFOd3BUcHJmbHVEVERTTzJaNmtWZTNISkZpUUgwMmhSdlBX?=
 =?utf-8?B?aTFWT25GeFRacGt1RjY1T3FFdkhCYkdxZ3A1ZnlXWjAvYUxGdkNVM2c3Wmcx?=
 =?utf-8?B?YjFlWEJHVWdGb3QwSG92U21hOVhGQlJKeFFVc2ltcGVYUUNTZmJoRU9VakZ6?=
 =?utf-8?B?MXAzOUQ3WURHYkN5M1NaT1l3TEQyWFR6ZlFkaW1RU3dvTVlUem9rckc2OW90?=
 =?utf-8?B?Tlg3ZUJNS3VHY0IydGtWVlVveDRCbVhDZEZubUY0cHR6YWVhT29VUC9LMVBK?=
 =?utf-8?B?eWZKUHV2cHJYMlBFVENhUFNta0xUbmVVMUNmS1U5S2hid0RacGRhT3N1RUt3?=
 =?utf-8?B?ektsWnRVdG1kdisxMVI2MjZWMlcwenRXK3lSaWtoeGIwQ3pLRFo2dy9sMWRn?=
 =?utf-8?B?SktSUW9HZkFYaUp0dER6dFFxV0tWUjVMUkdOa081bWFYMjFpZEdNbmZ1ZC9L?=
 =?utf-8?B?Q1ZPa0JKNWZ3UmFSN0hiMFFiOXRTbWdzOUZ4VFZrN1JHL0ZFUzUwd3RxSHZQ?=
 =?utf-8?B?bmdSTHFLV3NQMjJzUE1ibURYU3BuR2d0SEI4LysybVZ2dVJWTHRtWUJrYjlM?=
 =?utf-8?B?RzB1VjVxcmhLOWdNcWdvanA4TjAvZmxNY29sRHR4T3YvckVUMVpiUlQzbWdq?=
 =?utf-8?B?MTMvUmVwa0JENG1yQ3F6Q2U5dnB0SVJOcEFQRnRyQ1Nnck5aQ3pINEdlM3F4?=
 =?utf-8?B?akZMN0VYa0pmUG9SRFZ3N1N2d25nREpTRzVoc3JvK3dGODZXeEhxQUVxQzN6?=
 =?utf-8?B?ZXFDU0pUcFhJcDVIdWtRZWtrT0JJWk9VdkpXSCtVenNQYURUeXlzZ3hORm10?=
 =?utf-8?B?QlZNVU9BMXczRHFlUGlUKzFwbTh5dU1YS1VkdlB4MkcwMHl3eWI2RmluYm5B?=
 =?utf-8?B?UTlHRy9lWnpIcDV2c3o0eU1CbTNEL2oxVUpRSGpzZFE0MXVROWR1U2VrNEdn?=
 =?utf-8?B?djM2Z0lzbHN0Z0tUL3h6U0Q3UHYrb3pvbDBEOGhkQjJrWGVHWHN2cUpOVWZL?=
 =?utf-8?B?dGhNcjhHOTA3Q3FYdExFVjZodk1BM0hEa3NhVHpGTkRIUmVjd0k1eXVVYnl6?=
 =?utf-8?B?dThmWTltVXdwMHAvR2t4OVFYcU9md2RMbUNTOGpGS0o3VHJZeHRGdHJBam1o?=
 =?utf-8?B?dzdZTG01djg2Ti85ZGNqTE5UTlhHN1JucGlnUlE2SGE0N21LQUlFTEhaSkVY?=
 =?utf-8?Q?HCuYox6YjVW7QGHejZdVu4mUGJGZH9N0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXcyeEYyais5TTJjdmF1Qm14L2UwMjQzK0dTTVAvVDNqLytUNDBPcE53bkFO?=
 =?utf-8?B?Ti9iRmhaWHpqRi9KNVMwcWpxbmtGakpkYXl5Tmk4Wk1DK01rcTJVV0hiZzcw?=
 =?utf-8?B?RVBoVlZFODY3WWNickF6RHQ3cnlLSWpxWFRSa0MxRDhCUW5QRWhDK3pTNVor?=
 =?utf-8?B?aDdXWjNuamlQejR6YTlPT2lLTmdIMzVoVW9ZSkl2NkhjT3E1eUE3MHFScHhZ?=
 =?utf-8?B?R0dTb0RlYkxiSElWTytVQlREUS9SUjc5YjJiWXBwNGZjYjNhQ3U0Sy9aOWZK?=
 =?utf-8?B?NUlzMTlRSDZUcEhCWDRJVmQyTnF6Wkl5aksvUEVJM0pjTmJLNGEvbWNMeEIy?=
 =?utf-8?B?S1RVOTV5eEIvTUdVRHh3ZExZaE9SUGt5WUxrTWZkdlV0MStXK1NYYWt1RG5E?=
 =?utf-8?B?OWlzS1NiUUs2R3N1dzFxTHlwM2p1QmFHZ1ZtdlVGditoNDZGUXh6bERnMjBi?=
 =?utf-8?B?SEJXNzdtRG1XdWdPTDA4V0svS082OU9MNEtiZmx2M1RINlpwNmRrNThIUlRF?=
 =?utf-8?B?dXhVVGc5SkE1cVlpaXIvQnd6aGhmMDNTd2NENlcwVlRsYWVHcDVJVnAyc3VE?=
 =?utf-8?B?TG5QQ3pTdjMzRDB4amEyc0Fvc2IrZ2Zaa2tqQkZLOG10bTdrOHZlNUZCMTlk?=
 =?utf-8?B?YmdZcStMdm5lOXVhRkhvN1p0TjZ3UzJOV010ZGpJN2IzeStXOEZQVllTcGdU?=
 =?utf-8?B?NzFuaWhjNWJQYXRBVE1FV0ZzMHgxdXMwcnRTdmNKQWlxWC9EdkphR3hMcTN2?=
 =?utf-8?B?aTIyZFlwcTZOY1lNUERpN3E1YkRnRi9XMjZQZU81Z1NhNWtLZUhscGRqRXZr?=
 =?utf-8?B?RFJuZENnUE9STytuZTUyT2paZCtHZzZoM1R4QzZtTTgvRUpXVHpMT21kOTY0?=
 =?utf-8?B?ZW9keDNCK0ZkdXRkNDQvMWhaRVU3aFlvKzN5dXlTQlRpNWw0K0l5d3FvT2lx?=
 =?utf-8?B?QUQwdmoxbmM3Nzd1TzRKeUUrTmRnTThJdldzUmIrRGprdlpGQTBrTm1rSnlF?=
 =?utf-8?B?OWdUVGg2WUhMdXRiUGdPVk1pQWVjN3cvdVhUaDFKT01DYUFCamNrSEVZQzhF?=
 =?utf-8?B?NmdaZjI2OGM4QWQwNlA0ZXZtVjE2NkQrNUVFM1ZLcDNkNng1WEdWUEhtT0Fz?=
 =?utf-8?B?YXBPVTVNM2hjR3BKV200ZW1oZCtUMDZPT2xjUzZ5V0sxeTNtQXdRK0xGRDZV?=
 =?utf-8?B?VmN3RU9ORDc5YnZadHJsbWZmNzBFeFpjZkViTDljTU1HVWxrbHZjN3BIdlV3?=
 =?utf-8?B?YWsxY0hRRnlnZE5sTTNNNEVKS0NFYU96aFBuSG1QVmhOa3crYW1Ganl4VmZj?=
 =?utf-8?B?YlZuL0JOYjdmeCtjTytKNlAzMklqcktUUFk2d3Q0MS9HSkpRVE9NUWtSRVRa?=
 =?utf-8?B?eTRzUndFaTRURlNleU04d0JQcFpJT2tacXZYWDNzeTVrVGp6NjhxejhicUl3?=
 =?utf-8?B?dDVoQnNmWitQTjI0ckMxODRRRGczSHRta0JRQWt0MGhvOC9wWVVNdnZCaVFN?=
 =?utf-8?B?REVJY0swRjRxY00xSkVEbzZXZVFoekIxQnBhb2NMU25QZk1idXFBdjUzell0?=
 =?utf-8?B?ZnRVUWhDUldVK1dZOW00eGhPUHlUYVRQWW5XNXhQeFRiWUs5U2lKMDgxUHpD?=
 =?utf-8?B?MUdTUGpzZXVsaktTUHFaYVE1UWRydXVIV21jZU05OWRaYk9xMU9lTW9UVks2?=
 =?utf-8?B?dkhxSDBhYmt5cnl5WFVpdmJVaUVIMDFnYkdDOEVKZ2F1UXRyamptUzJlQWtq?=
 =?utf-8?B?YmVWaXp5eFl4V3VneGFOVHJUeGYwWmxqSjFCeWpaRnZPK1RzTEpGTTJTWXFZ?=
 =?utf-8?B?MmtYQUhWNlVTNlV6S3FFZzdhK0lXaW9ERDVZdHRsYk5NSXJxTXdpS1Avb1F0?=
 =?utf-8?B?Wk5CeldTK0N1RERoLzVKTzRKbURuWk9xb0txcE9zelE0c1RWMEYxa0tmbzV1?=
 =?utf-8?B?bWpyM2xDNUJ6OCtBbkw0T3NLa0M3U0FaVEFsZ2tKaytMV2dETHV5ei9mRWxh?=
 =?utf-8?B?WVZNRElzOTlSTG4wTkJBcVF3cENUSzN3RUJzamxJQ1hEMkowRVUxVWtUYzNj?=
 =?utf-8?B?SWZqSEtDVU00VFpld3BmNWNoUm1oVE5aOTkyYmlPbENiR0pJZWxOenFUdmF1?=
 =?utf-8?B?SDBYei9GYmJUWm9WZUh1bHNHbUovYjl0VVpSZFY5S0p2TlY2K3BUSWtCVDVo?=
 =?utf-8?B?M3B6UnVNUm91Q3h6RUlvZDR0QTFaTEJlTUpPODU5STNLMDBYVi96cStVWnJj?=
 =?utf-8?B?Z3dGOFZQamZLcXBCMFRJek5xNHc1OXBaRVlXMUFzbndoeVpVOW5WMjc5aEZ3?=
 =?utf-8?B?ZysxUlpYUkFkajRSSTNaSDdkdVQyaXRaeURuWFBOVlpBNWJHWmIrais0UjVm?=
 =?utf-8?Q?hMitxveT44LdDOSk=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nRmdJZoLxZCp7Yrw+vUQLvCGQOO/epIVuC3xDjd8u4MvuhugqooC5JZL43G21twY/eEk1ejC0IUBYCUoX5FQDKI9GkCBnAaZEDm4G3067q2CgGSP+J4HERr0xY/w3J23Zh+su/MN80xiwgRuQdGZIGTrmYYqc3EvdPlXWfU01N0aabFyn1zuzj9sZiaVet2Ok2p5Xckku1AF+UTOOnk0SNi6L+QveUV8CAufqQsbFsqxtbEhPKPK2HtmuYpGa6SnDWVLpXVpPHK9YkAr/obNETsAcVSSwG+hmQXtFONwflA4ytM2QlmRS7JGi7dp2KUPRy4UGCPVZ0VsYbALJGoQFGadxA65wWzdhN7JsLBAfIeUTGGUOMNWJUpjb9OuCWb0zgHyO3EJY/NAu2O29IUf1t146mSZGvL8RKFUGj1pI8DnJ4aH7N2mL5r8CF17W06HUR4mL5vZWl9p2FBQcGP6gMhCcQ+5DgHz2TUxgKd3ovGafiKqsEKWCBXzuBj8hyItJ2xBfHZMJKiaKWRWC6nHsNDukbk4ByJnjDujKa44TkNeQo/es/sIRiuBkRzJ9nFDjz7M6bkJUM4K9lr56hVR5L2RdW5yYPTjh/npxYZtcl8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403b9cae-dc08-40d6-6097-08de4eac9a4c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 11:53:56.5038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eb/PsT/B84kHefa7OXiwqCZOiN8hZOTw5/dFGFnyyiVmvPocB+E53MLWhwawyixVzA7kGcm+lv9hg8ZOjRQICu7xWq4TR8E88Y0ru7iOYm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601080082
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=695f9ad8 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=0UKUDYQ9IwHjiTx314kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5zbo_gyJeXxi42R3M86KWreIBQjMJahY
X-Proofpoint-ORIG-GUID: 5zbo_gyJeXxi42R3M86KWreIBQjMJahY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA4MSBTYWx0ZWRfX3QCz8wgsqE35
 J8mZ4Gzi1jXBLsTWmaHy/wF/R2u/JMCciZ408kiGBVgBKoImuz1HfZVuaQLi3E4eZbTYp5lLcq2
 b2WGjhYJjnIwiMhk+u813qgdDrelO/SA302c/WWuvps69x05gkzh5kpmV7YhyhH2Vh8U5371XaT
 JVCaoYvAdlepRdfw5fiHs6SNrsRtmMFWeENss/yWe7X23RXytrS3UxvzvoSSY3fa3rLN0xfru2/
 WCdl0mAoX3A/tD5LbUAm0vpLSNZJDROFjr0NBBPFOjF+tQh8T/P5SwEQ6IOtnHGiH1xTKb2RMTZ
 EFa60fshVKnCWOtj979PUaDelQP/qn3ZnLWwwI2SJxBPlIeaziIK+ajIiqMtte2YsyJ+Ay1J6Kv
 W5GykCBDnMjnnv+hT9MlRWi1/Li+WK3So/nsbG9WZiTVoRufgDM/2bqzKLcutms1dIK+fqlOSJ8
 X4WjHLwbaLBg4UyTnRQ==

On Thu, Jan 08, 2026 at 12:43:50PM +0100, Miguel Ojeda wrote:
> On Thu, Jan 8, 2026 at 11:29 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > I really don't think it is the case that maintainers can simplly dismiss an
> > entire series like that.
>
> I think Dan was referring to all kinds of series, i.e. maintainers
> have leeway to reject proposals, whether they are big or small and
> whether they are new features or cleanups.

Sure, but I would say it's reasonable that there's a norm in place that
rejecting series outright that aren't _trivially_ dismissable is bad if no
technical objection is given right?

The issue with LLMs is you can generate entirely novel series that aren't
so trivially dimissible but could very well have other signals to hand
e.g. brand new person, never done any kernel work before, sends a bunch of
series at once etc.

So maybe it's worth highlighting this?

>
> After all, the project works by trusting maintainers to do the right
> thing (i.e. the best they can with the information and time at their
> disposal), but sometimes there may not be concrete technical reasons.
>
> For instance, sometimes it is just a matter of bandwidth -- if
> maintainers cannot maintain the code, and no one (that is trusted to
> some degree) is willing to do so, then it would be a bad idea to take
> the code anyway, even if the feature is great, whether LLM-generated
> or not.

Haha well mm does just merge stuff even if there isn't review capacity :)
which I am arguing against presently as a very silly (and unworkable) thing
to do. But that's another debate...

>
> That is also why it is often said that it is a good idea to contact
> maintainers/community before developing completely a new feature etc.
> etc.

Yes, and we've seen in mm people come to the commnuity with a huge new
patchset that is rejected.

But it almost inevitably has _technical feedback_ as part of that reject
that took time, something that the asymmetry of slop wouldn't permit so
cleraly.

>
> So if a subsystem suddenly starts to get an onslaught of series like
> you warn about, then they cannot be expected to review and give
> technical feedback to everything, and they will need to prioritize
> somehow (e.g. fixes), or try to get more maintainers, or raise the
> issue in ksummit, etc.

Right, but we also need to be able to take the sensible approach of simply
not tolerating it.

I mean if the contention is we already in effect can do this, then surely
it's no harm to provide emphasis in the document no?

>
> At least, that is my take, i.e. we need to allow maintainers to adjust
> as things come. And, of course, as a community, we can always reassess
> as conditions change.

See my other point about the tail wags the dog effect when an official
kernel policy document appears to say 'open to business for LLMs'.

Linus has already been quoted in the press I believe with his 'LLMs are
just like any other tool'.

I wish we didn't have to think about that, but we do.

Anyway I'm submitting my suggested delta shortly. It's really not all that
much different from the rest, just putting some emphasis on the slop
aspect.

>
> Cheers,
> Miguel

Thanks, Lorenzo
