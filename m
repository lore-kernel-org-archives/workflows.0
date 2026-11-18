Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960409;
	b=jdnPN2X2xqNVdA8nVwesvWKXN3QonL2VBZmNcvI3VH361/dBVrUmht+Yqo4n1B2zG4+0
	 o8jwggKKh06/y7r++aAXSx7FydypEK6nnmUbHFsEIIESYZvwxUxDYXH+1ZcWmwgmgwyCE
	 lnvS6aChZEAXlGCkHv0LVOnHVHGFGN5NGHv95DKlR/S5vuwF23J2K0+Br3JxtKdCZw9A1
	 ix0aoMUzpL70cpm5p5HsIfpN2cxd4C+w4xUxLhAjQJlhqT0jpvJqiHE2W2IKVSVQza0Ws
	 u7kHZPqFxV32GXRCBcT0b4v6wUc/ch4rSuWCQlyZ6NiYf7i+0UH1fUtRfonJBRfqgBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=EFsKUadGG4JNXWjlD0c48hYv79rszfYTM4l79IQ0eAg=;
	b=0nD0qbhDMc6ROonVOBGPfpM+kxf2bemxIiaA6kI1cBb10bu1eUaCbziufWDbDqAIHPFA
	 PXGtLVi7ruvwUePMpF51Tuqb+1TRKMP+FIj0+PYV3R28iQEYhoEuxyIuP11989j/sFptU
	 QXutbxbsQ879GEKiovwVIt0SSd5ouUUC87D03dxg6YaDG45qZeh5IxG3MlG+xzRCqqUGH
	 fhqb5lzNe6NP6so13LIeQmy4/AHj9tjuIZ0XGwk7HtaDKZ/tlifuwOdqqaPV6FA9Wa0/2
	 YVAJWE9jgB6bWA1Li7u7XkCgQx4jZxRX2fB38PL4qIuBQcNdNepJu7iaalXNG2AYwPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eAsU4TNW;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E06606A32C
	for <workflows@vger.kernel.org>; Wed, 18 Nov 2026 00:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E06606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eAsU4TNW
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380b40319bdso773165eec.1
        for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 16:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794960408; x=1795565208; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EFsKUadGG4JNXWjlD0c48hYv79rszfYTM4l79IQ0eAg=;
        b=eAsU4TNWIHz8OfqBu5aEzcROnzrPvipyADCOhrzGhwgQQw1Txs+jHpwGPT6Z7o9OTM
         ZZOEXiyOOAvysqBsgy7PNXNTNA4foSUU9eMcGDlyAv9ct1onJOWjMfC8UpgrPehe1CqD
         eIjOkZP+h7S+cErV/MUnJXyU9irDYiA8/yr7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960408; x=1795565208;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFsKUadGG4JNXWjlD0c48hYv79rszfYTM4l79IQ0eAg=;
        b=epKW3SUq7NaLIyODxNpPeWlQYveqmxVHpXy9wf22/ubjfmna4RPBLSKS14+JT28YYd
         DDOjP43OhyticZ2HN8uBPGvuXQOhKpMLYHhaTZI4jONJmgL6s4Jw+qLl0odXgPyHKYmC
         0jwzzkFw0RXiiYuHYNgsv8o2QDSk+GTFDdqpVQmpDNTJ2TXvzd1Cx0dgSLMKSeZX8wLj
         /1+MIEN2EOr6Pxsm2XGZFUhjh1j/qjIfSxPfokzlhZi1t1vh2XuqWYbUeY4o45HzUfJS
         OO6pDsmn24qc547Hke4inNMHbpIlxeyVDonO7EWdyK8GEHKj2//w2jyKfuMdRko0AsRT
         p3PA==
X-Forwarded-Encrypted: i=1; AL+hErHxyQT8rYrxP1SlV3PHSxG46RhS8mb3PvqvE8dXFEmUhh4dujzrRbi1H4NXrEsiEnKySLJqqyzVqbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V5n/0wmk5Pq1t1AzWUy5EraB6Pc3OnQWBv8dOYho8B+gKWPXz
	Iq3WPqyZtMeJEnSrNqm+60zWoNxsqWF0GWraQ4KJDggt41NBy7SuX+EtkSUhqyOLrSs=
X-Gm-Gg: AZFdTZf6bqAbP6NYuNrbu2NpdtvJ/qYT/RWPB8jUZpBWElzQ8XCuu6Ua0S5zs4pGqt2
	3i8lLmpEUxz/LwekuaKWc01qXXFw5x+rEL2/wZWf3csux4a0uvD8NQRQ80M3BlhXQ74jWPf1dq9
	SSytT+rEgI01DCKXNjjQf434dnh+TMs5ELJ3gPW28YuxIz4Du+BEFbOsN/gsizfYVWUhsO7lzGK
	GBlCwPQqcU+MANuDLCXtTO47YCT/EN9sjPOMipHLXkVJWwrhoOwqUJVwdBzlo24IyOl9w5Lvx3k
	fOek6K5claseSMJ4G3beFP5DyJuciLRisFUGa4ZGBwSwKXuva+vLvOlRfO/Bsvx2P8Ox8nmfcic
	wDLaBUbXdaMrRSPa53pvwQbPZFz0w+HxcihNBNvL65kRx1tYrip7G8Hs1ApSoDMuoJmafJGJjvq
	5Qakao528xsHZ7s82Q1quzlkEIbhFF6YQ+0zGgDkPhglkuegCs7WdYgk7hLje95zvz++pWjjtdi
	ClAe30rZelQPvPLAYBYHdZRd4FazV4f/ViwfSd4HCVhOPyGgQtRsB9ETc4PA7eMVD5sIUM+w90f
	A+rYpso2jfOvHwJ8iUmi9qSFWhMF+EYuC+Khj32Qwh83Ia6n9itJk4CrpqzVEhzstZio6x4NORn
	RbL0eK3Dgh+yQkuPSK2fF5nerUd4MsHiz/XqqoH/iTuX6D+In6ZG3ayhqJxavu3xoXnvNfVgQ2f
	Q/dqG5aCpiHjIK/W80G+ffERIwewUgzZWAdKpgWMb3clpNjbCV+d6cHWeTEPLl9VKI
X-Received: by 2002:a05:7301:618b:20b0:380:f32e:d257 with SMTP id 5a478bee46e88-3827f98bff7mr824254eec.13.1794960407817;
        Tue, 17 Nov 2026 16:06:47 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm1714896eec.11.2026.11.17.16.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:06:47 -0800 (PST)
Date: Tue, 17 Nov 2026 16:06:43 -0800
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
Subject: Re: [PATCH v2 0/7] KMSAN: Move per-page metadata out of struct page
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
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
Message-ID: <avzsE5wGnXji5u6-@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

Thanks! The changes look great, thanks for working on this.

I think patch 5 still has some issues and have replied there, but for patches
1-4, 6, and 7, feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
