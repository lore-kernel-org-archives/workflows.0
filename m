Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971595;
	b=pOhcXe8tCothAkSSOjhXjuG16NkYVbLUMN0Cuh8ude8ToYTEfwrvz//BVDxeln4K4CI3
	 XRhEnhcQx6jkUVYbS3f7ZJ9teVgtjRghm1u6/4K+wjZxZW1dW2W5cq8UrNUwDXcdMucB/
	 3TPPz7dtE9UffZX0WnbPJ+XdR1JHWL4owcDNj2bi1mQbYUIZyRWnTSNjQ/sT/zp7hafuC
	 X47IKub+g9NwrIqRgXnsMICu1Ytq4oAhO+hjuiI5BGterfgsLRsPY8AK/SrWDMGWS0RPT
	 kOgNv8jhokqLWLXrV77oxOxfmx2hQSO35YT/Ly9LBPUhcYXuz3NcK0O7e/qxz0BMTmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971595;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=3Nxi0/sOY8+VKqMZ2GbfZhgX5prfn39dCsvQzRiF+fg=;
	b=33aJs2Qfg2dorct8xBQo0Vn0TYgbCvC5o/E1pKzQbpvVJYoTaI2BR/8fL4jRHq9DRcUJ
	 fF4ph3HOK2XXa2+2CNITCgItd5oi3uqaCnciU4zQ6W2kd1/BMmkxa4UmWUN7Z+2MnQe/9
	 5aCw2gyWH1mf4t0yVTomyrlWYC5dLtpdKhkuR7dEZcI/q6ldcPXwc+Y6Kikiu51+DGivw
	 3/3L8cgiF43iwpfpSGF5HMqGtqPg27ir98YRlF3gishBxcnNggdiAqw6kwH7Q+ToihJjJ
	 1mC3fKNjIEC0PbEp0ORQFYRoFRmG7MQQfi7DOSyYDdaMfvT+xHNZpXlfaIXu+EbwX6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oRxZdjUI;
	arc=none smtp.remote-ip=95.215.58.176
Received: from mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66841606A325
	for <workflows@vger.kernel.org>; Wed, 18 Nov 2026 03:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66841606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oRxZdjUI
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3Nxi0/sOY8+VKqMZ2GbfZhgX5prfn39dCsvQzRiF+fg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794971592; v=1; x=1795576392;
 b=oRxZdjUIVTFtNpuCG4tHhyT9WhEi06Z6YYJFMbB3a2pWb6wQj8oJ0BZz2H3OTnlIPwVy88J0
 DtOfhdLKwUjq1hRnRRPR29e4uNGeeAfy37B+hFrmO0+JaxMzLo9XCV2o6xiizEFF9MQnWQprhgK
 rTzswE73DOWS/gKR/pO/gd6c=
X-Envelope-To: workflows@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8fe63967abd7ab38;
	Wed, 18 Nov 2026 03:13:12 +0000
X-Mizu-Trace-ID: 8fe63967abd7ab38
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 0/7] KMSAN: Move per-page metadata out of struct page
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <avzsE5wGnXji5u6-@chrisdown.name>
Date: Wed, 18 Nov 2026 11:12:46 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>,
 Joerg Roedel <joerg.roedel@amd.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>,
 Ketan <ketan.kishore@oss.qualcomm.com>,
 Mostafa Saleh <smostafa@google.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Sashiko <sashiko-bot@kernel.org>,
 kasan-dev@googlegroups.com,
 workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DF4B7F9B-3B1E-4165-BAE4-2E05E86FB034@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <avzsE5wGnXji5u6-@chrisdown.name>
To: Chris Down <chris@chrisdown.name>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 18, 2026, at 08:06, Chris Down <chris@chrisdown.name> wrote:
>=20
> Hi Muchun,
>=20
> Thanks! The changes look great, thanks for working on this.
>=20
> I think patch 5 still has some issues and have replied there, but for =
patches
> 1-4, 6, and 7, feel free to add:
>=20
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Tested-by: Chris Down <chris@chrisdown.name>

Really thanks for your review and test.

Thanks,
Muchun

>=20
> Thanks!
>=20
> Chris

