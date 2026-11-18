Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985222;
	b=jfkYiX0cFMpNJcpegxtc7n5f3zM6GRH9W6PPti93dcg/ZwTBv9pGB8TKQKaxBEyDngWO
	 gIDNLX3ZNs0KXWm4hgVBqQrVCkdsIkoa5jBn6HviETzlww9tctYYNTeeAdWRCrsmDSzPL
	 4FT8cEsxaGWsVydaLBD9bAFMH7xcoqCrXYYzFttSGvQgJk4XH2b5PHj/8DLUqoWV+6xJ5
	 kgh0nG3hqMMjVHeOx3y1e9NCwtdOzhDfDXlx0y9vf73o+4EhRxtKNh18nNkRcHkxSCCI2
	 S7aaXLhGp/uV2xJLSuSx9EVQIUCC0F/snZOl9Akl8WBzFxkZMNJifoORlV+tA+EZGHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=0V4gHLbmmxLCmFwABtKMRTJRoH0Xzn0d+2gsbwvgOkM=;
	b=fgWqBjUmPevpmibcAupCpiiRJMXpTkJ1cCDWk1Lbbiy0l8wgC1sMPgxrfcSFXHJgJXmN
	 SwwrLZtz+tn+U4w7vmmmnCXTUuwbRHtZaGnWUiemD31XNJ7QTLBEgu5VjitPCc5Vw+ODd
	 s195v51tx23BU3gSniaYtw/wvVTPFPdn3Q67lq0A3YGDUi9BKnGMSl1ki8ccDoMxpJeyy
	 Fjq2h16iutfzfBv+ZPTIWloNYVcpAkyYzqVIPlPTGPIkcsKZQQ2mDLnz/DimnbQ7eXWlF
	 jdYI/uUIJjdDKwwBbV2wMqlb3fUqGQ8UQ2WtUA/lqxrZlgZxCsrWrefRZiK6YssyJqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=OVWGRyeF;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF591606A330
	for <workflows@vger.kernel.org>; Wed, 18 Nov 2026 07:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF591606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=OVWGRyeF
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so444990b3a.3
        for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 23:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794985213; x=1795590013; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0V4gHLbmmxLCmFwABtKMRTJRoH0Xzn0d+2gsbwvgOkM=;
        b=OVWGRyeFxxDRpNW7KWJCLbWei4gHffCAidQTaSERnk/N7Ey4ap+vKQB0LEUiBIxmKh
         xPGbw0lCTucgL3/rxvZ5Dy8y1+Y8avdQ+WZ+P8Gr9gr57tOAcMRfjNf5HxHhcIaHxBM4
         NGlrnqsJ1vP8UMeneSTEuJpOlXHqAZrkOG3Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985213; x=1795590013;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V4gHLbmmxLCmFwABtKMRTJRoH0Xzn0d+2gsbwvgOkM=;
        b=Axe6VjW1oQTam3J8zfPm4RYCNdayYCmzJgXfg9ZhTMxSI0u8punxYhzEp7AbEUsAwZ
         msjTfgbajBiA9JB8bbb4LbjcQ6V7pGaGgM2BBf7xrBRGYi9KiKJuZTdJfwLJDWgGGXaN
         eSe+Rvq8FCJqPEtdxSqYdWOsM4xJrlaStd04BJbkjLiYXr00SblzRg5uqVx/lXFTk+Ic
         ChJCF3gsIs1HHck7v17q+3mlN/5N+C3rQwhkyR0raN6/qAJxkCxhm7rIFLJ/CHbck1SC
         2Rtazldd3fUb5XX4FxJgpiKo8jjJhEHX4d5oH56o7IUCSbcCylCWrCGfgR7Cl+MMI7o9
         UijQ==
X-Forwarded-Encrypted: i=1; AL+hErFMjPj0mypyzADTK3RrQPXRug7zj3KY0hlWgy0rviA9Zufn/r6gKrrIU0QQGO9GL3x4nNu7zNQwGD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q7bcNQzBB/6ie3eMea7tRgGB7zjNptVHB0F84TI9jSB7vd9H+
	RIMJsxuCzMtcFl1Ke7rgD9HniIKEe3o+hdt3q7YYApKScG1sSJXJ4VjRxzVRKDxR1z0=
X-Gm-Gg: AYBFou1eCFBdhw8okXopk1bE9PoU38zHgakZmqr4LWqKSNum09uYF9kegJTm21110Fe
	Xj3ZRUI1X4uEeuo+A2qmz3tS2BJ7wHl1FP8LCSxjdiHMiovTMnIL82F0DJhPBVoo/eJ7MWW745c
	eimYM4tsY4uXjDzLJnJe9gpODdmDIiOitCSf7Oye3RyStcm9R2z6ySbobJ/pbSZv2giyqGBMHMH
	yRPpcfU00rR6q9/8eEefpY4fB8sd6JFLa36FK70HxVS7GVFfozf4zGvl9gLhb3lF1C6hnOD0n2q
	1fFd5NcoEiWX8n+/sOzSzvrSImOE0vXs0/YuSQuH7d8tJ7SA0XCIYRpjGNB8hJ8ZTiTc+x5xy9i
	fiWvqNK8Adqx+tMue+zHPyoqW3MeZCs1XOQaeR8d+C+NbiTUF0G6y6kOdgd52XfPDMdyx0Vk9Ur
	P6tcyq3afup2Y/w2qWjWEWOyFjflrj5rdp2AI8Qa5VMWUf2eJ1XCJJBlHduVqXzRb2RsG+KbkW1
	uF1wZ9GCSJzDA+zuBXGM/iBizoZ6P98iTNNTx8+9XCv5eu2E/CK9wFSNLkXSwWbDX4ShF7XJpVE
	ri7OxtBiaVtAIpWil8u4HIjbUUQ6v1Ssgsh+jqjkvFBl6EpCFicHDMc8ZhVbaMlApkO7n6X/UF7
	gffp7ADOM0Xf0hwq91My4Ncew27aQQUYACYLIpqT/xfHgappsflcJOvU8pwkjszG6m3PoTAAINr
	7ruxLyxHRMbiLHTGujFrtNyu9ihCNlQ2jbItY0qP27XpB4aZy+gGsGDzKJjbHwhiuY
X-Received: by 2002:a05:6a20:6a26:b0:3e1:8890:8400 with SMTP id adf61e73a8af0-3fe892fd632mr2082401637.15.1794985213105;
        Tue, 17 Nov 2026 23:00:13 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3c4bc20asm635004a12.27.2026.11.17.23.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:00:11 -0800 (PST)
Date: Tue, 17 Nov 2026 23:00:06 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Joerg Roedel <joerg.roedel@amd.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
	SPARSEMEM
In-Reply-To: <3C50E682-848F-4788-9238-923D5E292DEE@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
	<20261117120627.50601-6-songmuchun@bytedance.com>
	<avzsFxVqO27Vf4Db@chrisdown.name>
	<3C50E682-848F-4788-9238-923D5E292DEE@linux.dev>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <av1M9itGiTF1Akqi@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

Muchun Song writes:
>Mike's suggestion considerably simplifies the code, and early page_ext is
>only needed by optional debugging and instrumentation users. I would prefer
>to keep this approach.

You're probably right. But can I cheekily suggest something in the middle
perhaps? :-)

Given the zones are already set up before page_ext_alloc() runs, perhaps
you can pass the start of the node's ZONE_MOVABLE as max_addr to
memblock_alloc_try_nid() when the node has one. The general idea is:

     struct zone *movable = &NODE_DATA(nid)->node_zones[ZONE_MOVABLE];
     phys_addr_t max_addr = MEMBLOCK_ALLOC_ACCESSIBLE;

     if (!zone_is_empty(movable))
             max_addr = PFN_PHYS(movable->zone_start_pfn);
     addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
                                   max_addr, nid);
     if (!addr && max_addr != MEMBLOCK_ALLOC_ACCESSIBLE)
             addr = memblock_alloc_try_nid(size, PAGE_SIZE,
                                           __pa(MAX_DMA_ADDRESS),
                                           MEMBLOCK_ALLOC_ACCESSIBLE, nid);

I briefly tried that and it seems to work quite nicely.

But I don't object to it even without that, so feel free to add either way:

Reviewed-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
