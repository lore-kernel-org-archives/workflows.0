Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1743E3BB48;
	Tue,  6 Jan 2026 16:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767717753; cv=fail; b=lPZR1uR2VnRHrNf8zmUpxCk0hj+FS3mmtaLhRMKN90cxTt/b6EGRCEb+iLrawni59js4VP1o+mWOdB79xtGnSWOKdqliUOAx8qc8l2xEtrunqP8N7jUbFOXe+r5YOT9rn4tAmTIZrNPcnlwwch8sw6DySpKmmsuPtz1GTC7adCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767717753; c=relaxed/simple;
	bh=1CZ8xpP1fcJrruvqgx0iHC0vV4AOhKaF2Q2NWB89Pd0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=csrQ1d6ovzG3HZ7D15q9OERaYM9mqtyOMAERE+KphF6Y+pLEKwpbebxEOWx41coAnKlLqQ+WuUf5HOUs8MoHv8FuSl2tuHjhf0TJ2v7qqjxeNpqalkMCqT33JQWWNmT8XxXu/oPl9urHtlFX5dGIu52nRsqovoBbstSfh8NOU9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YUKlYant; arc=fail smtp.client-ip=52.101.56.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YUKlYant"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBlTyV4uJSBiFwh6lPu5iXlvqVmRIofq8olCPJ9rkp6KDQNwleP+2cXVQjNyxCjiliFJnlsLA6jwjqAexWSip3wYQTQMp00LC+LnpPH2LG7G2UjLCQ3RXWup7+T3HF7QQxdkehp1S5Vqsn5R4pt1qyBhI1ddRKIb++6QjFgzctIRYQy0+qjBKcoVZrTwVBjJiYM+C2YP9qJKN6TbUIHsNPVMMafeKG5CnLTUmi1Ok0cdPqO0qkwtP5fKgMPJL96fo1ZSKYqO6ECoqqX0KQc8jtHlhFv5knD3NtAqZivLVt/JeNxMZ8rzXue5wdwxT3yGCvmvfTUMBN/qqshM7DD16w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E1Ymv9z1mGJXiWDrKZZhb2LycA51b48Pj9W/ewj4vk=;
 b=YmqJ504tk3HQ2HGSptmUsgk2B+iEFRbYTTET+/T8fPudz7Tn+e0bjXyYfH7KwPNtQrLN+2VKz3sKGrX6+v1aTD+cr4tVrHX6n0XE/YEUArUvY3zYBOu4u+plXLDpHg91c85onMDzKxgbXS7ub7NWG5+q+fAiJnFU148AxLgOJy2M/HBUgimgy4tRsF8uiNr/K9M3A+leTPy0aVfalIBXLdTaU19xoBlU2CPuAs3X3OHD7t3O6MmAPdZLhgjLOXPXdVbZE9C8Lyb9It7BMJOCeO8wiz4WQSd3ZzkqXDUZm1J3fy2OgsmN2+cEjs1//Aap7fYAdud6hruGV+FMnicJjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E1Ymv9z1mGJXiWDrKZZhb2LycA51b48Pj9W/ewj4vk=;
 b=YUKlYantHPkfZmtEk9+HObxkB0aJ85PQ8wMPufaqzaMtXfEV36LTJu5h2fPC6J6otr79DxNUUx6V+z0gbvrHhrLyESjteypoEGcSoL/bHrzfX5etJKsw7EwPETUe1D4N8DZhzS9ZmzqJREX2JFCTc1T/x8EbQGTA1gb5ZnPt1N5VTLNROR5nQ8n64oZSQmgjW7XYWwUMPw0kytfNx7JRtjazboxB3B3cYR/e4yD9TetOL4H5VbcNaujYz4EfLKBqHCe4PuIEwWs26zpvYuMyHPJohKNZbFNpWV1F7duTLZk6McY9d9uklb2NeAQKmsq60MrERvzqvpDIT5gRlSe1Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA0PR12MB7003.namprd12.prod.outlook.com (2603:10b6:806:2c0::10)
 by MN0PR12MB6078.namprd12.prod.outlook.com (2603:10b6:208:3ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 16:42:28 +0000
Received: from SA0PR12MB7003.namprd12.prod.outlook.com
 ([fe80::4099:396e:1f40:169b]) by SA0PR12MB7003.namprd12.prod.outlook.com
 ([fe80::4099:396e:1f40:169b%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 16:42:28 +0000
Message-ID: <ce4af5ab-5dcf-4b67-b1af-f2288797e342@nvidia.com>
Date: Tue, 6 Jan 2026 18:42:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: process: email-client: add Thunderbird "Toggle
 Line Wrap" extension
To: Vincent Mailhol <mailhol@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sotir Danailov <sndanailov@gmail.com>,
 =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>,
 Paul McQuade <paulmcquad@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
From: Gal Pressman <gal@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0007.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::7)
 To SA0PR12MB7003.namprd12.prod.outlook.com (2603:10b6:806:2c0::10)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7003:EE_|MN0PR12MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: b69d0054-c1ad-4071-b66c-08de4d429428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0ZLajIrZE1SaDBSZm1VY0Y5SWlDZXNTWCtCOVNtQmxNYnZGRjlMSW01amFY?=
 =?utf-8?B?TTZyODYzV2NNbmdJbzdnb2FubWtIbjhkMVE4RWZudCtBMWZrZ3FIMUhQRng3?=
 =?utf-8?B?RDhBcEx5T1hud1lFS20wTENNTklxeENnR1g1MTNtdDRxOHFiRjBhZFJKQ1Vx?=
 =?utf-8?B?eU9NUFVnNTh3MVUveGFjcWoxZWZXZEh2bXBIQWhBdzhvNDRNQk80WDJkQVlZ?=
 =?utf-8?B?ck1ZVVNGeXVYTXErSTFpTk5JYTJYZmx1S2lJNkFiZU9MTEZoR0Q3Wkk5d2pO?=
 =?utf-8?B?WHYxTnRPQXRRQVA1RGh5RlA0UFZXWnhrQWRrekpFYkhCdGV3WXZ4WEd2amxM?=
 =?utf-8?B?WUFzWXVQL3ZGR05rS2lpRUppb3dHL0MvSFRJYmw2eksxbkZUWGRNZnM1NTFZ?=
 =?utf-8?B?WTE4a1lia1pkVlpiUTlwaTBqTXd5R2lsQUorckJiUGtaVmh6c1oxckhYMG1T?=
 =?utf-8?B?U3FmTFh1WW9LaDBxeWJDS2VUdkNwUllhcjVKNEpBUzB1dUgwaHpqZ29XTGxR?=
 =?utf-8?B?TmNONTZ1d1BlNWYyK1FhakJreG9WaTQ5RXo2QnJERFNPdU52dWg0RklnMEdy?=
 =?utf-8?B?eVRTMmNjRmJKWm1Rb3ZEbHBJQWt1RSt1YUdMZm1COTlwbUx4blROU0phSk1H?=
 =?utf-8?B?MXFIQ2paTjBoZk8xQnVkdDV6bDZKSVkzMVNncWNtMm9WSTM5VmNwQ2tDZUNx?=
 =?utf-8?B?VUpTa3VrRlJDdzg3bm44cU5wQUFoWDVoV3RncmRFNVdoMitRQ1JUQWw4dG55?=
 =?utf-8?B?dEQ2MXgrWEF1MGJQakt2ZTFkSHM5YmJ3My9LZVV1NmZlZWNhZlZJNkxzMHN3?=
 =?utf-8?B?bSt4bVhNa3ZFZ1gydUxvcEd0NldwbmNFaWo1SjVnTUFsMHZXOGFUV1RxdVNV?=
 =?utf-8?B?bzZUYTkxcVFzeEpwNU5TZThMd3lYN05qUmo4Vi8rbE4yblZhZGZnRXlna2hC?=
 =?utf-8?B?a0IxL1p3T3A1NHJST1J6akdHV3RNTnNNUndLWjBTL1BJVjFhQ2puMHU2WGM2?=
 =?utf-8?B?RHhrUkdNeDkrYVo3UmI2a2hjdkhiTGtQNFB5eE9MTVRkbTFIYkdXYU0rbzIw?=
 =?utf-8?B?Rlc2K2dDbUhCRFd0QnFvUjlGU1U4djB2ckJheVdSaktQR0oweFp4aW1NU1Ra?=
 =?utf-8?B?ZXRNTFBoaG5wcGFYYjNVeWZ1NFRtMk10bHAyZVdZNG9oUFc5R3plb1U4Skt3?=
 =?utf-8?B?SGp5YXZCSXZKZ0FhWndqR3pLTTJaQ0dCUWdrT3hWby8za2s4d0dKZ0NXdEtz?=
 =?utf-8?B?TDJIdUpuZmV5cGtjOWkvbkFTajFnUzZ3dDlmc0xzYjR3Y2V0KzBZbU9kbHox?=
 =?utf-8?B?QVE2TFJ6bExBOFJRbUU3K0RIYThlb0J0VVJTaERXNE9QWE8vSC9waGtxcm5x?=
 =?utf-8?B?L24zZ0xLNGt3cnFYK1FkYkw1dlJHWjZqdVVYSXpEK2h3Wjk1OEFJUTljcDZy?=
 =?utf-8?B?WlFuUkR1MEk2VHBsSElDRkMzQXFEcTRzNG1CcU43VXRmQ21lYzErZlh2eTAz?=
 =?utf-8?B?b1NBVjY5bDFkeGN5Mk45aTJ0K1JFTDRLKzJ3bmZ4TWJUREFzc0R2SkdFNmJZ?=
 =?utf-8?B?Y1NMbEEvM1hieSt4aGsvMGhDSmlvRXBxbzE1NzZmSkFZRzhyREQ3ME8wTXNo?=
 =?utf-8?B?YlFreGQxbUU1VVBNcy9mbU8zQWFoZ1ZiTE9YdmhmRlE0RDlrVnJwU0loL0px?=
 =?utf-8?B?SDk3VThzMDU4RzZVMXdVZ0s2YTRqMEcyc0hUMEtlWWhvS2dxTEdvNUtFYWY3?=
 =?utf-8?B?enh3aldJc2N5UkhIc1pvWkFzK0xaQlkyVUVwZVlTeDFaWDI1WlVuSVNPcGVN?=
 =?utf-8?B?alhrWHl4aVZINVlmYnBRdzY4QVBxTENOZzFIbk9FL09YNXoxNy9mSTE1b05X?=
 =?utf-8?B?RnVlWU10dkY0c3cwYWM2OXlYcUVMUW8wUXJFQkUzTmVJMGUvZUsweERuNU9R?=
 =?utf-8?B?MDRzb0o3UGZwN3NJeFZQYVVkSWd1SytnYVgwZmtsQXFMNnFlYUFQeDdua3NW?=
 =?utf-8?B?eTFOS2c3MkZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB7003.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2cyTWJpeXkrY3M4N1FhUnRHUi9BcUJEdDMzNkhTeVIvSWpKZlEvKzZRUVpG?=
 =?utf-8?B?UjN3VzRVSm5TWlZtVmFnOXRMKzVPWVJEVVI0RWlNYW1KTmd2cEdlenhvZFBs?=
 =?utf-8?B?b0pqc1R2RytSRUpONFI5N1BtY1c4WFdSaW13bVNTY3F5ZEwvcy9JM3RmdUtq?=
 =?utf-8?B?blIyeklNdTZRaisxNkp1RHFQalEvOWhCbG82dXdCRFdxUUdpRU0zWnY1cjA4?=
 =?utf-8?B?NzdBUHVTamU1blE0ZnNzSGtnVXNFZ3BKTFk2ZGRQbkZxSDNJODhxZVlUWkdC?=
 =?utf-8?B?Y3lwVE9NNXlLUVZjN3gzTVdDa01rd2RCcUNod2tFYU03SWh0WXNtUEhaZXJX?=
 =?utf-8?B?by9lVVNHYmt6eE9Lc09VSkRTcFNrdlZUdjc1U0EyaGpIOWhpNkZqQ1ZrM2lN?=
 =?utf-8?B?UzBXMVNWWSs2a2E5VENrSVQ5V1RYYUV5ZUV0ejRTaXRvN1FteXZZZ2ptcllo?=
 =?utf-8?B?RnF3Qjcxd2dxYXFYRzNweklsZHlKWU1WQVp1ZWt6UlNmTVI0S2phOG1FeWhS?=
 =?utf-8?B?emlOMTh0bVQ5NDhPUmd1dXo1ZU8rSWZlcUNnVVk0NUEydS9VVDN2ekExTldI?=
 =?utf-8?B?QnM1R0xoUDJ0MlIrRmhVUGJkYTBzdkxvczc1WGQ1VVFNVFE4Q1B3N0t4K2ZU?=
 =?utf-8?B?N2dhb0dWV25LUFRZQWFJdWpncy83MHRqdU0wOGdZc21XLzM5M2QwOG9FZXhT?=
 =?utf-8?B?bFNMSlRwd2k2Rml4MmFtcjg2ZkRHRE9SKzhvYmRxUGp0Ri80bSs3Ny9qemJ2?=
 =?utf-8?B?ZzQyWGc2Vnp2U1FNRUJyY3djemZGSEFocHQvR3BNWUY1N3owV2tUbEFlQUFm?=
 =?utf-8?B?bW5qVzFuQk9ZOHpBYWc2NzFpUllDdTFNZWJuS0tSYWlJRnV6VERxcDZZcmtP?=
 =?utf-8?B?N2YzbWZoNGdBczBIOFc0SWlTRFVNalpTVTlXZ0V5K3dPcXdhdjQyUU5UTFBC?=
 =?utf-8?B?YytQTGlBajRoYTlPb0M0L2FKQnZreWo3MnNpOTdRVy96VzFvcGpldU9nWngw?=
 =?utf-8?B?dVJXcUNIdXE3bHpvaDRhQ0h0ZHVVcndBQTFFV3ZQd2oveXhIWXo0L01MVmFv?=
 =?utf-8?B?V0tRclVKMmtFT3g4VGl5S1pybFpVazVMWU5MTVR1bit4ais0MDFDdytRUnJt?=
 =?utf-8?B?UkRJWngzblNOaVh1OTJjMENSSlhXdUNFcGI0OXRXMU51ZEV5UC9rRGR0TjRo?=
 =?utf-8?B?dGRpNE5JRnBFeUlLby9lQXJHbWlRSWJ3VjBpd2lqbi9LNU53RC90RThuMkdO?=
 =?utf-8?B?Z3ZFcG1OSm52Zlo1d2JwSUZHVGVQekx5WGErSXRwSzRHbWNLQWRBYVl6c3pM?=
 =?utf-8?B?TjE4YjBuUXV0dXJLRkpzcVU2K084a2hVaG5DUHN6alBYTFNpSE9JSzJHVUFR?=
 =?utf-8?B?Um1lWEtHTndvU2ZFU1R3Ky9lVm9OSFo4OWhDL2dnT095VSt0NEJENmNOTWJV?=
 =?utf-8?B?bW5pOE0rYkQrWWhpWWRzd3NRcmZiQ2JDcU9UVENHcW93QzBrdnRzR1A5L3dI?=
 =?utf-8?B?alUxV205M3VlL3NQQmZoMDUzMDR1YzFiZ0JHTlN6S3lrZFlkMloyMWFKb2hO?=
 =?utf-8?B?cE5PekRlWkhJRlZua282WGNvc2tOY3N6dWRSZXN4cW8vMHFkZXBiWEowZFN3?=
 =?utf-8?B?RHo1WlhoSXV1ODdKN01Ld3BDTFp1WXVBalRXNXFrZVpmQ2xFWjViNTAvUnI2?=
 =?utf-8?B?MjBWUzBYUXc2bm0zTVdHdEVaVjJLZjU1c2hOSGNBc3crUmRaVWdTY3grTnJ3?=
 =?utf-8?B?UHIvUzhPaXE3eS80NExrQWZXcHExbmNid2tUZ3ZFeVF3NmQyNWRsaUZyTGNz?=
 =?utf-8?B?eUVid2FhelJpQ0pKOVZRUlE0NUVYNjYyQjNVRitpcG5VTEdzNmZDY2JaZUsr?=
 =?utf-8?B?TzZFSk9FZjkxZ0hIQlkxY3VlMjFmOHYwZXdJUXgvc2ptcExGWDJvQjY1anM3?=
 =?utf-8?B?YWczMDBXZlhNWSs5ZnAvem5RTldtSTc0WFpsdVhka3pRQmh1Uy8raElEMjRS?=
 =?utf-8?B?Z0VORUhUR0M2Ym9SZndyWjN6ckQrQ2RQVCs4dTBwUVI4N1E1U29lNUJZdXVD?=
 =?utf-8?B?SlVHZWlCWlFRY29JZ0pUTW1UQzJMR1BVOGdlbmZkWGdENVIrR1RJRHRFZm9s?=
 =?utf-8?B?Nmh4VU1kY2YvV2hlR1dwOVBHZnNIbUFVWnlMbUxkd2NaamFhbjdQVnNLbGhj?=
 =?utf-8?B?QUJlVldLSnIraE5kNjBwNUdtZThqbmw0cHN4Qmp2OWp6M3pFOTcwQ2lWL1li?=
 =?utf-8?B?OFM0bE9oWTlvRmRHeGJCbXIrV1F2cXFKT3lSZ3Z1RWhmRHVwNnBYYjgwbjVs?=
 =?utf-8?Q?CGhbamgDq1NZ/JAOHu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69d0054-c1ad-4071-b66c-08de4d429428
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7003.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 16:42:28.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ldLmLOtab/qJJhI2qnVL/i/lWJmaDaEbBC9qn8Mc7ebvTbFLKR52NZmmjQR7fep
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6078

On 26/12/2025 1:46, Vincent Mailhol wrote:
> While reading the git-format-patch manpages [1], I discovered the existence
> of the "Toggle Line Wrap" extension for Thunderbird which I found rather
> convenient.
> 
> Looking at the history, the ancestor of this extension was added to the
> documentation in commit e0e34e977a7c ("Documentation/email-clients.txt:
> update Thunderbird docs with wordwrap plugin") but then removed in commit
> f9a0974d3f70 ("Documentation: update thunderbird email client settings").
> 
> Extend the paragraph on Thunderbird's mailnews.wraplength register to
> mention the existence of the "Toggle Line Wrap" extension. The goal is not
> to create a war on what is the best option so make it clear that this is
> just an alternative.
> 
> [1] man git-format-patch -- §Thunderbird
> Link: https://git-scm.com/docs/git-format-patch#_thunderbird
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>

I also use this extension and find it useful, good to have it documented.
Reviewed-by: Gal Pressman <gal@nvidia.com>

Btw, there are some tricks for when you want to wrap parts of the mail,
and leave other parts unwrapped. Useful when drafting a reply that
contains code snippets.

I don't remember the exact steps, but if you know it then it's good to
have it in here as well :).
