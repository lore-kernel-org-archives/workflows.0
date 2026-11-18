Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960413;
	b=Mfu7zrW69Rx849104KYuXJyiGHeepaVAk+ndDBLB5HOew9NvMY/gsVO5o9GzHVMBnoav
	 kotPGwEj0vvfMGx507ZsAQ0qQJbj0IRobL2dlI28iDs9SNxiQKI7EWVzSItllr1QusMzw
	 KUEgHm9gPqcRxU8sOUahUrRJuP4n239JTn5l5OuRCdbhOu9hbC0Y8tgF5imOlEahXlnEy
	 uZb9SDiOhXD5DEgi5nJ+VhVctIC/AuxHf5/5PMIwiymjT42e9bifzJcClTWT0lg4Z9Uly
	 6bURd9jW3UE9YagWL2ff+tGbGShH9vPfQarSg90YepGcXQe+o+iKxYGs80jfpJWZKlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=whdIwtpmJAdRFtIWUAbtiFqajWsbSsIAg/rpjYImvLo=;
	b=w+199XpBShb2TC1la0Djzs4BrSz8Sbr2OIluOHYFvx3ysP0y09NOzZGmMxt9RmS3g5G0
	 A2y1u8jZP4LCeUEIhBzxFgQDCh8V6JwO2Qyr4IOj6k7ZCE8vBb2VMgmcwgRs2yxLQSnyb
	 WrN5yi4DdW5ygE5sEpTNhIC0yIHJeYP7tYKcsZI8OQxGHuWHxFGn+2QxCKE85HMUTE/oL
	 8L5U9Nfnkcwv19J+2XDBletjSLL0qwm0c/TENk7B2olX9hCeu82R5T9CriGEmxfcNvO+B
	 IJzziYiySQcxCQEadf6tJjpn1/jKwVZJqmS4aRJuJ5T2hTVqjkmfIg5ENgkHt8ABOEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iqPF85Lp;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929C6606A32F
	for <workflows@vger.kernel.org>; Wed, 18 Nov 2026 00:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929C6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iqPF85Lp
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3ada81853so477897c88.0
        for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 16:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794960412; x=1795565212; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whdIwtpmJAdRFtIWUAbtiFqajWsbSsIAg/rpjYImvLo=;
        b=iqPF85Lpjor6frnj88wDyrBjbXbaBII5DodpVoIl7rwrg6Seti2haELhLqSfoXM1O6
         dyK0UqLUVY6TysXcPhQtWHuIb/SfNfu7MSpfADmZ0rDgFBr5Ln9RXTf6EXp3G5nqBYGI
         g0BJFhee7HlLnLDuEh4lFUG46SyHGwNiEZiJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960412; x=1795565212;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whdIwtpmJAdRFtIWUAbtiFqajWsbSsIAg/rpjYImvLo=;
        b=mEfQIgwbjWiUj85dpkO6KGmeSxm4g1E1p+4ZKVqc6Zmq73afPhogUibv0w+iNDvegY
         vB/zqN8shvwFfsEpT/oS2q6rYDWqUVpP0btpDXA15rheicEU11xVDcol0OOmElBHZszE
         qD8Siz/VffqmrvXL6Ip2i2NEKgkWYr4IB68/i43rZrHwevh5pjkarTM9DovqSZ650VCO
         4x/HPvsLa7eaSjbfIm4aT/KjA9fO1GXNfLdEu9EgUw/NjwRT85+/gu9ftKbboLSRRIWB
         JMEly/sQf2FOTXbwJnoP1vAi6XvRkFAKn8etD+Kb/0GRPAzbYeDajCcF/9lR4Ed6qRPg
         hp7g==
X-Forwarded-Encrypted: i=1; AL+hErH9BcE03hI+qm1oYcosKZzaC1RsGUm6ZeLlSWUp+Dr+W7U6KPCo4SFG1aL/PZb6Ae/S3MJ14rN1qP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z97tkJOsOkXCQGwJWMbKZa3vEJa4UWHX5/d8vz+tWSx/19LU/3m
	32SZYSRdvTN/FahC11tbt4oLZfImK7p6hLtMza9jue5sVDmGNLd0Vakhk2INy0MVa9g=
X-Gm-Gg: AZFdTZd0U07/BClgU+RdbbGL5Sk9m9MqbKc8Yx+kMTi+Imsteojdnhx65fx77R9C+ml
	EngcejIE3BRzhUg9WMOYt0PDWGBieJEkcRUmt1uujONYxwdzOY88OvF/2aOcFYFF4025Oo66y1j
	SPDBLRTaYD1p8QqjPnBsPvaTiMLa3vskC+uihUsvzU3VHDefSrxmIrMSTtzfE64+oLtL7EIsfMp
	Q3wdD27SLG7im1Kum11GGdFB7qNuUpWCCHZzYB9+SfkHpnHrmZkKhRa8Evv2HAjnNKugzFvppY5
	nwstjaayRDTqRaNRX4RRovQTmebkD1nuyW+5Uh9rEqbde0I9abMYi/2ZEGrKH7QYG9ajagEYfY+
	Hu7BIRkAtTSssW09KAFaRha6ohg67LQu7mxRvC4YY/Tk2QXH8+utkYb+s428YT+fZlkJRf6ZDE+
	U8j/Wzx89BH2zYQ8+WjfhYmf3KHcTGxG819Le50jH1fVAOIll39ZACtglZpcyTqZ4hW/S3e/2ti
	vmRdkGRVpaQpK6k8/20VthjXP3QeesJ4eJ4aAQBWVRngXXLU6BuCBaJzFBRMdAalf0ctPmshgNB
	1qp5sdhYHRmFQphyQwEjNs0XQKJfRaZYgqGLnyI/Dfkwyov5EICJlm1Wxd613q+pLs54juatJFn
	alWW5Ru8C7sDCyMkvkHxj8q4rbSdmqc9Asp8/8B/ymOk5GZGD9QSi/nGsJhnkANJ2BU/Ubu0V5A
	N3QV9cjf5JlD7YogVYxMD3fH3Hs0LvDThOlTLXsLuue1JqM6K1wJlv9GnF/cciq+QmiABp/lJEF
	8W2hvIsLVj9tw==
X-Received: by 2002:a05:7300:d210:b0:36d:4135:cd7 with SMTP id 5a478bee46e88-3828083e094mr888033eec.18.1794960411569;
        Tue, 17 Nov 2026 16:06:51 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63054ddsm1519563eec.4.2026.11.17.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:06:50 -0800 (PST)
Date: Tue, 17 Nov 2026 16:06:47 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>, Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
	SPARSEMEM
In-Reply-To: <20261117120627.50601-6-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
	<20261117120627.50601-6-songmuchun@bytedance.com>
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
Message-ID: <avzsFxVqO27Vf4Db@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

Muchun Song writes:
>+	if (!slab_is_available()) {
>+		addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
>+					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);

Hmm, unless I'm mistaken, memblock allocates top-down, and with
movablecore= or kernelcore= the top of each node is ZONE_MOVABLE, so this
puts the page_ext tables there. It looks like that then offlining those
memory blocks would fail with EBUSY because of the reserved pages.

I can see why Mike suggested always using memblock here, but only KMSAN
needs the tables before the buddy allocator is up. So I think this needs
to either go back to using memblock only for clients that need it, as v1
did, or keep these allocations below ZONE_MOVABLE.

Thanks!

Chris
